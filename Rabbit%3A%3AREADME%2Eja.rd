# -*- rd -*-

= README.ja

$Id: README.ja 1355 2010-01-29 13:48:57Z kou $

== 名前

Rabbit

== なにこれ？

RDで書かれた文書をもとにプレゼンテーションを行うためのソフト
ウェアです．

Rubyでスライドの見栄えを定義すること，キーボードによるインター
フェイスが多いこと，マウスジェスチャをサポートしていること，
などという特長があります．

== スクリーンショット

((<URL:http://pub.cozmixng.org/~gallery/kou/screenshot/rabbit/>))

== 作者

=== プログラム

Kouhei Sutou <kou@cozmixng.org>

=== 画像（1）

* マスコットキャラクタLavie（ラヴィ）((-語感はRabbitから，スペ
  ルはフランス語のla vieからとりました．-))とRabbitのロゴ

  カワイイ方のうさぎです．

* たいらびとたいやき

  たいやきが好きな食いしん坊なうさぎです。

* バナー

  カワイイバナーです．

モモ

=== 画像（2）

* 兎

  カッコいい方のうさぎです．

* かめ

  カワイイかめです．

sode

=== 画像（3）

旗

gan

=== 画像（4）

* ピンクのRabbitのロゴ

* ピンクのRubyのロゴ

* うさたろう

* かめたろう

* たぬ・きたろう（たぬさん）

* ゆきだるたろう（ゆきだるさん）

うさっち

=== 画像（5）

* ゆきうさ

  和服うさぎ少女です．

* アリス

  青いドレスの少女です．

朝比奈 理乃（あさひな　りの）

((<URL:http://littleblue.chu.jp/>))

=== xyzzy用モード

misc/xyzzy/

みやむこさん

=== Emacs用モード

misc/emacs/

武田くん

=== RabbIRC

bin/rabbirc

やまだあきらさん

== 共同開発者

  * みやむこさん
  * noritadaさん
  * 武田くん

== 著作権

コードの著作権はそれぞれのコードを書いたものにあります．つま
り，コミットされたコードの著作権はそのコミッタにあり，パッチ
のコードの著作権はそのパッチ作者にあります．

画像の著作権は上述の作者にあります．

== ライセンス

プログラム，画像ともにRuby'sです．詳しくはCOPYINGまた
はCOPYING.jaを見てください．

lib/rabbit/div/prototype.jsはMITスタイルのライセンスになります．
詳しくは((<Prototype JavaScript
Framework|URL:http://prototype.conio.net/>))を見てください．

マスコットキャラクタのPSDファイルが欲しい人はプログラム作者
に連絡してください．画像作者に相談してみます．

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
を御覧下さい．

== バグトラッキングシステム

ご意見ご要望不具合報告等は作者へのメール，上記のメーリングリ
スト，RWikiへの書き込みまたは((<影舞
|URL:http://www.cozmixng.org/~kagemai/?project=rabbit;action=top>))
をご利用下さい．

== 開発状況の確認

開発状況はコミットメールが流れるMLや((<コミット
RSS|URL:http://www.cozmixng.org/rss/rabbit.rdf>))で確認でき
ます．MLに参加するには以下のようなメールを送信してください．

  To: rabbit-commit@ml.cozmixng.org
  Cc: null@cozmixng.org
  Subject: 何か
  
  本文に何か

== お願い

私にはセンスがないので，素晴らしいテーマを作ってください．

ドキュメントが不足しています．助けてください．

メッセージを翻訳してください．

  % mkdir po/#{言語名}
  % ./update-po.rb

とすればpo/#{言語名}/rabbit.poができます．


== 依存ライブラリ

Windowsでの依存ライブラリのインストールは
((<Rabbit::INSTALL.win32.ja>))を参考にしてください．

  * ((<RAA:rdtool>))
  * ((<RAA:ruby-gnome2>))の中のRuby/GTK2

=== あればよいもの

  * mimeTeX （RD中にTeXのソースを埋め込むために必要）
  * gs （EPSを読み込むために必要）
  * ((<RAA:ruby-gnome2>))の中のRuby/RSVG
    （SVGを綺麗に拡大縮小するために必要）
  * ((<RAA:ruby-gettext>))（国際化されたメッセージを表示する
    ために必要）
  * ((<RAA:htree>))
  * ((<Migemo|URL:http://0xcc.net/migemo/>))
  * LaTeX
  * Tgif
  * Dia
  * GIMP
  * HikiDoc

=== 含まれているもの

  * ((<RAA:rwiki>))のSOAPインターフェイス

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/rabbit.tar.gz>))

  % svn co http://www.cozmixng.org/repos/rabbit/trunk rabbit

== インストール

  # ruby setup.rb

Windowsの場合はinstall.batを実行してもインストールできます．

=== Gentoo (Portage)

これでインストールできるようです．

  % sudo env ACCEPT_KEYWORDS=~x86 FEATURES="digest" emerge rabbit

((%% sudo emerge rabbit%))だけじゃだめなのかなぁ．

== 使い方

  % rabbit XXX.rd

例えば，sample/rabbit-implementation.rdを使うには，トップの
ディレクトリで以下のようにします．

  % rabbit sample/rabbit-implementation.rd

ただし，いくつかのサンプルは，テーマがsample/rabbit/theme以
下にあるためトップからではうまく表示できないかもしれません．
サンプルの実行は sample ディレクトリに入ってするとよいでしょ
う．

WindowsユーザならRDファイルをbin/rabbit.batにドラッグアンド
ドロップしてもよいです．

あるいは，*.rd（とか*.rbt（Rabbitの略））を

  <rubyをインストールしたフォルダ>\bin\rubyw -S rabbit

に関連付けて，RDファイルをダブルクリックすることで起動するこ
ともできます．

=== オプション

: -t, --theme=THEME
   テーマを指定します．

: -I, --include=PATH
   ロードパスを追加します．ロードパスはテーマの検索などにも
   使用されます．

: -B, --base=BASE
   入力ソース中の相対パス（例えば画像へのパス）を解決するた
   めのURIまたはパスを指定します．省略した場合は入力ソースの
   種類に応じて自動的に決定されます．

: -T, --type=TYPE
   入力ソースの種類を指定します．

   入力ソースの種類は rwiki, file（デフォルト）, argf, uri 
   のいずれかを指定します。

   : argf

     入力ソースとしてARGFを利用します．つまり，標準入力から
     ソースを入力することも出来ます．
     
     ソースの自動再読み込み機能は利用できません．
     
     例:
       % rabbit --type argf file1.rd file2.rd ...
     とか
       % cat file1.rd file2.rd ... | rabbit --type argf
     とか
       % rabbit --type argf
       = title
       ...
       ^D
     とか

   : file

     デフォルト．つまり--type fileは省略可．
     
     指定したファイルからソースを取得します．

     ソースの自動再読み込み機能を利用できます．
     
     例:
       % rabbit --type file file.rd

   : uri

     指定したURIからソースを取得します．

     ソースの自動再読み込み機能を利用できますが，パフォーマ
     ンスなどを考慮して，最後にソースを読み込んでから一定時
     間（現在は60秒）以上たたないとたとえソースが変更されて
     いてもソースを再読み込みしません．

     例:
       % rabbit --type uri http://www.cozmixng.org/repos/rabbit/trunk/sample/rabbit-implementation.rd
     とか
       % rabbit --type uri ftp://.../XXX.rd
     とか

     ちなみに，
       % rabbit --type uri file:///.../XXX.rd
     とか
       % rabbit --type uri /.../XXX.rd
     とかは
       % rabbit --type file /.../XXX.rd
     と同じ

   : rwiki

     指定したRWikiのページの内容をソースとします．ただし，
     RWikiにはSOAPインターフェイスが用意されている必要があり
     ます．

     ソースの自動再読み込み機能を利用できますが，パフォーマ
     ンスなどを考慮して，最後にソースを読み込んでから一定時
     間（現在は60秒）以上たたないとたとえソースが変更されて
     いてもソースを再読み込みしません．

     例:
       % rabbit --type rwiki RWikiのSOAPインターフェイスのURI ページ名

     注意点としてはページ名は対象となるRWikiと同じエンコーディ
     ングである必要があるということです．

     例えば，EUC-JPで以下のようにします（The RWikiにはSOAPイン
     ターフェイスが導入済み）．

       % rabbit --type rwiki http://pub.cozmixng.org/~the-rwiki/rw-soap.rb スライド::Rabbit

     --baseと組み合わせてこんな風にするとよいかもしれません．

       % rabbit --type rwiki --base #{Rabbitを展開したディレクトリ}/sample \
          http://pub.cozmixng.org/~the-rwiki/rw-soap.rb スライド::Rabbit

   : memory

     ソースをメモリ上に置いて管理します．このタイプではdRuby
     やSOAPなどのインターフェイスを用いてソースの内容を書き
     換えることができます．
     
     初期ソースはファイル名を指定して，そのファイルの内容を
     与えることができます．

     例（初期ソースなし）:
       % rabbit --type memory

     例（初期ソースあり）:
       % rabbit --type memory file.rd

: -e, --encoding=ENCODING
   入力ソースのエンコーディングを指定します．
   
   指定しなかった場合は自動検出を試みます．

: -f, --full-screen, --no-f, --no-full-screen
   フルスクリーンモードで起動するかどうかを指定します．
   
   デフォルトではフルスクリーンモードにはなりません．

: --index-mode, --no-index-mode
   一覧モードで起動するかどうかを指定します．
   
   デフォルトでは一覧モードにはなりません．

: -w, --width=WIDTH
   ウィンドウの幅を指定します．
   
   デフォルトは800です．
   
: -h, --height=HEIGHT
   ウィンドウの高さを指定します．

   デフォルトは600です．
   
: -S, --size=WIDTH,HEIGHT
   ウィンドウの高さと幅を指定します．

: -s, --save-as-image
   各スライドを画像として保存し，終了します．

: -i, --saved-image-type=TYPE
   保存される画像の種類を指定します．
   
   例えば，png（デフォルト）とかjpegとか．

: -b, --saved-image-base-name=BASE_NAME
   保存される画像のファイルのベース名を指定します．保存され
   る画像の名前は"#{ベース名}#{ページ番号}.#{拡張子}"となり
   ます．
   
   デフォルトはスライドのタイトルです．
   
   もし，ファイルシステムのエンコーディングがUTF-8ではないの
   に，ファイル名がUTF-8で保存される場合は，環境変数LANGとか
   G_FILENAME_ENCODINGとかを設定するとよいかもしれません．

: --output-html, --no-output-html
   保存されたスライドを表示するHTMLを生成するかどうかを指定
   します．
   
   デフォルトでは生成しません．

: --output-index-html, --no-output-index-html
   保存されたスライドのサムネイルを表示するHTMLを生成するか
   どうかを指定します．
   
   デフォルトでは生成しません．

: -p, --print
   スライドを印刷し，終了します．--output-filenameを指定する
   ことによりファイルに印刷したり，プリンタに直接印刷するこ
   ともできます．
   
   ただし，現在のところ，あまり品質はよくありません．

: -o, --output-filename=FILENAME
   印刷ファイル名を指定します．印刷フォーマットは拡張子によ
   り決定します．拡張子が.psの場合はPostScript形式で，.pdfの
   場合はPDF形式で出力します．それ以外の場合はPostScript形式
   で出力します．
   
   "|プログラム名"とすると，PostScript形式の出力をプログラム
   に渡します．
   
   デフォルトは"#{スライドのタイトル}.ps"です．

: --paper-width=WIDTH
   印刷時の用紙幅を指定します．用紙幅の単位はinchです．
   
   デフォルトは横置きA4の幅です．
   
: --paper-height=HEIGHT
   印刷時の用紙の高さを指定します．用紙の高さの単位はinchです．

   デフォルトは横置きA4の高さです．
   
: --paper-size=WIDTH,HEIGHT
   印刷時の用紙の高さと幅を指定します．用紙の高さと幅の単位
   はinchです．
   
   デフォルトは横置きA4です．

: --slides-per-page=SLIDES
    1ページに何枚のスライドを入れて印刷するかを指定します．
    
    デフォルトは1枚です．

: --margin={全部|上下,左右|上,左右,した|上,右,下,左}, --margin-*=MARGIN
    1ページに複数枚のスライドを印刷する時のスライドの周りの
    余白を指定します．
    
    デフォルトではスライドの枚数に応じて調節しますが，2枚と8
    枚以外の時はあまりうまくありません．

: --page-margin={全部|上下,左右|上,左右,した|上,右,下,左}, --page-margin-*=MARGIN
    印刷時のページの余白を指定します．
    
    デフォルトでは余白はとられません．

: --locale-dir=DIR
   ロケール用データ（*.mo）を置くためのディレクトリを指定し
   ます．Rabbitをシステムにインストールせずに使う場合は
   Rabbitのトップディレクトリで以下のようにします．

     % ruby -I./lib bin/rabbit --locale-dir data/locale sample/rabbit.rd
   
   デフォルトでは/usr/local/share/locale/や
   /usr/share/locale/あたりが使われます．

: --logger-type=TYPE
   エラーログをどのように出力するかを指定します．guiを指定す
   るとエラーログはダイアログボックスに表示されます．rabbit
   の起動オプションを解析するときにエラーが起こることもある
   ので，--logger-typeはオプションの先頭で指定することをお薦め
   します．

     % rabbit --logger-type gui ...
   
   デフォルトはstderrで標準エラー出力に表示されます．

: --use-druby, --no-use-druby
   dRubyインターフェイスを使うかどうかを指定します．

   デフォルトでは使います．

: --druby-uri=URI
   dRubyインターフェイスのURIを指定します．

   デフォルトではdruby://:10101です．

: --output-druby-uri, --no-output-druby-uri
   dRubyインターフェイスのURIを表示するかどうかを指定します．

   デフォルトでは表示しません．

: --use-soap, --no-use-soap
   SOAPインターフェイスを使うかどうかを指定します．

   デフォルトでは使いません．

: --soap-host=HOST
   SOAPインターフェイスのホストを指定します．

   デフォルトでは0.0.0.0です．

: --soap-port=PORT
   SOAPインターフェイスのポートを指定します．

   デフォルトでは10103です．

: --use-xmlrpc, --no-use-xmlrpc
   XML-RPCインターフェイスを使うかどうかを指定します．

   デフォルトでは使いません．

: --xmlrpc-host=HOST
   XML-RPCインターフェイスのホストを指定します．

   デフォルトでは0.0.0.0です．

: --xmlrpc-port=PORT
   XML-RPCインターフェイスのポートを指定します．

   デフォルトでは10104です．

: --server, --no-server
   サーバとして起動するかを指定します．
   
   デフォルトではサーバとして起動しません．

: --public-level=LEVEL
   外部インターフェイス（dRuby/XML-RPC/SOAP経由）にRabbitの
   機能をどのくらい公開するかを指定します．公開レベルは
   strict, move, read-size, change-size, size, read-source,
   change-source, source, allから選びます．後ろに挙げた公開
   レベルほど多くの機能を公開します．

   デフォルトではstrictです．

: --comment-source=FILE
   初期コメント用ソースのファイル名を指定します．
   
   デフォルトではRabbitが提供する初期コメント用ソースが使わ
   れます．

: --comment-encoding=ENCODING
   初期コメント用ソースのエンコーディングを指定します．

   指定しなかった場合は自動検出を試みます．

: --migemo-dictionary-search-path=PATH1,PATH2,...
   Migemoの静的辞書の検索パスを指定します．検索パスは
   --migemo-dictionary-nameで指定した静的辞書があるディレク
   トリか，静的辞書のパスを指定します．コンマで区切って複数
   のパスを指定することができます．

   デフォルトは/usr/local/share, /usr/shareです．

: --migemo-dictionary-name=NAME
   Migemoの静的辞書名を指定します．

   デフォルトはmigemo-dictです．

: --use-gl, --no-use-gl
   もし可能であればOpenGLを使うかどうかを指定します．

   デフォルトでは使いません．

: --show-native-window-id, --no-show-native-window-id
   もし可能であればウィンドウIDを表示するかどうかを指定します．

   デフォルトでは表示しません。

== Rabbit用RDの書き方

基本的に((<RAA:rwiki>))のスライド拡張と同じです．具体的な
サンプルはsample/rabbit.rdを見てください．

=== ページ

一番大きな見出し（=）がページのタイトルになります．そのペー
ジは次の見出しまで続きます．

  = タイトル

  なにか

  ...

  = 次のページ

  ...

この例だと二ページになります．

=== タイトルページ

最初のページはタイトルページになります．タイトルページには見
出し付きリスト（:）でスライドのメタ情報を指定できます．

  = 発表のタイトル

  : author
     須藤功平
  : institution
     COZMIXNG

この例では，作者が須藤功平で，所属がCOZMIXNGであるということ
を示しています．

現在のところ，authorとinstitution以外にsubtitle，
content_source，themeというメタ情報が指定できます．themeは，
Rabbitを起動するときにテーマが指定されなかった場合に使用され
るテーマになります．

=== 画像

verbatim blockとして記述します．詳しくはsample/rabbit.rdを見
てください．

=== 実体参照

inline verbatimとして記述します．詳しくはsample/rabbit.rdを見
てください．

=== 上（下）付き文字

inline verbatimとして記述します．詳しくはsample/rabbit.rdを見
てください．

=== 見出し

一番大きな見出し以外は使用できないので注意してください（スラ
イドではタイトル以外の見出しは必要ありませんよね？）．

=== 注釈

使えますが，プレゼンテーションでは使うべきではないと思います．

== テーマ

スライドの見た目はRDとは別に指定します．それがテーマです．

テーマのテスト用のスライドがsample/theme-bench.rabにあるので
活用してください。

=== 置き場所

テーマはrubyの$LOAD_PATHから検索されます．新しくテーマを作成
した場合は((|$LOAD_PATHに含まれているパス/rabbit/theme/テーマ
名/テーマ名.rb|))あるいは((|ソースがあるディレクトリ/テーマ
名.rb|))に置いてください．

=== 書き方

テーマはRubyスクリプトです．難しいと思われるかもしれませんが，
凝ったことをしなければそれほど難しいことはありません．

テーマは以下のような記述を列挙していくことになると思います．

  (1) 対象となるスライド中の要素（段落とか，ページタイトルと
      か）を選択

  (2) 選択した要素に対して属性を変更したり，描画時の動作を加
      えたりする．

例えば，各ページ（タイトルページは含まない）にあるタイトルの
文字の色を変更したい場合は以下のように書きます．

  match(Page, HeadLine) do |heads|
    heads.prop_set("foreground", "red")
  end

((|heads|))というように複数形になっているのは，((|heads|))は
タイトル（見出し，head line）を0個以上含んでいるからです．

=== プロパティ

(({prop_set}))では前景色（foreground）以外にも以下のものが指
定できます．詳しくは((<Pango Text Attribute
Markup|URL:http://developer.gnome.org/doc/API/2.4/pango/PangoMarkupFormat.html>))
を見てください．

: font_desc
   フォント情報を指定します．

: font_family
   フォント名を指定します．
   
   フォント名の一覧は(({font_families}))とやればフォント名の
   配列として取得できます．

: face
   font_familyと同じです．

: size
   フォントの大きさを指定します．
   
   フォントの大きさを数値で指定する場合は，指定する数値を
   (({screen_size}))で変換してから(({Pango::SCALE}))を掛けて
   ください．例えば，フォントの大きさを（Rabbitのテーマの世
   界の単位で）2にする場合は以下のようにします．

     screen_size(2) * Pango::SCALE

: style
   フォントのスタイルを指定します．

: weight
   フォントの重みを指定します．

: variant
   フォントのvariant（変形方法って感じ？）を指定します．

: stretch
   フォントの伸び縮みの具合を指定します．

: foreground
   前景色を指定します．

: background
   背景色を指定します．

: underline
   下線の種類をします．

: rise
   文字の上下の位置を指定します．

: strikethrough
   取消線を引くかどうかを指定します．

: fallback
   指定したフォントがなかった場合に似たようなフォントで代用
   するかどうかを指定します．

: lang
   言語を指定します．

: b
   太字にします．

: big
   フォントのサイズを大きくします．

: i
   斜体にします．

: s
   取消線を引きます．

: sub
   下付き文字にします．

: sup
   上付き文字にします．

: small
   フォントのサイズを小さくします．

: tt
   固定スペースフォントにします．

: u
   下線を引きます．

=== フック

要素が描画される前，又は後に実行される手続きを指定することが
できます．それぞれ，(({add_pre_draw_proc}))，
(({add_post_draw_proc}))で指定できます．これらの手続きを削除
するときは，それぞれ(({clear_pre_draw_procs}))，
(({clear_post_draw_procs}))を使います．

詳しくは．．．とりあえず，今のところはdefaultテーマを参考に
してください．

== 小技

=== 1ページに複数枚のスライドが入ったPDFを作る

XXX.rdから1ページに8枚のスライドが入ったPDF（XXX_multi.pdf）を
作成する手順は以下の通りです．

  % rabbit -p --slides-per-page 8 -o XXX_multi.pdf XXX.rd

== 感謝

  * モモさん: かわいいうさぎとかかわいいバナーなどを書いてく
    れました．
  * みやむこさん: xyzzy用のrabbitモードを書いてくれました．
    Windowsまわりでいろいろ助けてくれます．
  * zundaさん:
    * EPSの扱いを修正してくれました．
    * --marginの指定方法についてアドバイスしてくれました．
    * Rabbitを使ってプレゼンしてくれます．
    * Windowsへのインストール用ドキュメントを更新してくれま
      した。
    * Mac OS Xへのインストール用ドキュメントを更新してくれま
      した。
  * Vincentさん: Max OS Xでの動作確認をしてくれます．フラン
    ス語のメッセージを用意してくれました．
  * sodeさん: かっこいい兎とかかわいいうさぎとかかわいいかめ
    を書いてくれました．
  * かずひこさん: いろいろバグ報告をしてくれました．Rabbitを
    使ってプレゼンしてくれます．テーマデザインのアイディアを
    くれました．
  * noritadaさん: ドキュメントに関するバグ報告をしてくれまし
    た．
  * ganちゃん: 旗を書いてくれました．
  * かくたにさん:
    * ドキュメントに関するバグ報告をしてくれました．
    * Rabbitを使ってプレゼンしてくれます．
    * テーマデザインや機能拡張のアイディアをくれました．
    * HTML出力に関するバグを修正するパッチをくれました．
    * Mac OS X(Intel)用のパッケージを作ってくれました．
  * atzmさん: Gentoo用のパッケージ（*.ebuild）を作ってくれま
    した．
  * やまだあきらさん:
    * Debian用のパッケージ（*.deb）を作ってくれました．
    * バグ報告をし、修正もしてくれます。
    * rabbircを作ってくれました。
  * うさっちさん: ロゴとか，たろうシリーズなどを書いてくれま
    した．
  * dotさん: Windowsのインストールについてアドバイスしてくれ
    ました．
  * 田中さん: Windowsで動作確認してくれました．
  * 朝比奈さん: かわいいうさぎ少女とかアリスを書いてくれまし
    た．
  * 西川さん: FAQページの名前を考えてくれました．動作報告を
    してくれます．
  * 武田くん: Emacs用のrabbitモードを書いてくれました．
  * 木村さん: Mac OS X用のパッケージを作ってくれました．
  * kitajさん:
    * Rabbitを使ってプレゼンしてくれます。
    * Windowsのインストールドキュメントを修正してくれます。
    * テーマを改良してくれます。
  * あかぴさん: emergeについてのドキュメントを書いてくれました．
  * おばたさん:
    * pkgsrc用のパッケージを作ってくれました。
    * Rabbitを使ってプレゼンしてくれます。
    * バグ報告をし、修正もしてくれます。
    * たくさんデバッグしてくれます。
  * むとうさん:
    * Rabbitを使ってプレゼンしてくれます。
    * Windowsへのインストール用ドキュメントを更新してくれま
      した。
  * たださん:
    * Rabbitを使ってプレゼンしてくれます。
    * テーマを提供してくれました。
    * テーマベンチを作成するというアイディアをくれました。
  * 前田さん:
    * Rabbitを使ってプレゼンしてくれます。
    * プレゼンの中でこっそりバグレポートをしてくれました。
  * 中井さん: 不具合を報告してくれます。
  * Eduardo Gonzalezさん: 英語のドキュメントをよくしてくれま
    した。
  * 西山さん: バグレポートしてくれました。
  * 助田さん: Ruby 1.9関連のバグを報告してくれました。
  * kdmsnrさん: バグレポートしてくれました。
  * 佐々木さん: Debianパッケージのメンテナンスをしてくれます。
