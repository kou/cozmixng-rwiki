= OpenSSL

== パスフレーズ無しの証明書を作る．

  % openssl req -new -x509 -nodes -keyout server.key -out server.crt

== 証明書の中身を見る．

  % openssl x509 -text -in xxx.crt

== 証明書のハッシュを作る

/etc/ldap/ldap.confでTLS_CACERTDIRを指定するときなどは必要。

  % c_rehash 証明書があるディレクトリ
