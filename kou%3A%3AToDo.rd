= kou::ToDo

* cozmixng.orgドメイン更新

* RWiki: moveを作る．
* RWiki: テンプレートを作る．
* RWiki: 追加用ブックマークレットを作る．

* Svn: prop-change-email.rbを作る．

* RSS Parser: AtomがRFC化（((<rfc:4287>))）したのでサポートする．

* Rabbit: テーマドキュメントブラウザに編集インターフェイスを追加．

* Rabbitのポリシーをまとめる
  * プレゼン的にやっちゃだめなことをやると汚く見えるように．
    * 文字の大きさが大きめ（ぐだぐだ書かないように）
      * 一ページにたくさんの箇条書きを書けない
      * 一行に長々と文章を書けない（「○○した結果××となる」とか書いちゃダメ．「○○の結果は××」とか）

* RSS Parser: ((<Podcast|URL:http://phobos.apple.com/static/iTunesRSS.html>))対応
* RSS Parser: 例外にタグ／属性のURI情報も加える．
* RSS Parser: RSS 2.0 with dublin core/content moduleサポート

* コメントをスライドに対応付け．
* コメントを保存．
* マージして作ったテーマを保存．
* テーママージのundo．
* マウスドラッグでスライド入れ換え．
* Cairo対応．
* uim-rabbitを作る

* ((<Gauche>))の((<SWIG>))対応．
  * -> これやってたりしますか？ qt bindingが欲しいのでswigを使おうかなと思ってここを見つけました．((<ねる|URL:http://www.soraneko.com/~nel/>))
  * ごめんなさい．最近はめっきり手を付けていません．「そういえばGaucheの拡張ライブラリって書いた事ないなぁ，そこから調べなきゃ」とか思っているうちに時間が過ぎています．
  * ああ，了解です．では，こちらでやってみますね．
* RWikiのrt2rwiki-libのInlineParserをどうにかする．
* ((<Ruby>))で実装されたRelax NGバリデータを作る/探す
* RWikiのRD2RWikiVisitor#default_ext_*をrwiki/rd/ext/以下のクラスに移動してはどうかと提案する．
* ゼミのネタを考える．
  * 関数型make
  * ((<Self Tutorial|URL:http://research.sun.com/research/self/release_4.0/Self-4.0/Tutorial/>))
  * アスペクト指向
* GaucheとGTK+ のプログレスバーとタイムアウトとかについてまとめる．
* Metacityとgconftool-2についてまとめる．オプション: -R, --set, --type
* WiLiKi:kouを整理する
* ((<benchmark>)) -> ((<bsm>))
* ((<GalleryAdministrator>))（というか，RubyPhoto）の高速化．
* RWikiのnaviのborderを百分率でも指定できるようにする．例えば，上位30%（つまり，borderは（下から）70%）はヘッダに表示とか．

== pending
* ((<wsm>))でgoshがSEGVるのを追う．
  * -> スレッドがからむのであきらめた．
* ((<wsm>))がアクセスのたびにどんどん太っていくのをどうにかする．
  * --enable-threads=noにしてgoshをコンパイルしたら直ったので，FreeBSDだとBoehm GCとpthreadsの相性が悪いんだろうということで放置．
* ((<WikiLink>))で登録できなくなっているのを直す．
  * なにもしていないけど直っている？？？
