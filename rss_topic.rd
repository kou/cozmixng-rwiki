= rss_topic

== キャッシュ

有効期間を分単位で指定。最小値(60)以下を指定するとデフォルト値(120)が用いられる。

  * 有効期間 : 120

== スレッド

スレッドを使うかどうかを指定。「((<はい>))」, 「((<yes>))」, 「((<true>))」のいずれかだとスレッドを使う。

  * 使う : はい

== 表示

各ページにトピックを表示するかどうかを指定。「((<はい>))」, 「((<yes>))」, 「((<true>))」のいずれかだと表示する。

#  * 表示 : はい
  * 表示 : いいえ

表示件数を指定。-1を指定すると全件表示。0を指定するとデフォルト値(5)が用いられる。

  * 件数 : 3

説明の表示文字数を指定。-1を指定すると全体表示。0を指定するとデフォルト値(20)が用いられる。

  * 文字数 : 20

== サーバ

RSSを提供しているURIを指定。書式は
  [表示名]:[URI]
となる。表示名を省略すると/rdf:RDF/channel/title/text()が用いられる。

# COZMIXNG
  * : http://www.cozmixng.org/~rwiki/?cmd=rss;name=rss1.0
  * : http://www.cozmixng.org/~wsm/?__scratch_action__=rss
  * : http://www.cozmixng.org/index.rdf
  * : http://www.cozmixng.org/info/index.rdf
  * : http://www.cozmixng.org/~suzuki/d/t.rdf
  * : http://www.cozmixng.org/~yasushi/d/t.rdf
  * : http://pub.cozmixng.org/~rwiki/?cmd=rss;name=rss1.0
  * : http://pub.cozmixng.org/~wikilink/?cmd=rss;name=rss1.0
  * ギャラリー : http://pub.cozmixng.org/~gallery/index.rdf.ja
  * : http://streaming.cozmixng.org/~rwiki/?cmd=rss;name=rss1.0
  * ソフトウェア設計および演習 2003 : http://pub.cozmixng.org/~wiliki/group-2003.cgi?c=rss

# Suzuki Labo
  * SWS : http://www.os.cis.iwate-u.ac.jp/~suzuki/wiliki/wiliki.cgi?c=rss
  * S-Labo : http://www.os.cis.iwate-u.ac.jp/wiliki/wiliki.cgi?c=rss

# WiLiKi
  * : http://www.shiro.dreamhost.com/scheme/wiliki/wiliki.cgi?c=rss

# Ruby
  * : http://rnn.sourceforge.jp/rdf/rnn.rdf
  * RAA : http://raa.ruby-lang.org/index.rdf
  * : http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=rss;name=rss1.0

# News
  * /.J: http://slashdot.jp/slashdot.rdf
  * /. : http://slashdot.org/articles.rss
#  * W3C : http://www.w3.org/2000/06/webdata/xslt?xslfile=http://www.w3.org/2000/08/w3c-synd/home2rss.xsl&xmlfile=http://www.w3.org/&Base=http://www.w3.org/&Channel=http://www.w3.org/2000/08/w3c-synd/home.rss&Page=http://www.w3.org/
  * : http://www.atmarkit.co.jp/rss/rss2dc.xml
  * : http://rss-jp.net/x/2ch_rss.cgi?brd=linux
  * : http://rss-jp.net/x/2ch_rss.cgi?brd=unix
  * : http://rss-jp.net/x/2ch_rss.cgi?brd=prog
  * : http://rss-jp.net/x/2ch_rss.cgi?brd=tech
  * : http://rss-jp.net/x/yahoo_top.cgi

# SF.net
#  * : http://sourceforge.net/export/rss2_projfiles.php?group_id=21558

# etc
  * : http://dontstopmusic.no-ip.org/diary/index.rdf
