# -*- rd -*-

= Tutorial.ja

$Id: Tutorial.ja 288 2004-08-17 07:02:28Z kou $

テストファーストってなかなかできないよねぇ．

== 基本

GaUnitを使ったユニットテストでは

最初に

  (use test.unit)

を書きます．

テストは

  (use test.unit)

の後に書きます．

== 下準備

ここでは，付属のrun-test.elを使ってテストを起動するようにし
ます．run-test.elの設定はREADME.jaに書いているのでそちらを参
考にしてください．run-test.elを使わない場合は以下のsymdiffディ
レクトリで以下のようにテストを起動してください．

  [symdiff]% test/run-test.scm

まず，以下のようなディレクトリ構成を作成します．

  symdiff/ -+- lib/
            |
            +- test/ --- run-test.scm

コマンドでいうとこんな感じです．

  [somewhere]% mkdir -p symdiff/{lib,test}

run-test.scmの中身は以下のようにします．GaUnitが使っている
run-test.scm（test/run-test.scm）をコピーしてもよいでしょう．
先頭のshebang（#!...）は適当に変更してください．

  #!/usr/bin/env gosh

  (add-load-path "./lib")

  (use gauche.interactive)
  (use file.util)
  (use test.unit)

  (if (and (symbol-bound? 'main)
           (not (symbol-bound? '_main)))
    (define _main main))

  (define (main args)
    (let ((dir (sys-dirname (car args))))
      (for-each (lambda (test-script)
                  (load (string-join (list dir test-script) "/")))
                (directory-list dir
                                :filter (lambda (x)
                                          (rxmatch #/^test-.+\.scm$/ x))))
      (if (symbol-bound? '_main)
        (_main `(,(car args) "-vp" ,@(cdr args)))
        (run-all-test))))

run-test.scmには実行権を付けておきます．

  [somewhere]% cd symdiff
  [symdiff]% chmod +x test/run-test.scm

これで準備は完了です．実際のプログラムはlib/以下に置いて，テ
ストプログラムはtest/以下にtest-XXX.scmという名前で置くこと
になります．

== 例1: 記号微分((-記号微分というネタはSICPの2.3.2から頂きました．-))

2x^2 + x + 3をxで微分すると 4x + 1 になるとかいうあれです．

ここでは，記号微分のためのソースファイルをlib/symdiff.scm，
テストファイルをtest/test-symdiff.scmとします．

=== テストファイルの作成

まず，テストファイルtest/test-symdiff.scmを作成します．

  #!/usr/bin/env gosh

  (use test.unit)
  (require "symdiff")

C-cTでテストを実行してみましょう．C-cTには新しいフレームを作
成してそのフレーム内にテスト結果を表示するようにしてテスト
（test/run-test.scm）を実行するコマンドがバインドされていま
す．一方C-cC-tには単にテストを実行するコマンドがバインドされ
ています．テスト結果表示専用用フレームと編集用フレームのふた
つのフレームを使いたい場合は最初だけC-cTを使ってテストを実行
し，それ以降はC-cC-tでテストを起動するとよいでしょう．そうで
ない場合はC-cC-tだけ使えばよいでしょう．ちなみに，私は，最初
だけC-cTを使うタイプです． :)

run-test.elを使っていない場合はsymdiffディレクトリで以下のよ
うにtest/run-test.scmを起動してください．

  [symdiff]% test/run-test.scm

以下のようになるはずです．

  *** ERROR: cannot find file "symdiff.scm" in *load-path* (... 省略)
  Stack Trace:
  _______________________________________
    0  (%require feature)
          At line 52 of "/usr/local/share/gauche/0.8/lib/gauche-init.scm"
    1  (for-each (lambda (test-script) (load (string-join (list dir test- ...
          At line 15 of "././test/run-test.scm"

失敗しました．ソースファイルを作っていないのにrequireしてい
るから当然ですね．

それでは，ソースファイルを作成しましょう．

  [symdiff]% touch lib/symdiff.scm


それでは再びテストを実行してみましょう．C-cC-tで起動できます．


エラーが無くなりましたね．順調です．

=== テストの作成

記号微分は以下のような簡約規則があります．

  * dc/dx = 0 (cは定数かxではない変数)
  * dx/dx = 1
  * d(u+v)/dx = du/dx + dv/dx
  * d(uv)/dx = u(dv/dx) + (du/dx)v

ひとつずつテストを作っていきましょう．

==== dc/dx = 0

まず，dc/dx = 0のテストを書きましょう．

今回は，1 を x で微分すると 0 になることをテストします．

記号微分をする手続きはderivとしましょう．derivの第一引数は微
分される式，第二引数は微分する変数にしましょう．このように，
テストファーストプログラミング(テスト駆動開発?)ではテストを
書くことによってインターフェイスの設計をします．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     (assert-equal 0 (deriv 1 'x))))

ちなみに，テストは

  (use test.unit)

の後に書きます．

つまり，テストファイル全体は以下のようになります．

  #/usr/bin/env gosh

  (use test.unit)
  (require "symdiff")

  (define-test-case "Symbolic Differentiation"
    ("base test"
     (assert-equal 0 (deriv 1 'x))))

C-cC-tで実行してみましょう．

  ./test/test-symdiff.scm:8: (deriv 1 'x)
  Error occured in base test
  *** ERROR: unbound variable: deriv
  Stack Trace:
  _______________________________________
    0  (deriv 1 'x)
          At line 8 of "./test/test-symdiff.scm"
    1  (assert-equal 0 (deriv 1 'x))
          At line 8 of "./test/test-symdiff.scm"
    2  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    3  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"
  .

エラーになりました．記号微分をする手続きderivを定義していな
いので当然ですね．

ちなみに，C-x`でテストが失敗した箇所にジャンプできます．今回
の場合だと，test/test-symdiff.scmの以下の行にジャンプします．

     (assert-equal 0 (deriv 1 'x))))


それでは，テストをパスするために，ソースファイル
lib/symdiff.scmにderivを定義しましょう．

  (define (deriv exp var)
    0)

それでは，C-cC-tでテストを実行しましょう．

  .

成功しましたね．.（ドット）はテストがパスしたことを表してい
ます．ちなみに，これからでてくるFはテストが失敗（Failure）し
たことを，Eはエラー（Error）が発生したことを示しています．

もし，もっと詳細なテスト結果を表示したい場合はC-uC-cC-tとし
てテストを起動してみてください．run-test.elを使っていない場
合は以下のようにします．

  [symdiff]% test/run-test.el -vv

こんな感じになるでしょう．

  - Start test suite Default test suite
  -- Start test case Symbolic Differentiation
  .

  1 tests, 1 assertions, 1 successes, 0 failures, 0 errors
  Testing time: 2.83e-4

もし，
((<Gauche-gtk|URL:http://www.shiro.dreamhost.com/scheme/index-j.html#libs>))
がインストールされていれば，以下のようにtest/run-test.scmを
起動することによってグラフィカルにテスト結果を表示することが
できます．

 [symdiff]% test/run-test.scm -ug

ESCやC-qなどで終了します．C-rとかを押すとテストを実行します．
C-lとかを押すとテストファイルを読み込み直してからテストを実
行します．


はじめのテストがパスしてよかったですね．お菓子でも食べながら
かるくお祝いでもしましょうか．え，微分していないじゃないかっ
て？いいんです．テストは(deriv 1 'x)が0を返すように要求して
いるだけなんです．私達はテストに合格する((*最低限の*))コード
を書けばいいだけなんです．

==== dx/dx = 1

次は，dx/dx = 1のテストを書きましょう．

  (assert-equal 1 (deriv 'x 'x))

ですね．これは，先程出てきたdefine-test-caseの中に書くのでテ
ストファイルには以下のように書かれます．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     (assert-equal 0 (deriv 1 'x))
     (assert-equal 1 (deriv 'x 'x))))

C-cC-tで実行してみましょう．

  F
  ./test/test-symdiff.scm:9: (assert-equal 1 (deriv 'x 'x))
   expected:<1>
    but was:<0> in base test

失敗しましたね．エラーではないですよ．失敗です．(deriv 'x
'x)が1を返すはずなのに0を返しているからです．

テストに合格するようにderivを定義しなおしましょう．

  (define (deriv exp var)
    (if (eq? exp var)
      1
      0))

C-cC-tでテストを実行してみましょう．

  .

合格しましたね．順調です．またお祝いでもしましょうか．

==== d(u+v)/dx = du/dx + dv/dx

次は，d(u+v)/dx = du/dx + dv/dxのテストを書きましょう．

微分の足し算が出てきたので，まず，足し算を表現するオブジェク
トを作るコンストラクタmake-sumを作りましょう．

make-sumは足し算を表現するリストを返すことにしましょう．

  (assert-equal '(+ 1 x) (make-sum 1 'x))

make-sumは最初に示した簡約規則には含まれていないので，別のテ
ストにしましょうか．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     (assert-equal 0 (deriv 1 'x))
     (assert-equal 1 (deriv 'x 'x)))
    ("sum test"
     (assert-equal '(+ 1 x) (make-sum 1 'x))))

では，C-cC-tでテストを実行しましょう．

  .E
  ./test/test-symdiff.scm:11: (make-sum 1 'x)
  Error occured in sum test
  *** ERROR: unbound variable: make-sum
  Stack Trace:
  _______________________________________
    0  (make-sum 1 'x)
          At line 11 of "./test/test-symdiff.scm"
    1  (assert-equal '(+ 1 x) (make-sum 1 'x))
          At line 11 of "./test/test-symdiff.scm"
    2  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    3  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"

エラーが出ました．make-sumを定義していないので当然ですね．

ソースファイルにmake-sumの定義を加えましょう．

  (define (make-sum exp1 exp2)
    (list '+ exp1 exp2))

C-cC-tでテストを実行します．

  ..

成功ですね．

それでは，d(u+v)/dx = du/dx + dv/dxのテストを書きましょう．

  (assert-equal (make-sum (deriv 1 'x)
                          (deriv 'x 'x))
                (deriv (make-sum 1 'x) 'x))

これは，"base test"の方にいれておきましょう．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     (assert-equal 0 (deriv 1 'x))
     (assert-equal 1 (deriv 'x 'x))
     (assert-equal (make-sum (deriv 1 'x)
                             (deriv 'x 'x))
                   (deriv (make-sum 1 'x) 'x)))
    ("sum test"
     (assert-equal '(+ 1 x) (make-sum 1 'x))))

C-cC-tでテストしましょう．

  F
  ./test/test-symdiff.scm:10: (assert-equal (make-sum (deriv 1 'x) (deriv 'x 'x)) (deriv (make-sum 1 'x) 'x))
   expected:<(+ 0 1)>
    but was:<0> in base test
  .

失敗しましたね．derivに微分の足し算の場合の処理を加えていな
いので当然ですね．

その前に，expが微分の足し算であることを確かめるためにsum?を
作りましょう．sum?のテストは以下のようになります．

  (assert-true (sum? (make-sum 1 'x)))

これは，"sum test"の方に加えておきましょう．

sum?ができるまでは先程のderivのテストを実行しないようにして
おきましょう．こういうときはコメントアウトするのではなくて，
先頭に'（クォート）を付けると便利です．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     (assert-equal 0 (deriv 1 'x))
     (assert-equal 1 (deriv 'x 'x))
     '(assert-equal (make-sum (deriv 1 'x)
                             (deriv 'x 'x))
                   (deriv (make-sum 1 'x) 'x)))
    ("sum test"
     (assert-equal '(+ 1 x) (make-sum 1 'x))
     (assert-true (sum? (make-sum 1 'x)))))


それではC-cC-tでテストしましょう．

  .E
  ./test/test-symdiff.scm:15: (sum? (make-sum 1 'x))
  Error occured in sum test
  *** ERROR: unbound variable: sum?
  Stack Trace:
  _______________________________________
    0  (sum? (make-sum 1 'x))
          At line 15 of "./test/test-symdiff.scm"
    1  (assert-true (sum? (make-sum 1 'x)))
          At line 15 of "./test/test-symdiff.scm"
    2  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    3  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"

sum?が未定義であるエラーが報告されました．それでは，
lib/symdiff.scmにsum?を定義しましょう．

  (define (sum? exp)
    (and (pair? exp) (eq? '+ (car exp))))

C-cC-tでテストを実行しましょう．

  ..

成功しましたね．

それでは，先程無効にしたderivのテストを，先頭の'（クォート）
をとって有効にしましょう．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     ...
     (assert-equal (make-sum (deriv 1 'x)
                             (deriv 'x 'x))
                   (deriv (make-sum 1 'x) 'x)))
    ("sum test"
     ...))


それでは，C-cC-tでテストを実行しましょう．

  F
  ./test/test-symdiff.scm:10: (assert-equal (make-sum (deriv 1 'x) (deriv 'x 'x)) (deriv (make-sum 1 'x) 'x))
   expected:<(+ 0 1)>
    but was:<0> in base test
  .

あいかわらず失敗しますね．それでは，derivを定義しなおしましょ
う．

といきたいところですが，d(u+v)/dx = du/dx + dv/dxという定義
を見ると，make-sumで作った足し算（d(u+v)の(u+v)のところ）を
（uとvに）分解する必要がありそうです．ということで，もう一度，
derivのテストをクォートしてmake-sumで作ったオブジェクトのセ
レクタを作ることにしましょう．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     ...
     '(assert-equal (make-sum (deriv 1 'x)
                             (deriv 'x 'x))
                   (deriv (make-sum 1 'x) 'x)))
    ("sum test"
     ...))

ソースを書き換えたのでC-cC-tでテストしておきましょう．

  ..

きちんとパスしますね．

それではセレクタを作っていきましょう．足し算の最初の項を取り
出すやつはaddend，二番目の項を取り出すやつはaugendとしましょ
う．

addendとaugendのテストは以下のようになります．

  (assert-equal 1 (addend (make-sum 1 'x)))
  (assert-equal 'x (augend (make-sum 1 'x)))

これは，"sum test"の方に加えておきましょう．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     ...
     '(assert-equal (make-sum (deriv 1 'x)
                             (deriv 'x 'x))
                   (deriv (make-sum 1 'x) 'x)))
    ("sum test"
     ...
     (assert-equal 1 (addend (make-sum 1 'x)))
     (assert-equal 'x (augend (make-sum 1 'x)))))

それではC-cC-tでテストを実行します．

  .E
  ./test/test-symdiff.scm:16: (addend (make-sum 1 'x))
  Error occured in sum test
  *** ERROR: unbound variable: addend
  Stack Trace:
  _______________________________________
    0  (addend (make-sum 1 'x))
          At line 16 of "./test/test-symdiff.scm"
    1  (assert-equal 1 (addend (make-sum 1 'x)))
          At line 16 of "./test/test-symdiff.scm"
    2  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    3  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"

addedを定義していないのでエラーが起きましたね．

ここで，"sum test"でエラーが起きても"base test"が実行されて
いることに注意してください（テスト中にエラーが発生したことを
示すEとテストがパスしたことを示す.（ドット）が出ていますね）．
GaUnitでは，各テストで起こったエラーが他のテストに影響を及ぼ
すことはありません．

ただし，同じテスト内でエラーが発生した場合（addendを使った
assert-equal）はそれ以降（augendを使ったassert-equal）は実行
されません．

それでは，addendとaugendを定義しましょう．

  (define (addend sum)
    (cadr sum))

  (define (augend sum)
    (caddr sum))

C-cC-tでテストを実行しましょう．

  ..

成功しましたね．

今度こそderivのテストを実行しましょう．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     ...
     (assert-equal (make-sum (deriv 1 'x)
                             (deriv 'x 'x))
                   (deriv (make-sum 1 'x) 'x)))
    ("sum test"
     ...))

C-cC-tでテストを実行すると以下のようになりますね．

  F
  ./test/test-symdiff.scm:10: (assert-equal (make-sum (deriv 1 'x) (deriv 'x 'x)) (deriv (make-sum 1 'x) 'x))
   expected:<(+ 0 1)>
    but was:<0> in base test
  .

それでは，derivを定義しなおしましょう．

  (define (deriv exp var)
    (cond ((sum? exp)
           (make-sum (deriv (addend exp) var)
                     (deriv (augend exp) var)))
          ((eq? exp var) 1)
          (else 0)))

それでは，C-cC-tでテストを実行しましょう．

  ..

成功しましたね．おめでとうございます．それでは，かるくパーティ
でも．．．

==== d(uv)/dx = u(dv/dx) + (du/dx)v

最後にd(uv)/dx = u(dv/dx) + (du/dx)vのテストを書きましょう．

掛け算が出てきたので，まず，掛け算を表現するオブジェクトを作
るコンストラクタmake-productを作りましょう．

make-productは掛け算を表現するリストを返すことにしましょう．

  (assert-equal '(* 1 x) (make-product 1 'x))

make-productは掛け算用のテストにしましょう．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     (assert-equal 0 (deriv 1 'x))
     (assert-equal 1 (deriv 'x 'x))
     (assert-equal (make-sum (deriv 1 'x)
                             (deriv 'x 'x))
                   (deriv (make-sum 1 'x) 'x)))
    ("sum test"
     (assert-equal '(+ 1 x) (make-sum 1 'x))
     (assert-true (sum? (make-sum 1 'x)))
     (assert-equal 1 (addend (make-sum 1 'x)))
     (assert-equal 'x (augend (make-sum 1 'x))))
    ("product test"
     (assert-equal '(* 1 x) (make-product 1 'x))))

それでは，C-cC-tでテストを実行しましょう．

  ..E
  ./test/test-symdiff.scm:19: (make-product 1 'x)
  Error occured in product test
  *** ERROR: unbound variable: make-product
  Stack Trace:
  _______________________________________
    0  (make-product 1 'x)
          At line 19 of "./test/test-symdiff.scm"
    1  (assert-equal '(* 1 x) (make-product 1 'x))
          At line 19 of "./test/test-symdiff.scm"
    2  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    3  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"

make-productが定義されていないのでエラーが起きました．

それでは，make-productを定義しましょう．

  (define (make-product exp1 exp2)
    (list '* exp1 exp2))

C-cC-tでテストを実行しましょう．

  ...

順調です．

続いてオブジェクトが微分の掛け算であることを確かめるために
product?を作りましょう．product?のテストは以下のようになりま
す．

  (assert-true (product? (make-product 1 'x)))

これは，"product test"の方に加えておきましょう．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     ...)
    ("sum test"
     ...)
    ("product test"
     ...
     (assert-true (product? (make-product 1 'x)))))

それでは，C-cC-tでテストを実行しましょう．

  ..E
  ./test/test-symdiff.scm:20: (product? (make-product 1 'x))
  Error occured in product test
  *** ERROR: unbound variable: product?
  Stack Trace:
  _______________________________________
    0  (product? (make-product 1 'x))
          At line 20 of "./test/test-symdiff.scm"
    1  (assert-true (product? (make-product 1 'x)))
          At line 20 of "./test/test-symdiff.scm"
    2  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    3  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"

product?が定義されていないのでエラーが起きました．

product?を定義しましょう．

  (define (product? exp)
    (and (pair? exp) (eq? '* (car exp))))

C-cC-tでテストをしましょう．

  ...

成功です．

続いて，セレクタを作りましょう．multiplierは掛け算の最初の項
を，multiplicandは足し算の二番目の項を取得するセレクタです．

multiplierとmultiplicandのテストは以下のようになります．

  (assert-equal 1 (multiplier (make-product 1 'x)))
  (assert-equal 'x (multiplicand (make-product 1 'x)))

これは，"product test"にいれておきましょう．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     ...)
    ("sum test"
     ...)
    ("product test"
     ...
     (assert-equal 1 (multiplier (make-product 1 'x)))
     (assert-equal 'x (multiplicand (make-product 1 'x)))))

それでは，C-cC-tテストを実行します．

  ..E
  ./test/test-symdiff.scm:21: (multiplier (make-product 1 'x))
  Error occured in product test
  *** ERROR: unbound variable: multiplier
  Stack Trace:
  _______________________________________
    0  (multiplier (make-product 1 'x))
          At line 21 of "./test/test-symdiff.scm"
    1  (assert-equal 1 (multiplier (make-product 1 'x)))
          At line 21 of "./test/test-symdiff.scm"
    2  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    3  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"

multiplierが未定義のためエラーになりました．

それでは，multiplierとmultiplicandを定義しましょう．

  (define (multiplier product)
    (cadr product))

  (define (multiplicand product)
    (caddr product))

それではC-cC-tでテストしましょう．

  ...

パスしましたね．


それでは，いよいよd(uv)/dx = u(dv/dx) + (du/dx)vのテストを書
きましょう．

  (assert-equal (make-sum (make-product 1 (deriv 'x 'x))
                          (make-product (deriv 1 'x) 'x))
                (deriv (make-product 1 'x) 'x)))

これは，"base test"に加えておきましょう．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     ...
     (assert-equal (make-sum (make-product 1 (deriv 'x 'x))
                             (make-product (deriv 1 'x) 'x))
                   (deriv (make-product 1 'x) 'x)))
    ("sum test"
     ...)
    ("product test"
     ...))

C-cC-tでテストを実行しましょう．

  F
  ./test/test-symdiff.scm:13: (assert-equal (make-sum (make-product 1 (deriv 'x 'x)) (make-product (deriv 1 'x) 'x)) (deriv (make-product 1 'x) 'x))
   expected:<(+ (* 1 1) (* 0 x))>
    but was:<0> in base test
  ..

失敗しましたね．derivに微分の掛け算の場合の処理を加えていな
いので当然ですね．

それでは，derivに掛け算の場合の処理を加えましょう．

  (define (deriv exp var)
    (cond ((sum? exp)
           (make-sum (deriv (addend exp) var)
                     (deriv (augend exp) var)))
          ((product? exp)
           (make-sum (make-product (multiplier exp)
                                   (deriv (multiplicand exp) var))
                     (make-product (deriv (multiplier exp) var)
                                   (multiplicand exp))))
          ((eq? exp var) 1)
          (else 0)))

C-cC-tでテストしてみましょう．

  ...

成功です．それでは，最後の定義が片付いたのでパーッとお祝いし
ましょうか．


=== リファクタリング

お祝いはすみましたか？それではプログラミングに戻りましょう．

derivの中でeq?で同じ変数かチェックしていますが，実はこれが気
になっていました．同じ変数かどうかをチェックする述語
same-variable?でeq?を置き換えたいと思います．

same-variable?のテストは以下のようになります．

  (assert-true (same-variable? 'x 'x))
  (assert-false (same-variable? 'x 'y))
  (assert-false (same-variable? 'x 1))

これは，"variable test"にいれておきましょう．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     (assert-equal 0 (deriv 1 'x))
     (assert-equal 1 (deriv 'x 'x))
     (assert-equal (make-sum (deriv 1 'x)
                             (deriv 'x 'x))
                   (deriv (make-sum 1 'x) 'x))
     (assert-equal (make-sum (make-product 1 (deriv 'x 'x))
                             (make-product (deriv 1 'x) 'x))
                   (deriv (make-product 1 'x) 'x)))
    ("sum test"
     (assert-equal '(+ 1 x) (make-sum 1 'x))
     (assert-true (sum? (make-sum 1 'x)))
     (assert-equal 1 (addend (make-sum 1 'x)))
     (assert-equal 'x (augend (make-sum 1 'x))))
    ("product test"
     (assert-equal '(* 1 x) (make-product 1 'x))
     (assert-true (product? (make-product 1 'x)))
     (assert-equal 1 (multiplier (make-product 1 'x)))
     (assert-equal 'x (multiplicand (make-product 1 'x))))
    ("variable test"
     (assert-true (same-variable? 'x 'x))
     (assert-false (same-variable? 'x 'y))
     (assert-false (same-variable? 'x 1))))

それでは，C-cC-tでテストを実行しましょう．

  ...E
  ./test/test-symdiff.scm:27: (same-variable? 'x 'x)
  Error occured in variable test
  *** ERROR: unbound variable: same-variable?
  Stack Trace:
  _______________________________________
    0  (same-variable? 'x 'x)
          At line 27 of "./test/test-symdiff.scm"
    1  (assert-true (same-variable? 'x 'x))
          At line 27 of "./test/test-symdiff.scm"
    2  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    3  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"

same-variable?が定義されていないのでエラーになりました．
same-variable?を定義しましょう．

  (define (same-variable? exp1 exp2)
    (and (variable? exp1)
         (variable? exp2)
         (eq? exp1 exp2)))

引数が変数かvariable?でチェックするようにしました．

おっと，variable?のテストをまだ書いていませんでしたね（定義
もまだ書いていませんが）．variable?のテストは以下のようにな
ります．

  (assert-true (variable? 'x))
  (assert-false (variable? 1))

これは，"variable test"にいれておきましょう．

  (define-test-case "Symbolic Differentiation"
    ("base test"
     ...)
    ("sum test"
     ...)
    ("product test"
     ...)
    ("variable test"
     ...
     (assert-true (variable? 'x))
     (assert-false (variable? 1))))

それではC-cC-tでテストしてみましょう．

  ...E
  ./lib/symdiff.scm:38: (variable? exp1)
  Error occured in variable test
  *** ERROR: unbound variable: variable?
  Stack Trace:
  _______________________________________
    0  (variable? exp1)
          At line 38 of "./lib/symdiff.scm"
    1  (same-variable? 'x 'x)
          At line 27 of "./test/test-symdiff.scm"
    2  (assert-true (same-variable? 'x 'x))
          At line 27 of "./test/test-symdiff.scm"
    3  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    4  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"

variable?を定義していないのでエラーが起きました．variable?を
定義しましょう．

  (define (variable? exp)
    (symbol? exp))

expがsymbolであれば変数とします．

それでは，C-cC-tでテストを実行しましょう．

  ....

合格しましたね．

それでは，derivを書き換えましょう．

  (define (deriv exp var)
    (cond ((sum? exp)
           (make-sum (deriv (addend exp) var)
                     (deriv (augend exp) var)))
          ((product? exp)
           (make-sum (make-product (multiplier exp)
                                   (deriv (multiplicand exp) var))
                     (make-product (deriv (multiplier exp) var)
                                   (multiplicand exp))))
          ((same-variable? exp var) 1)
          (else 0)))

C-cC-tでテストを実行しましょう．

  ....

合格したままですね．

=== 簡約化

しまった！

  * dc/dx = 0 (cは定数かxではない変数)

のcがxではない変数の場合のテストをしていませんでした．

"base test"に以下のようなテストを追加しましょう．

  (assert-equal 0 (deriv 'y 'x))

C-cC-tでテストを実行しましょう．

  ....

合格していますね．よかったぁ．

ついでに，今までは，1とxを使った簡単な式しかテストしていなかっ
たのでもう少し複雑な式もテストしてみましょう．

今までは，1次元の簡単な使ったテストしか使っていませんでした
が，2次元以上のテストを追加しましょう．

最初に出した例2x^2 + x + 3をxで微分すると 4x + 1 になるとい
う微分をテストしてみましょう．

   (assert-equal (make-sum (make-product 4 'x) 1)
                 (deriv (make-sum (make-product 2 (make-product 'x 'x))
                                  (make-product 'x 3))
                        'x))))

これは，"more test"としておきましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("more test"
     (assert-equal (make-sum (make-product 4 'x) 1)
                   (deriv (make-sum (make-product 2 (make-product 'x 'x))
                                    (make-sum 'x 3))
                          'x))))

テストしてみましょう．

  ....F
  ./test/test-symdiff.scm:34: (assert-equal (make-sum (make-product 4 'x) 1) (deriv (make-sum (make-product 2 (make-product 'x 'x)) (make-sum 'x 3)) 'x))
   expected:<(+ (* 4 x) 1)>
    but was:<(+ (+ (* 2 (+ (* x 1) (* 1 x))) (* 0 (* x x))) (+ 1 0))> in more test

失敗しますね．

これは，式を簡約化していないことが原因のようです．

簡約化の規則を追加しましょう．

  * x + 0 = x
  * 数値 + 数値 = 数値の足し算
  * x * 1 = x
  * x * 0 = 0
  * 数値 * 数値 = 数値の掛け算

とりあえず，先程足したテストをクォートしておいて，簡約化の方
から手を付けましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("more test"
     '(assert-equal (make-sum (make-product 4 'x) 1)
                   (deriv (make-sum (make-product 2 (make-product 'x 'x))
                                    (make-sum 'x 3))
                          'x))))

C-cC-tでテストしておきましょう．

  .....

パスしますね．

==== make-sum

それでは，まず，足し算（make-sum）から手を付けましょう．テス
トは以下のものです．

  (assert-equal 'x (make-sum 'x 0))

これは，"sum reduce"というテストにしましょうか．

  (define-test-case "Symbolic Differentiation"
    ...
    ("sum reduce"
     (assert-equal 'x (make-sum 'x 0))))

C-cC-tでテストを実行します．

  .....F
  ./test/test-symdiff.scm:39: (assert-equal 'x (make-sum 'x 0))
   expected:<x>
    but was:<(+ x 0)> in sum reduce

失敗しますね．それでは，make-sumを書き換えましょう．

  (define (make-sum exp1 exp2)
    (cond ((= exp1 0) exp2)
          ((= exp2 0) exp1)
          (else (list '+ exp1 exp2))))

C-cC-tでテストしてみましょう．

  E
  ./test/test-symdiff.scm:12: (make-sum 1 'x)
  Error occured in base test
  *** ERROR: real number required: x
  Stack Trace:
  _______________________________________
    0  (make-sum 1 'x)
          At line 12 of "./test/test-symdiff.scm"
    1  (deriv (make-sum 1 'x) 'x)
          At line 12 of "./test/test-symdiff.scm"
    2  (assert-equal (make-sum (deriv 1 'x) (deriv 'x 'x)) (deriv (make-s ...
          At line 10 of "./test/test-symdiff.scm"
    3  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    4  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"
  （省略）

make-sumの引数には数値以外も指定される可能性があるので=を使
用するのはまずいですね．ということで，=number?を使うことにし
ましょう．=number?のテストは以下の通りです．

  (assert-true (=number? 1 1))
  (assert-false (=number? 1 'x))

これは"sum reduce"に加えておきましょう．ついでにmake-sumのテ
ストはクォートしておきます．

  (define-test-case "Symbolic Differentiation"
    ...
    ("sum reduce"
     '(assert-equal 'x (make-sum 'x 0))
     (assert-true (=number? 1 1))
     (assert-false (=number? 1 'x))))

C-cC-tでテストします．

  （省略）
  ./test/test-symdiff.scm:40: (=number? 1 1)
  Error occured in sum reduce
  *** ERROR: unbound variable: =number?
  Stack Trace:
  _______________________________________
    0  (=number? 1 1)
          At line 40 of "./test/test-symdiff.scm"
    1  (assert-true (=number? 1 1))
          At line 40 of "./test/test-symdiff.scm"
    2  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    3  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"

このエラーは=number?が未定義だからですね．=number?を定義しま
しょう．

  (define (=number? exp1 exp2)
    (and (number? exp1)
         (number? exp2)
         (= exp1 exp2)))

C-cC-tでテストを実行しましょう．

  E
  ./test/test-symdiff.scm:12: (make-sum 1 'x)
  Error occured in base test
  *** ERROR: real number required: x
  Stack Trace:
  _______________________________________
    0  (make-sum 1 'x)
          At line 12 of "./test/test-symdiff.scm"
    1  (deriv (make-sum 1 'x) 'x)
          At line 12 of "./test/test-symdiff.scm"
    2  (assert-equal (make-sum (deriv 1 'x) (deriv 'x 'x)) (deriv (make-s ...
          At line 10 of "./test/test-symdiff.scm"
    3  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    4  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"
  （省略）

先程の=number?が未定義というエラーが無くなりました．それでは，
make-sum の = を =number?に書き換えましょう．

  (define (make-sum exp1 exp2)
    (cond ((=number? exp1 0) exp2)
          ((=number? exp2 0) exp1)
          (else (list '+ exp1 exp2))))

ついでに，"sum reduce"でクォートしておいたmake-sumのクォート
も外しましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("sum reduce"
     (assert-equal 'x (make-sum 'x 0))
     (assert-true (=number? 1 1))
     (assert-false (=number? 1 'x))))

それではC-cC-tでテストをしましょう．

  ......

パスしましたね．

次は，"数値 + 数値 = 数値の足し算"となるようにmake-sumを変更
しましょう．テストはこうなります．

  (assert-equal 3 (make-sum 1 2))

これは"sum reduce"いれておきましょう．

(define-test-case "Symbolic Differentiation"
  ...
  ("sum reduce"
   ...
   (assert-equal 3 (make-sum 1 2))))

C-cC-tでテストを実行します．

  .....F
  ./test/test-symdiff.scm:42: (assert-equal 3 (make-sum 1 2))
   expected:<3>
    but was:<(+ 1 2)> in sum reduce

失敗しましたね．それでは，make-sumを書き換えましょう．

  (define (make-sum exp1 exp2)
    (cond ((=number? exp1 0) exp2)
          ((=number? exp2 0) exp1)
          ((and (number? exp1) (number? exp2))
           (+ exp1 exp2))
          (else (list '+ exp1 exp2))))

C-cC-tでテストしてみましょう．

  ......

パスしましたね．

==== make-product

次は，make-productを改良しましょう．

まず，x * 1 = xからです．これのテストは以下のようになります．

  (assert-equal 'x (make-product 'x 1))

これは"product reduce"にいれておきましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("product reduce"
     (assert-equal 'x (make-product 'x 1))))

それでは，C-cC-tでテストしましょう．

  ......F
  ./test/test-symdiff.scm:44: (assert-equal 'x (make-product 'x 1))
   expected:<x>
    but was:<(* x 1)> in product reduce

失敗しました．それでは，make-productを書き換えましょう．

  (define (make-product exp1 exp2)
    (cond ((=number? exp1 1) exp2)
          ((=number? exp2 1) exp1)
          (else (list '* exp1 exp2))))

それではC-cC-tでテストしましょう．

  F
  ./test/test-symdiff.scm:13: (assert-equal (make-sum (make-product 1 (deriv 'x 'x)) (make-product (deriv 1 'x) 'x)) (deriv (make-product 1 'x) 'x))
   expected:<(+ 1 (* 0 x))>
    but was:<1> in base test
  .F
  ./test/test-symdiff.scm:23: (assert-equal '(* 1 x) (make-product 1 'x))
   expected:<(* 1 x)>
    but was:<x> in product test
  F
  ./test/test-symdiff.scm:24: (assert-true (product? (make-product 1 'x)))
   expected:<#t>
    but was:<#f> in product test
  E
  ./test/test-symdiff.scm:25: (multiplier (make-product 1 'x))
  Error occured in product test
  *** ERROR: pair required, but got x
  Stack Trace:
  _______________________________________
    0  (multiplier (make-product 1 'x))
          At line 25 of "./test/test-symdiff.scm"
    1  (assert-equal 1 (multiplier (make-product 1 'x)))
          At line 25 of "./test/test-symdiff.scm"
    2  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    3  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"
  ....

今のテストはパスしますが，

  (assert-equal (make-sum (make-product 1 (deriv 'x 'x))
                          (make-product (deriv 1 'x) 'x))
                (deriv (make-product 1 'x) 'x)))

では，(+ 1 (* 0 x))になるはずが，1になっていて失敗しています．
とりあえず，これは，残りの簡約化の規則

  * x * 0 = 0
  * 数値 * 数値 = 数値の掛け算

を実装すれば解決しそうなので放置しましょう．

一方"product test"の

  (assert-equal '(* 1 x) (make-product 1 'x))

では，(* 1 x)になるはずが，1になっていて失敗しています．これ
は，今加えたテスト

  (assert-equal 'x (make-product 'x 1))

と同じことをしているので，変更するか削除しましょう．今回は，
1が特別なケースなので，削除しないで，2に変更しましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("product test"
     (assert-equal '(* 2 x) (make-product 2 'x))
     ...)
    ...)

機能拡張のためにテストを変更することもあります．

同じく，"product test"の

  (assert-true (product? (make-product 1 'x)))

では，#tになるはずが#fになっていて失敗しています．これも先程
と同じ様に1が特別なケースになったからです．そこで，テストを
変更します．

  (define-test-case "Symbolic Differentiation"
    ...
    ("product test"
     ...
     (assert-true (product? (make-product 2 'x)))
     (assert-false (product? (make-product 1 'x)))
     ...)
    ...)

1の場合はproduct?が#fになるというテストを加えておきました．

こちらも同じく"product test"の

  (assert-equal 1 (multiplier (make-product 1 'x)))

では，(make-product 1 'x)の返り値が1となっているのに，
multiplierはproduct(リスト)を要求していてエラーになっていま
す．これも，1が特別な場合だからです．テストを変更しましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("product test"
     ...
     (assert-equal 2 (multiplier (make-product 2 'x))))
    ...)

それでは，C-cC-tでテストを実行しましょう．

  F
  ./test/test-symdiff.scm:13: (assert-equal (make-sum (make-product 1 (deriv 'x 'x)) (make-product (deriv 1 'x) 'x)) (deriv (make-product 1 'x) 'x))
   expected:<(+ 1 (* 0 x))>
    but was:<1> in base test
  .E
  ./test/test-symdiff.scm:27: (multiplicand (make-product 1 'x))
  Error occured in product test
  *** ERROR: pair required, but got x
  Stack Trace:
  _______________________________________
    0  (multiplicand (make-product 1 'x))
          At line 27 of "./test/test-symdiff.scm"
    1  (assert-equal 'x (multiplicand (make-product 1 'x)))
          At line 27 of "./test/test-symdiff.scm"
    2  (#<id 0x826ddd0 gauche.parameter::let> ((#<id 0x826b3b0 gauche.par ...
          [unknown location]
    3  (let ((counter (make <real-time-counter>))) (with-time-counter cou ...
          At line 247 of "/home/kono/kou/local/share/gauche/site/lib/test/unit/base.scm"
  ....

先程変更したテスト以外は全て合格しましたが，1つエラーが増え
ました．"product test"の

  (assert-equal 'x (multiplicand (make-product 1 'x)))

です．これは，先程の

  (assert-equal 1 (multiplier (make-product 1 'x)))

と同じ様に1が特別な場合だから起こりました．そこで，1を使わな
いようにテストを変更します．

  (define-test-case "Symbolic Differentiation"
    ...
    ("product test"
     ...
     (assert-equal 'x (multiplicand (make-product 2 'x))))
    ...)

それではテストを実行しましょう．

  F
  ./test/test-symdiff.scm:13: (assert-equal (make-sum (make-product 1 (deriv 'x 'x)) (make-product (deriv 1 'x) 'x)) (deriv (make-product 1 'x) 'x))
   expected:<(+ 1 (* 0 x))>
    but was:<1> in base test
  ......

失敗があって気持ち悪いですが，残りの簡約化でパスするはずなの
でよしとします．

次は，x * 0 = 0を実現します．これのテストは以下のようになり
ます．

  (assert-equal 0 (make-product 'x 0))

これは，"product reduce"にいれましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("product reduce"
     ...
     (assert-equal 0 (make-product 'x 0))))

それではC-cC-tでテストを起動しましょう．

  F
  ./test/test-symdiff.scm:13: (assert-equal (make-sum (make-product 1 (deriv 'x 'x)) (make-product (deriv 1 'x) 'x)) (deriv (make-product 1 'x) 'x))
   expected:<(+ 1 (* 0 x))>
    but was:<1> in base test
  .....F
  ./test/test-symdiff.scm:46: (assert-equal 0 (make-product 'x 0))
   expected:<0>
    but was:<(* x 0)> in product reduce

予想通り失敗しました．それでは，実装しましょう．

  (define (make-product exp1 exp2)
    (cond ((=number? exp1 1) exp2)
          ((=number? exp2 1) exp1)
          ((or (=number? exp1 0) (=number? exp2 0)) 0)
          (else (list '* exp1 exp2))))

C-cC-tでテストを実行します．

  .......

先程残しておいた失敗も今の変更でパスするようになりました．よ
かったですね．

最後に，"数値 * 数値 = 数値の掛け算"を実装しましょう．テスト
は以下のようになります．

  (assert-equal 6 (make-product 2 3))

これは，"product reduce"にいれておきましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("product reduce"
     ...
     (assert-equal 6 (make-product 2 3))))

それでは，C-cC-tでテストを実行します．

  ......F
  ./test/test-symdiff.scm:47: (assert-equal 6 (make-product 2 3))
   expected:<6>
    but was:<(* 2 3)> in product reduce

失敗しました．それでは，実装しましょう．

  (define (make-product exp1 exp2)
    (cond ((=number? exp1 1) exp2)
          ((=number? exp2 1) exp1)
          ((or (=number? exp1 0) (=number? exp2 0)) 0)
          ((and (number? exp1) (number? exp2))
           (* exp1 exp2))
          (else (list '* exp1 exp2))))

それでは，C-cC-tでテストしましょう．

  .......

パスしました．

そろそろクォートしていたテストを戻してみましょう

  (define-test-case "Symbolic Differentiation"
    ...
    ("more test"
     (assert-equal (make-sum (make-product 4 'x) 1)
                   (deriv (make-sum (make-product 2 (make-product 'x 'x))
                                    (make-sum 'x 3))
                          'x)))
    ...)

それではC-cC-tでテストを実行してみましょう．

  ....F
  ./test/test-symdiff.scm:35: (assert-equal (make-sum (make-product 4 'x) 1) (deriv (make-sum (make-product 2 (make-product 'x 'x)) (make-sum 'x 3)) 'x))
   expected:<(+ (* 4 x) 1)>
    but was:<(+ (* 2 (+ x x)) 1)> in more test
  ..

パスしませんね．テスト結果をみると

  * ax + bx = (a + b) * x ; a, bは数値
  * a * (b * c) = abの計算結果 * acの計算結果 ; aは数値, b, cは数値か変数

という規則を追加するとよさそうです．

とりあえず，また，クォートしておきましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("more test"
     '(assert-equal (make-sum (make-product 4 'x) 1)
                   (deriv (make-sum (make-product 2 (make-product 'x 'x))
                                    (make-sum 'x 3))
                          'x)))
    ...)

C-cC-tでテストを実行してみます．

  .......

パスしますね．

それでは，まず，ax + bx = (a + b) * xから実装してみましょう．
テストは以下のようになります．

  (assert-equal '(* 5 x) (make-sum (make-product 3 'x)
                                   (make-product 2 'x)))

これは，"sum reduce"にいれておきましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("sum reduce"
     ...
     (assert-equal '(* 5 x) (make-sum (make-product 3 'x)
                                      (make-product 2 'x))))
    ...)

C-cC-tでテストを実行します．

  .....F
  ./test/test-symdiff.scm:44: (assert-equal '(* 5 x) (make-sum (make-product 3 'x) (make-product 2 'x)))
   expected:<(* 5 x)>
    but was:<(+ (* 3 x) (* 2 x))> in sum reduce
  .

失敗します．それでは，実装しましょう．

  (use srfi-1)
  (use util.combinations)
  (use gauche.collection)

  (define (make-sum exp1 exp2)
    (define (can-reduce?)
      (and (product? exp1) (product? exp2)
           (find (lambda (target)
                   (every (lambda (x) (eq? #t x))
                          (map (lambda (pred arg) (pred arg))
                               (list number? number? variable? variable?)
                               target)))
                 (permutations*
                  (list (multiplier exp1)
                        (multiplicand exp1)
                        (multiplier exp2)
                        (multiplicand exp2))
                  equal?))))

    (cond ((=number? exp1 0) exp2)
          ((=number? exp2 0) exp1)
          ((and (number? exp1) (number? exp2))
           (+ exp1 exp2))
          (else
           (let ((ret (can-reduce?)))
             (if ret
                 (let-optionals* ret ((first-number #f)
                                      (second-number #f)
                                      (first-variable #f)
                                      (second-variable #f))
                   (if (and first-number
                            (same-variable? first-variable second-variable))
                       (make-product (make-sum first-number second-number)
                                     first-variable)
                       (list '+ exp1 exp2)))
                 (list '+ exp1 exp2))))))

うーん，長くなってしまいましたねぇ．a,bが数値でxが変数という
条件にあうproductを見付けるために順列(permutations)を生成し
てマッチしているからですが，他に方法が思い付かなかったのです．

不吉な匂いがしてリファクタリングをしたくなりますが，今はこれ
以上思い浮かばないのでこのままにしておきます（みなさんの宿題
に．．．）．

C-cC-tでテストしてみましょう．

  .......

パスしましたね．


それでは

  * x + x = 2x ; xは変数

という規則を加えてみましょう．テストは以下のようになります．

  (assert-equal '(* 2 x) (make-sum 'x 'x))

これは，"sum reduce"に加えましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("sum reduce"
     ...
     (assert-equal '(* 2 x) (make-sum 'x 'x)))
    ...)

C-cC-tでテストを実行します．


  .....F
  ./test/test-symdiff.scm:46: (assert-equal '(* 2 x) (make-sum 'x 'x))
   expected:<(* 2 x)>
    but was:<(+ x x)> in sum reduce
  .

失敗しますね．それでは，実装しましょう．長いのでcondのところ
だけ示します．same-variable?がある節を追加しました．

  (cond ((=number? exp1 0) exp2)
        ((=number? exp2 0) exp1)
        ((and (number? exp1) (number? exp2))
         (+ exp1 exp2))
        ((same-variable? exp1 exp2)
         (make-product 2 exp1))
        (else
         ...))

C-cC-tでテストを実行します．

  .......

パスしました．

次に，a * (b * c) = abの計算結果 * acの計算結果（aは数値, b,
cは数値か変数）を実装しましょう．テストは以下のようになりま
す．

  (assert-equal '(* 9 x) (make-product 3 (make-product 3 'x)))

これは，"product reduce"に加えておきましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("product reduce"
     ...
     (assert-equal '(* 9 x) (make-product 3 (make-product 3 'x))))
    ...)

C-cC-tでテストを実行します．

  ......F
  ./test/test-symdiff.scm:51: (assert-equal '(* 9 x) (make-product 3 (make-product 3 'x)))
   expected:<(* 9 x)>
    but was:<(* 3 (* 3 x))> in product reduce

失敗しました．それでは，実装しましょう．

  (define (make-product exp1 exp2)
    (cond ((=number? exp1 1) exp2)
          ((=number? exp2 1) exp1)
          ((or (=number? exp1 0) (=number? exp2 0)) 0)
          ((and (number? exp1) (number? exp2))
           (* exp1 exp2))
          (else
           (let ((ret (find
                       (lambda (exps)
                         (let ((e1 (car exps))
                               (e2 (cadr exps)))
                           (and (number? e1)
                                (product? e2)
                                (or (number? (multiplier e2))
                                    (variable? (multiplier e2)))
                                (or (number? (multiplicand e2))
                                    (variable? (multiplicand e2))))))
                       (permutations (list exp1 exp2)))))
             (if (and ret (or (number? (multiplier (cadr ret)))
                              (number? (multiplicand (cadr ret)))))
                 (let ((num (car ret))
                       (mulier (multiplier (cadr ret)))
                       (mulcand (multiplicand (cadr ret))))
                   (if (and (number? mulier)
                            (number? mulcand))
                       (* num mulier mulcand)
                       (apply make-product
                              (if (number? mulier)
                                  (list (* num mulier) mulcand)
                                  (list (* num mulcand mulier))))))
                 (list '* exp1 exp2))))))

今回も順列を生成してしまいました．うーん，それにしても汚いで
すね．

ともあれ，C-cC-tでテストしてみましょう．

  .......

パスしました．

クォートして置いたテストを実行してみましょう．

  (define-test-case "Symbolic Differentiation"
    ...
    ("more test"
     (assert-equal (make-sum (make-product 4 'x) 1)
                   (deriv (make-sum (make-product 2 (make-product 'x 'x))
                                    (make-sum 'x 3))
                          'x)))
    ...)


C-cC-tでテストを実行します．

  .......

パスしますね．


あとは，これをリファクタリングしていけばいいだけです．テスト
があるので，安心してリファクタリングできますね．

ここまで．あとは，勝手にリファクタリングしてください．

それでは，私はテストがパスしたお祝いでもしてきます．
