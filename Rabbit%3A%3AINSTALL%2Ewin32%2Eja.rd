# -*- rd -*-

= INSTALL.win32.ja

$Id: INSTALL.win32.ja 970 2007-08-08 12:25:17Z kou $

Windows上でRabbitを実行するのは大変です．以下を参考にして頑
張ってください．

== Ruby 本体のインストール

ruby 1.8.6 のインストール。One-Click Installerを使うのが楽．

: ruby186-25.exe
   ((<URL:http://rubyforge.org/frs/download.php/18566/ruby186-25.exe>))

== RDTool のインストール

((<RAA:rdtool>)) をインストールする。

アーカイブを展開して，setup.rb を実行してインストールする．

: rdtool-0.6.20.tar.gz
   ((<URL:http://www.moonwolf.com/ruby/archive/rdtool-0.6.20.tar.gz>))

== Ruby/GTK2のインストール

以下のURLを参考にしてRuby/GTK2(GTK2入り)の最新版をインストー
ルする。

((<URL:http://ruby-gnome2.sourceforge.jp/ja/hiki.cgi?%A5%A4%A5%F3%A5%B9%A5%C8%A1%BC%A5%EB%A5%AC%A5%A4%A5%C9+Windows%CA%D4>))

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
      > ruby -ropen-uri -e "puts open('http://viewvc.rubyforge.mmmultiworks.com/cgi/viewvc.cgi/trunk/support/ruby.st?root=support&view=co').read" > ruby.st

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
