= kou::ToDo

* WikiLinkのグループがひとつしか登録できなくなっているのをどうにかする．
* Rabbitのenscript対応．
* Rabbitの画像表示用HTML出力対応．
* Rabbitのpreの後のlistのインデントがおかしくなっているやつを修正．
* Rabbitに3分ハッキング的なテーマを追加．
* Rabbitにユーザからのリアルタイム御意見インターフェイスをつける．
  * ちっちゃいウインドウを用意して，そこにずらずらと書かれていく感じ．
  * 見た目はlightning-talkテーマかなぁ．
  * タイトルが無いスライドも作れるようにすると良いのかなぁ．
  * 逆に，タイトルスライドに表示するという手も．
    * いや，面倒か．
  * ブラウザの入力フォームを用意する．
  * もちろん，dRubyで直接叩いてもよし．
* uim-rabbitを作る
* Rabbitに角が丸い四角を書くAPIを用意する．

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
* Rabbit: Thread -> Gtkのtimeout

== pending
* ((<wsm>))でgoshがSEGVるのを追う．
  * -> スレッドがからむのであきらめた．
* ((<wsm>))がアクセスのたびにどんどん太っていくのをどうにかする．
  * --enable-threads=noにしてgoshをコンパイルしたら直ったので，FreeBSDだとBoehm GCとpthreadsの相性が悪いんだろうということで放置．
* ((<WikiLink>))で登録できなくなっているのを直す．
  * なにもしていないけど直っている？？？
