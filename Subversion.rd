= Subversion

Subversion関係の作業記録

== メモ

  * ((<URL:http://ukai.jp/Slides/2003/0521-lw2003/html/index.html>))

== インストール

/usr/local/etc/pkgtools.confのMAKE_ARGSに以下を追加．

  'devel/subversion' => 'WITH_MOD_DAV_SVN=yes',

devel/subversionをインストール

  % sudo /usr/local/sbin/portupgrade -NRr subversion

== 設定

/usr/local/etc/apache2/httpd.confを弄ります。

とりあえず以下のモジュールをロードします。

  LoadModule dav_module libexec/apache2/mod_dav.so
  LoadModule dav_fs_module libexec/apache2/mod_dav_fs.so
  LoadModule dav_svn_module     libexec/apache2/mod_dav_svn.so

リポジトリの場所を指定します。今回はコミットは特定のユーザしか出来ないようにしますが、閲覧、取得は誰でも出来るようにします。

  <Location /repos>
          AuthName "Subversion Repository"
          AuthType Basic
          AuthUserFile "/usr/local/svn/.htpasswd"
          <LimitExcept GET PROPFIND OPTIONS REPORT>
                  Require valid-user
          </LimitExcept>
          DAV svn
          SVNPath /usr/local/svn/repos
  </Location>

Apacheを再起動。

  % sudo /usr/local/sbin/apachectl restart

== リポジトリの初期化

  % cd /usr/local
  % sudo mkdir svn
  % sudo svnadmin create svn/repos
  % sudo /usr/sbin/chown -R www:www svn/repos

これで((<URL:/repos/>))でリポジトリの内容を見ることが出来ます。

=== パスワードの登録

コミットしたい人は以下の様にユーザ登録して下さい。

  % sudo /usr/local/sbin/htpasswd /usr/local/svn/.htpasswd hoge

== リポジトリに登録

基本的に一つのSVNPathには同じRevisionが割り当てられます。

CVSではhoge/fugaという様にインポートすれば階層的にモジュールが作成されますが、Subversionではそのようには出来ません。そこで、階層的にモジュールを作成する方法を以下に書いておきます。

例えば、((<URL:/repos/ruby/pwm>))で((<Pseudo Web Mail>))のモジュールにアクセスしたいとします。このとき、まだ((<URL:/repos/ruby/>))は出来ていないとします。

その時はまず、リポジトリ((<URL:/repos/>))にrubyというモジュールをインポートします。

  % cd /usr/tmp
  % rm -rf tmp
  % mkdir -p tmp/ruby
  % svn import tmp http://www.cozmixng.org/repos/

古いsvnだと

  % svn imoprt http://www.cozmixng.org/repos/ tmp

かもしれません．

このとき、ログを書くために環境変数SVN_EDITORに指定されたエディタが起動します。SVN_EDITORが指定されていないとVISUAL、VISUALも指定されていないとEDITORに指定されているエディタを起動します。EDITORも指定されていないとエラーで終了します。

オプションをいくつか紹介しておきます。

: -m
  ログをコマンドラインから指定することも出来ます。

: --username
  リポジトリにアクセスするためのユーザ名を指定することが出来ます。

: --encoding
  エンコーディングを指定することが出来るので日本語を含むファイルをインポートするときは指定して下さい。

オプションは他にもあるのでsvn help importしてみて下さい。

これで((<URL:/repos/ruby/>))が出来たのでこの下にpwmモジュールを登録します。

  % cd /usr/tmp
  % rm -rf tmp
  % mkdir tmp
  % cp -R /path/to/pwm tmp
  % svn import http://www.cozmixng.org/repos/ruby/ tmp --encoding EUC-JP -m "	* Start Pseudo Web Mail"

これで((<URL:/repos/ruby/pwm/>))が出来ます。

ちなみに今回の場合は以下のようにしても大丈夫です。

  % cd /usr/tmp
  % rm -rf tmp
  % mkdir -p tmp/ruby
  % cp -R /path/to/pwm tmp/ruby
  % svn import http://www.cozmixng.org/repos/ tmp --encoding EUC-JP

でも、これだといつもブラウザでアクセスするとHEADしか見えないので普通は/repos/ruby/pwm/{trunk,tags/0.0.1,tags/0.0.2}/などという構成にします。

  % cd /usr/tmp
  % rm -rf tmp
  % mkdir -p tmp/ruby/pwm/trunk
  % cp -R /path/to/pwm tmp/ruby/trunk
  % svn import http://www.cozmixng.org/repos/ tmp --encoding EUC-JP

ここでtrunkからtags/0.0.1などにはcopyを使えば良いです。これはシンボリックリンクみたいなものらしいので無駄にディスク容量が増えることは無いそうです。まぁ、これでTAGがつけれるということです。

  % svn copy http://www.cozmixng.org/repos/pwm/trunk http://www.cozmixng.org/repos/pwm/tags/0.0.1

もし，tagsができていないときはsvn mkdirでもしておけばいいでしょう．

  % svn mkdir http://www.cozmixng.org/repos/pwm/tags

== チェックアウト

今登録したPWMをチェックアウトするには以下のようにします。

  % svn co http://www.cozmixng.org/repos/ruby/pwm/trunk hoge

こうするとカレントディレクトリにhogeというディレクトリが出来て((<URL:/repos/ruby/pwm/trunk>))のファイルがチェックアウトされます。hogeを省略するとここではtrunkが指定されたものと見なされます。

基本的にCVSと一緒なので後は自力で頑張って下さい。ちなみに私が自分の計算機にSubversionをインストールして弄っていた時のメモが((<URL:/~kou/linux/svn>))にあります。

== TIPS

=== SubversionでWebサイトを管理

Subversionでサイト管理するにはプロパティを使うといいでしょう。

例えば以下のようにすると、ブラウザでリポジトリを見てもSubversionで管理されているとは気付かないでしょう。

  % find . -regex ".*\.html\(\...\)?" -exec svn propset \
    svn:mime-type "text/html; charset=UTF-8" {} \;
  % find . -name "*.css" -exec svn propset svn:mime-type text/css {} \;
  % find . -name "*.png" -exec svn propset svn:mime-type image/png {} \;
  % find . -name "*.gif" -exec svn propset svn:mime-type image/gif {} \;
  % find . -regex ".*\.\(jpg\|jpeg\|jpe\)" \
    -exec svn propset svn:mime-type image/jpeg {} \;

=== 何か良くわからんがエラーが出る

とりあえず以下を実行してみてから再度挑戦してみて下さい。

  % svn cleanup
