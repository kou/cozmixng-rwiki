# -*- rd -*-

= README.ja

$Id: README.ja 563 2005-02-28 00:43:34Z kou $

== 名前

gdchart

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

Ruby's

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
を御覧下さい．

== なにこれ？

((<GDChart|URL:http://www.fred.net/brv/chart/>))のRubyバイン
ディングです．RubyとCのインターフェイスは
((<SWIG|URL:http://www.swig.org/>))で生成しています．

同様のものに，((<RAA:ruby-gdchart>))があります．

== 依存しているもの

  * ((<GD|URL:www.boutell.com/gd/>))
  * ((<GDChart|URL:http://www.fred.net/brv/chart/>))
  * ((<SWIG|URL:http://www.swig.org/>))

=== あればよいもの

GDChartもこれらを利用してコンパイルされている必要があります．

  * ((<libfreetype|URL:http://sourceforge.net/projects/freetype/>))
    （日本語を扱いたければ必須）
  * ((<libjpeg|URL:http://www.ijg.org/>))

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/gdchart.tar.gz>))

  % svn co http://www.cozmixng.org/repos/ruby/gdchart/trunk gdchart

== インストール

  % ruby setup.rb config

もし，インクルードパスを追加したければ以下のようにしてくださ
い．

  % ruby setup.rb config -- -Iパス1 -Iパス2 ...

あとはいつも通りです．

  % ruby setup.rb setup
  # ruby setup.rb install

== 使い方

sample/以下を参考にしてください．ごめんなさい，詳しいことは
後で書きます．たぶん．

日本語を扱いたい場合はsample/*_ja.rbが参考になると思います．


今のところは，とりあえず，~/.irbrcに以下のように書いてTABで
メソッド名を補完してごまかしていてください．

  require 'irb/completion'

例えば，円グラフを作成したい場合は以下のようにするとよいかも
しれません．

  % irb -r gdchart/pie
  irb(main):001:0> pie = GDChart::Pie.new
  irb(main):002:0> pie.[TAB]


あるいは，lib/gdchart/base.rbとかlib/gdchart/graph.rbとか
lib/gdchart/pie.rbの以下のコメントが書かれた部分より下のとこ
ろを見るとよいかもしれません．

  # _
  ### method generation

=== 日本語を使うときの注意

やはり，大したことは書かないのですが，日本語を使うときは以下
のことに注意してください．

  * 文字コードをUTF-8にしてください（GDのコンパイルの仕方に
    よって変わってくるかも）．

  * フォントは日本語のTrueTypeフォントを指定してください．

  * フォントだけでなくサイズ（sizeじゃなくてptsizeの方）も指
    定してください．
    
    例えば，グラフのタイトルを設定する場合は以下のようにしま
    す．
    
      graph = GDChart::Graph.new
      graph.title = "たいとる"
      graph.title_font = ".../mikachan.ttf"
      graph.title_ptsize = 20.0

== 感謝

  * Markusさん: バグ報告してくれました．
