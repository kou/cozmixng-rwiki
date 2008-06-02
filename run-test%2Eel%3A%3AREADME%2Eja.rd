# -*- rd -*-

= README.ja

$Id: README.ja 4 2008-06-02 23:51:41Z  $

== 名前

run-test.el

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

GPL

== なにこれ？

テストの実行を支援するEmacs-Lispです。

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/run-test.tar.gz>))

  % svn co http://www.cozmixng.org/repos/elisp/run-test/trunk run-test

== インストール

  % sudo ...

== 使い方

lib/run-test.elはEmacs上でのテストの実行を支援するEmacs-Lisp
です。lib/run-test-setting.elはrun-test.elを使うための設定例
です．

使うには，まず，.emacsに以下を記述します．

  (setq load-path (cons run-test{,-setting}.elがあるディレクトリ load-path))
  (load "run-test-setting")

ここでは
((<GaUnit|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=GaUnit>))
のテストを実行するとします。

run-test.elのために用意するものはテストを実行するスクリプト
です。例えば、以下のようなrun-test.scmというスクリプトです。

  #!/usr/bin/env gosh

  (add-load-path ".")

  (use test.unit)

  (define base-dir (sys-dirname *program-name*))
  (for-each load (glob #`",|base-dir|/**/test-*.scm"))

そして、testというディレクトリを作って、このrun-test.scmに実
行権を付けておいておきます。

テストファイルはtestというディレクトリ以下に
test-your-module.scmという名前で作っていきます．つまり，ディ
レクトリ構成は以下の様になります．

  topdir --- test --- run-test.scm
                   |
                   +- test-hoge.scm
                   |
                   .
                   .
                   .
                   |
                   +- test-fuga.scm

テスト(run-test.scm)はtopdirで起動されます．つまり，

  % test/run-test.cm

というように起動されます．

run-test.scmを書くときはこのことに注意しましょう．

設定はこれで終了です．

topdir以下にいるときはC-cC-t(run-test)で
topdir/test/run-test.scmが実行できます．実行結果は*run-test*
バッファに挿入されます．テストを実行して失敗/エラーがおきた
らエラーが発生したassertionにC-x`でジャンプすることができます．

C-cT(run-test-in-new-frame)とやると，新しくフレームを作成し
てtopdir/test/run-test.scmを実行します．最初にテストを走らせ
る時に使うとよいでしょう．

これで手軽に頻繁にテストを実行できますね．Happy testing!!

== キーバインド

: C-cC-t
   テストを走らせる

: C-cT
   テストを走らせる。テスト結果は新しいフレームを作成してそ
   こに表示する。

== カスタマイズ変数

: run-test-file-names
   テストを実行するスクリプトの拡張子を除いたファイル名のリ
   ストです．
   
   デフォルト: ("test/run-test" "test/runner" "run-test")

: run-test-suffixes
   run-test-fileに付加する拡張子のリストです．先頭の方にある拡張子程
   優先されます．
   
   デフォルト: ("" ".scm" ".rb" ".py" ".sh")
