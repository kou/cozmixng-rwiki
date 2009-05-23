= INSTALL.macosx-macports.ja

$Id: INSTALL.macosx-macports.ja 1226 2009-03-12 11:13:56Z kou $

Mac OS X のパッケージ管理システムのひとつである、MacPorts を利用して
Rabbit をインストール、利用する手順について説明します。

== 事前に準備するもの

以下のソフトウェアが必要です。Mac OS X のシステムDVDなどからインストール
してください。

* Xcode Tools
* X11
* Subversion

Xcode Tools のインストール時には、X11 SDK を選択するのを忘れないでください。

Subversion は、MacPorts のインストール後に

  ~% sudo port install subversion

としてインストールするか、((<URL:http://metissian.com/projects/macosx/subversion/>))
で公開されているバイナリパッケージを利用してインストールするのが簡単です。
また、Mac OS X 10.5 (Leopard) では、Subversion がインストールされていますので、自分で用意する必要はありません。

== MacPorts のインストール

MacPorts の公式サイト ((<URL:http://www.macports.org/>)) からダウンロード、
インストールします。ディスクイメージ(.dmg)からインストールするのが簡単です。

とくに指定しなければ、/opt/local 以下に MacPorts 関連のファイル群がインストール
されます。MacPorts のコマンドを利用するために、環境変数 PATH に /opt/local/bin
を追加します。

=== MacPorts の設定

残念なことに、公式の MacPorts では Rabbit のパッケージ(Portfile)が用意されて
いません。独自のパッケージを利用するために、以下の設定を行います。

まず、Portfile を Subversion リポジトリから取得します。この例では、
自分のホームディレクトリ下に dports/ というディレクトリにダウンロードします。

  ~% svn co http://www.cozmixng.org/repos/dports/trunk dports
  ~% cd dports
  ~/dports% portindex

次に、このディレクトリを MacPorts が参照するように 
/opt/local/etc/macports/sources.conf を編集します。

  # To enable your local ports repository, uncomment and customize the
  # following line to point at your local dports directory
  # Example: file:///Users/landonf/misc/darwinports/dports
  #
  file:///Users/yourname/dports # <- here
  # To get darwinports from the darwinports rsync server use:
  # rsync://rsync.darwinports.org/dpupdate/dports
  rsync://rsync.darwinports.org/dpupdate/dports

ここで /Users/yourname はあなたのホームディレクトリに置き換えてください。

正しく設定できたかを確認するために、Rabbit の Portfile の情報を出力してみます。

  ~% port info rb-rabbit
  rb-rabbit 0.5.1, Revision 0, ruby/rb-rabbit
  {http://www.cozmixng.org/~rwiki/?cmd=view;name=Rabbit}
  # 以下省略 #

正しく設定できていないときは、以下のようなメッセージが出力されます。

  ~% port info rb-rabbit
  No port rb-rabbit found.


== Rabbit のインストール

まず、以下のコマンドで、Rabbitに必要なソフトウェアの情報を更新し
ておくのも良いかもしれません。

  ~% sudo port sync

以下のコマンドで Rabbit と、それに必要なソフトウェアがインストールされます。

  ~% sudo port install rb-rabbit

glib や Gtk2 がインストールされていないときは、これらのインストールのために
ある程度の時間がかかります。

他にも以下の port をインストールするとよいでしょう。

* htree (rb-htree) - ソースコードに色をつけることができるようになります
* Ruby-GetText-Package (rb-gettext) - メッセージなどの国際化が有効になります

インストール方法は同様です。

  ~% sudo port install rb-htree
  ~% sudo port install rb-gettext

注) Ruby-GetText-Package が、すでに RubyGems からインストールされているときは
rb-gettext のインストールは不要です。

Rabbit のデフォルトの rb-gnome では、only_gtk2 というバリアントを指定して
インストールされます。RSVG など、Ruby/Gnome の他の機能を利用したい場合には

  ~% sudo port install rb-gnome -only_gtk2

とすることで、Ruby/Gnome のすべてのライブラリを利用することができます。
ただし、この場合は依存パッケージが多いために、数時間インストールに時間が
かかります。

== X11 環境に関する Tips

一般的な PC-UNIX 環境とは異なり、Mac OS X ではウィンドウシステムとして X を
利用していません。そのため、いくつかの注意が必要になります。

=== X11.app を起動する

X11.app が起動していなければ、rabbit は実行できません。X11.app は 
/アプリケーション/ユーティリティ/X11.app にあります。

=== DISPLAY 環境変数

X11 上で動作する Rabbit を利用するためには、DISPLAY 環境変数が設定されて
いなければなりません。X11.app 上の xterm では設定されていますが、標準の
ターミナルや iTerm、JTerminal を利用しているときは自分で設定する必要が
あることに注意してください。

== Rabbit をバージョンアップする

port sync コマンドで Portfile を Subversion リポジトリと同期したうえで、
port upgrade コマンドにより、Rabbit を最新のバージョンに更新することが
できます。

  ~% sudo port sync
  ~% sudo port upgrade rb-rabbit

Rabbit だけをバージョンアップしたいときは、-n オプションを指定します。この
オプションの指定により、関連するソフトウェアは更新せずに Rabbit だけを更新
することができます。
  
  ~% sudo port -n upgrade rb-rabbit


== 連絡先

お気づきの点やリクエストなどは、Rabbit::UsersGroup.ja
((<URL:http://www.cozmixng.org/~rwiki/index.rb?cmd=view;name=Rabbit%3A%3AUsersGroup.ja>)) 
や Rabbit MacPorts 担当の木村 (kimuraw at i.nifty.jp) までどうぞ。


