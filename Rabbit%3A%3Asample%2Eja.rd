# To run with it without system install.
#  % ruby -I./lib bin/rabbit -f sample/rabbit.rd 
# $Id: rabbit.rd 99 2004-11-21 14:18:18Z kou $

= Rabbit

: subtitle
   RDでプレゼンテーション
: author
   須藤功平
: institution
   COZMIXNG
#: content_source
#   出典
: theme
   rabbit

= 何これ？

プレゼンテーションツール

  * Rubyで書かれている
  * GTK+ 2を使っている
    * 使ってみたかったんだもん
      * だめ？

= 特長

  * ソースをRDで書ける
  * RWikiと協調する
    * ソースの編集はRWikiで行う
    * プレゼンするときはRWikiから直接ソースをもってくる
  * 見た目はRDとは別に指定

= できる(('sup:up'))こと(('sub:down'))

  * テキストを((*強調*))し(('del:なかっ'))たり
  * 下付き(('sub:文字'))とか上付き(('sup:文字'))とか．
  * 数式記号とか(('&sum;'))(('sub:i=0'))(('&Sigma;&sum;'))(('&sum;sub:i=0'))
  * 画像表示
  * 変更されたソースの自動再読み込み
  * テーマの再読み込み

= まだある

  * Indexページの自動生成
  * 右クリックメニュー
  * オフスクリーンでのスクリーンショット作成
  * PS/PDF出力（品質は微妙）
  * 国際化されたメッセージ

= できないこと

  * スライドに落書き
  * インラインでの画像挿入
  * スクリーンショットの整形
  * リンク先へのジャンプ

= ToDo

  * 音を鳴らす
  * 3Dの絵を書く（X3Dのライブラリがあれば．．．）

= 求めているもの

  * coolなテーマ
  * greatなドキュメント

= スライド保存

  * スライドをイメージとして保存できる
    * 画像を綺麗に並べるのは他のツールの仕事
    * ((<RAA:gallery>))とかzphotoとかとかとかとかとかとか

= 画像は？

  * インラインでなければ大丈夫．

    サイズ変更も可能

      # image
      # src = lavie.png
      # caption = Lavie
      # keep_ratio = true
      # width = 100
      # height = 100
#      # normalized_width = 50
#      # normalized_height = 50
#      # relative_width = 100
#      # relative_height = 50

= 画像サイズは？

スライドサイズに応じて変更可能

  # image
  # src = usagi.png
  # caption = 兎
  # keep_ratio = true
#  # normalized_width = 50
#  # normalized_height = 50
#  # relative_width = 100
  # relative_height = 50

= ローカルにない画像は？

  * 外部URLも大丈夫

      # image
      # src = http://www.cozmixng.org/repos/images/cozmixchu.png
      # caption = こずみっくちゅー

= 数式は？

mimeTeXを呼び出す

  # TeX
  # keep_ratio = true
  # relative_width = 80
  
  \Large f(x)=\Bigint_{-\infty}^x~e^{-t^2}dt

= 汚いじゃん

  * あらかじめEPSを作っておく

    * でも，gsがなきゃだめなの．

  # image
  # src = equation.eps
  # keep_ratio = true
  # relative_width = 80

= SVGでもOK

  # image
  # src = spiral.svg
  # keep_ratio = true
  # relative_height = 100

= 折り返し

なーーーーーーーーーーーーーーーーーーーーーーーーーーーーーがーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーい行は？

= ソースをのせると？

どう？

  こんな
  かんじに
  def なり
    ますよ
  end

どう？

= 箇条書きは？

  (1) どう

  (1) です

      (1) どうどうどう

          (1) もう

          (1) いっちょーーー

      (1) どうなのよぉ

  (1) か？


= ラベル付きリストは？

: Rabbit
   うさぎ

   : Turtle
      かめ

: うさぎ
   Rabbit

= テーマの書き方

--- Rabbit::Theme#match(*path, &block)
     パスでテーマを適用する要素を指定する

うーん，後でちゃんとしたものを用意します．

= キーバインド（基本）

: 終了
   q, Esc
: 次ページ
   n, f, j, l, Spc, Ret, Tab, +, ↓, →, 左クリックなど
: 前ページ
   p, b, k, h, BS, Del, -, ↑, ←, 真ん中クリックなど

= キーバインド（便利）

: タイトルページへ移動
   a, 0, <, Home
: nページ目へ移動
   1-9．+Ctrlで+10，+Altで+20
: 最後のページへ移動
   e, >, End

= キーバインド（本番）

: フルスクリーン切替え
   F5, F10

: 一覧モード切替え
   i

: 一覧モードで指定したページへ移動
   ダブルクリック

= キーバインド（機能）

: スクリーンショット
   各ページを画像として保存

   s

: 印刷
   各ページをPS/PDFとして保存

   Ctrl+p

= キーバインド（描画）

: 再描画
   Ctrl+l

: テーマ再読み込み
   t, r

= キーバインド（その他）

: アイコン化
   z

= おわり

こんな感じです．

書かなきゃいけないことはいろいろあるなぁ．

文書書きって苦手．
