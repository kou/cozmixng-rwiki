= リアルタイムカウンタ

ページを更新しなくても，常に最新の値を表示するカウンタ．Flashだとあるらしい．例えば，

  * ((<2bee.jp : Flash(フラッシュ)カウンタ[特徴・機能]|URL:http://2bee.jp/flash_counter/>))

とか．

== CGI+JavaScriptで実現

x秒毎にページをリロードなんてさせない！

=== 前提

JavaScriptでファイルが読みこめること．

IE5以上, NS6以上だとXMLを読みこむことができるらしい．((<Hawk'sW3L: XMLデータを扱う|URL:http://www.hawk.34sp.com/smpview.php?src=tips_xml>))

=== 戦略

(1) ページが読みこまれる毎にCGIを起動してカウント値を増やしてファイルに保存する

    カウント値を保存するファイルはXML形式
(1) ページではJavaScriptでx秒毎にファイルを読みこんで最新のカウンタ値を取得する．

    たしか，timeoutとかあったはず．
(1) カウント値が変わっていたらカウント値を表示し直す．

=== 試作品

((<URL:http://pub.cozmixng.org/~kou/realtimecounter>))

Mozillaでしか動作確認していません．
