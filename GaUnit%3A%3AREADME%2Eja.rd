# -*- rd -*-

= README.ja

$Id: README.ja 335 2005-06-14 03:33:03Z kou $

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

GPL or BSD License

== 注意

Gauche 0.8.3以前では動きません．

== なにこれ？

GaUnitはGaucheで実装されたUnit Testing Frameworkです．おまけ
でテストの実行を支援するEmacs-Lispが付いています．

同様のものに
((<SchemeUnit|URL:http://schematics.sourceforge.net/schemeunit.html>))
があります．

== 読めねぇよ

「ごにっと」とかはどうでしょう？

== メーリングリスト

((<COZMIXNG RWiki - 連絡先|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))を御覧下さい．

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/gaunit.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/gaunit/trunk gaunit

== インストール

  # gosh install/install.scm

== 使い方

テストを定義したプログラムを用意します．

  (use test.unit)

  (define-test-suite ...)
  とか
  (define-test-case ...)
  とか

プログラムを実行します．GaUnitはテストを走らせる(({main}))手
続きを提供しているので，(({main}))手続きを定義する必要はあり
ません．

  % gosh test-program.scm

=== オプション

GaUnitが提供している(({main}))手続きはいくつかオプションを受
け付けます．

: -uUI, --ui=UI
   テスト結果を表示するユーザインタフェースを指定します．
   ((|UI|))には以下のものが指定できます．

   : t[ext]
      テキスト版のユーザインタフェースを使用します．デフォル
      トです．

   : g[tk]
      GTK+版のユーザインタフェースを使用します．以下のように
      キーバインドされています．これらのキーはCtrlやAltなど
      の修飾キーが付いていても動作します．つまり，lでもCtrl
      + lでもAlt + lでも動作します．
      
      : l
         Loadボタンを押します．
      
      : r
         Runボタンを押します．
       
      : q, ESC
         終了します．


: -vLEVEL, --vervose=LEVEL
   テスト結果をどの程度詳細に表示するかを指定します．現在の
   ところ，テキスト版のユーザインタフェースでのみ意味があり
   ます．((|LEVEL|))には以下のものが指定できます．

   : s[ilent]
      テストが失敗したとき，あるいはエラーが発生したときのみ
      その詳細を表示します．テストが成功したときはなにも出力
      しません．

   : p[rogress]
      テストが成功したときに"."が出力されます．それ以外は
      silentと同じです．

   : n[ormal]
      テストスイートの実行時にそのテストスイートの名前を表
      示します．また，テストが終わったときに，テスト数，全表
      明数，成功した表明数，失敗した表明数，エラー数，テスト
      にかかった時間を表示します．それ以外はprogressと同じで
      す．デフォルトです．

   : v[erbose]
      テストケースの実行時にそのテストケースの名前を表示しま
      す．それ以外はnormalと同じです．

: -sREGEXP, --test-suite=REGEXP

   正規表現REGEXPにマッチするテストスイート名を持つテストス
   イートのみ実行します．

: -cREGEXP, --test-case=REGEXP

   正規表現REGEXPにマッチするテストケース名を持つテストケー
   スのみ実行します．

: -tREGEXP, --test=REGEXP

   正規表現REGEXPにマッチするテスト名を持つテストのみ実行し
   ます．

: -h, --help
   使用法を表示して終了します．

例えば，ユーザインタフェースとしてGTK+版を使いたければ以下の
ようにします．

  % gosh test-program.scm -ug

詳細なログを表示したければ以下のようにします．

  % gosh test-program.scm -vv

=== リファレンス

==== 表明(?)

GaUnitは以下に示すテストをするための手続きを用意しています．

((|[message]|))はオプションです．失敗時のメッセージである文
字列か，引数をひとつとる手続きを指定します．手続きの場合はテ
スト結果が引数として渡されます．

--- fail([message])
    
    必ず失敗します．

--- assert(pred expected actual [message])
    
    (({(pred expected actual)}))が#fでないならば成功します．

--- assert-equal(expected actual [message])
    
    (({(equal? expected actual)}))が#tを返せば成功します．

--- assert-true(actual [message])
    
    ((|actual|))が#tならば成功します．

--- assert-false(actual [message])
    
    ((|actual|))が#fならば成功します．

--- assert-instance-of(expected-class object [message])
    
    ((|object|))が((|expected-class|))のインスタンスであれば
    成功します．

--- assert-raise(expected-class thunk [message])
    
    ((|thunk|))(引数無しの手続き)内で起こった例外が
    ((|expected-class|))のインスタンスであれば成功します．

--- assert-error(tunk [message])
    
    ((|thunk|))(引数無しの手続き)内で例外が発生すれば成功します．

--- assert-each(assert-proc lst &keyword :apply-if-can :run-assert :prepare)
    
    ((|assert-proc|))を((|lst|))の各要素に対して適用します．
    
    ((|lst|))の各要素は((|prepare|))に適用され，
    ((|run-assert|))によって((|assert-proc|))に適用されます．
    
    もし，((|prepare|))が返値がリストで((|apply-if-can|))が
    #t(デフォルト)なら((|assert-proc|))に((|apply|))されます．
    
    イメージとしてはこんな感じです．

      (define (run-assert assert-proc args)
        (if (and (list? args) apply-if-can)
            (apply assert-proc args)
            (assert-proc args)))
      (for-each (lambda (item)
                  (run-assert assert-proc (prepare item)))
                lst)

--- assert-macro(expanded form [message])
    
    (({(equal? expanded (macroexpand form))}))が真を返せば成功します．
    
--- assert-macro1(expanded form [message])
    
    (({(equal? expanded (macroexpand-1 form))}))が真を返せば成功します．
    
--- assert-lset-equal(expected actual [message])
    
    (({(lset= equal? expected actual)}))が真を返せば成功します．
    
--- assert-values-equal(expected productor [message])
    
    (({(receive actual (productor) (equal? expected
    actual))}))が真を返せば成功します．
    
==== 必要最小限

GaUnitは以下の手続きを用意しています．

--- run-all-test(&keyword :ui)
    
    ((|define-test-case|)), ((|define-test-suite|))で定義されたテストを
    実行します．
    
GaUnitは以下の構文を用意しています．

--- define-test-case
    
    テストケースを定義します．
    
      (define-test-case "テストケース名"
        (setup テストが実行される前に実行される引数無しの手続き) ; 必要なら
        (teardown テストが実行された後に実行される引数無しの手続き) ; 必要なら
        ("テスト名"
          (assertなんとか ...))
        ...)

--- define-test-suite
    
    テストスイートを定義します．
    
      (define-test-suite "テストスイート名"
        ("テストケース名"
          (setup テストが実行される前に実行される引数無しの手続き) ; 必要なら
          (teardown テストが実行された後に実行される引数無しの手続き) ; 必要なら
          ("テスト名"
            (assertなんとか)
            ...)
          ...)
        ...)

==== 必要なら

GaUnitは以下の手続きを用意しています．

--- run(<test-suite> or <test-case> or <test> &keyword :ui)

    テストを実行します．
    
    キーワード引数((|:ui|))を指定することによりテストを実行するユー
    ザインターフェイスを変更できます．

GaUnitは以下の構文を用意しています．

--- define-assertion
    
    assertion(表明?)を定義します．
    
      (define-assertion (表明名 引数 ...)
        式の列:最後の式の値が成功か失敗か示す)
    
    ((|式の列|))の値が((|<assertion-failure>|))クラスのオブジェク
    トなら失敗，それ以外なら成功を示します．詳しくは
    lib/test/assertions.scmの((|define-assertion|))を使って定義さ
    れているassertionを見てください．

--- make-test
    
    テストを作成します．

--- make-test-case
    
    テストケースを作成します．

--- make-test-suite
    
    テストスイートを作成します．


また，(({define-test-case}))や(({make-test-case}))でテストケー
スを作成する際，テストの前後に必ず実行される手続きを登録/削
除する手続きがあります．

--- gaunit-add-default-setup-proc!(proc)
    
    引数無しの手続き((|proc|))を各テストが始まる前に実行する
    手続きとして登録します．

--- gaunit-delete-default-setup-proc!(proc)
    
    (({gaunit-add-default-setup-proc!}))で登録した((|proc|))
    を削除します．

--- gaunit-clear-default-setup-procs!
    
    (({gaunit-add-default-setup-proc!}))で登録した((|proc|))
    をすべて削除します．

--- gaunit-add-default-teardown-proc!(proc)
    
    引数無しの手続き((|proc|))を各テストが終わった後に実行す
    る手続きとして登録します．

--- gaunit-delete-default-teardown-proc!(proc)
    
    (({gaunit-add-default-teardown-proc!}))で登録した((|proc|))
    を削除します．

--- gaunit-clear-default-teardown-procs!
    
    (({gaunit-add-default-teardown-proc!}))で登録した((|proc|))
    をすべて削除します．

(({gaunit-*-default-{setup,teardown}-*}))を使えば，
(({define-test-case}))などで(({setup}))や(({teardown}))を指
定せずに対応する手続きを登録することができます．例えば，以下
のふたつの(({define-test-case}))は同じ動作をします．

  (define-test-case "test case"
    (setup (lambda () (print "setup")))
    (teardown (lambda () (print "teardown")))
    ("test1" ...)
    ("test2" ...)
    ...)

  (gaunit-add-default-setup-proc! (lambda () (print "setup")))
  (gaunit-add-default-teardown-proc! (lambda () (print "teardown")))
  (define-test-case "test case"
    ("test1" ...)
    ("test2" ...)
    ...)
  (gaunit-clear-default-setup-procs!)
  (gaunit-clear-default-teardown-procs!)

(({gaunit-*-default-{setup,teardown}-*}))で登録した手続きが
必要なくなった場合は，
(({gaunit-clear-default-{setup,teardown}-procs!}))などで登録
した手続きを削除することを忘れないでください．以下のように，
独自のテストケース定義マクロを作成してもいいでしょう．

  (define (*setup-proc*) ...)
  (define (*teardown-proc*) ...)
  (define-syntax define-my-test-case
    (syntax-rules ()
      ((_ arg ...)
       (begin
         (gaunit-add-default-setup-proc! *setup-proc*)
         (gaunit-add-default-teardown-proc! *teardown-proc*)
         (define-test-case arg ...)
         (gaunit-delete-default-setup-proc! *setup-proc)
         (gaunit-delete-default-teardown-proc! *teardown-proc*)))))

== 付属品

以下のものが付属しています．

=== run-test.el

sample/site-lisp/run-test.elはEmacs上でのテストの実行を支援
するEmacs-Lispです．sample/site-lisp/run-test-setting.elは
run-test.elを使うための設定例です．

使うには，まず，.emacsに以下を記述します．

  (setq load-path (cons run-test{,-setting}.elがあるディレクトリ load-path))
  (load "run-test-setting")

テストを実行するスクリプトrun-test.shを書きます．例えば，こ
んな感じです．

  #!/bin/sh

  for test in test/test-*.scm
  do
    echo "Running test $test..."
    gosh $test
  done

あるいは，run-test.scmとしてこんな感じでもいいです．

  #!/usr/bin/env gosh

  (use file.util)
  (use test.unit)

  (if (symbol-bound? 'main)
      (define _main main))

  (define (main args)
    (let ((dir (sys-dirname (car args))))
      (for-each (lambda (test-script)
                  (print "loading " (string-join
                                     (list dir test-script)
                                     "/"))
                  (load (string-join (list dir test-script) "/")))
                (directory-list dir
                                :filter (lambda (x)
                                          (rxmatch #/^test-.+\.scm/ x))))
      (if (symbol-bound? '_main)
          (_main args)
          (run-all-test))))


で，testというディレクトリを作って，このrun-test.shあるいは
run-test.scmに実行権を付けておいておきます．

テストファイルはtestというディレクトリ以下にtest-hoge.scmと
いう名前で作っていきます．つまり，ディレクトリ構成は以下の様
になります．

  topdir --- test --- run-test.sh or run-test.scm
                   |
                   +- test-hoge.scm
                   |
                   .
                   .
                   .
                   |
                   +- test-fuga.scm

テスト(run-test.scm)はtopdirで起動されます．つまり，

  % test/run-test.sh

というように起動されます．

run-test.{sh,scm}を書くときはこのことに注意しましょう．

設定はこれで終了です．

topdir以下にいるときはC-cC-t(run-test)で
topdir/test/run-test.shが実行できます．実行結果は*run-test*
バッファに挿入されます．テストを実行して失敗/エラーがおきた
らエラーが発生したassertionにC-x`でジャンプすることができます．

C-cT(run-test-in-new-frame)とやると，新しくフレームを作成し
てtopdir/test/run-test.shを実行します．最初にテストを走らせ
る時に使うとよいでしょう．

これで手軽に頻繁にテストを実行できますね．Happy testing!!

==== カスタマイズ変数

: run-test-file
   テストを実行するスクリプトの拡張子を除いたファイル名です．
   
   デフォルト: "test/run-test"

: run-test-suffixes
   run-test-fileに付加する拡張子のリストです．先頭の方にある拡張子程
   優先されます．
   
   デフォルト: (".scm" ".rb" ".sh")
