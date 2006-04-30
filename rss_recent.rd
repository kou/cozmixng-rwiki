= rss_recent

== キャッシュ

有効期間を分単位で指定。最小値(60)以下を指定するとデフォルト値(120)が用いられる。

  * 有効期間 : 120

== スレッド

スレッドを使うかどうかを指定。「((<はい>))」, 「((<yes>))」, 「((<true>))」のいずれかだとスレッドを使う。

  * 使う : はい

== 表示

表示件数を指定。-1を指定すると全件表示。0を指定するとデフォルト値(5)が用いられる。

  * 件数 : 50

説明の表示文字数を指定。-1を指定すると全体表示。0を指定するとデフォルト値(20)が用いられる。

  * 文字数 : 200

== サーバ

RSS 1.0を提供しているURIを指定。書式は
  [表示名]:[URI]
となる。表示名を省略すると/rdf:RDF/channel/title/text()が用いられる。

  * : http://www.cozmixng.org/~rwiki/?cmd=rss;name=rss1.0
  * : http://www.cozmixng.org/~wsm/?__scratch_action__=rss
  * : http://www.cozmixng.org/index.rdf
  * : http://www.cozmixng.org/info/index.rdf
  * : http://www.cozmixng.org/~suzuki/d/t.rdf
  * : http://www.cozmixng.org/~yasushi/d/t.rdf
  * : http://pub.cozmixng.org/index.rdf
  * : http://pub.cozmixng.org/~rwiki/?cmd=rss;name=rss1.0
  * : http://pub.cozmixng.org/~wikilink/?cmd=rss;name=rss1.0
  * : http://streaming.cozmixng.org/~rwiki/?cmd=rss;name=rss1.0
  * : http://rnn.sourceforge.jp/rdf/rnn.rdf
  * SWS : http://www.os.cis.iwate-u.ac.jp/~suzuki/wiliki/wiliki.cgi?c=rss
  * S-Labo : http://www.os.cis.iwate-u.ac.jp/wiliki/wiliki.cgi?c=rss
  * : http://www.shiro.dreamhost.com/scheme/wiliki/wiliki.cgi?c=rss
  * /.J : http://slashdot.jp/slashdot.rdf
  * /. : http://slashdot.org/articles.rss
  * : http://www.baykit.org/~makotos/cgi-bin/wiliki.cgi?c=rss
  * W3C : http://www.w3.org/2000/06/webdata/xslt?xslfile=http://www.w3.org/2000/08/w3c-synd/home2rss.xsl&xmlfile=http://www.w3.org/&Base=http://www.w3.org/&Channel=http://www.w3.org/2000/08/w3c-synd/home.rss&Page=http://www.w3.org/
  * : http://www.atmarkit.co.jp/rss/rss2dc.xml
  * : http://rss-jp.net/x/yahoo_top.cgi

# Ruby
  * : http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=rss;name=rss1.0
