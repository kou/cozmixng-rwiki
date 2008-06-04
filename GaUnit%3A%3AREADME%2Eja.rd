# -*- rd -*-

= README.ja

$Id: README.ja 457 2008-06-04 00:21:29Z kou $

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

GPL or BSD License

== 注意

Gauche 0.8.13用です。それより前で動くかどうかはわかりません。

== なにこれ？

GaUnitはGaucheで実装されたUnit Testing Frameworkです．

同様のものに
((<SchemeUnit|URL:http://schematics.sourceforge.net/schemeunit.html>))
があります．

== 読めねぇよ

「ごにっと」とかはどうでしょう？

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/gaunit.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/gaunit/trunk gaunit

== インストール

  % sudo gosh install/install.scm

== 使い方

テスト用のモジュールを定義したプログラムを用意します．

  (define-module test-your-module
    (extend test.unit.test-case)
    (use your-module))
  (select-module test-your-module)

  (define (test-your-module-function1)
    (assert-equal "Good!" (your-module-function1))
    ...
    #f)

  (define (test-your-module-function2)
    (assert-equal 29 (your-module-function2))
    ...
    #f)

  (provide "test-your-module")

'test-'から始まる関数が1つのテストとして実行されます。

'-u test.unit'オプション付きでプログラムを実行します。GaUnit
はtest.unitモジュールでテストを走らせる(({main}))手続きを提供
しています。test.unitをuseすれば、(({main}))手続きを定義する
必要はありません。

  % gosh -u test.unit test-your-module.scm

しかし、今後のために以下のようなテスト起動スクリプト
run-test.scmを作成するとよいでしょう。

run-test.scm:
  #!/usr/bin/env gosh

  (add-load-path ".")

  (use test.unit)

  (define base-dir (sys-dirname *program-name*))
  (for-each load (glob #`",|base-dir|/**/test-*.scm"))

以下のように実行します。

  % gosh run-test.scm

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
      ((*今は動きません。*))

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

==== 表明他

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

--- assert-not-equal(expected actual [message])
    
    (({(not (equal? expected actual))}))が#tを返せば成功します．

--- assert-null(actual [message])
    
    (({(null? actual)}))が#tを返せば成功します．

--- assert-not-null(actual [message])
    
    (({(not (null? actual))}))が#tを返せば成功します．

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
    
--- assert-in-delta(expected delta actual [message])
    
    (({(<= (- expected delta) actual (+ expected delta))}))
    が真を返せば成功します．
    
--- assert-output(expected thunk [message])
    
    (({(equal? expected (with-output-to-string thunk))}))が
    真を返せば成功します．つまり，((|expected|))と
    (({(thunk)}))の出力結果が等しければ成功します．
    
    もし，((|expected|))に正規表現を指定していた場合は
    (({(rxmatch expected (with-output-to-string thunk))}))が
    #f以外を返せば成功します．つまり，(({(trunk)}))の出力結
    果が((|expected|))にマッチすれば成功します．

--- assert-match(expected actual [message])
    
    (({(rxmatch expected actual)}))が#f以外を返せば成功しま
    す．

--- pend(message [thunk])

    このテストを保留にします。((|message|))が保留の理由にな
    ります。もし、引数なしの関数((|thunk|))を指定していて、
    その((|thunk|))を実行してもエラーが起きたり、表明が失敗
    しない場合は、このテストは失敗します。これは、
    ((|thunk|))の内容が問題があるから保留にしている、という
    意図に反して((|thunk|))の内容に問題がなかったので失敗、
    という考えに基づいています。
