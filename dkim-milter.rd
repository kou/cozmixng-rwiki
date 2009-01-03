= dkim-milter

((<https://sourceforge.net/projects/dkim-milter/>))

DKIM（DomainKeys Identified Mail）を実装した((<milter>))。署名（DKIM-Signatureヘッダをつける）と検証（DKIM-Signatureヘッダを見つけて、DNSを引いて公開鍵を見つけて、署名の正当性を判断）の両方できる。

ちなみに、検証だけであれば((<spamass-milter>))でもできる。

== インストール

  % sudo /usr/local/sbin/portupgrade -NRr dkim-milter

== 設定

=== 署名の設定

セレクタはmail、ドメインはcozmixng.orgとする。dkim-milterはmailnullユーザ、mailグループで動作させることとする。

まず、署名用の鍵を作成する。鍵は/usr/local/etc/mail/dkim/以下に保存することにする。

DKIM用の鍵はdkim-genkeyで作成できる。上述の通りのセレクタとドメインで作成する場合は以下の通りになる。

  % sudo mkdir -p /usr/local/etc/mail/dkim
  % cd /usr/local/etc/mail/dkim
  % sudo dkim-genkey -s mail -d cozmixng.org
  % sudo chown -R mailnull:mail .
  % sudo chmod 600 mail.private

これで、秘密鍵が/usr/local/etc/mail/dkim/mail.privateに作成される。同じディレクトリにあるmail.txtがDNSに登録する内容である。

((<BIND>))の正引きの設定ファイルにmail.txtの設定を追加する。

もし、/var/named/etc/namedb/named.confに
  zone "cozmixng.org" {
          type master;
          file "master/cozmixng.org";
  };
と、書かれていたら、/var/named/etc/namedb/master/cozmixng.orgの最後にでもmail.txtの内容を追加する。

  mail._domainkey IN TXT "v=DKIM1; g=*; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC9oRZmGwMg/SHZBopimBDN9nPynnpAWkwYsTEri8FhKXN160ApiclbxiIwqxuSIxVpNviGpkAOLhyBkrCh4nYoUGkfu/STwpOlhfRKctvq9Xdr4KnnTrvswVtkHvpizEIERcmxSives9FUiTdv1lOlGTSQBd9iHMhRn87I/KXF/QIDAQAB" ; ----- DKIM mail for cozmixng.org

設定ファイルを更新したら、((*serialをあげるのを忘れないこと！*))

BINDを再起動して確認する。（reloadでもいいけど）

  % sudo env - PATH=/sbin:/usr/sbin:$PATH /etc/rc.d/named restart
  % dig @127.0.0.1 mail._domainkey.cozmixng.org TXT

DNSに登録した内容（mail.txtと同じ内容。ただし、最後の「; ----- DKIM mail for cozmixng.org」はコメントなので無視する）と同じであれば登録されている。

あとは、署名対象の送信元を指定するファイルを作成する。場所はどこでもよいのだが、ここでは/usr/local/etc/mail/dkim/internal.confとする。ファイルには署名対象の送信元のホストを1行につき1つずつ記述する。

dkim-milterはこのリストに載っているホストのから送信されたメールの他、送信時に認証（SMTP Auth/POP before SMTP）しているメールも署名対象とする。そのため、送信時に認証が必要のない、ローカルホストや、同じネットワークのホストを登録しておくとよいと思う。

/usr/local/etc/mail/dkim/internal.conf
  127.0.0.1
  ::1
  localhost.cozmixng.org

milterから認証されているかどうかを判断するための設定は((<Postfix>))を参照。

=== 検証の設定

特になし。

=== 起動の設定

ユーザはmailnullユーザ、グループはmailグループにする。

デフォルトでPIDファイルが/var/run/milterdkim/pidに保存されるので、ソケットも同じディレクトリに作ることにする。

秘密鍵は/usr/local/etc/mail/dkim/mail.privateにあって、署名対象の送信元リストは/usr/local/etc/mail/dkim/internal.confにある。（署名対象の送信元リストは"-i"オプションで指定する。）

署名対象のメールのドメインはcozmixng.orgでサブドメインも署名対象にしたいので"-D"オプションも指定する。

/etc/rc.conf
  milterdkim_enable="YES"
  milterdkim_uid="mailnull:mail"
  milterdkim_socket="unix:/var/run/milterdkim/dkim-milter.sock"
  milterdkim_domain="cozmixng.org"
  milterdkim_key="/usr/local/etc/mail/dkim/mail.private"
  milterdkim_selector="mail"
  milterdkim_flags="-D -i /usr/local/etc/mail/dkim/internal.conf"

用意ができたので起動。

  % sudo /usr/local/etc/rc.d/dkim-milter start
