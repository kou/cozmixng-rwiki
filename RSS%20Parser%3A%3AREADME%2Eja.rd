# -*- rd -*-

= README.ja

$Id: README.ja 378 2009-05-16 03:00:50Z kou $

== 名前

RSS Parser

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

Ruby's

== 注意

  * RSS Parser 0.1.7以降ではruby 1.8.2以降でないと動きません．
  * Atom・Podcast用の要素を扱いたい場合はRSS Parser 0.1.8以
    降を使ってください。
  * Slashモジュールを使いたい場合はRSS Parser 0.2.0以降を使っ
    てください。
  * バージョンを重ねるごとにより厳密に動作するようになってい
    ます。今までは#to_sでRSSが得られたものが空文字列が返るよ
    うになっているかもしれません。その場合は#validateを呼ぶ
    とどこが問題かわかるでしょう。
  * RSS::Maker.makeで必要な情報を設定していない場合、RSS
    Parser 0.2.4以前ではnilが返りましたが、RSS Parser 0.2.5
    以降では例外を発生するようになりました。これは、nilが返
    された場合、どこが悪いのかを示す情報が得られなく、問題を
    修正することが困難だからです。

== なにこれ？

((<RSS(RDF Site Summary)
1.0|URL:http://web.resource.org/rss/1.0/>))，RSS 0.9x/2.0
（0.90を除く），((<Atom
1.0|URL:http://www.ietf.org/rfc/rfc4287.txt>))を妥当性検証
（バリデーション）付き（あるいは無し）でパースします。

rubyの配布ファイルにも入っています．

== 依存ライブラリ

  * XMLプロセサ(((<RAA:REXML>))2.5.0以上または
    ((<RAA:xmlscan>))または((<RAA:xmlparser>)))

=== あればいいライブラリ

  * Iconvバインディング
  * ((<RAA:Uconv>))

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/rss.tar.gz>))

  % svn co http://www.cozmixng.org/repos/rss/trunk rss

== インストール

  % ruby setup.rb config
  % ruby setup.rb setup
  # ruby setup.rb install

あるいは

  # ruby setup.rb

== FAQ

=== RSS 0.90をパースしたい

RSS 0.90はRSS 1.0として扱えることもあります．もし，RSS 0.90
をパースしたい場合は，以下のようにRSS 1.0としてパースするこ
とが出来ます．

  def rss090_to_rss10(feed)
    feed.sub(%r{xmlns=(['"])http://my.netscape.com/rdf/simple/0.9/\1},
             'xmlns="http://purl.org/rss/1.0/"')
  end
  rss = RSS::Parser.parse(rss090_to_rss10(feed), false)

== 感謝

  * かずひこさん: いろいろバグを報告してくれました．
  * 秋山智朗さん: ドキュメントのバグを報告してくれました．
  * Chris Leeさん: バグを報告してくれました．
  * Ronald Pijnackerさん: バグを報告してくれました．
  * 西山和広さん: バグを報告してくれました．
  * Christian W. Zuckschwerdtさん: RSS 0.90の扱いについてア
    ドバイスしてくれました．
  * 米澤拓央さん: バグを報告してくれました。
  * Sam Lownさん: RSS 2.0でcontent:encodedを使うことについて
    書かれた文書を教えてくれました。
    ((<URL:http://www.rssboard.org/rss-profile>))
  * Ray Chenさん: バグを報告してくれました。
  * Michael Auzenneさん: バグを報告してくれました。
  * Akinori MUSHAさん: APIの提案をしてくれました。
