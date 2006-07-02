# -*- rd -*-

= README.ja

$Id: README.ja 764 2006-06-06 15:23:54Z tkdats $

== rabbit-mode.el

Rabbitのソースファイル用のEmacsメジャーモードです．

== インストール

.emacsに以下を記述してください．

  (autoload 'rabbit-mode "rabbit-mode" "major mode for Rabbit" t)
  (add-to-list 'auto-mode-alist '("\\.\\(rbt\\|rab\\)$" . rabbit-mode))

== 関数

関数名(デフォルトのキーバインド)と表記します．

=== rabbit-run-rabbit(C-c C-r)

現在開いているバッファのファイルを引数としてEmacs上から
Rabbitを起動します．

Rabbitのメッセージはバッファ*Rabbit<ファイル名>*という
バッファに出力されます．

=== rabbit-insert-title-template(C-c C-t)

タイトルのテンプレートの挿入します．

プレゼンテーションのタイトルを入力します．

関連する変数

* rabbit-author
* rabbit-institution
* rabbit-theme

=== rabbit-insert-image-template(C-c i)

画像のテンプレートの挿入します．

画像のファイル名，キャプション，サイズ指定の方法，サイズを
入力します．

キャプションに何も入力しなかった場合（空文字列の場合)，
テンプレートのキャプションの行はコメントアウトされます．

サイズ指定の方法は

* relative
* normalized
* pixel(幅と高さを指定)

サイズ指定の方法に何も入力しなかった場合（空文字列の場合)，
デフォルト(relative)を使います．

=== rabbit-insert-image-template-default(C-c C-i)

デフォルト(relative)のサイズ指定の方法で画像のテンプレートを
挿入します．

画像のファイル名，キャプション，サイズを入力します．

=== rabbit-insert-slide(C-c C-s)

スライドの挿入を挿入します．

スライド名を入力します．

=== rabbit-next-slide(M-n)

次のスライドへ移動します．

=== rabbit-previous-slide(M-p)

前のスライドへ移動します．

== 変数

変数名(デフォルト値)と記述します．

=== rabbit-command(rabbit)

rabbitの起動コマンドです．

関連する関数
* rabbit-run-rabbit

=== rabbit-author(Author)

タイトルに表示される作者名です．

関連する関数
* rabbit-insert-title-template

=== rabbit-institution(Institution)

タイトルに表示される所属です

関連する関数
* rabbit-insert-title-template

=== rabbit-theme(rabbit)

コマンドでテーマが指定されなかったときに使われるテーマです．

=== Faces

rabbit-modeのfaceです．

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
