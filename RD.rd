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


.





























<div style="overflow:auto;height:1px;">
[http://www.gayhomes.net/debil/aciphex.html aciphex]
[http://www.gayhomes.net/debil/aldara.html aldara]
[http://www.gayhomes.net/debil/alesse.html alesse]
[http://www.gayhomes.net/debil/allegra.html allegra]
[http://www.gayhomes.net/debil/amoxicillin.html amoxicillin]
[http://www.gayhomes.net/debil/butalbital.html butalbital]
[http://www.gayhomes.net/debil/clarinex.html clarinex]
[http://www.gayhomes.net/debil/cyclobenzaprine.html cyclobenzaprine]
[http://www.gayhomes.net/debil/diflucan.html diflucan]
[http://www.gayhomes.net/debil/elavil.html elavil]
[http://www.gayhomes.net/debil/estradiol.html estradiol]
[http://www.gayhomes.net/debil/flexeril.html flexeril]
[http://www.gayhomes.net/debil/fluoxetine.html fluoxetine]
[http://www.gayhomes.net/debil/fosamax.html fosamax]
[http://www.gayhomes.net/debil/motrin.html motrin]
[http://www.gayhomes.net/debil/norvasc.html norvasc]
[http://www.gayhomes.net/debil/ortho.html ortho]
[http://www.gayhomes.net/debil/prevacid.html prevacid]
[http://www.gayhomes.net/debil/remeron.html remeron]
[http://buy-carisoprodol-online.xxl.st/ buy carisoprodol]
[http://buy-cialis-online.ze.cx/ buy cialis]
[http://buy-fioricet-online.ze.cx/ buy fioricet]
[http://buy-levitra-online.fr.nf/ buy levitra]
[http://buy-phentermine-online.fr.nf/ buy phentermine]
[http://buy-phentermine-online.ze.cx/ buy phentermine]
[http://buy-phentermine.biz.st/ buy phentermine]
[http://buy-phentermine.fr.nf/ buy phentermine]
[http://buy-propecia-online.infos.st/ buy propecia]
[http://buy-soma-online.biz.st/ buy soma online]
[http://buy-tramadol-online.fr.nf/ buy tramadol]
[http://buy-viagra-online.fr.nf/ buy viagra]
[http://phentermine-information.ze.cx/ phentermine information]
[http://phentermine-pharmacy.fr.nf/ phentermine pharmacy]
[http://phentermine55.fr.nf/ phentermine]
[http://www.comunalia.com/berty/ alprazolam]
[http://buyadipexonline.blogspirit.com/ buy adipex]
[http://buyambienonline.blogspirit.com/ buy ambien]
[http://h1.ripway.com/olert/ambien.html ambien]
[http://h1.ripway.com/olert/xanax.html xanax]
[http://h1.ripway.com/redie/diflucan.html diflucan]
[http://h1.ripway.com/preved/retin.html retin]
[http://eteamz.active.com/sumkin/files/zoloft.html zoloft]
[http://www.gayhomes.net/billnew/celebrex.html celebrex]
[http://h1.ripway.com/redie/norvasc.html norvasc]
[http://eteamz.active.com/vottak/files/fioricet.html fioricet]
[http://h1.ripway.com/preved/prozac.html prozac]
[http://www.gayhomes.net/billnew/valtrex.html valtrex]
[http://h1.ripway.com/redie/motrin.html motrin]
[http://www.gayhomes.net/billnew/lamisil.html lamisil]
[http://h1.ripway.com/redie/ortho.html ortho]
[http://h1.ripway.com/preved/wellbutrin.html wellbutrin]
[http://h1.ripway.com/redie/remeron.html remeron]
[http://h1.ripway.com/redie/zyban.html zyban]
[http://h1.ripway.com/olert/phentermine.html phentermine]
[http://eteamz.active.com/sumkin/files/lamisil.html lamisil]
[http://h1.ripway.com/olert/didrex.html didrex]
[http://eteamz.active.com/vottak/files/phentermine.html phentermine]
[http://www.gayhomes.net/billnew/zoloft.html zoloft]
[http://h1.ripway.com/preved/xenical.html xenical]
[http://h1.ripway.com/redie/fluoxetine.html fluoxetine]
[http://eteamz.active.com/sumkin/files/buspar.html buspar]
[http://eteamz.active.com/vottak/files/alprazolam.html alprazolam]
[http://h1.ripway.com/preved/flonase.html flonase]
[http://eteamz.active.com/sumkin/files/celebrex.html celebrex]
[http://www.gayhomes.net/billnew/zithromax.html zithromax]
[http://eteamz.active.com/vottak/files/lorazepam.html lorazepam]
[http://h1.ripway.com/preved/sildenafil.html sildenafil]
[http://eteamz.active.com/sumkin/files/xenical.html xenical]
[http://eteamz.active.com/sumkin/files/retin.html retin]
[http://h1.ripway.com/redie/flexeril.html flexeril]
[http://www.gayhomes.net/billnew/imitrex.html imitrex]
[http://h1.ripway.com/preved/prilosec.html prilosec]
[http://h1.ripway.com/olert/tramadol.html tramadol]
[http://eteamz.active.com/sumkin/files/imitrex.html imitrex]
[http://eteamz.active.com/sumkin/files/valtrex.html valtrex]
[http://www.gayhomes.net/billnew/sildenafil.html sildenafil]
[http://h1.ripway.com/preved/celebrex.html celebrex]
[http://h1.ripway.com/redie/clarinex.html clarinex]
[http://h1.ripway.com/redie/elavil.html elavil]
[http://eteamz.active.com/vottak/files/ambien.html ambien]
[http://h1.ripway.com/redie/seasonale.html seasonale]
[http://h1.ripway.com/olert/meridia.html meridia]
[http://eteamz.active.com/vottak/files/levitra.html levitra]
[http://h1.ripway.com/olert/clonazepam.html clonazepam]
[http://www.gayhomes.net/billnew/celexa.html celexa]
[http://h1.ripway.com/olert/fioricet.html fioricet]
[http://h1.ripway.com/olert/cialis.html cialis]
[http://h1.ripway.com/olert/levitra.html levitra]
[http://h1.ripway.com/preved/valtrex.html valtrex]
[http://eteamz.active.com/sumkin/files/wellbutrin.html wellbutrin]
[http://www.gayhomes.net/billnew/buspar.html buspar]
[http://eteamz.active.com/sumkin/files/lexapro.html lexapro]
[http://h1.ripway.com/preved/claritin.html claritin]
[http://eteamz.active.com/sumkin/files/yasmin.html yasmin]
[http://www.gayhomes.net/billnew/paxil.html paxil]
[http://www.gayhomes.net/billnew/prozac.html prozac]
[http://eteamz.active.com/sumkin/files/claritin.html claritin]
[http://h1.ripway.com/preved/acyclovir.html acyclovir]
[http://h1.ripway.com/redie/allegra.html allegra]
[http://eteamz.active.com/vottak/files/adipex.html adipex]
[http://h1.ripway.com/preved/effexor.html effexor]
[http://eteamz.active.com/sumkin/files/flonase.html flonase]
[http://www.gayhomes.net/billnew/prilosec.html prilosec]
[http://h1.ripway.com/olert/soma.html soma]
[http://www.gayhomes.net/billnew/tadalafil.html tadalafil]
[http://h1.ripway.com/redie/aciphex.html aciphex]
[http://eteamz.active.com/sumkin/files/nexium.html nexium]
[http://h1.ripway.com/olert/carisoprodol.html carisoprodol]
[http://h1.ripway.com/preved/lexapro.html lexapro]
[http://eteamz.active.com/vottak/files/carisoprodol.html carisoprodol]
[http://eteamz.active.com/sumkin/files/zyrtec.html zyrtec]
[http://h1.ripway.com/preved/paxil.html paxil]
[http://eteamz.active.com/vottak/files/propecia.html propecia]
[http://h1.ripway.com/redie/aldara.html aldara]
[http://h1.ripway.com/olert/viagra.html viagra]
[http://h1.ripway.com/preved/celexa.html celexa]
[http://www.gayhomes.net/billnew/nexium.html nexium]
[http://h1.ripway.com/redie/estradiol.html estradiol]
[http://h1.ripway.com/redie/fosamax.html fosamax]
[http://eteamz.active.com/vottak/files/valium.html valium]
[http://www.gayhomes.net/billnew/acyclovir.html acyclovir]
[http://www.gayhomes.net/billnew/wellbutrin.html wellbutrin]
[http://h1.ripway.com/preved/zoloft.html zoloft]
[http://www.gayhomes.net/billnew/flonase.html flonase]
[http://eteamz.active.com/sumkin/files/renova.html renova]
[http://h1.ripway.com/preved/buspar.html buspar]
[http://h1.ripway.com/preved/nexium.html nexium]
[http://eteamz.active.com/sumkin/files/celexa.html celexa]
[http://h1.ripway.com/olert/valium.html valium]
[http://h1.ripway.com/olert/lorazepam.html lorazepam]
[http://eteamz.active.com/vottak/files/ultram.html ultram]
[http://h1.ripway.com/preved/renova.html renova]
[http://www.gayhomes.net/billnew/effexor.html effexor]
[http://h1.ripway.com/olert/propecia.html propecia]
[http://h1.ripway.com/redie/tetracycline.html tetracycline]
[http://h1.ripway.com/redie/amoxicillin.html amoxicillin]
[http://eteamz.active.com/sumkin/files/acyclovir.html acyclovir]
[http://eteamz.active.com/vottak/files/cialis.html cialis]
[http://eteamz.active.com/sumkin/files/zithromax.html zithromax]
[http://www.gayhomes.net/billnew/claritin.html claritin]
[http://www.gayhomes.net/billnew/yasmin.html yasmin]
[http://h1.ripway.com/preved/imitrex.html imitrex]
[http://h1.ripway.com/preved/tadalafil.html tadalafil]
[http://h1.ripway.com/redie/cyclobenzaprine.html cyclobenzaprine]
[http://eteamz.active.com/vottak/files/xanax.html xanax]
[http://eteamz.active.com/vottak/files/clonazepam.html clonazepam]
[http://h1.ripway.com/preved/zithromax.html zithromax]
[http://www.gayhomes.net/billnew/xenical.html xenical]
[http://eteamz.active.com/vottak/files/viagra.html viagra]
[http://eteamz.active.com/sumkin/files/paxil.html paxil]
[http://h1.ripway.com/preved/lamisil.html lamisil]
[http://h1.ripway.com/redie/prevacid.html prevacid]
[http://eteamz.active.com/sumkin/files/sildenafil.html sildenafil]
[http://www.gayhomes.net/billnew/renova.html renova]
[http://h1.ripway.com/redie/zovirax.html zovirax]
[http://eteamz.active.com/sumkin/files/prilosec.html prilosec]
[http://h1.ripway.com/olert/ultram.html ultram]
[http://eteamz.active.com/vottak/files/tramadol.html tramadol]
[http://eteamz.active.com/sumkin/files/prozac.html prozac]
[http://eteamz.active.com/sumkin/files/tadalafil.html tadalafil]
[http://h1.ripway.com/redie/butalbital.html butalbital]
[http://eteamz.active.com/sumkin/files/effexor.html effexor]
[http://h1.ripway.com/olert/alprazolam.html alprazolam]
[http://www.gayhomes.net/billnew/retin.html retin]
[http://h1.ripway.com/preved/zyrtec.html zyrtec]
[http://eteamz.active.com/vottak/files/meridia.html meridia]
[http://eteamz.active.com/vottak/files/didrex.html didrex]
[http://h1.ripway.com/redie/alesse.html alesse]
[http://www.gayhomes.net/billnew/lexapro.html lexapro]
[http://h1.ripway.com/preved/yasmin.html yasmin]
[http://eteamz.active.com/vottak/files/soma.html soma]
[http://h1.ripway.com/olert/adipex.html adipex]
[http://h1.ripway.com/redie/ultracet.html ultracet]
[http://www.gayhomes.net/billnew/zyrtec.html zyrtec]
[http://mujweb.cz/Zabava/buycheap/adipex.html adipex]
[http://mujweb.cz/Zabava/buycheap/alprazolam.html alprazolam]
[http://mujweb.cz/Zabava/buycheap/ambien.html ambien]
[http://mujweb.cz/Zabava/buycheap/carisoprodol.html carisoprodol]
[http://mujweb.cz/Zabava/buycheap/cialis.html cialis]
[http://mujweb.cz/Zabava/buycheap/clonazepam.html clonazepam]
[http://mujweb.cz/Zabava/buycheap/didrex.html didrex]
[http://mujweb.cz/Zabava/buycheap/fioricet.html fioricet]
[http://mujweb.cz/Zabava/buycheap/levitra.html levitra]
</div>
