= kou::ToDo

* ((<rwiki-devel:199>))をサクッと片付ける．
  * 今日中にできなかった．．．軽く焼酎呑んじゃったから，もう眠い．．．
  * 今日もできなかった．．．
* ((<Subversion>))の((<Ruby>))バインディングを((<SWIG>))で作る．
  * -> 本家のリポジトリに((<ブランチを切る|URL:https://svn.collab.net/repos/svn/branches/ruby>))
  * -> 切る前に置いておいた((<パッチ達|URL:http://pub.cozmixng.org/~kou/diff/>))．
* ((<Gauche>))の((<SWIG>))対応．
  * -> これやってたりしますか？ qt bindingが欲しいのでswigを使おうかなと思ってここを見つけました．((<ねる|URL:http://www.soraneko.com/~nel/>))
  * ごめんなさい．最近はめっきり手を付けていません．「そういえばGaucheの拡張ライブラリって書いた事ないなぁ，そこから調べなきゃ」とか思っているうちに時間が過ぎています．
  * ああ，了解です．では，こちらでやってみますね．
* RWikiのrt2rwiki-libのInlineParserをどうにかする．
* ((<Ruby>))で実装されたRelax NGバリデータを作る/探す
* RWikiのRD2RWikiVisitor#default_ext_*をrwiki/rd/ext/以下のクラスに移動してはどうかと提案する．
* ゼミのネタを考える．
  * kouプロダクツをまとめてネタにする．
  * 関数型make
  * ((<Self Tutorial|URL:http://research.sun.com/research/self/release_4.0/Self-4.0/Tutorial/>))
  * アスペクト指向
* Diaにrotateを実装する．
* SodipodiをRubyで拡張できたらいいな．
  * Sodipodiを拡張するフレームワークはmoduleあたりか
* SWIGの%renameディレクティブで正規表現とかワイルドカードが使えるようにする．
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
