# -*- rd -*-

= Tutorial.ja

$Id: Tutorial.ja 17 2004-09-14 06:47:53Z kou $

== 下準備

まず，テストを作成するための下準備をします．
((<GaUnit|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=GaUnit>))
に付いているrun-test.elを使うと仮定して話を進めます．

今回は，四則演算を行うプログラムを作成します．

=== ディレクトリ構成

まず，プログラムを作成するためのディレクトリを用意します．今
回はcalcとしましょう．

  % cd ~/work/c/ # とかプログラム作成用ディレクトリに移動
  % mkdir calc
  % cd calc

続いて，calc/ディレクトリ以下にプログラム用ディレクトリsrc/
と，テストプログラム用ディレクトリtest/を作成します．

  [calc]% mkdir src
  [calc]% mkdir test

つまり，ディレクトリ構成は以下のようになります．

  calc/ -+- src/ ソースファイルを置く
         |
         +- test/ テスト用のファイルを置く

=== テスト起動の自動化

ディレクトリ構成が出来たので，次に，テストを起動を自動化する
ためのファイルを作成します．

まず，テスト起動用スクリプトcalc/test/run-test.shを作成しま
す．内容は以下のようにします．makeはGNU Makeを使うようにして
ください．システムによってはgmakeというコマンドでインストー
ルされているかもしれません．適宜変更してください．

  #!/bin/sh
  make test

実行権を付けるのを忘れないでください．

  [calc]% chmod +x test/run-test.sh

次に，calc/Makefileを作成します．内容は以下のようにします．

  include Makefile.test

calc/Makefile.testは「$PREFIX/share/cutter/Makefile.test」
（$PREFIXは./configure時に--prefixで指定した値）をコピーして
きます．あるいは，アーカイブ中のsample/calc/Makefile.testを
コピーしてもよいです．

ということで，現在は以下のような構成になっているはずです．

  calc/ -+- Makefile <- 作成
         |
         +- Makefile.test <- コピー
         |
         +- src/
         |
         +- test/ -+- run-test.sh <- 作成


== テストの作成

テストはtest/以下にtest_XXX.cという名前で作成します．今回は
test/test_calc.cとしてテストを書きましょう．

まず，足し算のテストを書きます．

  #include <cutter/cutter.h>
  
  #include "calc.h"
  
  UT_DEF(add_test)
  {
    UT_ASSERT_EQUAL_INT(3, add(1, 2), "1 + 2");
    UT_PASS;
  }
  
  UT_REGISTER_BEGIN("calc test")
  UT_REGISTER(add_test, "add test")
  UT_REGISTER_END

このテストでは，(({add(1, 2)}))の結果が(({3}))になるかをテス
トしています．それでは，run-test.elを使っている場合はC-cC-t
でテストを実行してみましょう．使っていない場合は以下のコマン
ドでテストを実行します．

  [calc]% test/run-test.sh

以下のような結果になるでしょう．

  Need to run make depend
  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG test/test_calc.c | sed -e 's,^\(.*\):,test/\1:,' > .depend.test
  cat .depend.src .depend.test > .depend
  rm .depend.src .depend.test

これは，ファイル間の依存関係を自動計算しています．必要なとき
（今のようにファイルを作成したときや変更されたとき）に自動で
実行されます．

依存関係が計算されたのでもう一度C-cC-tでテストしてみましょう．

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include` -o test/test_calc.o -c test/test_calc.c
  test/test_calc.c:3:18: calc.h: No such file or directory
  test/test_calc.c: In function `add_test':
  test/test_calc.c:7: warning: implicit declaration of function `add'
  gmake: *** [test/test_calc.o] エラー 1

calc.hがないのでコンパイルエラーになっています．ということで，
src/calc.hを作成しましょう．

  int add(int x, int y);

きっちりとこんな風にしてもよいです．

  #ifndef CALC_H
  #define CALC_H

  int add(int x, int y);

  #endif

それでは，C-cC-tでテストを走らせましょう．

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include` -o test/test_calc.o -c test/test_calc.c
  gcc -L./ -shared -o test/libtest_calc.so test/test_calc.o
  cutter -vp
  dlopen() failed: ./test/libtest_calc.so: Undefined symbol "add"
  Assertion ((null)) failed load.c:43
  gmake: *** [do-test] Abort trap (コアダンプしました)
  rm test/test_calc.o

(({add}))が定義されていないのでcoreを吐いて終了しました．そ
れでは，src/calc.cに(({add}))の定義を書きましょう．テストで
は(({add})) は(({1})), (({2}))を引数として受け取ったら，
(({3}))を返すことになっていました．

  #include "calc.h"

  int
  add(int x, int y)
  {
    return 3;
  }

足し算していないと思うかもしれませんが，これでいいのです．テ
ストは(({3}))を返すことを期待しているのですから．

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  cutter -vp
  .
  [1/1](100.00%) tests passed.
  rm test/test_calc.o src/calc.o

コンパイル後にテストを実行（cutter -vp）しています．「tests
passed.」というのを見てもわかる通り，テストをパスしています．
予想通りですね．

ただ，今の(({add}))だと答えが3になる場合しか正しく動作しませ
ん．他の場合でも動作するようにテストを追加して，改良しましょ
う．

test/test_calc.cを以下のように変更します．

  UT_DEF(add_test)
  {
    UT_ASSERT_EQUAL_INT(3, add(1, 2), "1 + 2");
    UT_ASSERT_EQUAL_INT(1, add(3, -2), "3 + -2");
    UT_PASS;
  }

つまり，(({1 + 2}))の結果が(({3}))になるだけではなく，(({3 +
-2}))の結果が(({1}))になる必要があります．

それでは，C-cC-tでテストしましょう．

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  cutter -vp
  E
  Errors:
  ./test/test_calc.c:8: - calc test add test - 3 + -2
   expected: <1>
    but was: <3>

  [0/1](0.00%) tests passed.
  gmake: *** [do-test] エラー 1
  rm test/test_calc.o src/calc.o

予想通り失敗しました．(({3 + -2}))でも結果が3になっています．

それでは，テストをパスするようにsrc/calc.cをを変更しましょう．

  int
  add(int x, int y)
  {
    return x + y;
  }

C-cC-tでテストします．

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  cutter -vp
  .
  [1/1](100.00%) tests passed.
  rm test/test_calc.o src/calc.o

パスしました．あとは，今の手順を繰り返していけばよいです．つ
まり，こういうことです．

  * テストの作成
  * テストの実行（エラーになることを確認）
  * テストをパスするようにソースの変更
  * テストの実行（テストにパスすることを確認．パスするまでは
    次のテストを追加しない）

引き算，かけ算，割り算は宿題としましょう．

== おまけ

と思いましたが，引き算だけ追加してみましょう．自分でやりたい
人は見ないでください．

まず，test/test_calc.cにテストを追加します．

  UT_DEF(sub_test)
  {
    UT_ASSERT_EQUAL_INT(1, sub(3, 2), "3 - 2");
    UT_PASS;
  }

テストを登録することを忘れてはいけません．

  UT_REGISTER_BEGIN("calc test")
  UT_REGISTER(add_test, "add test")
  UT_REGISTER(sub_test, "sub test") /* <- 追加 */
  UT_REGISTER_END

C-cC-tでテストを実行します．

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  test/test_calc.c: In function `sub_test':
  test/test_calc.c:14: warning: implicit declaration of function `sub'
  cutter -vp
  dlopen() failed: ./test/libtest_calc.so: Undefined symbol "sub"
  Assertion ((null)) failed load.c:43
  gmake: *** [do-test] Abort trap (コアダンプしました)
  rm test/test_calc.o src/calc.o

(({sub}))を宣言をしていないことによる警告が出ています．また，
(({sub}))を定義していないためにcoreを吐いています．

まず，src/calc.hに(({sub}))のプロトタイプ宣言を追加しましょ
う．

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  cutter -vp
  dlopen() failed: ./test/libtest_calc.so: Undefined symbol "sub"
  Assertion ((null)) failed load.c:43
  gmake: *** [do-test] Abort trap (コアダンプしました)

(({sub}))の宣言がないという警告がなくなりました．

src/calc.cに定義を書きましょう．

  int
  sub(int x, int y)
  {
    return x - y;
  }

簡単ですね．

C-cC-tでテストしましょう．
  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  cutter -vp
  ..
  [2/2](100.00%) tests passed.

パスしました．

以上です．かけ算と割り算は本当に宿題です．

