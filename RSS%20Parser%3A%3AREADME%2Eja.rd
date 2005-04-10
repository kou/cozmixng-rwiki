# -*- rd -*-

= README.ja

$Id: README.ja 23 2005-04-07 06:38:01Z kou $

((*0.0.6まではruby 1.8での動作がruby 1.6の動作に比べて10倍遅
いです．ruby 1.8で使う場合は0.0.7以降を使ってください．*))

== 名前

RSS Parser(Ruby/RSSはかぶるので使わない)

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

Ruby's

== お願い

もう少し真面目にRSS 0.9x/2.0をパースしようと思います．そのた
め，私はRSS 0.9x/2.0のテストケースを求めています．

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
を御覧下さい．

== バグトラッキングシステム

ご意見ご要望不具合報告等は作者へのメール，上記のメーリングリ
スト，RWikiへの書き込みまたは((<影舞
|URL:http://www.cozmixng.org/~kagemai/?project=rss;action=top>))
をご利用下さい．

== なにこれ？

((<RSS(RDF Site Summary)
1.0|URL:http://web.resource.org/rss/1.0/>)), RSS 0.9x/2.0を
妥当性検証(バリデーション)付き(あるいは無し)でパースします。

サンプルとして，RSSを取得してその内容を表示する
((<tDiary|URL:http://www.tdiary.org/>))のプラグインが付いて
います。

rubyのCVS HEADにも入っています．

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

=== tDiaryにインストール

sample/tdiary_pluginの下にあるrss-recent.rbをtDiaryのプラグ
イン用のディレクトリにコピーしたりシンボリックリンクを張った
りして下さい。

このプラグインをインストールすると以下のメソッドが使えるよう
になります。

--- rss_recent(url, max=5, cache_time=3600)

     ((|url|))にあるRSSをパースして最初に現れた項目のうち最
     大((|max|))項目を表示します。RSSをパースした結果は
     ((|cache_time|))秒キャッシュされます。

       * ((|url|)): RSSのあるURL
       * ((|max|)): 表示する項目数
       * ((|cache_time|)): RSSをキャッシュしておく時間(秒)

(({rss_recent}))を制御する以下のオプションがあります．

: @options['rss-recent.use-image-link']
     
   このオプションが(({nil}))または(({false}))でない場合，
   /rdf:RDF/image/urlなど，リンク時に画像として使えるよう
   な情報があればそれを使用します．
