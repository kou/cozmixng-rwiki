# -*- RD -*-

((<URL:http://www.swig.org/Doc1.3/Arguments.html>))の勝手な
和訳．

SWIG 1.3 - Last Modified : October 13, 2002

= 引数の扱い

((*注意: この章は作成中です．*))

3章で，SWIGが基本的なデータタイプとポインタをどのように扱う
かを説明しました．具体的にいうと，intやdoubleのようなプリミ
ティブな型は，ターゲット言語の対応する型に対応する型に対応づ
けられます．構造体，クラス，配列，その他のユーザ定義データ型
のような，プリミティブな型ではない全てのデータタイプには，そ
のデータタイプを指すポインタが使われます．しかし，いくつかの
アプリケーションでは，特定のデータタイプに関するSWIGの扱い方
を変更することが望ましい．例えば，関数の引数を通して複数の値
を返したいとします．本章では，これを実現するためのテクニック
を説明します．

== typemaps.iライブラリ

この節では，typemaps.iライブラリについて説明します．このライ
ブラリは引数変換の特性を変更するために広く使われます．

=== 序論

以下のようなCの関数を考えます．

    void add(double a, double b, double *result) {
            *result = a + b;
    }

ソースコードを読めば，この関数は((|double *result|))引数に値
を保存することは明白です．しかし，SWIGは関数本体を読まないの
で，裏に潜んだ動作を知る方法はありません．

これを扱うためのひとつの方法は，typemaps.iライブラリを使って
以下のようなインタフェースコードを書くことです．

    // Simple example using typemaps
    %module example
    %include "typemaps.i"
    
    %apply double *OUTPUT { double *result };
    extern void add(double a, double b, double *result);

((:%apply:))ディレクティブは，指定した型を特別な型として扱う
ルールを適用することをSWIGに教えます．((|double *OUTPUT|))は，
どのように((|double *|))型の引数から出力値を返すかを定義して
いるルールの名前です．ルールは大括弧の中((({{ ... }})))に並
べられた全てのデータタイプに適用されます．今回の例では
(({double *result}))に適用されます．

このインタフェースファイルを使ってモジュールを作成すると，
(Pythonでは)以下のようにこの関数を使うことができる．

    >>> a = add(3,4)
    >>> print a
    7
    >>>

この場合，どのように3番目の引数への出力値が返されたかがわか
ります．つまり，3番目の引数への出力値は魔法のように関数の戻
り値に変換されたのです．特別な(({double *}))オブジェクトを作っ
て，どうにかしてそれを関数に渡す必要がなくなったので，明らか
に関数は使いやすくなりました．

一度，型にタイプマップを適用すると，以後全ての型と名前に対し
て効果があります．例えば，以下のように書くことができます．

    %module example
    %include "typemaps.i"
    
    %apply double *OUTPUT { double *result };
    extern void add(double a, double b, double *result);
    extern void sub(double a, double b, double *result);
    extern void mul(double a, double b, double *result);
    extern void div(double a, double b, double *result);
    ...

この場合，(({double *OUTPUT}))ルールは，その後に現れる全ての
関数に適用されます．

タイプマップ変換を使っては複数の値を返すこともできます．例え
ば，以下のコードを考えてください．

    %include "typemaps.i"
    %apply int *OUTPUT { int *width, int *height };
    
    // Returns a pair (width,height)
    void getwinsize(int winid, int *width, int *height);

この場合，この関数は複数の値を返します．そのため，以下のよう
に使うことができます．

    >>> w,h = genwinsize(wid)
    >>> print w
    400
    >>> print h
    300
    >>>

((:%apply:))ディレクティブは，タイプマップルールをデータタイ
プに関連づけるために使われますが，ルール名を直接引数中に使う
こともできます．例えば，以下のようにも書けます．

    // Simple example using typemaps
    %module example
    %include "typemaps.i"
    
    extern void add(double a, double b, double *OUTPUT);

タイプマップは，明示的に削除されたり，再定義されない限り効果
を持続します．タイプマップを消去するには((:%clear:))ディレク
ティブを使います．例えば，以下のように使います．

    %clear double *result;      // Remove all typemaps for double *result

=== 入力パラメータ

以下のタイプマップルールは，ポインタは単一の入力値だけを保持
していることをSWIGに指示します．

    int *INPUT              
    short *INPUT
    long *INPUT
    unsigned int *INPUT
    unsigned short *INPUT
    unsigned long *INPUT
    double *INPUT
    float *INPUT

このルールを使うと，ポインタの代わりに値を渡すことができます．
例えば，以下の関数を考えてください．

    double add(double *a, double *b) {
            return *a+*b;
    }

今，以下のSWIGインタフェースを考えます．

    %module example
    %include "typemaps.i"
    ...
    extern double add(double *INPUT, double *INPUT);

この関数がスクリプト言語のインタプリタで使われるとき，以下の
ように動きます．

    result = add(3,4)

=== 出力パラメータ

以下のタイプマップルールは関数の出力値がポインタであることを
SWIGに指示します．このルールを使うと，関数を呼び出す時に引数
を与える必要がなくなります．その代わり，ひとつ以上の出力値が
返ってきます．

    int *OUTPUT
    short *OUTPUT
    long *OUTPUT
    unsigned int *OUTPUT
    unsigned short *OUTPUT
    unsigned long *OUTPUT
    double *OUTPUT
    float *OUTPUT

これらのルールは，以前にでてきた例で示したように使えます．例
えば，以下のようなCの関数があったとします．

    void add(double a, double b, double *c) {
            *c = a+b;
    }

SWIGのインタフェースファイルは以下のようになるでしょう．

    %module example
    %include "typemaps.i"
    ...
    extern void add(double a, double b, double *OUTPUT);

この場合は，一つの値だけが返されますが，一つの値しか返せない
というような制限はありません．(以前に示したように)出力ルール
をひとつ以上の引数に適用することで，任意の数の値を返すことが
できます．

もし，関数が値を返す場合は，関数が返す値と引数の値が一緒に返
されます．例えば，以下のような関数があったとします．

    extern int foo(double a, double b, double *OUTPUT);

この関数は，以下のようにふたつの値を返します．

    iresult, dresult = foo(3.5, 2)

=== 入出力パラメータ

ポインタが入力用にも出力用にも使われるときは，以下のタイプマッ
プルールを使うことができます．

    int *INOUT
    short *INOUT
    long *INOUT
    unsigned int *INOUT
    unsigned short *INOUT
    unsigned long *INOUT
    double *INOUT
    float *INOUT

このルールを使うCの関数は，例えば以下のようになります．

    void negate(double *x) {
            *x = -(*x);
    }

入力用と出力用のふたつの機能を持つ((|x|))を作るために，この
関数は，インタフェースファイル中で以下のように宣言されます．

    %module example
    %include typemaps.i
    ...
    extern void negate(double *INOUT);

スクリプト中では，普通に関数を呼び出すことができます．

    a = negate(3);         # a = -3 after calling this

(({INOUT}))ルールの難解な点は，多くのスクリプト言語がプリミ
ティブなオブジェクトに対して変更不可能という制約を強制してい
ることです(つまり，整数や文字列といった単純なオブジェクトは
変更できないということです)．このため，この例のCの関数(訳注:
(たぶん) Cバージョンの(({negative})))がしているように，(訳注:
(たぶん)スクリプト言語の(({negative}))では)オブジェクトの値
を変更することができません．したがって，(({INOUT}))ルールは
元の入力オブジェクトの値を直接上書きするのではなくて，変更さ
れた値を持つ新しいオブジェクトを返します．

((*互換性に関する注意*)): (({INOUT}))ルールは初期のバージョ
ンのSWIGでは(({BOTH}))でした．(({BOTH}))は後方互換性のために
残されていますが，推奨されません．

=== 異なった名前の使用

以前に示したように，((:%apply:))ディレクティブは(({INPUT}))，
(({OUTPUT}))，(({INOUT}))タイプマップを異なった名前の引数に
適用するために使うことができます．例えば，以下の通りです．

    // Make double *result an output value
    %apply double *OUTPUT { double *result };
    
    // Make Int32 *in an input value
    %apply int *INPUT { Int32 *in };
    
    // Make long *x inout
    %apply long *INOUT {long *x};

ルールを消去するために，((:%clear:))ディレクティブを使います．

    %clear double *result;
    %clear Int32 *in, long *x;

タイプマップ宣言はレキシカルスコープを持っていて，タイプマッ
プの効果は定義した場所からファイルの終わり，または対応する
((:%clear:))宣言まで続きます．

== 入力値に制約を適用する

入力値の扱いを変更するのに加えて，制約を加えるためにタイプマッ
プを使うこともできます．例えば，値が正の値であるとか，ポイン
タがNULLでないことを保証したいかもしれません．これは
constraints.iライブラリファイルを取り込むことで達成すること
ができます．

=== 簡単な制約の例

以下のインタフェースファイルは制約ライブラリをもっともよく説
明しています．

    // 制約付きのインタフェースファイル
    %module example
    %include "constraints.i"
    
    double exp(double x);
    double log(double POSITIVE);         // 正の値だけを許可
    double sqrt(double NONNEGATIVE);     // 非負の値だけ許可
    double inv(double NONZERO);          // 非ゼロの値だけ許可
    void   free(void *NONNULL);          // 非NULLのポインタだけ許可

このファイルは望んだ通りに動作します．もし，引数のどれかが制
約条件に違反したら，スクリプト言語は例外をあげるでしょう．結
果として，不正な値を捕捉することができ，不可解なプログラムの
クラッシュなどを防ぐことができます．

=== 制約方法

現在利用できる制約は以下のものです．

    POSITIVE                     Any number > 0 (not zero)
    NEGATIVE                     Any number < 0 (not zero)
    NONNEGATIVE                  Any number >= 0
    NONPOSITIVE                  Any number <= 0
    NONZERO                      Nonzero number
    NONNULL                      Non-NULL pointer (pointers only).

=== 新しいデータタイプに制約を適用する

制約ライブラリはプリミティブなCの型だけをサポートしています
が，((:%apply:))を使って新しいデータタイプへ簡単に制約を適用
できます．

    // Apply a constraint to a Real variable
    %apply Number POSITIVE { Real in };
    
    // Apply a constraint to a pointer type
    %apply Pointer NONNULL { Vector * };

"Number"や"Pointer"という特別な型は，それぞれ，任意の数値型，
ポインタ型に適用できます．以降の制約を取り除くために，以下の
ように(({%clear}))ディレクティブを使うことができます．

    %clear Real in;
    %clear Vector *;
