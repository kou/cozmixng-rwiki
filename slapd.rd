= slapd

((<OpenLDAP>))が提供するLDAPサーバの話。

Debian上での話。

== TLSサポート

TLSをサポートするためには以下を設定ファイルに追加して再起動する。

/etc/ldap/slapd.conf:
  TLSCertificateFile      /etc/ldap/certs/server.crt
  TLSCertificateKeyFile   /etc/ldap/certs/server.key

証明書などは以下のようにして作成できる。((<OpenSSL>))も参考に。

  % sudo mkdir -p /etc/ldap/certs
  % cd /etc/ldap/certs
  % sudo openssl req -new -x509 -nodes -keyout server.key -out server.crt
  % sudo chmod 600 server.key
  % sudo c_rehash .

最後のc_rehashを忘れないこと。

=== クライアント側の設定

↑は自前証明書なので、これを使ってTLSを使うにはクライアント側に証明書を登録しないといけない。（あるいは証明書の確認（？）を適当にやる）

  ldap-client% sudo mkdir -p /etc/ldap/certs
  ldap-client% scp ldap-server:/etc/ldap/certs/server.crt /tmp/
  ldap-client% cd /etc/ldap/certs
  ldap-client% mv /tmp/server.crt ./
  ldap-client% sudo c_rehash .

最後のc_rehashを忘れないこと。

デフォルトで/etc/ldap/certs/にある証明書を使うようにする。

/etc/ldap/ldap.conf:
  TLS_CACERTDIR /etc/ldap/certs

OpenLDAPがTLSのバックエンドとしてGnuTLSを利用している場合はTLS_CACERTDIRが使えないのでTLS_CACERTでファイルを指定する。

/etc/ldap/ldap.conf:
  TLS_CACERT /etc/ldap/certs/server.crt

ちなみに、証明書の確認（？）を適当にするならこう。

/etc/ldap/ldap.conf:
  TLS_REQCERT never

== トラブルシューティング

=== ldapsearchでTLS接続できない

TLS_CACERTで登録している証明書がおかしいかもしれない。以下の
コマンドで接続して出力される証明書と同じ証明書を含が
TLS_CACERTで指定したファイルに含まれているか確認すること。

  % gnutls-cli --insecure -p 636 your.ldap.server -d 4711 --print-cert

=== ldapsearchのログを詳細にする

-d -1オプションをつける。

  % ldapsearch -d -1 ...
