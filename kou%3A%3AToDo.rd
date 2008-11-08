= kou::ToDo

* ((<GaUnit>))にもっとSchemeっぽいAPIをつける。

* Rabbit: rabbit-launcherを作る（作ってもらう）。
  * Rabbitを起動するGUIアプリケーション。主にWindowsユーザ用。
  * RDをドラッグするとRabbitを起動。
  * RD毎に起動オプションを指定できる。
  * 起動オプションは保存されて、次に同じRDをドラッグしたときは保存した起動オプションを使う。
  * 一度表示したRDはアプリケーション内に表示され、それをダブルクリックするとRDをドラッグしなくてもそのRDを表示する。
  * RDの一覧表示ではそのRDのスクリーンショットを使う。
  * スクリーンショットの取得はdRuby経由でできるはず。

* Rabbit: rabbit-installerを作る（作ってもらう）。
  * Ruby/GTK2アプリケーション。Windowsユーザ用。
  * Ruby/GTK2はインストールされているという前提。
  * RDToolとかRabbit本体を勝手にダウンロードしてインストールする。
  * 頑張るならenscriptとかも入れちゃう。
  * WindowsインストーラちっくなUI。
  * GnomeDruid使える？
    * Gtk::Assistantになってる！

* Subversion: Svn::Core::PROP_XXXじゃなくて、:XXXというようにも書けるようにする。

* 風博士: collectors

* gnome-terminal: new_tabしたときに指定したディレクトリに移動するオプション

* rcairo: 表のサポート
* rcairo: グラフのサポート
* rcairo: バーコードのサポート
  * とりあえずBarby::CairoOutputterを作って送っておいた。将来的にはQRコードもサポートされるっぽいし。
* rcairo: captchaのサポート

* Svn: コールバックにはrb_protect()を使う。

* RWiki: テンプレートを作る．
* RWiki: 追加用ブックマークレットを作る．

* Svn: prop-change-email.rbを作る．

* Rabbit: テーマドキュメントブラウザに編集インターフェイスを追加．

* Rabbitのポリシーをまとめる
  * プレゼン的にやっちゃだめなことをやると汚く見えるように．
    * 文字の大きさが大きめ（ぐだぐだ書かないように）
      * 一ページにたくさんの箇条書きを書けない
      * 一行に長々と文章を書けない（「○○した結果××となる」とか書いちゃダメ．「○○の結果は××」とか）

* RSS Parser: 例外にタグ／属性のURI情報も加える．

* コメントをスライドに対応付け．
* コメントを保存．
* マージして作ったテーマを保存．
* テーママージのundo．
* マウスドラッグでスライド入れ換え．
* uim-rabbitを作る

* RWikiのRD2RWikiVisitor#default_ext_*をrwiki/rd/ext/以下のクラスに移動してはどうかと提案する．
* ((<Self Tutorial|URL:http://research.sun.com/research/self/release_4.0/Self-4.0/Tutorial/>))
* GaucheとGTK+ のプログレスバーとタイムアウトとかについてまとめる．
* Metacityとgconftool-2についてまとめる．オプション: -R, --set, --type
* ((<benchmark>)) -> ((<bsm>))

== pending

== やらない

* ((<wsm>))でgoshがSEGVるのを追う．
  * -> スレッドがからむのであきらめた．
* ((<wsm>))がアクセスのたびにどんどん太っていくのをどうにかする．
  * --enable-threads=noにしてgoshをコンパイルしたら直ったので，FreeBSDだとBoehm GCとpthreadsの相性が悪いんだろうということで放置．
* ((<WikiLink>))で登録できなくなっているのを直す．
  * なにもしていないけど直っている？？？
* ((<GalleryAdministrator>))（というか，RubyPhoto）の高速化．
* RWikiのnaviのborderを百分率でも指定できるようにする．例えば，上位30%（つまり，borderは（下から）70%）はヘッダに表示とか．
* WiLiKi:kouを整理する
* RWikiのrt2rwiki-libのInlineParserをどうにかする．
* ((<Ruby>))で実装されたRelax NGバリデータを作る/探す
* ((<Gauche>))の((<SWIG>))対応．
  * -> これやってたりしますか？ qt bindingが欲しいのでswigを使おうかなと思ってここを見つけました．((<ねる|URL:http://www.soraneko.com/~nel/>))
  * ごめんなさい．最近はめっきり手を付けていません．「そういえばGaucheの拡張ライブラリって書いた事ないなぁ，そこから調べなきゃ」とか思っているうちに時間が過ぎています．
  * ああ，了解です．では，こちらでやってみますね．
