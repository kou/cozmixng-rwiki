= RD working draft 日本語版

RWikiはページの編集の際にRDという書式を用います。RDとは以下のようなものです。

== RDとは何か

RDとはRuby版のPODです。つまりRubyスクリプトファイルの中に埋め込む事を意図して
定義されたドキュメントフォーマットです。

RDは主にplain textをさまざまなフォーマットに変換するplain2というプログラム
の影響を受けています。そのため、RDはplain textに似ており、シンプルですっきり
した文法なので読みやすく書きやすいでしょう。

== RubyインタプリタはRDをどのように扱うか

Rubyのインタプリタは単純に"(({=begin}))"で始まる行から"(({=end}))"で始まる
行までを無視します。ですから、スクリプトファイル中に埋め込む事ができるのは
RDだけではありません。何でも(({=begin}))と(({=end}))の間に書く事ができるの
です。RDは選択肢の一つにすぎませんが、Ruby標準のドキュメントフォーマットと
されています。((-もし他のドキュメントフォーマットに興味があるなら、例えば
rubyapi2
((<URL:http://www.ueda.info.waseda.ac.jp/~igarashi/ruby/xml.html#rubyapi2>))
などを見るといいでしょう。これはRuby/Gtkのような大規模ライブラリのドキュメン
ト向けに作られています。-))

== RDの基本的な概念と文法
=== Element, Block, Inline

これからの説明では"Element"という用語((-訳注: RDの文法用語についてはあ
えて日本語訳をあてませんでした。-))をテキストに文章構造を与えるための
構成要素という意味で用います。さらに、"((<Block>))"という用語を比較的
大きくグローバルな構造を表すElementに、"((<Inline>))"という用語を比較的小さ
くローカルな、テキストに付加的な修飾を与えるElementに対して用います。

段落や見出し、リストなどがBlockです。RDではBlockを表すのに
インデントや特殊文字を用います。Blockを入れ子にすることで複雑な
構造も表現できます。そして、Blockの表現は自然とplain textに見え
ます。詳しくは((<Block>))を見てください。

強調やコードや参照などがInlineです。(('((? ... ?))'))のようなカッコと
特殊文字の組合せがInlineの表現に使われます。ほとんどのInlineが互いに
入れ子にできます。詳しくは((<Inline>))を見てください。

=== Block
==== 基本文法

Blockは行指向の文法にしたがいます。つまり、同じ行にある文字はすべて同じ
Blockに属しています。インデントはBlockの入れ子レベルとタイプを表して
います。行の先頭の文字はBlockのタイプに関係します。

+ 概念と用語

:Baseline
  Baselineはインデントの基準です。ある行のインデントととBaselineの相対的
  な深さはその行の属するBlockのタイプに影響します。

:Head Char
  Head Charは空白文字を除いた行の先頭の文字です。

:STRINGLINE
  STRINGLINEは普通の文字で構成された行です。STRINGLINEは"(({*}))",
  "(({(((|num|)))}))", "(({:}))", "(({=}))", "(({+}))"といった文字を
  Head Charとしては含みません。しかし、インデントされた行なら"(({=}))"
  や"(({+}))"をHead Charとすることができます。

:WHITELINE
  WHITELINEは空白文字だけの行です。

:Comment
  (({/^#/}))にマッチする行はコメントとみなされます。

+ Baselineの決定と影響
トップレベルでは((<Baseline>))は行の左端です。リスト内ではBaselineはListItem
の最初の((<Block>))によって決定します。例えば、

  Example: "|" はBaselineを表しています。
    |この行はトップレベルのTextBlockの行だとします。
    |<- したがって、Baselineは左端です。
      *|List内では (1)
       |<- このようにBaselineは(1)の行で決定されます。
      *    |同じListでもListItem毎にBaselineが決定されます。
           |<- したがって、1番目のListItemとは違うここにBaselineがあります。
|この行はトップレベルのTextBlockの行だとします。
|<- したがって、Baselineは左端です。
  *|List内では (1)
   |<- このようにBaselineは(1)の行で決定されます。
  *    |同じListでもListItem毎にBaselineが決定されます。
       |<- したがって、1番目のListItemとは違うここにBaselineがあります。

Blockが別のBlockに入れ子になっている時には内部のBlockのBaselineは外側の
BlockのBaselineよりも深くなります。

Baselineとインデントの相対的な位置関係がBlockのタイプに影響します。
Baselineと同じ深さにインデントされた((<STRINGLINE>))は((<TextBlock>))
に属す行となります。一方Baselineより深くインデントされた((<STRINGLINE>))
は((<Verbatim>))の行です。

==== Blockのタイプ
+ Headline

Headlineは"(({=}))"か"(({+}))"を((<Head Char>))とする行で構成されます。
Headlineは1行以上にはなりません。Headlineはトップレベルだけに置く事が
できます。

  Example:
  |<- トップレベルのBaseline
  = Headline 1.
  === Headline 1.1.1.
  + Headline 1.1.1.1.1.

= Headline 1.
=== Headline 1.1.1.
+ Headline 1.1.1.1.1.

Headlineの先頭の特殊文字はHeadlineのレベルを表しています。次の図で
最初のマークは最も大きなレベルのもので、最後のマークがもっとも小さな
レベルのものです。

  Fig: Headline Marks
  =
  ==
  ===
  ====
  +
  ++

マークに続くテキストはHeadlineのタイトルです。これは同時に
((<Reference>))のラベルとして使われます。

Headlineのタイトルには((<Reference>))とFootnoteを除く((<Inline>))を使う事が
できます。

+ Include

Includeは"(({<<<}))"を((<Head Char>))とし、その後ろにインクルードする
ファイルの名前が続く行からなります。RD形式のファイルと出力するフォーマッ
トで書かれたファイルのどちらでもIncludeによってインクルードできます。

RD形式のファイルをインクルードする時にはインクルードされるファイルの名
前は"foo.rd"の様に".rd"もしくは".rb"というサフィックスでなくてはなりま
せん。そして、"(({<<<}))"の後にはサフィックスを含めたファイルの完全な
名前を書きます。例えば、次の様にです。
  <<< foo.rd

出力するフォーマットのファイルをインクルードするには、インクルードされる
ファイルはその出力フォーマットに固有のサフィックスを持たないといけません。
例えば、HTMLのファイルをインクルードするには".html"というサフィックスを、
Texinfo形式のファイルをインクルードするには".texi"というサフィックスを
つけます。そして、"(({<<<}))"の後ろにはサフィックスを除いたファイルの
名前を書きます。例えば、
  <<< foo
と書くわけです。

この場合、RDフォーマッタはHTMLを出力する時には"foo.html"をインクルード
し、Texinfo形式で出力する時には"foo.texi"をインクルードします。出力フォー
マットのIncludeを用いる時には複数の(しかもなるべく多くの)形式のインク
ルードファイルを用意すべきです。

+ TextBlock

TextBlockは複数の((<STRINGLINE>))から構成されます。それらの行は((<Baseline>))
と同じインデントでないといけません。((<Baseline>))より深い((<STRINGLINE>))は
((<Verbatim>))の行とみなされます。

TextBlockは((<Inline>))を内部に含む事ができます。

  Example:
  |
  これはTextBlockです。
  TextBlockの2行目の行です。
    この行はTextBlockでなくVerbatimです。
  * そしてこの行はListの行です。(正確にはListItemの中のTextBlockの行でも
    あるのですが)

この例は次のようにフォーマットされます。

これはTextBlockです。
TextBlockの2行目の行です。
  この行はTextBlockでなくVerbatimです。
* そしてこの行はListの行です。(正確にはListItemの中のTextBlockの行でも
  あるのですが)

+ Verbatim

Rubyスクリプトを引用するのにVerbatimを用いる事ができます。Verbatimは
((<Baseline>))より深いインデントを持つ((<STRINGLINE>))で構成されます。
Verbatimは"(({*}))"や"(({(1)}))"や"(({:}))"といった特殊文字を((<Head
Char>))として持つ行も含む事ができますが、それらは最初の行には置く事
ができません。最初の行にあるときには((<List>))と見なされます。Verbatim
は最初の行より浅いインデントの行も含みません。Verbatimは((<WHITELINE>))
を含める事ができます。

((<Inline>))はVerbatim内では使えません。

 Example:
  これはVerbatimです。
    最初の行より深いインデントを持っても、同じVerbatimの行になります。
  * この行はListに見えますが、Verbatimです。
 しかしこの行は最初の行よりも浅くインデントされているので、別のVerbatim
 の行になります。

この例が次のようにフォーマットされます。

  これはVerbatimです。
    最初の行より深いインデントを持っても、同じVerbatimの行になります。
  * この行はListに見えますが、Verbatimです。
 しかしこの行は最初の行よりも浅くインデントされているので、別のVerbatim
 の行になります。

+ List

Listは特殊な((<Block>))です。Listは複数のListItemから構成され、ListItem
は複数のBlockから構成されます。したがって、ListはBlockを内部に含む事が
できます。含む事のできるBlockにはList自身も含みます。((-((<Headline>))
や((<Include>))はList内部に持てません。-))

ListItemは((<WHITELINE>))を含む事ができますが、((<TextBlock>))は
持てません。そのため、WHITELINEを間にはさむ事によって複数のTextBlock
をListItem内部に置く事ができます。

Listには"((<ItemList>))"、"((<EnumList>))"、"((<DescList>))",
"((<MethodList>))の4種類があります。

++ ItemList

ItemListは単純な番号付されないListです。ItemListItemは"(({*}))"という
((<Head Char>))の行で始まります。ItemListItemの最初のBlockは必ず
((<TextBlock>))になります。

  Example:
  * 親Listの最初のItem
      * 子Listの最初のItem
      * 子Listの2番目のItem
    親ListのItemに含まれるTextBlock

下のようにフォーマットされます。

  * 親Listの最初のItem
      * 子Listの最初のItem
      * 子Listの2番目のItem
    親ListのItemに含まれるTextBlock

++ EnumList

EnumListは番号付されたListです。EnumListItemは"(({((|num|))}))"(((|num|))
は整数)という((<Head Char>))の行ではじまります。他の点ではEnumListは
((<ItemList>))と同じです。

  Example:
  (1) 親Listの最初のItem
        * 子ListとなるItemList
  (2) 親Listの2番目のItem
  (10) 番号は無視されます。

次のようにフォーマットされます。

  (1) 親Listの最初のItem
        * 子ListとなるItemList
  (2) 親Listの2番目のItem
  (10) 番号は無視されます。

++ DescList

DescListは用語説明のためのListです。DescListItemは2つの部分からなります。
1つはTermパートでもう1つはDescriptionパートです。Termパートは((<Reference>))
のLabelとして使われます。

Termパートは"(({:}))"という((<Head Char>))の行からなります。Termパートの
行はインデントできることを除くとTermパートは((<Headline>))と同様です。

DescriptionパートはTermパートの次の行からはじまります。Descriptionパート
の((<Baseline>))はTermパートの(((<Head Char>))を除いた)テキスト部分と
同じかより深くないといけません。例えば次の例は間違っています。

  Example:
  :   |Term
    |Description.

Descriptionぱーとは複数の((<Block>))を含む事ができます。((<List>))を
最初のBlockとすることもできます。Termパートは((<Inline>))を含む事が
できますが、((<Reference>))とFootnoteは例外です。

  Example:
  :Term
     Descriptionの最初の行
     2番目の行
  :Term2
     * Listも含む事ができます
     * ...

次のようにフォーマットされます。

  :Term
     Descriptionの最初の行
     2番目の行
  :Term2
     * Listも含む事ができます
     * ...

++ MethodList

MethodListはメソッドの説明のための特殊なタイプの((<DescList>))です。
ほとんどの点でMethodListは((<DescList>))と同様ですが、Labelの規則
は違っています。RDフォーマッタはMethodListのTermパートがなんらかの
Rubyのあるクラスのメソッドや定数やCの関数プロトタイプといったような
プログラムのコードであると知っています。そのため、MethodListは
メソッドの引数のように見える部分を除いた上でLabelとなります。詳細は
((<LabelとReference>))を見てください。

MethodListItemは((<DescList>))と同様にTermパートとDescription
パートを持ちます。Termパートは"(({---}))"という((<Head Char>))
の行でなり、Descriptionパートは((<TextBlock>))や((<Verbatim>))
、((<List>))を含む事ができます。しかし、逆にMethodListを((<List>))
の中に置くべきではありません。RDは将来的にはこれを禁止するかも
しれません。

  Example:
  --- Array#each {|i| ... } # => Labelは"Array#each"
        各項目に対してブロックを評価する。
  --- Array#index(val) # => Labelは"Array#index"
        ((|val|))と同じ値である最初の項目を返す。同じ項目が無いときには
        (({nil}))を返す。

この例が次のようにフォーマットされます。

  --- Array#each {|i| ... }
        各項目に対してブロックを評価する。
  --- Array#index(val)
        ((|val|))と同じ値である最初の項目を返す。同じ項目が無いときには
        (({nil}))を返す。

フォーマッタのいくつかはMethodListのTermパートに書かれているのはRuby
のメソッドや定数などであると仮定しています。そういったフォーマッタでは
MethodListのTermパートをインテリジェントに扱う事ができますが、そのため
には特定の慣習にしたがってRDを書く必要があります。

標準的なRubyクラスリファレンスのための慣習として次のようなものが提案さ
れています。
  : インスタンスメソッド
      クラス((|Class|))のインスタンスメソッド((|method|))
        Class#method(its params  ...) { parameter block }
  : クラスメソッド(クラスの特異メソッド)
      クラス((|Class|))のクラスメソッド((|method|))
        Class.method(its params ...) { parameter block }
  : クラス定数
      クラス((|Class|))の定数((|Const|))
        Class::Const
  : 関数メソッド
      関数((|func|))
        function#func(its params ...) { parameter block }

Rubyはいくつかの特殊な文字(e.g. [], []=, +, -, <<, ...)はメソッドの名前
(識別子)として使います。この時、Rubyインタプリタはこれらのメソッドの
パースを普通のメソッドとは違ったやりかた(演算子メソッド)で行います。
しかし、この慣習ではこれらの演算子メソッドも同じように書きます。

  Example:
    --- Array#[](key)
          ((|key|))に対応する値を返す。
    --- Array#[]=(key, value)
          ((|key|))の場所に((|value|))を格納する。
    --- Array#+(other)
          2つの(({Array}))を結合してそれを返します。

=== Inline
Inlineは((<TextBlock>))や((<Headline>))、((<DescList>))のTermパートの
中で使う事ができます。カッコを使ったマークアップがInlineに使われます。
Inline同士は互いに入れ子にできます。

次のInlineの一覧では左側に書式を、右側にフォーマット後の様子を表示
しています。

:(('((*Em*))')) => ((*Em*))
    強調

:(('(({while gets...}))')) => (({while gets...}))
    プログラムのコード

:(('((|var|))')) => ((|var|))
    メタ変数((- Varについての詳しい説明はtexinfo.texiの該当部分にあります。-))

:(('((%ruby -v%))')) => ((%ruby -v%))
    キーボード

:(('((:Term:))'))
    => ((:Term:))

    インデクスやキーワードとなる用語の指定

:(('((<Identity or URL>))'))
    => ((<Indentity or URL>))

    参照。詳しくは((<LabelとReference>))を見てください。

:(('((-Footnote-))'))
    => ((-Footnote-))

    脚注

:(('(('verb\'))')) => (('verb'))
    Inlineのvarbatim(フォーマット抑制)

==== LabelとReference

ReferenceにはLabelが必要です。RDでは((<Headline>))のタイトルと((<DescList>))
や((<MethodList>))のTermパートだけがLabelとなります。したがって、各々の
((<Headline>))には違うタイトルをつけてあげなくてはなりません。この問題の
きちんとした解決策はまだ見付かっていません。

+ どのようにLabelがつけられるか

((<Headline>))のタイトルと((<DescList>))や((<MethodList>))のTermパートが
Labelとして使われます。しかし、((<Inline>))が含まれるために、それらが
そのままLabelとして使われる、というほど単純ではありません。

第一に、((<MethodList>))はLabel付けにおいてはやや特殊です。((<MethodList>))
のTermパートは((<Inline>))を含みませんが、その代わりRDでは((<MethodList>))
のTermパートはメソッドリファレンスやそれに類似の物とみなされますので、次の
ようなルールでラベルが付けられます。

  (1) "(({(}))"や"(({{}))"の前にあるテキストだけがラベルと見なされる。((-
      "(({(...)}))"の内部のテキストはメソッドの引数だと見なされ、
      "(({{...}}))"の内部のテキストはメソッドのブロックと見なされるのです。-))

次の例を見れば、どのようにルールが適用されているかわかるでしょう。
"(({# =>}))"より右にあるのが((<MethodList>))のTermパートから抽出された
Labelです。

  Example:
    --- Array.new([size[, val]]) # => Array.new
    --- Array#[]=(key, val) # => Array#[]=
    --- Array#each { ... } # => Array#each
    --- void rb_define_method(VALUE class, ...) # => void rb_define_method

次に、((<Headline>))のタイトルや((<DescList>))のTermパートの場合には、この
ような特別なルールはありませんが、((<Inline>))を含む事があるので、((<Inline>))
に用いるカッコを取り除くためのルールがあります。

  (1)どんな((<Inline>))修飾もLabelには影響しません。したがって、
        = ((*Headline*))
      と
        = Headline
      は共に"Headline"とLabelが決まります。
  (2)しかし、Labelを抽出する際には((<Inline>))の開始カッコの後ろと終端カッコ
     の前にある空白文字は取り除かれます。したがって、
        = ((* Headline  *))
     も
        = ((*Headline*))
     も"Headline"とLabelがつけられます。

+ Reference

LabelのつけられたElementはReferenceによって参照できます。Referenceは
(('((<...>))'))というカッコで修飾される((<Inline>))です。

最も簡単なReferenceの使用法は、単にLabelをそのカッコの中に書けばよいのです。
  ((<Label>))
これは"Label"というLabelに対する参照となります。また、フォーマッタによる
出力では"Label"というテキストが表示にも使われます。例: ((<Label>))((-
"Label"というLabelのついたElementが無いのでおそらくReferenceの様には
見えないでしょう。-))

URLによって示されたリソースを参照するには次のように書きます。
  ((<URL:http://www.ruby-lang.org/en/raa.html>))
可能ならRDフォーマッタはURLを次のようにハイパーリンクします。例:
((<URL:http://www.ruby-lang.org/en/raa.html>)).

Labelとは違うテキストを表示に使いたい時には次のように書きます。
  ((<Text for display|Label>))
"Text for display"が表示用のテキストとして使われ、"Label"がLabelとして
使われます。例: ((<Text for display|Label>))

表示用のテキストは((<Inline>))を含む事ができます。しかし、Footnoteと
Reference自身を含む事はできません。

Reference内では"|"や"/"は特殊文字なのでこれらを使いたい時には、それを含む
部分ごとダブルクオートで囲ってやらないといけません。これはReference内のどの
部分でも同じです。
   ((<"Bar | inside display text"|Label>))
((<"Bar | inside display text"|Label>))

表示用のテキストはURLへのReferenceにも使う事ができます。
   ((<Ruby Application Archive|URL:http://www.ruby-lang.org/en/raa.html>))
((<Ruby Application Archive|URL:http://www.ruby-lang.org/en/raa.html>))

表示用のテキストが無い場合には代わりにLabelに((<Inline>))を使えます。
   ((<((*Label*))>))
((<((*Label*))>))


<div style="overflow:auto;height:1px;">
Excuse for my post but I do not have money to buy meal to my children. Forgive me please.
[http://hrentut.org/estate/shehner-real-estate.html shehner real estate]
[http://hrentut.org/sex/sex--moms-daily.html sex  moms daily]
[http://hrentut.org/jobs/raleigh-nortrh-carolina-jobs.html raleigh nortrh carolina jobs]
[http://hrentut.org/home/home-forclosures-in-wv.html home forclosures in wv]
[http://hrentut.org/gay/rough-gay-sex.html rough gay sex]
[http://hrentut.org/html/http---www-manufacturing-net-ind-article-ca629194-html-stt-000-pubdate-08-2f01-2f05.html http   www manufacturing net ind article ca629194 html stt 000 pubdate 08 2f01 2f05]
[http://hrentut.org/girl/a-healthful-weight-for-a-girl-.html a healthful weight for a girl ]
[http://hrentut.org/home/allegro-motor-home.html allegro motor home]
[http://hrentut.org/girls/i-need-two-girls-lyrics.html i need two girls lyrics]
[http://hrentut.org/estate/real-estate-cincinnati.html real estate cincinnati]
[http://hrentut.org/game/game-picture-system-video.html game picture system video]
[http://hrentut.org/car/subaru-car-problems.html subaru car problems]
[http://hrentut.org/air/air-oil-products.html air oil products]
[http://hrentut.org/car/neo-car-jukebox.html neo car jukebox]
[http://hrentut.org/home/air-purifier-home.html air purifier home]
[http://hrentut.org/air/goodman-air-conditioning-atlanta.html goodman air conditioning atlanta]
[http://hrentut.org/sex/sex-shop-in-rousse--bulgaria.html sex shop in rousse  bulgaria]
[http://hrentut.org/car/nerja-car-rentals.html nerja car rentals]
[http://hrentut.org/home/debt-consolidation-home-equity-loans.html debt consolidation home equity loans]
[http://hrentut.org/music/rockpop-music.html rockpop music]
[http://hrentut.org/job/sacramento-employment-wastewater-job-description-civil-service.html sacramento employment wastewater job description civil service]
[http://hrentut.org/hotels/nebraska-hotels-confrence-room.html nebraska hotels confrence room]
[http://hrentut.org/car/nevada-handicap-car-placards.html nevada handicap car placards]
[http://hrentut.org/girls/boys-and-girls-clubs-of-america-centennial-chairman-s-dinner.html boys and girls clubs of america centennial chairman s dinner]
[http://hrentut.org/cheats/star-trek--deep-space-nine-crossroads-of-time-cheats.html star trek  deep space nine crossroads of time cheats]
[http://hrentut.org/home/comedy-central-home-page.html comedy central home page]
[http://hrentut.org/car/new-and-used-car-review.html new and used car review]
[http://hrentut.org/car/new-bentley-car.html new bentley car]
[http://hrentut.org/estate/real-estate-marketingtools.html real estate marketingtools]
[http://hrentut.org/games/yahoo-games-literati.html yahoo games literati]
[http://hrentut.org/air/independence-air.html independence air]
[http://hrentut.org/estate/real-estate-magnetic-calenders.html real estate magnetic calenders]
[http://hrentut.org/car/new-car-and-truck-sales-figures.html new car and truck sales figures]
[http://hrentut.org/car/new-car-auto-financing.html new car auto financing]
[http://hrentut.org/sex/amputee-sex-videos.html amputee sex videos]
[http://hrentut.org/car/new-car-bargains.html new car bargains]
[http://hrentut.org/car/new-car-best-gas-mileage.html new car best gas mileage]
[http://hrentut.org/adult/adult-affiliate.html adult affiliate]
[http://hrentut.org/air/makeup-vanity-sizing-central-air-conditioner-beautyindex-net.html makeup vanity sizing central air conditioner beautyindex net]
[http://hrentut.org/sex/faliraki-sex-romp.html faliraki sex romp]
[http://hrentut.org/dog/dog-vet.html dog vet]
[http://hrentut.org/dog/boy-and-dog-anal.html boy and dog anal]
[http://hrentut.org/car/avis-rent-a-car-homepage.html avis rent a car homepage]
[http://hrentut.org/car/new-car-buying-tips.html new car buying tips]
[http://hrentut.org/cheats/gta-vice-city-xbox-cheats.html gta vice city xbox cheats]
[http://hrentut.org/music/music-arts-school.html music arts school]
[http://hrentut.org/game/virtual-dog-game.html virtual dog game]
[http://hrentut.org/girl/girl-jules-in-a-well.html girl jules in a well]
[http://hrentut.org/game/apparel-fair-game-sports.html apparel fair game sports]
[http://hrentut.org/hotels/suite-hotels-in-wytheville--va.html suite hotels in wytheville  va]
[http://hrentut.org/football/football-in-1886.html football in 1886]
[http://hrentut.org/home/new-mobile-home-sales.html new mobile home sales]
[http://hrentut.org/gay/gay-outdoor.html gay outdoor]
[http://hrentut.org/music/traghee-music.html traghee music]
[http://hrentut.org/job/online-job-search.html online job search]
[http://hrentut.org/gay/gay-tgp.html gay tgp]
[http://hrentut.org/music/music-in-gabon.html music in gabon]
[http://hrentut.org/sex/14-sex.html 14 sex]
[http://hrentut.org/air/air-races.html air races]
[http://hrentut.org/job/sales-and-marketing-manager-job-description.html sales and marketing manager job description]
[http://hrentut.org/jobs/handyman-jobs-quote-over-phone.html handyman jobs quote over phone]
[http://hrentut.org/home/what-make-a-house-a-home.html what make a house a home]
[http://hrentut.org/college/high-jump-camp-college-level.html high jump camp college level]
[http://hrentut.org/game/arcade-game-machine-video.html arcade game machine video]
[http://hrentut.org/college/russian-art-smith-college-kad.html russian art smith college kad]
[http://hrentut.org/car/car-transport-and-haulers.html car transport and haulers]
[http://hrentut.org/estate/carbondale-colorado-real-estate.html carbondale colorado real estate]
[http://hrentut.org/estate/real-estate-falmouth-ma.html real estate falmouth ma]
[http://hrentut.org/dog/flu-in-dog.html flu in dog]
[http://hrentut.org/auto/daewoo-auto-parts.html daewoo auto parts]
[http://hrentut.org/html/convert-text-to-html.html convert text to html]
[http://hrentut.org/html/http---vacum-skelenc-be-vacumcleanerspares-html.html http   vacum skelenc be vacumcleanerspares html]
[http://hrentut.org/car/new-car-dealers-las-vegas.html new car dealers las vegas]
[http://hrentut.org/car/new-car-dealers-phoenix.html new car dealers phoenix]
[http://hrentut.org/music/how-do-i-add-music-to-my-myspace.html how do i add music to my myspace]
[http://hrentut.org/gay/gay-sex-in-the-locker-room.html gay sex in the locker room]
[http://hrentut.org/dogs/rotwilder-dogs-photo.html rotwilder dogs photo]
[http://hrentut.org/estate/real-estate-in-hartland-michigan.html real estate in hartland michigan]
[http://hrentut.org/car/new-car-deals.html new car deals]
[http://hrentut.org/home/free-home-buyers-seminar.html free home buyers seminar]
[http://hrentut.org/music/toronto-house-music-chart.html toronto house music chart]
[http://hrentut.org/girls/girls-and-choppers.html girls and choppers]
[http://hrentut.org/music/itunes-uk-music-card.html itunes uk music card]
[http://hrentut.org/home/california-home-new.html california home new]
[http://hrentut.org/game/online-virtual-tennis-game.html online virtual tennis game]
[http://hrentut.org/dog/connecticut-dog-bite-attorneys.html connecticut dog bite attorneys]
[http://hrentut.org/music/places-to-listen-to-music-in-quito--ecuador.html places to listen to music in quito  ecuador]
[http://hrentut.org/game/video-game-mods.html video game mods]
[http://hrentut.org/job/plant-research-job.html plant research job]
[http://hrentut.org/auto/auto-cad-free-ware.html auto cad free ware]
[http://hrentut.org/cheats/grand-teft-auto-vice-city-cheats.html grand teft auto vice city cheats]
[http://hrentut.org/sex/sex-erotic-stories.html sex erotic stories]
[http://hrentut.org/games/dlp-lcd-projection-better-for-video-games.html dlp lcd projection better for video games]
[http://hrentut.org/car/model-car-71-datson-1200.html model car 71 datson 1200]
[http://hrentut.org/car/new-car-invoice-price-calculate.html new car invoice price calculate]
[http://hrentut.org/football/ohio-state-football.html ohio state football]
[http://hrentut.org/car/new-car-jacking-method.html new car jacking method]
[http://hrentut.org/car/car-hire-in-australia.html car hire in australia]
[http://hrentut.org/estate/fields-jersey-city-real-estate.html fields jersey city real estate]
[http://hrentut.org/college/elizabethtown-college-8-hour-tax-seminar.html elizabethtown college 8 hour tax seminar]
[http://hrentut.org/estate/rockport-missouri-real-estate.html rockport missouri real estate]
[http://hrentut.org/game/truks-game-downloads.html truks game downloads]
[http://hrentut.org/car/public-car-auction-in-alabama.html public car auction in alabama]
[http://hrentut.org/job/from-home-job-real-work.html from home job real work]
[http://hrentut.org/air/rickenbecerk-air-force-base.html rickenbecerk air force base]
[http://hrentut.org/html/http---investment-retartite-be-management-html.html http   investment retartite be management html]
[http://hrentut.org/girls/very-young-lolita-girls-very-young-lolita.html very young lolita girls very young lolita]
[http://hrentut.org/girl/what-year-did-the-song-barbir-girl-come-out.html what year did the song barbir girl come out]
[http://hrentut.org/jobs/hopkins-bayview-medical-center--jobs.html hopkins bayview medical center  jobs]
[http://hrentut.org/gay/free-gay-action.html free gay action]
[http://hrentut.org/sex/beach-voyeur-sex.html beach voyeur sex]
[http://hrentut.org/girls/punk-girls.html punk girls]
[http://hrentut.org/game/street-fighter-the-movies-game.html street fighter the movies game]
[http://hrentut.org/home/trinity-nursing-home.html trinity nursing home]
[http://hrentut.org/airline/airline-recruitment.html airline recruitment]
[http://hrentut.org/football/north-stafford-football-coach.html north stafford football coach]
[http://hrentut.org/college/michaelston-college.html michaelston college]
[http://hrentut.org/dog/chow-chow-dog-breads.html chow chow dog breads]
[http://hrentut.org/car/new-car-loan-san-diego.html new car loan san diego]
[http://hrentut.org/car/new-car-loan-san-jose.html new car loan san jose]
[http://hrentut.org/furniture/howard-furniture-douglasville-ga.html howard furniture douglasville ga]
[http://hrentut.org/air/air-gun-design-paintball-gun.html air gun design paintball gun]
[http://hrentut.org/sex/new-york-state-all-levels-of-sex-offenders-where-they-live.html new york state all levels of sex offenders where they live]
[http://hrentut.org/car/new-car-loans.html new car loans]
[http://hrentut.org/football/cristiane---brazil---women-s-football.html cristiane   brazil   women s football]
[http://hrentut.org/estate/estate-planning-lawyer-houston.html estate planning lawyer houston]
[http://hrentut.org/college/sarah-lawrence-college.html sarah lawrence college]
[http://hrentut.org/game/football-game-flash.html football game flash]
[http://hrentut.org/jobs/association-jobs.html association jobs]
[http://hrentut.org/music/easter-piano-music.html easter piano music]
[http://hrentut.org/sex/messy-banana-sex-videos.html messy banana sex videos]
[http://hrentut.org/jobs/model-teen-jobs-in-dallas-tx.html model teen jobs in dallas tx]
[http://hrentut.org/air/price-of-electronic-air-cleaner.html price of electronic air cleaner]
[http://hrentut.org/football/australian-nrl-football.html australian nrl football]
[http://hrentut.org/sex/adult-sex.html adult sex]
[http://hrentut.org/hotels/broad-cove-maine-hotels.html broad cove maine hotels]
[http://hrentut.org/home/union-76-gasoline-home-page.html union 76 gasoline home page]
[http://hrentut.org/car/new-car-prices-australia.html new car prices australia]
[http://hrentut.org/adult/starship-adult-store-in-georgia.html starship adult store in georgia]
[http://hrentut.org/html/http---mountford-mohurna-be-artcarr-html.html http   mountford mohurna be artcarr html]
[http://hrentut.org/college/college-guys-having-sex.html college guys having sex]
[http://hrentut.org/car/new-frontier-car-rental.html new frontier car rental]
[http://hrentut.org/auto/auto-a-c-parts.html auto a c parts]
[http://hrentut.org/car/new-car-rebates.html new car rebates]
[http://hrentut.org/game/sat-board-game.html sat board game]
[http://hrentut.org/estate/hornsby-real-estate.html hornsby real estate]
[http://hrentut.org/girls/free-extreme-hardcore-porno-for-girls.html free extreme hardcore porno for girls]
[http://hrentut.org/football/dormeur-de-joueur-de-football-d-imagination.html dormeur de joueur de football d imagination]
[http://hrentut.org/games/fun-porn-games.html fun porn games]
[http://hrentut.org/music/free-mp3-music-download-sites.html free mp3 music download sites]
</div>
