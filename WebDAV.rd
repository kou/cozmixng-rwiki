= WebDAV

WebDAV関係の作業記録です。

== 設定

WebDAVモジュール(mod_dav.so, mod_dav_fs.so)はApacheに組み込まれているものとします．

まず，WebDAV用のロックファイルを指定します．ロックファイルには拡張子が付いてはいけません．

  DAVLockDB /var/lock/httpd/DAVLock

ロックファイルを作成するディレクトリは，Apacheを実行しているユーザが書き込めるようにしておきます．というのも，私にはどんな名前のロックファイルを作るのか分からないからです．DebianのApacheではDAVLockDBで指定した名前のロックファイル(バイナリ，たぶんSDBM)が作成されました．FreeBSDのApacheではDAVLockDBで指定した名前に.dir, .pagと付いたロックファイルが作成されました．

  % sudo mkdir -p /var/lock/httpd
  % sudo /usr/sbin/chown www:www /var/lock/httpd

WebDAV用に公開するディレクトリへのaliasを設定します．

  Alias /webdav /usr/local/webdav

このディレクトリはApacheの実行ユーザに書き込み権が無ければいけません．

  % sudo mkdir -p /usr/local/var/webdav
  % sudo /usr/sbin/chown www:www /usr/local/var/webdav

あとはaliasを設定したパスでDAVを使用可能にするだけです．

  <Location /webdav>
    DAV on
  </Location>

.htaccessとか置かれて設定書き換えられたりとか，CGIとかSSIとか実行させないように以下のようした方がいいかもしれません．

  <Location /webdav>
    AllowOverride None
    Options None
    DAV on
  </Location>

ファイル一覧くらいは見せてもいいならこのくらいか？

  <Location /webdav>
    AllowOverride None
    Options Indexes
    DAV on
  </Location>

設定が全部終わり，クライアントがアクセスするとロックファイルが出来ます．

== アクセス方法

=== Windowsを使っている人

"Webフォルダ"を使ってください．アドレスはhttp://www.cozmixng.org/webdav/です．

参考: ((<URL:http://support.jca.apc.org/software/webfolder.html>))

=== MacOS Xを使っている人

使えるそうです．アドレスはhttp://www.cozmixng.org/webdav/です．

参考: ((<URL:http://homepage1.nifty.com/glass/tom_neko/web/web_webdav.html#client>))

=== UNIX系OSを使っている人

Konquerorを使っているならスキームをwebdavとしてアクセスしてください．例: webdav://www.cozmixng.org/webdav/

Nautilusを使っているならスキームをhttpとしてアクセスしてください．例: http://www.cozmixng.org/webdav/

Emacsを使っているならeldavをインストールしてURIの前に:を付けてアクセスしてください．例: :http://www.cozmixng.org/webdav/

シェルを使っている人はcadaverをインストールしてアクセスしてください．例: cadaver http://www.cozmixng.org/webdav/
