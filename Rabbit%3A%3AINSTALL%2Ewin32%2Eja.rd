# -*- rd -*-

= INSTALL.win32.ja

$Id: INSTALL.win32.ja 500 2006-01-11 05:33:37Z miyamuko $

Windows上でRabbitを実行するのは大変です．以下を参考にして頑
張ってください．

== Ruby 本体のインストール

ruby 1.8.4 のインストール。

: ruby-1.8.4-i386-mswin32.zip
   ((<URL:ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.8.4-i386-mswin32.zip>))

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

GLADE for Windows の GTK+ 2 パッケージをインストールする。

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

(3) ruby コードを色づけする場合は、以下のコマンドで ruby.st もインストールする。

      > cd <Enscript のインストール先>\share\enscript\hl
      > ruby -ropen-uri -e "puts open('http://rubyforge.org/cgi-bin/viewcvs.cgi/*checkout*/support/ruby.st').read" > ruby.st

(4) ((<RAA:htree>)) をインストールする。

    アーカイブを展開して，install.rb を実行してインストールする。

    : htree.tar.gz
        ((<URL:http://cvs.m17n.org/viewcvs/ruby/htree.tar.gz>))

(5) アーカイブを展開して，setup.rb を実行してインストールする。

    : Iconv for One Click Installer
        ((<URL:http://www.dave.burt.id.au/ruby/iconv.zip>))

== rabrick を使う

((<RAA:div>)) をインストールする。

アーカイブを展開して，install.rb を実行してインストールする。

: div-1.3.2.tar.gz
   ((<URL:http://www2a.biglobe.ne.jp/~seki/ruby/div-1.3.2.tar.gz>))


面倒ですいません．
