# -*- rd -*-

= README.ja

$Id: README.ja 892 2007-06-04 03:43:48Z kou $

== rabbit-mode.el

Rabbitのソースファイル用のEmacsメジャーモードです．

== インストール

.emacsに以下を記述してください．

  (autoload 'rabbit-mode "rabbit-mode" "major mode for Rabbit" t)
  (add-to-list 'auto-mode-alist '("\\.\\(rbt\\|rab\\)$" . rabbit-mode))

== 目次

=== Rabbitの操作
  * ((<rabbit-mode.el::README.ja/EmacsからRabbitを起動する>))

=== 移動
  * ((<rabbit-mode.el::README.ja/次のスライドへ移動する>))
  * ((<rabbit-mode.el::README.ja/前のスライドへ移動する>))

=== 挿入
  * ((<rabbit-mode.el::README.ja/タイトルを挿入する>))
  * ((<rabbit-mode.el::README.ja/画像のテンプレートを挿入する>))
  * ((<rabbit-mode.el::README.ja/スライドを挿入する>))
  * ((<rabbit-mode.el::README.ja/箇条書きを挿入する>))

=== スライド操作
  * ((<rabbit-mode.el::README.ja/スライドを削除する>))
  * ((<rabbit-mode.el::README.ja/スライドをコピーする>))
  * ((<rabbit-mode.el::README.ja/スライドを複写する>))

=== 設定
  * ((<rabbit-mode.el::README.ja/画像テンプレートのデフォルトのサイズ指定方法を変える>))
  * ((<rabbit-mode.el::README.ja/rabbit-modeの変数>))

== Rabbitの操作
=== EmacsからRabbitを起動する

rabbit-run-rabbitを実行します．デフォルトのキーバインドはC-c C-rです．

(('*'))Rabbit<ファイル名>*というバッファが作られ，Rabbitのメッセージが書き込
まれます．

== 移動
=== 次のスライドへ移動する

rabbit-next-slideを実行します．デフォルトのキーバインドはM-nです．

=== 前のスライドへ移動する

rabbit-previous-slideを実行します．デフォルトのキーバインドはM-pです．

== 挿入
=== タイトルを挿入する

rabbit-insert-title-templateを実行します．デフォルトのキーバインドは
C-c C-tです．

プレゼンテーションのタイトルとメタデータを入力します．デフォルトのメタ
データを変数に設定可能です．設定できるメタデータは

  * rabbit-author(著者)
  * rabbit-institution(所属)
  * rabbit-theme(テーマ)

です．

=== 画像のテンプレートを挿入する

画像サイズは割合で指定するのが便利だと思いますので，割合指定がデフォル
トになっています．

==== 画像サイズを割合で指定する場合

rabbit-insert-image-template-defaultを呼びます．デフォルトのキーバイン
ドはC-c C-iです．

画像ファイルのパス，キャプション，画像サイズの割合を入力します．ファイ
ルパス以外は省略可能です．

==== 画像サイズの指定方法も決める場合

rabbit-insert-image-templateを呼びます．デフォルトのキーバインドはC-c iです．

画像ファイルのパス，キャプション，サイズ指定の方法，サイズを入力します．
ファイルパス以外は省略可能です．

サイズ指定の方法は

* relative
* normalized
* pixel(幅と高さを指定)

から選びます．

=== スライドを挿入する

rabbit-insert-slideを呼びます．デフォルトのキーバインドはC-c C-sです．

=== 箇条書きを挿入する

rabbit-insert-itemsを呼びます．キーバインドは割り当てられていません．

項目を入力していき，空文字を入力すると修了します．

== スライド操作
=== スライドを削除する

rabbit-delete-slideを実行します．デフォルトのキーバインドはC-c C-dです．

=== スライドをコピーする

rabbit-copy-slideを実行します．キーバインドは割り当てられていません．

現在のスライドがキルリングに保存されます．

=== スライドを複写する

rabbit-duplicate-slideを実行します．キーバインドは割り当てられていません．

現在のスライドのコピーを，次のスライドとして挿入します．現在のスライド
の内容を少しだけ変えたい場合に便利です．

=== 画像テンプレートのデフォルトのサイズ指定方法を変える

変数rabbit-default-image-size-unitにサイズ指定方法をセットします．デフォ
ルトは"relative"です．

有効な値
  * "relative"
  * "normalized"
  * "pixel"

== 変数

: rabbit-command

   Rabbitの起動コマンドです(デフォルトは"rabbit")．

: rabbit-author

   著者名です．タイトルページのテンプレートで使われます(デフォルトはnil)．

: rabbit-institution

   著者の所属です．タイトルページのテンプレートで使われます(デフォルトはnil)．

: rabbit-theme

   プレゼンテーションのテーマです(デフォルトは"rabbit")．

: rabbit-default-image-size-unit

   画像ファイルのテンプレート挿入で使われるデフォルトのサイズ
   指定方法です(デフォルトは"relative")．

: Faces

   rabbit-modeの各faceです．

     * rabbit-heading-face
     * rabbit-emphasis-face
     * rabbit-verbatim-face
     * rabbit-term-face
     * rabbit-footnote-face
     * rabbit-link-face
     * rabbit-code-face
     * rabbit-description-face
     * rabbit-keyboard-face
     * rabbit-variable-face
     * rabbit-comment-face
