# -*- rd -*-

= INSTALL.win32.ja

$Id: INSTALL.win32.ja 83 2004-10-21 14:06:21Z kou $

Windows上でRabbitを実行するのは大変です．以下を参考にして頑
張ってください．

== Ruby 本体のインストール

ruby 1.8.1 のインストール。
One-Click Ruby Installer for Windows 日本語版を使えば OK。

((<One-Click Ruby Installer for Windows 日本語版
|URL:http://www.moonwolf.com/ruby-setup-20041012.exe>))

== RDTool のインストール

※ One-Click Ruby Installer for Windows 日本語版で ruby をイ
ンストールした場合は別途インストールする必要はありません。

RDTool をインストールする。
ただしインストール時に [ruby-list:38913] のパッチが必要です。
あと make も (うへぇ)。
* ((<URL:http://raa.ruby-lang.org/project/rdtool/>))
* ((<URL:http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-list/38913>))

面倒な人は以下のバイナリを展開したものを ruby のインストール
ディレクトリにコピーするだけで OK。(mingw だけど気にしない)
* ((<URL:http://ftp.ruby-lang.org/pub/ruby/binaries/mingw/1.8/ext/rdtool-0.6.14-i386-mingw32-1.8.tar.gz>))

== Ruby/GTK2のインストール

※ One-Click Ruby Installer for Windows 日本語版で ruby をイ
ンストールした場合は別途インストールする必要はありません。

install.rb を実行してインストールする。

: ruby-gtk2-0.10.0-2-i386-msvcrt-1.8.zip
    * ((<URL:http://prdownloads.sourceforge.net/ruby-gnome2/ruby-gtk2-0.10.0-2-i386-msvcrt-1.8.zip?download>))

== GTK+ 2のインストール

GLADE for Windows の GTK2 パッケージをインストールする。

: gtk+-win32-aio-2.4-rc15
    * ((<URL:http://gladewin32.sourceforge.net/modules.php?name=Downloads&d_op=getit&lid=43>))

== Rabbit のインストール

install.bat を実行してください。

面倒ですいません．
