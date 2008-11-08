= Courier-IMAP

Maildir形式対応のPOP3，IMAPサーバ．((<DRAC>))には対応していない(((<対応させている人はいる|URL:http://www.ftserve.net/~fuji/linux/popbeforesmtp.shtml>)))．

== インストール

  % sudo /usr/local/sbin/portupgrade -NRr courier-imap

== 設定

設定ファイルは/usr/local/etc/courier-imap/{imapd,imapd-ssl,pop3d,pop3d-ssl}

以下，変更点

=== imapd

  IMAPDSTART=YES

  IMAP_TLS_REQUIRED=0
  IMAPDSTARTTLS=0

  IMAP_CAPABILITY="IMAP4rev1 UIDPLUS CHILDREN NAMESPACE THREAD=ORDEREDSUBJECT THREAD=REFERENCES SORT QUOTA AUTH=CRAM-MD5 AUTH=CRAM-SHA1 IDLE"

=== imapd-ssl

  IMAPDSSLSTART=YES
  IMAP_TLS_REQUIRED=1

  TLS_CERTFILE=/usr/local/etc/courier-imap/imapd.pem

=== pop3d

  POP3DSTART=YES

  POP3AUTH="LOGIN CRAM-MD5 CRAM-SHA1"

  POP3_TLS_REQUIRED=0

  POP3AUTH_TLS="$POP3AUTH PLAIN"
  POP3AUTH_TLS_ORIG="$POP3AUTH PLAIN"

=== pop3d-ssl

  POP3DSSLSTART=YES
  POP3_TLS_REQUIRED=1

  TLS_CERTFILE=/usr/local/etc/courier-imap/pop3d.pem

=== UNIXアカウントが存在しない場合

((<Postfix>))でバーチャルホストを設定しておく．

==== ユーザを作る

  % sudo /usr/local/sbin/userdb アカウント名@cozmixng.org set \
      home=/home/mailuser/cozmixng.org/アカウント名 \
      mail=/home/mailuser/cozmixng.org/アカウント名/Maildir \
      uid=10000 gid=10000

例:
  % sudo /usr/local/sbin/userdb kou@cozmixng.org set \ 
      home=/home/mailuser/cozmixng.org/kou \
      mail=/home/mailuser/cozmixng.org/kou/Maildir \
      uid=10000 gid=10000

==== ユーザのパスワードを設定する

  % sudo /usr/local/sbin/userdbpw -md5 | \
      sudo /usr/local/sbin/userdb \
        アカウント名@cozmixng.org set pop3pw
  % sudo /usr/local/sbin/userdbpw -md5 | \
      sudo /usr/local/sbin/userdb \
        アカウント名@cozmixng.org set imappw
  % sudo /usr/local/sbin/makeuserdb

例:
  % sudo /usr/local/sbin/userdbpw -md5 | \
      sudo /usr/local/sbin/userdb \
        kou@cozmixng.org set pop3pw
  % sudo /usr/local/sbin/userdbpw -md5 | \
      sudo /usr/local/sbin/userdb \
        kou@cozmixng.org set imappw
  % sudo /usr/local/sbin/makeuserdb

CRAM-MD5を利用するならこう．

  % sudo /usr/local/sbin/userdbpw -hmac-md5 | \
      sudo /usr/local/sbin/userdb \
        kou@cozmixng.org set hmac-md5pw
  % sudo /usr/local/sbin/makeuserdb

これはPOP3でもIMAPでも共通で使えるみたい．

==== quotaを設定

こんなことをするとquotaを設定できるみたい．ちなみに，この例だと100MB．

  % sudo /usr/local/sbin/userdb \
      kou@cozmixng.org set quota=100000000
  % sudo /usr/local/sbin/makeuserdb


=== バーチャルホストを設定していない場合

==== ユーザのホームにMaildirを作る

  % maildirmake ~/Maildir

/usr/share/skelに作っておくと新規登録したユーザは自分で作らなくても良い。

  % sudo maildirmake /usr/share/skel/Maildir

== 証明書

=== 自分で作る

作り方は((<Apache>))や((<ストリーミング>))や((<Qpopper>))と一緒．

注意点は，Courier-IMAPは秘密鍵と証明書を同じファイルにしなければいけないことである．なので，以下のようにして{imapd.pem,pop3d.pem}を作る．

鍵を作る．Common Nameはmail.cozmixng.orgにすること．

  % sudo openssl req -new \
    -out /usr/local/etc/courier-imap/server.csr \
    -keyout /usr/local/etc/courier-imap/server.pem
  % sudo openssl rsa \
    -in /usr/local/etc/courier-imap/server.pem \ 
    -out /usr/local/etc/courier-imap/server.key
  % sudo chmod 600 /usr/local/etc/courier-imap/server.{pem,key}

認証する(省略)．

証明書と秘密鍵を一緒にする．

  % cd /usr/local/etc/courier-imap
  % sudo sh -c 'cat server.crt server.key > pop3d.pem'
  % sudo cp {pop3,imap}d.pem
  % sudo chmod 600 {pop3,imap}d.pem

=== mkimapdcertを使う

/usr/local/etc/courier-imap/imapd-cnfを作る．/usr/local/etc/courier-imap/imapd-cnf.distをコピーして，それを編集するとよいだろう．

  % sudo cp /usr/local/etc/courier-imap/imapd-cnf{.dist,}

注意点は

  [ req_dn ]

の中の

  CN=localhost

をIMAP/POPサーバのものに変えること（mail.cozmixng.orgとか）．

後は，mkimpadcertを実行するだけ．

  % sudo mkimapdcert

証明書他は/usr/local/share/courier-imap/imapd.pemに生成される．ちなみに，/usr/local/share/courier-imap/imapd.pemがもうすでにあるとmkimpadcertは新しくimapd.pemを作らない（上書きしない）ので，作りなおすときはrmしてからmkimapdcertを
実行すること．

pop3d.pemはimapd.pemをコピーすればよい．

== 起動

起動するときは/usr/local/libexec/courier-imap/{imapd,pop3d}-ssl.rcを使う．/usr/local/etc/rc.d/courier-imap-{impad,pop3d}-ssl.shとしてリンクを張っておくといいだろう．

== クライアントの設定

うまくいかない．．．

=== 昔はうまくいった設定

Mewなら

  (setq mew-prog-ssl "/usr/sbin/stunnel")

  (setq mew-config-alist
   ...
       ("pop-ssl"       . 't)
       ("imap-ssl"      . 't)
   ...)

とか書く．そんでもって，メールサーバの証明書をもってきて（~/mail.pemとする），~/.certs/以下に置く．~/.certs/以下に置くときのファイル名は"#{証明書のハッシュ値}.0"なんだってさ．

  % mkdir -p ~/.certs
  % cp ~/mail.pem ~/.certs/`openssl x509 -hash -noout -in ~/mail.pem`.0

ちなみに，メールサーバの証明書は

  -----BEGIN CERTIFICATE-----

から

  -----END CERTIFICATE-----

までの部分．mkimapdcertでimapd.pemを作ったのなら，imapd.pemの真ん中あたりにあるはず．


もし，証明書を検証（？）しないなら以下を書いておく．

  (setq mew-ssl-verify-level 0)
