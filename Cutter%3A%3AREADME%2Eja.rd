# -*- rd -*-

= README.ja

$Id: README.ja 14 2004-09-14 05:23:13Z kou $

== 名前

Cutter

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

LGPL

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
を御覧下さい．

== なにこれ？

((<CUnit|URL:http://www.gethos.net/opensource/cunit>))を改造
したCのためのUnit Testing Frameworkです．CUnitに付属している
ドキュメントはCUnit/以下にあります．

テストを共有ライブラリとして作成するのが特長です．

== 依存ライブラリ

特に無し

=== あればよいもの

  * ((<GaUnit|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=GaUnit>))
    に付いているrun-test.el（Emacs上で楽にテストしたい場合）

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/cutter.tar.gz>))

  % svn co http://www.cozmixng.org/repos/c/cutter/trunk cutter

== インストール

  % ./configure
  % make
  # make install

== 使い方

  % cutter [オプション] [libtest_*.soがあるディレクトリ]

=== オプション

: -vLEVEL, --verbose=LEVEL

   出力の詳細さを指定します．LEVELにはsilent, normal,
   progress, verboseが指定できます（それぞれs, n, p, vでも可）．
   後ろの方ほど詳細になります．
   
: -bBASE, --base=BASE
   
   テストが失敗した場合にファイル名の前にBASEを付加します．
   Cutterの出力からテストが失敗した箇所にジャンプするツール
   （Emacsなど）と連携するための機能です．

== テストの作り方

テストの実行は以下のような流れになります．

  (1) テストを作成する
  (2) コンパイルし，libtest_*.soを作成する
  (3) cutterを起動し，libtest_*.soを読み込ませ，テストをする

詳しくはTutorial.jaを参考にして下さい．

== リファレンス

=== 表明

UT_ASSERT*の一覧です．引数にある(({message}))は表明が失敗した
場合に表示されます．

--- UT_PASS
    
    必ずパスします．

--- UT_FAIL(message)
    
    必ず失敗します．

--- UT_ASSERT(expect, message)
    
    (({expect}))が0以外ならパスします．

--- UT_ASSERT_EQUAL_INT(expect, actual, message)
    
    (({expect}))と(({actual}))が等しければパスします．どちら
    もint型あるいはその亜種（longとか）である必要があります．

--- UT_ASSERT_EQUAL_FLOAT(expect, actual, message)
    
    (({expect}))と(({actual}))が等しければパスします．どちら
    もfloat型あるいはその亜種（doubleとか）である必要があり
    ます．

--- UT_ASSERT_EQUAL_STRING(expect, actual, message)
    
    (({expect}))と(({actual}))が同じ内容の文字列であればパス
    します．

=== 雛型

テストの雛型は以下のようになります．

  #include <cutter/cutter.h>
  
  #include "自分のプログラムのヘッダファイル"
  
  UT_DEF(テスト名1)
  {
    UT_ASSERTなんとか;
    ...
    UT_PASS; /* ここまで来たらテストにパスしたということ */
  }
  
  UT_DEF(テスト名2)
  {
    ...
  }
  
  ...
  
  /* テストを登録 */
  UT_REGISTER_BEGIN("テスト全体の名前") /* ;は付けない */
  UT_REGISTER(テスト名1, "テストの説明") /* ;は付けない */
  UT_REGISTER(テスト名2, "テストの説明") /* ;は付けない */
  ...
  UT_REGISTER_END

