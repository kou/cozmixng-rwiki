# -*- rd -*-

= Tutorial.ja

$Id: Tutorial.ja 526 2004-12-05 04:56:07Z kou $

== require

RSS 1.0を扱う場合は

  require 'rss/1.0'

を記述してください。

RSS 0.9xを扱う場合は

  require 'rss/0.9'

を記述してください。

RSS 2.0を扱う場合は

  require 'rss/2.0'

を記述して下さい．

これらは複数記述する事ができます。つまり，RSS 0.9x/1.0を扱いたい場合は

  require 'rss/0.9'
  require 'rss/1.0'

として下さい．RSS 0.9x/1.0/2.0を扱いたい場合は

  require 'rss/1.0'
  require 'rss/2.0'

として下さい．RSS 2.0はRSS 0.9xを含んでいるので

  require 'rss/0.9'

を記述する必要はありません．

また、必要に応じて

  require 'rss/dublincore'

や

  require 'rss/syndication'

や

  require 'rss/content'

や

  require 'rss/trackback'

も記述してください。これらは、それぞれ((<Dublin
Core|URL:http://web.resource.org/rss/1.0/modules/dc/>))モジュー
ル、
((<Syndication|URL:http://web.resource.org/rss/1.0/modules/syndication/>))
モジュール，
((<Content|URL:http://web.resource.org/rss/1.0/modules/content/>))
モジュール，
((<TrackBack|URL:http://madskills.com/public/xml/rss/module/trackback/>))
モジュールを使用可能にします。

ただし，Contentモジュールはcontent:encodedしかサポートしていません．

== パース

RSSをパースしたい場合はRSS::Parserクラスを使います。
RSS::Parser.parseはStringのRSSをパースします(使用するXMLパー
サによってはFileやIOオブジェクトなどでもパース可能です)。RSS
1.0をパースした場合はRSS::RDFオブジェクトを、RSS 0.9x/2.0を
パースした場合はRSS::Rssオブジェクトを返します。パースした
Stringがwell formedなXMLで無い場合は，RSS::Errorのサブクラス
(RSS::NotWellFormedError)の例外が発生します。well formedな
XMLだが，RSS 0.9x/1.0/2.0のいずれでもない場合は，nilが返りま
す．

例えば、RSS 1.0をバリデーション付きでパースするには以下のよ
うにします。ここで、変数(({rss_source}))にはRSS 1.0形式の文
字列が格納されているものとします。

  require 'rss/1.0'
  rss = RSS::Parser.parse(rss_source, true)

RSS::Parser.parseの第二引数は省略するとtrueが指定されたもの
とみなされるので、これは以下のようにも書けます。

  require 'rss/1.0'
  rss = RSS::Parser.parse(rss_source)

最初はバリデーション付きでパースして，validではないRSSだった
場合はバリデーション無しでパースするには以下のように書きます。

  require 'rss/1.0'
  rss = nil
  begin
    rss = RSS::Parser.parse(rss_source)
  rescue RSS::InvalidRSSError
    rss = RSS::Parser.parse(rss_source, false)
  end

これは(({rss_source}))がRSS 0.9x/1.0/2.0のどれか分からない時
にも有効です。以下のように書くと、まずRSS 1.0としてバリデー
ション付きでパースし、バリデーションに失敗するとRSS 0.9x/(壊
れた)1.0/2.0のいずれかとしてパースします。

  require 'rss/1.0'
  require 'rss/2.0'
  rss = nil
  begin
    rss = RSS::Parser.parse(rss_source)
  rescue RSS::InvalidRSSError
    rss = RSS::Parser.parse(rss_source, false)
  end


Dublin Core，Syndication，Content，TrackBackモジュールの要素
もパースしたい場合はRSS::Parser.parseの前にrss/dublincore,
rss/syndication, rss/content, rss/trackbackをrequireしてくだ
さい。

  require 'rss/1.0'
  require 'rss/2.0'
  require 'rss/dublincore'
  require 'rss/syndication'
  require 'rss/content'
  require 'rss/trackback'
  rss = nil
  begin
    rss = RSS::Parser.parse(rss_source)
  rescue RSS::InvalidRSSError
    rss = RSS::Parser.parse(rss_source, false)
  end

=== 知らない要素の扱い

パーサはデフォルトでは知らない要素(仕様書に規定されていない
要素)を無視します。もし、知らない要素に遭遇した時に例外を発
生させたければ，RSS::Parser.parseの第三引数にfalseを指定して
ください。こうすると、パース中に知らない要素に遭遇した時に
RSS::UnknownTagError例外が発生します。RSS::UnknownTagErrorク
ラスはRSS::InvalidErrorクラスのサブクラスです。

以下のようにすると，より厳密にRSS 1.0をパースできます。

  RSS::Parser.parse(rss_source, true, false)

== パースされたRSS

RSSはパースされるとStringオブジェクトからRSS::RDF,
RSS::RDF::Channel, RSS::Rss等のオブジェクトになります。各オ
ブジェクトで子要素オブジェクトにアクセスするために，要素名と
同じ名前のアクセサがあります。

=== リーダ(reader)

rdf:RDF要素の子要素であるchannel要素を参照するには，以下のよう
にします。

  rss = RSS::Parser.parse(rss_source)
  rss.channel # => /rdf:RDF/channel要素; RSS::RDF::Channel

もし、要素が子要素も属性も持たない場合はStringが返ってきます。
その要素が省略可能ならばnilが返って来るかもしれません。これ
は要素が子要素または属性を持つ場合も同様です。

  rss = RSS::Parser.parse(rss_source)
  rss.channel.description # => /rdf:RDF/channel/text(); String

属性にアクセスする時も同様です。channel要素のrdf:about属性に
アクセスするには以下のようにします。属性の値はStringかnilで
す。

  rss = RSS::Parser.parse(rss_source)
  rss.channel.about # => /rdf:RDF/channel/@about属性; String または nil

同名の複数の子要素があるかもしれないときも同様です。ただし、
リーダに引数を指定しないと最初の子要素が返ってきます。例えば、
rdf:RDF要素の最初のitem要素にアクセスするには以下のようにし
ます。

  rss = RSS::Parser.parse(rss_source)
  rss.channel.item # => /rdf:RDF/item[1]要素; RSS::RDF::Channel::Item

3番目のitem要素にアクセスするには以下のようにします。省略さ
れなかったリーダの引数はArray#[]の引数と同じように扱われます。

  rss = RSS::Parser.parse(rss_source)
  rss.channel.item(2) # => /rdf:RDF/item[3]要素; RSS::RDF::Channel::Item

子要素すべてを取得したいときは要素名の複数形がリーダとなりま
す。すべてのitem要素を取得するには以下のようにします。

  rss = RSS::Parser.parse(rss_source)
  rss.channel.items # => /rdf:RDF/item要素の配列; [RSS::RDF::Channel::Item, ...]

=== ライタ(writer)

rdf:RDF要素の子要素であるchannel要素を設定するには以下のよう
にします。RSS::RDF::Channel.newの第一引数にはrdf:about属性の
値を指定することもできます。

  rss = RSS::Parser.parse(rss_source)
  rss.channel = RSS::RDF::Channel.new(rdf_about_value)

属性値を設定する場合も同様です。

  rss = RSS::Parser.parse(rss_source)
  rss.channel.about = "http://cozmixng.www.cozmixng.org/"

同名の複数の子要素が存在する場合は少し異なります．要素名の複
数形でのメソッドで要素の配列を取得して，その配列に対して
Array#<<やArray#[]=などを用いて要素を設定します．

  rss = RSS::Parser.parse(rss_source)
  item = RSS::RDF::Item.new(rdf_about_value)
  rss.items << item
  rss.items.last == item # => true

注意: item=/set_itemなどはRubyっぽくないので使わないでくださ
い．

== 出力

RSS Parserといっているので誤解されがちですが，RSSを出力する
こともできます．

=== 基本

(({to_s}))するとRSS形式の文字列を返します．

RSSを出力する流れは以下のようになります．

  * RSSオブジェクト（(({RSS::RDF}))とか(({RSS::Rss}))クラス
    のオブジェクト）を作成する

  * 出力エンコーディングを指定する(省略可)

  * RSSオブジェクトの(({to_s}))メソッドを呼ぶ

=== xml-stylesheet

xml-stylesheetも出力することができます．

RSSのルート要素（(({RSS::RDF}))または(({RSS::Rss}))）オブジェ
クトはxml_stylesheetsという名前の配列を持っています．この配
列に(({RSS::XMLStyleSheet}))オブジェクトを挿入することでRSS
にxml-stylesheetを関連づけることができます．

  rss.xml_stylesheets << RSS::XMLStyleSheet.new(...)

(({RSS::XMLStyleSheet.new}))には以下のような(({Hash}))または
連想配列を渡します．作成される(({RSS::XMLStyleSheet}))オブジェ
クトは与えられた引数によって初期化されます．

(({Hash})):

  {
    :href => "...",
    :type => "...",
    :title => "...",
    :media => "...",
    :charset => "...",
    :alternate => "...",
  }

連想配列:

  [
    [:href, "..."],
    [:type, "..."],
    [:title, "..."],
    [:media, "..."],
    [:charset, "..."],
    [:alternate, "..."],
  ]

全てのキーは省略可能です．

例えば，xml-stylesheetとしてsample.xslを指定する場合は以下の
ようにします．

  rss.xml_stylesheets << RSS::XMLStyleSheet.new({:href => "sample.xsl"})

本当は(({{:type => "text/xsl"}}))も指定しないといけないとこ
ろですが，拡張子が.xslまたは，.cssの場合は適当に推測してくれ
るので省略可能です．

=== RSSオブジェクトを作る

既存のRSSをパースせずに，一から新しくRSSを作成するにはRSS
Makerが便利です．ただし，RSS MakerのAPIはまだ確定したわけで
はありません．よりよいAPIにするために，意見を受け付けていま
す．


以下のように使います．

  require "rss/maker"
  
  rss = RSS::Maker.make("バージョン") do |maker|
    maker.XXX = YYY
    ...
  end

例えば，

  * http://example.com/にある
  * Example Siteという説明文を持つ
  * Exampleというサイトを
  * http://example.com/index.rdfという名前のRSS 1.0

を生成するには以下のようにします．

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"
  end

もし，

  * http://example.com/article.htmlにある
  * Sample Articleというタイトルの

エントリを含めたければ以下のようにします．

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
  end

もし，先のエントリが

  * 2004/11/1 10:10

のものならこうします．

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")
  end

サンプル中の

  item.date = ...

は

  item.dc_date = ...

でも構いません．(({#dc_date=}))は(({#date=}))の単なる別名で
す．


さらに，

  * http://example.com/article2.htmlにある
  * Sample Article2という
  * 2004/11/2 10:10に作成された

エントリを持つなら以下のようにします．

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")
  end

もし，更新日が新しい順に並び替えたければ

  maker.items.sort = true

を追加し，以下のようにします．

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.sort = true

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")
  end

もし，サイトに

  * Example Siteという名前の
  * http://example.com/logo.pngというロゴ

がある場合は以下のようにします．

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.sort = true

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"
  end

もし，

  * http://example.com/search.cgiに
  * keywordというパラメタ名で検索できる
  * Search Example Siteという名前で
  * Search Example Site's all textという説明付きの

検索用CGIがあったら以下のようにします．

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.sort = true

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"

    maker.textinput.title = "Search Example Site"
    maker.textinput.description = "Search Example Site's all text"
    maker.textinput.name = "keyword"
    maker.textinput.link = "http://example.com/search.cgi"
  end

もし，

  * http://example.com/index.xslにある

xml-stylesheetを追加したい場合は以下のようにします．

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    xss = maker.xml_stylesheets.new_xml_stylesheet
    xss.href = "http://example.com/index.xsl"

    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.sort = true

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"

    maker.textinput.title = "Search Example Site"
    maker.textinput.description = "Search Example Site's all text"
    maker.textinput.name = "keyword"
    maker.textinput.link = "http://example.com/search.cgi"
  end

もし，RSS 2.0を生成したい場合は以下のように，
(({RSS::Maker.make}))の第一引数を変更します．

  require "rss/maker"
  
  rss = RSS::Maker.make("2.0") do |maker|
    xss = maker.xml_stylesheets.new_xml_stylesheet
    xss.href = "http://example.com/index.xsl"

    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.sort = true

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"

    maker.textinput.title = "Search Example Site"
    maker.textinput.description = "Search Example Site's all text"
    maker.textinput.name = "keyword"
    maker.textinput.link = "http://example.com/search.cgi"
  end

もし，RSS 0.91を生成したい場合は，RSS 2.0の場合と同様に
(({RSS::Maker.make}))の第一引数を(({"0.91"}))に変更します．

== サンプル

RSS Parserのサンプルスクリプトをいくつか紹介します．これらの
スクリプトはsample/以下に入っています．

=== サンプル1 - 項目一覧

それでは、複数のRSSをパースしてitem要素を表示するスクリプト
を書いてみましょう。

まず、RSS 0.9x/1.0/2.0をパースできるように以下のようにrequireします。

  require 'rss/1.0'
  require 'rss/2.0'

パースするRSSはファイルに保存されていて引数で与えられるものとします。

  ARGV.each do |fname|
    rss_source = nil
    File.open(fname) do |f|
      rss_source = f.read
    end

    rss = nil
    begin
      rss = RSS::Parser.parse(rss_source, false)
    rescue RSS::Error
    end

    if rss.nil?
      puts "#{fname}はRSS 0.9x/1.0/2.0のいずれでもありません。"
    else
      print_items(rss)
    end
  end

あとはprint_itemsというメソッドを定義するだけです。

RSS::RDFとRSS::Rssには便利のためにitemsというメソッドとimage
というメソッドが定義されています。

itemsはRSS::RDFの場合は全ての/rdf:RDF/item要素を配列で返しま
す。RSS::Rssの場合は全ての/rss/channel/item要素を配列で返し
ます。

imageはRSS::RDFの場合は/rdf:RDF/image要素を返します。
RSS::Rssの場合は/rss/channel/image要素を返します。

  def print_items(rss)
    rss.items.each do |item|
      puts "#{item.title} : #{item.description}"
    end
  end

出力する文字コードを変更するにはRSS::RDF#output_encoding=ま
たはRSS::Rss#output_encoding=が使えます。もし、変換できない
エンコーディングを指定された場合は
RSS::UnknownConversionMethodError例外が発生します。

先程のprint_itemsをEUC-JPで出力するように書き換えてみましょう。

  def print_items(rss)
    begin
      rss.output_encoding = "EUC-JP"
    rescue RSS::UnknownConversionMethodError
    end
    rss.items.each do |item|
      puts "#{item.title} : #{item.description}"
    end
  end



=== サンプル2 - 更新順表示

次はDublin Coreモジュールのdate属性を使って更新順にitemを表
示してみましょう。

Dublin Coreモジュールの要素にアクセスするには「dc_要素名」と
いうアクセサが用意されています。ちなみにSyndicationモジュー
ルの要素にアクセスするには「sy_要素名」というアクセサが，
Contentモジュールの要素にアクセスするには「content_要素名」
というアクセサが用意されています。

requireするのは以下のものです。

  require 'rss/1.0'
  require 'rss/dublincore'

サンプル1と同じようにパースするRSSはファイルに保存されていて
引数で与えられるものとします。

  items = []
  ARGV.each do |fname|
    rss_source = nil
    File.open(fname) do |f|
      rss_source = f.read
    end

    rss = nil
    begin
      rss = RSS::Parser.parse(rss_source, true)
    rescue RSS::Error
    end

    if rss.nil?
      puts "#{fname}はRSS 1.0ではありません。"
    else
      begin
        rss.output_encoding = "euc-jp"
      rescue RSS::UnknownConversionMethodError
      end
      rss.items.each do |item|
        items << item if item.dc_date
      end
    end
  end
  print_items(items)

あとはprint_itemsというメソッドを定義するだけです。

Item#dc_dateはTimeオブジェクトかnilを返します。引数の
(({items}))にはdc_dateがnilではないものしか含まれていないは
ずなので以下のようにソートできます。

  def print_items(items)
    items.sort do |x, y|
      y.dc_date <=> x.dc_date
    end.each do |item|
      puts "#{item.dc_date.localtime.iso8601} : #{item.title} : #{item.description}"
    end
  end

=== サンプル3 - 複数のRSSをブレンド

TODO: sample/blend.rbを元にしたサンプルを書く．
