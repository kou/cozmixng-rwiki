= Apache

Apache関係の作業記録です。

== インストール

/usr/local/etc/pkgtools.confのMAKE_ARGSに以下を追加．

  'www/apache*' => [
    'WITH_SUEXEC_MODULES=yes',
    'WITH_SSL_MODULES=yes',
   ],

www/apache22をインストール

  % sudo /usr/local/sbin/portupgrade -NRr apache

www/apache20からwww/apache22にアップデートする場合は以下のようにする．

  % sudo nice -20 /usr/local/sbin/portupgrade -NRr -o www/apache22 apache

== Digest認証を使う

httpd.confにauth_digestモジュールをロードする記述を追加する。

  LoadModule auth_digest_module libexec/apache22/mod_auth_digest.so

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
      -out /usr/local/etc/apache22/server.csr \
      -keyout /usr/local/etc/apache22/server.pem
  % sudo openssl rsa \
      -in /usr/local/etc/apache22/server.pem \
      -out /usr/local/etc/apache22/server.key
  % sudo chmod 600 /usr/local/etc/apache22/server.{pem,key}

もしかしたら以下のような-configオプションが必要かもしれない．

  -config /etc/ssl/openssl.cnf

ちなみに，req -subjectを使えばreq -new設定した値を見ることができる．

  % openssl req -subject \
      -in /usr/local/etc/apache22/server.csr

もしなかったら，認証局を作る．あるいは((<CAcert|URL:http://www.cacert.org/>))を利用する．
  % cd /usr/local/share/ca
  % sudo sh /usr/src/crypto/openssl/apps/CA.sh -newca

認証する．
  % cd /usr/local/share/ca/
  % sudo openssl ca -cert /usr/local/share/ca/demoCA/cacert.pem \
      -keyfile /usr/local/share/ca/demoCA/private/cakey.pem \
      -in /usr/local/etc/apache22/server.csr \
      -out /usr/local/etc/apache22/server.crt

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

== httpreadyがない

Apache 2.2.xを起動させると以下のようにwarningが出る場合がある．

  [warn] (2)No such file or directory: Failed to enable the 'httpready' Accept Filter

この場合は以下のようにすればよい．

  % sudo kldload accf_http.ko

毎回起動した毎に呼び出すのは面倒なので/boot/loader.confに以下を追加．

  accf_http_load="YES"
