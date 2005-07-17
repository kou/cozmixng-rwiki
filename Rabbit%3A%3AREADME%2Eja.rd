# -*- rd -*-

= README.ja

$Id: README.ja 188 2005-07-15 11:05:12Z kou $

== 名前

Rabbit

== なにこれ？

RDで書かれた文書をもとにプレゼンテーションを行うためのソフト
ウェアです．

== スクリーンショット

((<URL:http://pub.cozmixng.org/~gallery/kou/screenshot/rabbit/>))

== 作者

=== プログラム

Kouhei Sutou <kou@cozmixng.org>

=== 画像（1）

マスコットキャラクタLavie（ラヴィ）((-語感はRabbitから，スペ
ルはフランス語のla vieからとりました．-))とRabbitのロゴ

カワイイ方のうさぎです．

モモ

=== 画像（2）

* 兎

  カッコいい方のうさぎです．

* うさぎ

  走っているカワイイうさぎです．

* かめ

  カワイイかめです．

sode <sodetaka@kono.cis.iwate-u.ac.jp>

=== 画像（3）

旗

gan <shinsato@kono.cis.iwate-u.ac.jp>

=== xyzzy用モード

misc/xyzzy/

みやむこさん

== ライセンス

プログラム，画像ともにRuby's

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
((<INSTALL.win32.ja>))を参考にしてください．

  * ((<RAA:rdtool>))
  * ((<RAA:ruby-gnome2>))の中のRuby/GTK2

=== あればよいもの

  * mimeTeX （RD中にTeXのソースを埋め込むために必要）
  * gs （EPSを読み込むために必要）
  * libgnomeprint >= 2.8 （PS/PDFで出力するために必要）
  * ((<RAA:ruby-gnome2>))の中のRuby/GnomePrint
    （PS/PDFで出力するために必要）
  * ((<RAA:ruby-gnome2>))の中のRuby/RSVG
    （SVGを綺麗に拡大縮小するために必要）
  * ((<RAA:ruby-gettext>))（国際化されたメッセージを表示する
    ために必要）

=== 含まれているもの

  * ((<RAA:rttool>))改: ((<RAA:rwiki>))に含まれているものと
    同じもの
  * ((<RAA:rwiki>))のSOAPインターフェイス

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/rabbit.tar.gz>))

  % svn co http://www.cozmixng.org/repos/rabbit/trunk rabbit

0.0.3より前のものはこちらです．

  % svn co http://www.cozmixng.org/repos/ruby/rabbit/trunk rabbit

== インストール

  # ruby setup.rb

Windowsの場合はinstall.batを実行してもインストールできます．

== 使い方

  % rabbit XXX.rd

例えば，sample/rabbit-implementation.rdを使うには，トップの
ディレクトリで以下のようにします．

  % rabbit sample/rabbit-implementation.rd

WindowsユーザならRDファイルをbin/rabbit.batにドラッグアンド
ドロップしてもよいです．

あるいは，*.rd（とか*.rbt（Rabbitの略））を

  <rubyをインストールしたフォルダ>\bin\rubyw -S rabbit

に関連付けて，RDファイルをダブルクリックすることで起動するこ
ともできます．

=== オプション

: -t, --theme
   テーマを指定します．

: -I, --include
   ロードパスを追加します．ロードパスはテーマの検索などにも
   使用されます．

: -B, --base
   入力ソース中の相対パス（例えば画像へのパス）を解決するた
   めのURIまたはパスを指定します．省略した場合は入力ソースの
   種類に応じて自動的に決定されます．

: -T, --type
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

: -e, --encoding
   入力ソースのエンコーディングを指定します．
   
   デフォルトはUTF-8です．

: -f, --full-screen
   フルスクリーンモードで起動します．

: -w, --width
   ウィンドウの幅を指定します．
   
   デフォルトは800です．
   
: -h, --height
   ウィンドウの高さを指定します．

   デフォルトは600です．
   
: -S, --size
   ウィンドウの高さと幅を指定します．

: --paper-width
   印刷時の用紙幅を指定します．用紙幅の単位はinchです．
   
   デフォルトは横置きA4の幅です．
   
: --paper-height
   印刷時の用紙の高さを指定します．用紙の高さの単位はinchです．

   デフォルトは横置きA4の高さです．
   
: --paper-size
   印刷時の用紙の高さと幅を指定します．用紙の高さと幅の単位
   はinchです．
   
   デフォルトは横置きA4です．

: -s, --save-as-image
   スライドの各ページを画像として保存し，終了します．

: -i, --saved-image-type
   保存される画像の種類を指定します．
   
   例えば，png（デフォルト）とかjpegとか．

: -b, --saved-image-basename
   保存される画像のファイルのベース名を指定します．保存され
   る画像の名前は"#{ベース名}#{ページ番号}.#{拡張子}"となり
   ます．
   
   デフォルトはスライドのタイトルです．
   
   もし，ファイルシステムのエンコーディングがUTF-8ではないの
   に，ファイル名がUTF-8で保存される場合は，環境変数LANGとか
   G_FILENAME_ENCODINGとかを設定するとよいかもしれません．

: -p, --print
   スライドを印刷し，終了します．--output-filenameを指定する
   ことによりファイルに印刷したり，プリンタに直接印刷するこ
   ともできます．
   
   ただし，現在のところ，あまり品質はよくありません．

: -o, --ourput-filename
   印刷ファイル名を指定します．印刷フォーマットは拡張子によ
   り決定します．拡張子が.psの場合はPostScript形式で，.pdfの
   場合はPDF形式で出力します．それ以外の場合はPostScript形式
   で出力します．
   
   "|プログラム名"とすると，PostScript形式の出力をプログラム
   に渡します．
   
   デフォルトは"#{スライドのタイトル}.ps"です．

: --slides-per-page
    1ページに何枚のスライドを入れて印刷するかを指定します．
    
    デフォルトは1枚です．

: --margin, --*-margin
    1ページに複数枚のスライドを印刷する時のスライドの周りの
    余白を指定します．
    
    デフォルトではスライドの枚数に応じて調節しますが，2枚と8
    枚以外の時はあまりうまくありません．

: --page-margin, --*-page-margin
    印刷時のページの余白を指定します．
    
    デフォルトでは余白はとられません．

: --locale-dir
   ロケール用データ（*.mo）を置くためのディレクトリを指定し
   ます．Rabbitをシステムにインストールせずに使う場合は
   Rabbitのトップディレクトリで以下のようにします．

     % bin/rabbit --locale-dir data/locale --type file sample/rabbit.rd
   
   デフォルトでは/usr/local/share/locale/や
   /usr/share/locale/あたりが使われます．

: --log-type
   エラーログをどのように出力するかを指定します．guiを指定す
   るとエラーログはダイアログボックスに表示されます．rabbit
   の起動オプションを解析するときにエラーが起こることもある
   ので，--log-typeはオプションの先頭で指定することをお薦め
   します．

     % rabbit --log-type gui ...
   
   デフォルトはstderrで標準エラー出力に表示されます．

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

=== 置き場所

テーマはrubyの$LOAD_PATHから検索されます．新しくテーマを作成
した場合は((|$LOAD_PATHに含まれているパス/rabbit/theme/テー
マ名/テーマ名.rb|))に置いてください．

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

以下のものを用意してください．

  * ps2pdf

XXX.rdから1ページに8枚のスライドが入ったPDF（XXX_multi.pdf）を
作成する手順は以下の通りです．

  % rabbit -p --slides-per-page 8 -o XXX.ps XXX.rd
  % ps2pdf XXX.ps

== 感謝

  * モモさん: かわいいうさぎなどを書いてくれました．
  * みやむこさん: xyzzy用のrabbitモードを書いてくれました．
    Windowsまわりでいろいろ助けてくれます．
  * zundaさん: EPSの扱いを修正してくれました．--marginの指定
    方法についてアドバイスしてくれました．Rabbitを使って
    プレゼンしてくれます．
  * Vincentさん: Max OS Xでの動作確認をしてくれます．フラン
    ス語のメッセージを用意してくれました．
  * sodeさん: かっこいい兎とかかわいいうさぎとかかわいいかめ
    を書いてくれました．
  * かずひこさん: いろいろバグ報告をしてくれました．Rabbitを
    使ってプレゼンしてくれます．
  * noritadaさん: ドキュメントに関するバグ報告をしてくれまし
    た．
  * ganちゃん: 旗を書いてくれました．

