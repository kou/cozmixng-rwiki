= 日本語プログラミング

== Java

=== ソース

わからん

  // 日本語.java
  class 日本語
  {

    public static void main(String[] args)
      {
        人 山田 = new 人("山田");
        System.out.println(山田.あいさつ("田中"));
       }
  }

  class 人
  {
    private String _名前;

    public 人(String 名前)
      {
        _名前 = 名前;
      }
  
    public String あいさつ(String 名前)
      {
        return("どうも " + 名前 + "さん，私は" + _名前 + "です．");
      }
  }

=== 実行

うごかん

  % javac 日本語.java
  % java 日本語 # 多分ここでエンコーディングを指定しなくてはいけない．

== Gauche

=== ソース

  ;;; 日本語.scm
  (define (あいさつ 自分 相手)
    (display #`"どうも,|相手|さん，私は,|自分|です．")
    (newline))

  (あいさつ "山田" "田中")

=== 実行

  % gosh 日本語.scm

== Ruby

=== ソース

クラス名はアルファベットの大文字で始めなくてはいけない

  # 日本語.rb
  class C人

    def initialize(名前)
      @名前 = 名前
    end

    def あいさつ(名前)
      puts ("どうも #{名前}さん，私は#{@名前}です．")
    end

  end

  C人.new("山田").あいさつ("田中")

=== 実行

ソースのエンコーディング((-いまだにエンコーディングと文字コードの使い分けがよく分からん-))がEUC-JPの場合

  % ruby -Ke 日本語.rb
