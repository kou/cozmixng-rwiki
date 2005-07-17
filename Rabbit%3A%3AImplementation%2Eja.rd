# To run with it without system install.
#  % ruby -I./lib bin/rabbit -f sample/rabbit-implementation.rd 
# $Id: rabbit-implementation.rd 176 2005-06-30 08:35:41Z kou $

= Rabbitの実装

: subtitle
   The implementation of Rabbit
: author
   須藤功平
: institution
   COZMIXNG
: theme
   rabbit

= 概要

  * Rabbitって何？
  * Rabbitってどうなってるの？

= Rabbit?

  * Ruby/GTK2を用いたプレゼンツール
    * フォントはアンチエイリアス
    * 多言語対応
  * ソースはRD
    * 簡単に書ける
    * RWikiのスライド拡張互換

= ターゲット

  * 使うべき人
    * 楽にスライドを作成したい人
  * 使うべきではない人
    * 数式ばかり使う人
    * スライドをGUIで作成したい人
    * 豊富なテンプレートが欲しい人

      （自分では作りたくない）

= スライド作成

  * インタラクティブ

    * ソースの自動再読み込み
    * テーマの再読み込み

  * 特殊文字（記号）
    * UTF-8で直接記述
    * 実体参照

= プレゼンテーション

  * 豊富なキーバインド
    * Emacs系，vi系，矢印．．．

  * 起動時: RD (('&rightarrow;')) Rabbitオブジェクト
    * モッサリ（遅いマシンだと）

  * 起動後: オンメモリ
    * サクサク（遅いマシンでも）

= スライド公開

  * スライドを画像へ変換
    * 画像を並べるのは他のツール
    * ギャラリー，zphoto．．．

  * RWikiのページとして公開
    * ブラウザで閲覧
    * Rabbitで閲覧

= 実装

  * ページの構造
  * 描画方法
  * テーマ

= ブロックとインライン

: ブロック
   0個以上の要素((-スライド上に配置されるオブジェクト-))を含む

   段落，箇条書きなど

: インライン
   直接描画される要素

   テキスト，画像など

= テキスト

  * 多言語を扱える
  * さまざまな装飾が可能
    * サイズ，色，下線．．．

= テキスト

  * 多言語を扱える
  * さまざまな装飾が可能
    * サイズ，色，下線．．．

((*Pangoを使用しているから*))

= Pango

フレームワーク
  * 世界中のテキストを配置／表示

: Pan
   ギリシャ語で「全て」
: Go
   日本語で「言語」

= 画像

  * URIで指定
  * 制限
    * 他のインラインと同居できない
    * ビットマップとして扱う

 # image
 # src = lavie.png
 # caption = Lavie
 # keep_ratio = true
# # width = 100
# # height = 100
# # relative_width = 100
 # relative_height = 70

= 描画

  * 2つのフェーズ
    * コンパイル
    * 描画
  * 再帰的
    * ネスト数大 (('&rightarrow;')) 計算時間大
    * コンパイル結果をキャッシュ

= コンパイル

  * オブジェクトの描画サイズの決定
    * シミュレーション描画
    * 実際には描画しない
  * 描画の下準備
    * 画像のロード
    * Pangoレイアウトの生成

= テーマ

  * 見栄えを指定
    * Rubyスクリプトとして記述

  * ソースとは独立
    * データ（RD）と混在させない

  * フック
    * 要素の描画前後

= テーマの適用

流れはCSSと類似

  (1) 対象となる要素を選択
  (1) 要素に対して
      * プロパティを設定（代入）
      * フックを設定（ブロック）
  (1) 繰り返し

= サイズ

  * 絶対的な値
    * 画像サイズで指定可能
  * 正規化した値
    * ウィンドウサイズに応じて増減
    * テキスト／画像サイズで指定可能
  * ウィンドウサイズに対する割合
    * 画像サイズで指定可能

= まとめ

  * スライドが楽に作成できる
  * 見栄えも悪くない
    * スライド用の書き方をすれば
  * テーマはRubyスクリプト
    * 簡単なもの: 知識はいらない
    * 細部にこだわる: 知識が必要
