= ZnMarg

== Margarine
* ((<Margarine Project 〜 考えないパンとバターと話す方法 〜|URL:http://plantl.org/l/munou/margarine/>))からダウンロードする。
* 最新版では変わってるかもしれませんが、
  1.0.5ではカレントディレクトリにファイルを展開するので
  他のファイルと混ざるとまずいところで展開しないように。
* ((<RAA:mysql-ruby>))と((<RAA:ruby-chasen>))が必要なので
  別途インストールしておく。

* marg.rbの1行目を(({#!/usr/bin/env ruby -Ke}))に変更。
  FreeBSDではこれでいいけどLinuxだと/usr/bin/envが
  (({'ruby -Ke'}))を実行しようとして失敗する。
* marg.rbの(({$DEFAULT_MARG}))と(({require 'margarine.rb'}))の間に
  設定ファイルを読み込ませる処理を入れた。
    $DEFAULT_MARG = 'defaultmarg'

    if File.symlink?(__FILE__)
      Dir.chdir(File.dirname(File.readlink(__FILE__)))
    else
      Dir.chdir(File.dirname(__FILE__))
    end
    load 'znz-config.rb'
    # --

    require 'margarine.rb'
  ((<HackingMarg|URL:http://plantl.org/l/munou/margarine/hiki/hiki.cgi?HackingMarg>))
  によると、本家では$HOME/.margrcを読むようになりそう。

* znz-config.rbの作成。
    $DB_USER = 'znz'
    $DB_NAME = 'znz'
    $DB_PASSWORD = 'ここにパスワード'
    $DEFAULT_MARG = 'znmarg'

== plum
* ((<URL:http://plum.sourceforge.jp/>))に最新版がある。
* 最新版をダウンロードして展開したディレクトリplum-2.33.2に入る。
* 先ほどのmarg.rbにシンボリックリンクを張る。
    ln -s ~/margarine/znmarg/marg.rb .
* margarine.plmをmodule/munouにコピー。
    mkdir module/munou
    cp -p ~/margarine/znmarg/margarine.plm module/munou/margarine.plm
* plum-znmarg.confを作成。
    cp plum-default.conf plum-znmarg.conf
    vi plum-znmarg.conf
* plum-znmarg.confでは
  * plum.nick
  * plum.user
  * plum.name
  * plum.server
  * channel.join.connect.channel
  * ctcp.userinfo.info
  * log.client.file (margarineの挙動チェック用)
  * log.daily.file (普通のログ取り用)
  を設定して、末尾に
    + munou/margarine.plm
    munou.margarine.marg: znmarg
    munou.margarine.reply: default
    munou.margarine.register: true
  を追加した。
