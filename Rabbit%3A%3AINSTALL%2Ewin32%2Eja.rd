# -*- rd -*-

= INSTALL.win32.ja

$Id: INSTALL.win32.ja 560 2006-02-08 01:49:43Z kou $

Windows上でRabbitを実行するのは大変です．以下を参考にして頑
張ってください．

== Ruby 本体のインストール

ruby 1.8.4 のインストール。One-Click Installerを使うのが楽
((-まだpreview3だけど，大丈夫でしょう．-))．

: ruby184-16p3.exe
   ((<URL:http://rubyforge.org/frs/download.php/8338/ruby184-16p3.exe>))

== RDTool のインストール

((<RAA:rdtool>)) をインストールする。

アーカイブを展開して，setup.rb を実行してインストールする．

: rdtool-0.6.20.tar.gz
   ((<URL:http://www.moonwolf.com/ruby/archive/rdtool-0.6.20.tar.gz>))

== Ruby/GTK2のインストール

アーカイブを展開して，install.rb を実行してインストールする。

: ruby-gtk2-0.14.1-1-i386-msvcrt-1.zip
   ((<URL:http://prdownloads.sourceforge.net/ruby-gnome2/ruby-gtk2-0.14.1-1-i386-msvcrt-1.zip>))

== GTK+ 2のインストール

GLADE for Windows の GTK+ 2 パッケージをインストールする。((-「プロシージャ エントリポイント libiconv_set_relocation_prefix がダイナミック リンク ライブラリ iconv.dll から見つかりませんでした。」問題を回避するには、ruby付属のiconv.dllを削除/リネームするしかない?-))

: gtk-win32-2.8.8-rc2.exe
   ((<URL:http://gladewin32.sourceforge.net/modules/wfdownloads/visit.php?lid=95>))

== Rabbit のインストール

install.bat を実行してください。


== EPS を表示する

(1) AFPL Ghostscript 8.53 for Win32 をインストールする。

    : gs853w32.exe
        ((<URL:http://www.cs.wisc.edu/~ghost/>))

(2) インストール後 <インストール先>/gs/gs8.53/bin に PATH を通す。

== ソースコードの色づけを行う

(1) Enscript をインストールする。

    : enscript-1.6.3-9-bin.exe
        ((<URL:http://sourceforge.net/project/showfiles.php?group_id=23617&package_id=16960>))

(2) <Enscript のインストール先>/bin に PATH を通す。

(3) ruby コードを色づけする場合は、以下のコマンドで ruby.st もインストールする。((-http://rubyforge.org/cgi-bin/viewvc.cgi/support/ruby.st?view=coじゃないかな?-))

      > cd <Enscript のインストール先>\share\enscript\hl
      > ruby -ropen-uri -e "puts open('http://rubyforge.org/cgi-bin/viewcvs.cgi/*checkout*/support/ruby.st').read" > ruby.st

(4) ((<RAA:htree>)) をインストールする。

    アーカイブを展開して，install.rb を実行してインストールする。

    : htree.tar.gz
        ((<URL:http://cvs.m17n.org/viewcvs/ruby/htree.tar.gz>))

== rabrick を使う

((<RAA:div>)) をインストールする。

アーカイブを展開して，install.rb を実行してインストールする。

: div-1.3.2.tar.gz
   ((<URL:http://www2a.biglobe.ne.jp/~seki/ruby/div-1.3.2.tar.gz>))


面倒ですいません．
