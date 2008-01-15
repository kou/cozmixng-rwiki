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
