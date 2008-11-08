= Rubyで関数プログラミング

((<Rubyで関数プログラミング(Functional Programming in Ruby)|URL:http://sky.zero.ad.jp/~zaa54437/programming/ruby/>))より

== 引数に関数を指定するときには&をつけなければいけない？？

((<ファーストクラスの関数(Part 6)|URL:http://sky.zero.ad.jp/~zaa54437/programming/ruby/part6.htm>))より

  関数の引数に関数を指定することはできますが、
  それは、通常の関数定義ではなく関数オブジェクトを生成して、
  &記号をつけて、しかも引数の最後に指定しなければなりません。

これではダメなのだろうか．

  def a(b, c, d)
    p b[1]
    p c[1]
    p d[1]
  end

  a(lambda {|x| x + 1},
    lambda {|x| x + 2},
    lambda {|x| x + 3})

== #lambdaに関数オブジェクトを渡せない？？

((<参照透明性の確保(2) - 継続渡し(continuation passing)|URL:http://sky.zero.ad.jp/~zaa54437/programming/ruby/appendix-b1.htm>))あたり

関数オブジェクトがProcオブジェクトのことならば渡せるのではないだろうか．例えばこんな感じ．

  # 継続渡し版
  # 定義
  cont_func4 = lambda {|a| print a, "\n" }

  def cont_func3(a, continuation)
    a=4*a;
    continuation[a]
  end

  cont_func2 = lambda {|a, continuation|
    print a, "\n";
    continuation[a, cont_func4]
  }

  def cont_func1(a, continuation)
    a=a+a+a;
    # Methodオブジェクトでもいいのならto_procはいらないけど
    continuation[a, method(:cont_func3).to_proc]
  end

  # 実行プログラム
  cont_func1(2, cont_func2);
