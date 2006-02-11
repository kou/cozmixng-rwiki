= RD2TeX

RDから(La)TeXに変換するライブラリ．

== ダウンロード

現在，アーカイブはありません．
((<リポジトリ|URL:http://www.cozmixng.org/repos/ruby/rd2tex/>))からチェックアウトしてください．

  svn co http://www.cozmixng.org/repos/ruby/rd2tex/trunk rd2tex

== 含まれているもの

=== RD -> LaTeX

RDから普通のLaTeXに変換するライブラリ．

  % rd2 -r rd/rd2tex-lib XXX.rd

$LOAD_PATHを変更して，カスタマイズしたテンプレートを読み込ませることにより出力をカスタマイズできる．

論文用っぽいLaTeXを出力する例:

  % ruby -I rd2tex/sample/thesis -S rd2 -r rd/rd2tex-lib XXX.rd

=== RD -> prosper

RDからprosper用LaTeXに変換するライブラリ．

  % rd2 -r rd/rd2prosper-lib XXX.rd

書式は((<Rabbit>))みたいに書く．
