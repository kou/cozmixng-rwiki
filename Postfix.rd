= Postfix

Postfix関係の作業記録

不正中継をテストしてくれるページ((<Mail relay testing|URL:http://www.abuse.net/relay.html>))

== インストール

SMTP AUTHをするためにSASL v2も使えるようにしておく．なのでcyrus-sasl2をインストールしておく．

  % sudo portupgrade -N cyrus-sasl

== 基本的な設定

ファイルは/usr/local/etc/postfix/main.cf

=== @以下にはデフォルトでドメイン名を付ける

  myorigin = $mydomain

=== 配送先を指定

  mydestination = $myhostname, localhost.$mydomain, $mydomain, mail.$mydomain

=== 拒否したときのレスポンスコードを指定

550はメールを拒否したことを示す．

450は後で送ってねということを示す．

  unknown_local_recipient_reject_code = 550

=== 信用するホストを指定

自分のところだけ信用する．

  mynetworks_style = host

=== /etc/aliasesを更新

  % sudo postalias /etc/aliases

== IPv6も利用する

inet_protocolsに利用するIPの種類を指定する．

以下のようにしておくと利用可能ならばIPv4とIPv6を利用する．

  inet_protocols = all

IPv4だけ利用したい場合は以下のように書く．

  inet_protocols = ipv4

IPv6だけ利用したい場合は以下のように書く．

  inet_protocols = ipv6

両方有効にしたい場合は以下のように書く．

  inet_protocols = ipv4, ipv6

== (A)POP before SMTPの設定

((<Qpopper>))を使っていたときはこれを使っていた．なぜならQpopperが((<DRAC>))を使えたから．

hashとかdbmじゃなくてbtreeだった．

  smtpd_recipient_restrictions =
          permit_mynetworks
          permit_auth_destination
          check_client_access btree:/usr/local/etc/dracd
          reject_unauth_destination
          reject

mynetworksにDRACで認証したホストを追加する．

  mynetworks = 127.0.0.0/8, btree:/usr/local/etc/dracd

IPv6を有効にした場合は，[[::1]]も追加しておくとよい．

  mynetworks = 127.0.0.0/8, [[::1]], btree:/usr/local/etc/dracd

== SMTP AUTHの設定

((<Courier-IMAP>))は((<DRAC>))を使えないのでSMTP AUTHにする．

ここでは((<Cyrus SASL>))を使う．

SASLによる認証を有効にする

  smtpd_sasl_auth_enable = yes

SASL用のドメインの設定

  smtpd_sasl_local_domain = $mydomain

匿名による認証，平文による認証を許可しない

  smtpd_sasl_security_options = noanonymous, noplaintext

が，Outlookのために以下のようにしておく．

  smtpd_sasl_security_options = noanonymous
  broken_sasl_auth_clients = yes

STARTTLSを使えるようにする(Mewだと使えない)．秘密鍵と証明書は(((<Apache>))の時と同じように)作った．

  smtpd_tls_cert_file = /usr/local/etc/postfix/certs/smtpd.pem
  smtpd_tls_key_file = /usr/local/etc/postfix/certs/smtpd.key
  smtpd_use_tls = yes 
  smtpd_tls_session_cache_database = sdbm:/usr/local/etc/postfix/smtpd_scache

キャッシュ用のファイルを作る

  % sudo touch /usr/local/etc/postfix/smtpd_scache.{dir,pag}

SMTP AUTHが成功したクライアントは許可する(permit_sasl_authenticatedを追加)．

  smtpd_recipient_restrictions =
        permit_mynetworks
        permit_sasl_authenticated
        permit_auth_destination
        check_client_access btree:/usr/local/etc/dracd
        reject_unauth_destination
        reject

==== クライアントの設定

Mewなら

  (setq mew-config-alist
   ...
       ("smtp-user"     . "kou")
   ...)

とか書いておいたらSMTP AUTHするようになる．

== 転送の設定

  (1) 転送先をrelay_domainsに加えておく。

        relay_domains = transport.$mydomain

  (2) transport_mapsに転送するアドレスと転送先の対応を書いたファイルを指定する(.dbはつけない)。

        transport_maps = hash:/usr/local/etc/postfix/transport

  (3) transport_mapsで指定したファイルに対応関係を書く。

        hoge@transport.example.com smtp:[transport.example.com]
        .transport.example.com smtp:transport.example.com
      
      スペースの左側が転送するメールアドレスまたはドメインで右側が転送先になる。

      この例だと、hoge@transport.example.com宛てのメールはtransport.example.comにSMTPで転送され(転送先のホスト名が[]で囲まれているとMXレコードを引かない)、ドメインの最後が.transport.example.com宛てのメールはtransport.example.comのMXレコードで指定されたホストにSMTPで転送される。

      特定のユーザ宛てのメールの転送をするとき(左側にhoge@transport.example.comと書かれているとき)は、以下のことに注意しなければいけないようだ。

        * 転送先サーバがmydestinationに含まれているならば、転送元サーバがそのユーザのメールを受け取る設定になっていなければいけない。

      なので、もし、転送元サーバにユーザ(上の例ではhoge)がいないときは/etc/aliasesを以下のように編集するなどして受け取れるようにしておく必要がある(と思う)。というか，mydestinationにいれずにrelay_domainにいれればいい．

        hoge: root

  (4) 高速に検索できるようにするためにデータベース化する。

        % sudo /usr/local/sbin/postmap /usr/local/etc/postfix/transport

  (5) 設定を反映させる

        % sudo /usr/local/sbin/postfix reload

== バーチャルドメインの設定

(1) main.cfに以下を追加

      virtual_maps = hash:/usr/local/etc/postfix/vmaps
      virtual_mailbox_base = /home/mailuser
      virtual_mailbox_maps = hash:/usr/local/etc/postfix/vmailbox
      virtual_mailbox_domains = hash:/usr/local/etc/postfix/vmaildomains
      virtual_minimum_uid = 10000
      virtual_uid_maps = static:10000
      virtual_gid_maps = static:10000

(2) uid, gidともに10000のmailuserというユーザを作成

(3) /usr/local/etc/postfix/vmailboxにバーチャルなメールアドレスを指定

      kou@example.com example.com/kou/Maildir/
      hoge@example.com example.com/hoge/Maildir/

    とか

(4) /usr/local/etc/postfix/vmaildomainsにバーチャルドメインを設定．((*バーチャルドメインに設定するドメイン名はmydestinationから除いておく．*))

      example.com HOGE FUGA

(5) /usr/local/etc/postfix/vmapsにバーチャルドメイン宛のメールでローカルユーザに転送するアドレスの対応を記述

      postmaster@example.com root
      mailuser@example.com root
      info@example.com root
      webmaster@example.com  root

    もし，vmaildomainsにバーチャルドメインを書いていなければvmapsの先頭に以下を書いておく

      example.com anything

    ちなみに，anythingのところは何を書いてもいいらしい．

(6) {vmailbox,vmaildomains,vmaps}をDB化

      % sudo /usr/local/sbin/postmap /usr/local/etc/postfix/{vmailbox,vmaildoamins,vmaps}

(6) 設定ファイルを再読み込み

      % sudo env - /usr/local/etc/rc.d/postfix.sh reload

== 8bit -> 7bit変換を抑制する

デフォルトではContent-Transfer-Encoding: 8bitのメールをquoted-printableに変換するみたい．これを抑制するには以下を記述すればよい．

  disable_mime_output_conversion = yes

8bitってまだお行儀悪いのかしら．


== Rgrey

スパムをほとんど拒否できるという((<Rgrey - S25R + greylisting|URL:http://k2net.hakuba.jp/rgrey/>))の設定をする。パスを変えた以外は同じ。

まず、Postfix用のGreylistの実装であるPostgreyをインストールする。

  % sudo /usr/local/sbin/portupgrade -NRr postgrey

/etc/rc.confに以下を追加してPostgreyを起動するようにする。

  postgrey_enable="YES"

Postgreyを起動する。

  % sudo /usr/local/etc/rc.d/postgre start

/usr/local/etc/postfix/main.cfを編集し、Postgreyを使うようにする。

  smtpd_restriction_classes =
      check_greylist

  check_greylist = check_policy_service inet:10023

  smtpd_recipient_restrictions =
      permit_sasl_authenticated
      check_client_access regexp:/usr/local/etc/postfix/check_client_fqdn
      ...

  policy_time_limit = 3600

/usr/local/etc/postfix/check_client_fqdnを作る。

  /^unknown$/                                  check_greylist
  /^[^\.]*[0-9][^0-9\.]+[0-9]/                 check_greylist
  /^[^\.]*[0-9]{5}/                            check_greylist
  /^([^\.]+\.)?[0-9][^\.]*\.[^\.]+\..+\.[a-z]/ check_greylist
  /^[^\.]*[0-9]\.[^\.]*[0-9]-[0-9]/            check_greylist
  /^[^\.]*[0-9]\.[^\.]*[0-9]\.[^\.]+\..+\./    check_greylist
  /^(dhcp|dialup|ppp|adsl)[^\.]*[0-9]/         check_greylist

これは、データベース扱いにしていないので、postmapはしなくてもいい。

あとは、設定を再読み込みする。

  % sudo /usr/local/etc/rc.d/postfix.sh reload

== submissionポート対応

/usr/local/etc/postfix/master.cfに以下の行を追加。

  submission   inet    n       -       n       -       -       smtpd

設定ファイルを再読み込みする。

  % sudo /usr/local/etc/rc.d/postfix.sh reload
