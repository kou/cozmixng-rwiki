= XML Validator for Ruby

何も言わないといつまでたっても作らなそうなので書いておく。

== 動機

  * Pure RubyなXML Validatorがないから。
  * amritaで遊んでみたいけどエディタのサポートの無い構文を書くのは嫌だ。
    * => XMLで書いて変換しちゃえばいい。
      * => 無いから作るか。
        * => とりあえずvalidatorかなぁ。

== 戦略

  (1) schemaをparseしてschemaに依存しない表現を生成する。
      * schemaからBNFを生成してrpgでparserを生成
        * => RELAX NGやXML Schemaでは無順序で任意回数出現する要素を表現できるので全ての組合せを作らなくてはいけない
          * => ダメ
      * データ型作るが面倒
  (2) 生成したものからオートマトンを生成する。
      * 二分木オートマトンか？
        * JavaやC#などのMSVはこれで実装？
  (3) 生成したオートマトンにXML文書をかける。
      * XML文書を二分木に変換か？

== メモ

  * ((<"ISO/IEC JTC1/SC34 N320"|URL:http://www.y12.doe.gov/sgml/sc34/document/0320.htm>))
  * ((<"JIS/RELAX NG 目次"|URL:http://www.y-adagio.com/public/standards/jis_relaxng/toc.htm>))
