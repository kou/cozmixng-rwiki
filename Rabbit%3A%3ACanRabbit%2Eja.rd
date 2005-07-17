= できるRabbit

: subtitle
   Rabbitでプレゼンテーション
: author
   須藤功平
: institution
   COZMIXNG
: theme
   rabbit

== はじめに

Rabbitを用いてプレゼンテーションを行うための資料はどのように
作成したらよいかを説明します．目標はRDの文法を知っている読者
がRabbitを用いてプレゼンテーションが「できる」ようになること
です．

このファイル自体をRabbitの入力とすることができるため，プレゼ
ンテーション資料がどのように表示されるかを確認することができ
ます．

= 特徴

  * ソースはRD
  * RWikiとの連携
  * テーマ
  * 多言語が扱える

== 特徴

Rabbitにはさまざまな機能がありますが，ここでは特徴的なものの
み紹介します．他の機能については，機会があれば紹介します．

=== 書式

Rabbitの入力ソースはRD((-Ruby Document-))という書式で記述し
ます．つまり，資料はRD形式で書くことになります．

インライン書式の評判は悪いですが，インデントベースの構文は，
自然に構造化された文書を作成することができます．インライン書
式が無ければRDで書かれた文書の可読性は高いと思います．

=== RWikiとの連携

RabbitはRWikiと連携して動作することができます．つまり，RWiki 
のページを直接入力ソースとして読み込むことができます．

これにより，資料をどこでも簡単に編集することができます．また，
RWikiのバージョン管理機能を使うことにより，データの損失を気
にせず，安心して資料を作成することができます．もし，Rabbitが
インストールされていない環境でも，RWikiのスライド拡張を利用
してプレゼンテーションを行うことができます．


RWikiのページを直接入力ソースとして読み込む機能を一般化して，
HTTPや，FTPを用いてネットワーク越しの入力ソースを直接読み込
むこともできます．利用可能な入力方式は以下の通りです．

: ARGF
   標準入力から読み込む．

: file
   指定したファイルから読み込む．

: URI
   指定したURIから読み込む．スキームにはhttp，ftp，fileが使
   える．

: RWiki
   RWikiのページを読み込む．

=== テーマ

Rabbitでは内容（RD）と見た目を分離するために，テーマ機能を提
供します．

テーマを切り替える事により，同じ内容の資料を異なる見た目でプ
レゼンテーションに利用することができます．異なる機会／場所で
のプレゼンテーションの時に役立つかもしれません．

一つのテーマは複数のテーマを組み合わせて作ることもできます．
例えば，「右下にスライド番号を表示するテーマ」や「タイトルス
ライドに画像を表示するテーマ」などがあり，それらのテーマを用
いて作成されているテーマがあります．

テーマはRubyスクリプトです．テーマの書き方は別の機会に紹介す
ることにしましょう．

=== 多言語の扱い

RabbitはPangoを利用しているため，複数の言語で書かれたテキス
トを同時に表示する事ができます．ただし，入力ソースのエンコー
ディングをUTF-8にする必要があるので注意してください．

UTF-8以外のエンコーディングで書かれた入力ソースを読み込むと
きは，コマンドライン引数でエンコーディングを指定することによ
り，入力ソースのエンコーディングをUTF-8に変換します．

= 書き方

以下を強制する魔法の粉が．．．

  * だらだら書かない
  * 一枚のスライドには一つの事を
  * 現在位置を意識させる
  * 適度に図を


== 書き方

資料はRDで記述しますが，従来のような構造化された文書ではなく，
プレゼンテーション資料であることを意識して書く必要があります
((-普通の文書として書くこともできますが，プレゼンテーション
資料であることを意識してかいた方がよりよい資料が作成できるで
しょう．-))．例えば，以下のようなことを意識して書くとよいで
しょう．

  * だらだら書かない
    
    自明な，あるいは必要のない主語，述語，形容詞などは省略し
    ても，プレゼンテーション時の説明で補うことができます．ス
    ライドの内容を読むだけのプレゼンテーションなら誰でもでき
    ます．自分にしかできないプレゼンテーションをしませんか？
    
    ((*本当に*))言いたいことだけをすっきり書くことにより，そ
    の事が伝わりやすくなるかもしれません．
    
    Rabbitが標準で提供するテーマは他のプレゼンテーションツー
    ルが標準で提供するテーマよりも文字の大きさが大きめに設定
    されています．そのため，だらだら書くと一スライドに収まらな
    くなり，だらだら書いてしまいがちな自分を戒めることができ
    ます．

  * 一枚のスライドには一つの事を
    
    プレゼンテーションでは，メリハリを付けないと観客が飽きて
    しまいます．一枚のスライドに複数の事を盛り込むと，スライ
    ドを切り替える事による話題転換を表現できないため，話の区
    切りをつけることが難しくなるようです．
    
    そういえば，Rabbitには，スライド切り替え時の効果がありま
    せん．さて，この機能は必要でしょうか．

  * 現在位置を意識させる
    
    少し前に見せたスライドだからといって，観客が覚えていると
    思ってはいけません．観客に「あれ？今何の説明をしているん
    だっけ？」と思わせてはいけません．
    
    これは，一つの事を複数のスライドに分割した時などに起こる
    ようです．要所要所に今は何の説明をしている，次は何の説明
    をする，全体で見ると今はここにいる，などを確認できるスラ
    イドを挿入することで回避できる場合もあるようです．
    
    これもメリハリを付けるということに関係するかもしれません．
    
    Rabbitには全てのスライドのサムネイルを表示する機能がありま
    す．これを用いて完成した資料の流れをもう一度追ってみて迷
    子になりそうな箇所がないか確認することができます．

  * 適度に図を
    
    直感的に理解してもらう場合は，文字で説明するよりも図を用
    いた方が効果的な場合が多いようです．
    
    また，文字だけのスライドは単調になってしまいがちです．
    図を入れることにより，文字だけのスライドよりもメリハリを
    付けることができます．
    
    RabbitはPNGやJPEG，EPS形式の画像などを扱うことができます．
    もちろん，拡大縮小もできます．

= スライド

(('='))がスライド区切り

  = スライド1
  ...
  = スライド2
  ...

== スライド

Rabbitでは，一番大きな見出し（=）から次の一番大きな見出しま
でを一枚のスライドとみなします．例えば，以下の例では二枚のス
ライドがあります．

  = スライド1
  ...
  = スライド2
  ...

それ以外の見出しの間は単に無視されます．

  = スライド1
  表示される
  ...
  == 中見出し
  無視される
  ...
  = スライド2
  表示される
  ...

この文書はこの規則を利用しています．

大見出しの後にそれより小さい見出しを挿入し，その間に説明用の
文章を挿入しています．これらの説明用の文章はプレゼンテーショ
ン時は表示されません．説明用の文章のみを抜き出し，プレゼンテー
ションのレジュメを作成するということも可能です．例えば，
((<rd2tex|URL:http://www.cozmixng.org/repos/ruby/rd2tex/>))
を用いる事ができます．

=== スライドタイトル

大見出しにしたテキストがスライドタイトルとなります．

以下の例では，「スライド1」と「スライド2」がスライドタイトル
になります．

  = スライド1
  ...
  = スライド2
  ...

スライドタイトルはウィンドウのタイトルバーに表示されたり，ポッ
プアップメニューを用いてジャンプする際のスライド一覧などに表示
されます．

= タイトルスライド

  * 最初のスライド
  * メタデータを記述

  = タイトル
  
  : author
     須藤功平
  : institution
     COZMIXNG

== タイトルスライド

最初のスライドはタイトルスライドとなります．

タイトルスライドにはスライドのメタデータを記述します．メタデー
タはRDでいうラベル付きリストで記述します．ラベルにはメタデー
タ名を，説明にはメタデータ名に対応する値を記述します．

以下の例では，「作者」と「所属」をメタデータとして記述してい
ます．

  = タイトル
  
  : author
     須藤功平
  : institution
     COZMIXNG

記述できるメタデータは以下のものがあります．

: author
   作者

: institution
   所属

: subtitle
   サブタイトル

: content_source
   出典

: theme
   デフォルトのテーマ名．コマンドライン引数で上書きすること
   が可能．

=== プレゼンテーションタイトル

タイトルスライドのスライドタイトルはスライド全体のタイトル
（プレゼンテーションタイトル）になります．

プレゼンテーションタイトルはスライドタイトルと同じく，さまざ
まな場所に表示されます．

= 画像

  * さまざまな形式を扱える
    * PNG, EPS, ...
    * 形式を指定する必要はない
  * 外部にある画像も扱える
    * HTTP, FTP, file://, ...

== 画像

RabbitではPNGやJPEG，EPSなど複数の画像形式を扱うことができま
す．

EPS形式以外は，ファイルの内容から画像形式を自動認識するので
明示的に画像形式を指定する必要はありません．EPS形式の場合は
拡張子を.epsにする必要があります．

画像の指定にはURIを用います．スキームとして，http，ftp，file
を用いることができます．

  http://...
  ftp://...
  file://...

スキームを省略した場合は相対パスとして扱います．

  sample.png
  ../sample.png
  ...

相対パスはパスの前にベースURIがあるものとして扱います．ベー
スURIは入力ソースの種類によって自動的に決定されます．

: ARGF
   カレントディレクトリ

: file
   指定したファイルがあるディレクトリ

: URI
   指定したURIのファイル名を除いた部分

: RWiki
   指定したRWiki（のSOAP）インターフェイスのURIのファイル名
   を除いた部分

= 書式

   # _
   # image
   # src = 画像のURI
   # パラメタ名 = 値
   # ...

  # image
  # src = usagi.png
  # keep_ratio = true
  # relative_height = 100

=== 書式

画像を挿入する場合は以下のように記述します．

  # _
  # image
  # src = 画像のURI
  # パラメタ名 = 値
  # ...

パラメタ名には以下のものを指定することができます．

: keep_ratio
   画像を拡大縮小した時に縦横の割合を維持する．指定できる値
   は(({true}))またはそれ以外．(({true}))の場合は縦横の割合
   を維持する．ただし，幅／高さのどちらか一方のみを指定して
   いる場合に限る((-幅も高さも指定している場合は縦横の割合な
   んて気にしないでしょ？-))．
   
   デフォルト: (({true}))
   
   注意: 昔は(({keep_scale}))という名前でした．

: caption
   画像の表題を設定する．

: width
   画像の幅を指定する．単位はピクセル．
   
: height
   画像の高さを指定する．単位はピクセル．
   
: normalized_width
   画像の幅を指定する．単位はテーマ内での単位（スライドの大
   きさに比例する）．
   
: normalized_height
   画像の高さを指定する．単位はテーマ内での単位（スライドの
   大きさに比例する）．
   
: relative_width
   画像の幅をその時点で利用可能な幅に対する割合で指定する．
   例えば，箇条書きの中に画像を配置している場合は，箇条書き
   でインデントされている分だけ幅が狭くなる．

   単位は%．
   
: relative_height
   画像の高さをその時点で利用可能な高さに対する割合で指定す
   る．つまり，100を指定するとスライドの残りを目一杯使うこと
   になる((-実際はcaptionなどを挿入する場合があるため，画像
   を目一杯大きくしたい場合でも90ぐらいを指定した方がよ
   い．-))．

   単位は%．

: dither_mode
   ディザのモードを指定する．指定できる値は(({none}))，
   (({max}))，(({normal}))．
   
   デフォルトは(({normal}))．

: x_dither
   ディザで使用するx軸方向のドット数を指定する((-嘘かも-))．
   
   デフォルトは(({0}))．

: y_dither
   ディザで使用するy軸方向のドット数を指定する((-嘘かも-))．
   
   デフォルトは(({0}))．

= 発表時の注意

  * キャッシュを利用する
  * キー操作を覚える
  * 練習をする

== プレゼンテーション時の注意

プレゼンテーション時の注意事項です．Rabbit特有の事もあります
し，そうでないものもあります．

=== キャッシュ

テーマやスライドの内容によっては，次のスライドが表示されるま
での時間がかかります．Rabbitは一度表示したスライドをキャッシュ
して，二度目以降の表示ではそのキャッシュを利用してスライドを
表示します．

もし，スライドの切替えが遅いようなら，本番前にスライドをキャッ
シュさせましょう．スライドのキャッシュはcキーやポップアップ
メニューからできます．これは，サムネイル表示に関しても同様で
す((-サムネイル生成時のプログレスバーを見せたければ，あえて
キャッシュを作らない方がよいでしょう．-))．

ただし，最大化／最小化などでウィンドウサイズを変更するとキャッ
シュはクリアされるので注意してください．

=== キー操作

Rabbitは次／前のスライドに移動するコマンドに多くのキーバイン
ドを用意しています．おそらく，あなたが想像したキーで想像した
動作が起こるでしょう．

プレゼンテーションでは持ち時間が限られているのが普通です．ス
ムーズに進行できるように基本動作のキーバインドは覚えておくと
よいでしょう．

キー操作が嫌ならマウスで操作することもできます．ホイールやポッ
プアップメニューも使えるので，スムーズに進行できるように自分
にあったやり方を見付けてください．

=== 練習

本番前に，必ず((*声に出して*))練習するようにしてください．声
に出すことによって，どの部分が言葉につまる部分なのかがわかり
ます．言葉につまる部分は自分が理解していないのかもしれません
し，スライドの内容が説明しづらい内容になっているのかもしれま
せん．いずれにしても，どこかに問題があるようです．何度も練習
して言葉につまる部分がないようにしてください．

練習することによりプレゼンテーションにどのくらい時間がかかる
かを計る事ができます．ストップウォッチを使ってもよいですが，
Rabbitにはスライドの隅に残り時間を表示するテーマもあるので，
それを活用してもよいでしょう．
