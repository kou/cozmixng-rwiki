= Apache

Apache関係の作業記録です。

== インストール

/usr/local/etc/pkgtools.confのMAKE_ARGSに以下を追加．

  'www/apache2' => [
    'WITH_SUEXEC_MODULES=yes',
    'WITH_SSL_MODULES=yes',
   ],

www/apache2をインストール

  % sudo /usr/local/sbin/portupgrade -NRr apache

== Digest認証を使う

httpd.confにauth_digestモジュールをロードする記述を追加する。

  LoadModule auth_digest_module libexec/apache2/mod_auth_digest.so

httpd.confや.htaccessにDigest認証の設定を記述する

  AuthName realm_name
  AuthType Digest
  AuthDigestDomain /path/to/you/want/to/auth
  AuthDigestFile /path/to/digest/file
  Require valid-user

Digest認証用のファイルを作る

  % /usr/local/sbin/htdigest -c /path/to/digest/file realm_name user_name

ここで、realm_nameはAuthNameで指定したものとおなじものを指定する。

== SSLを使う

鍵とか，証明書のリクエストを作る．Common Nameはwww.cozmxing.orgとかstreaming.cozmixng.orgとかにする．

  % sudo openssl req -new \
      -out /usr/local/etc/apache2/ssl.key/server.csr \
      -keyout /usr/local/etc/apache2/ssl.key/server.pem
  % sudo openssl rsa \
      -in /usr/local/etc/apache2/ssl.key/server.pem \
      -out /usr/local/etc/apache2/ssl.key/server.key
  % sudo chmod 600 /usr/local/etc/apache2/ssl.key/server.{pem,key}

もしかしたら以下のような-configオプションが必要かもしれない．

  -config /etc/ssl/openssl.cnf

もしなかったら，認証局を作る．
  % cd /usr/local/share/ca
  % sudo sh /usr/src/crypto/openssl/apps/CA.sh -newca

認証する．
  % cd /usr/local/share/ca/
  % sudo openssl ca -cert /usr/local/share/ca/demoCA/cacert.pem \
      -keyfile /usr/local/share/ca/demoCA/private/cakey.pem \
      -in /usr/local/etc/apache2/ssl.key/server.csr \
      -out /usr/local/etc/apache2/ssl.crt/server.crt

== 名前ベースのバーチャルホスト

名前ベースのバーチャルホストの設定をしたいIPアドレスを指定する．

どのIPアドレスも良い場合は*を指定する．IPアドレスの後にポート番号も指定できる．

  NameVirtualHost *:80

この例だと，どのIPアドレスでもよいが，80番ポートのみ名前ベースのバーチャルホストを利用する．

次に，バーチャルホストを指定する．

各バーチャルホストには，最低でもServerNameとDocumentRootを指定する．デフォルトで利用される設定は，一番最初に書き，DocumentRootは<VirtualHost>の外で指定したやつを同じ設定にする．

<VirtualHost>のIPアドレスの指定方法は（だいたい）NameVirtualHostと同じ．

  <VirtualHost *:80>
    ServerName www.cozmixng.org
    DocumentRoot /XXX/YYY
  </VirtualHost>

  <VirtualHost *:80>
    ServerName cozmix.sgk.iwate-u.ac.jp
    DocumentRoot /YYY/ZZZ
    SuexecUserGroup cozmix cozmix
    ErrorLog /var/log/cozmix.sgk.iwate-u.ac.jp-error_log
    CustomLog /var/log/cozmix.sgk.iwate-u.ac.jp-access_log combined
  </VirtualHost>

バーチャルホストの実行ユーザ／グループを変更するにはSuexecUserGroupを指定する．古いApacheで指定できたUserとGroupは使用できない．
