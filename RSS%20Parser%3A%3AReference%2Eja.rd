# -*- rd -*-

= Reference.ja

$Id: Reference.ja 521 2004-11-28 07:36:24Z kou $

RSS Makerのリファレンスです．

RSS ParserのAPIはRSSの要素を知っていれば使えるはずなので省略
します．ごめんなさい．

== 注意

Rubyの伝統的な(({Class#instance_method}))や
(({Class.class_method}))という表記を使いません．実際にコード
に書くときと同じ表記を使います．つまり，(({obj}))のインスタ
ンスメソッド(({meth}))を示すために以下のように書きます．

  obj.meth

また，以下に表れる(({maker}))は(({RSS::Maker.make}))に渡した
ブロックへの引数名とします．つまり，以下のようにした時の
(({maker}))ということです．

  RSS::Maker.make(...) do |maker|
    ...
  end

--- RSS::Maker.make(version, &block)
     ((|version|))には(({"1.0"}))または(({"0.9"}))または
     (({"0.91"}))または(({"2.0"}))を指定します．(({"0.9"}))
     と(({"0.91"}))は同じであることに注意してください．
     
     ((|block|))を実行したあとの(({maker}))オブジェクトから
     RSSオブジェクトを生成して返します．

== maker

RSSのルート要素を生成するオブジェクトです．

(({maker.channel}))を適切に設定しなければRSSは生成されません．

--- maker.version
     作成するXMLのバージョンを返します．

--- maker.version=(value)
     作成するXMLのバージョンを設定します．

--- maker.encoding
     作成するXMLのエンコーディングを返します．デフォルトは
     UTF-8です．

--- maker.encoding=(value)
     作成するXMLのエンコーディングを設定します．(({maker}))
     に設定する際のエンコーディングはここで指定したものにす
     る必要があります．

--- maker.standalone
     作成するXMLのstandaloneを返します．

--- maker.standalone=(value)
     作成するXMLのstandaloneを設定します．

--- maker.rss_version
     作成するRSSのバージョンを返します．

--- maker.xml_stylesheets
     (({xml_stylesheet}))を管理するオブジェクトを返します．
     
--- maker.channel
     channel要素を生成するオブジェクトを返します．
     
--- maker.image
     image要素を生成するオブジェクトを返します．
     
--- maker.items
     item要素を生成するオブジェクトを管理するオブジェクトを
     返します．
     
--- maker.textinput
     textinput要素を生成するオブジェクトを返します．
     
=== maker.xml_stylsheets

(({#<<}))，(({#[]}))，(({#[]=}))，(({#first}))，(({#last}))，
(({#push}))，(({#pop}))，(({#shift}))，(({#unshift}))，
(({#each}))など配列と同じメソッドも持ちます．

--- maker.xml_stylesheets.new_xml_stylesheet
     新しく(({xml_stylesheet}))を作成し，返します．作成された
     (({xml_stylesheet}))は(({xml_stylesheet}))リストの最後
     に追加されています．

==== xml_stylesheet

(({xml_stylesheet}))は
(({maker.xml_stylesheet.new_xml_stylesheet}))で作成されたオ
ブジェクトとします．

(({href}))と(({type}))は必ず指定する必要があります．ただし，
(({href}))に設定した値の拡張子が.xslまたは.cssの場合は
(({type}))を指定する必要はありません．自動で推測します．

--- xml_stylesheet.href
--- xml_stylesheet.href=(value)

--- xml_stylesheet.type
--- xml_stylesheet.type=(value)

--- xml_stylesheet.title
--- xml_stylesheet.title=(value)

--- xml_stylesheet.media
--- xml_stylesheet.media=(value)

--- xml_stylesheet.charset
--- xml_stylesheet.charset=(value)

--- xml_stylesheet.alternate
--- xml_stylesheet.alternate=(value)

=== maker.channel

channel要素の値を設定します．

RSS 1.0を生成する場合は(({about}))，(({title}))，(({link}))，
(({description}))を設定しなければいけません．

RSS 0.91を生成する場合は(({title}))，(({link}))，
(({description}))，(({language}))を設定しなければいけません．

RSS 2.0を生成する場合は(({title}))，(({link}))，
(({description}))を設定しなければいけません．

(({maker.channel}))になんらかの値を設定しておきながら，上記
の(({maker.channel}))が要求する値を設定していない場合は
(({RSS::NotSetError}))例外が発生します．どの値も設定していな
い場合は例外は発生しません．

--- maker.channel.about
--- maker.channel.about=(value)

--- maker.channel.title
--- maker.channel.title=(value)

--- maker.channel.link
--- maker.channel.link=(value)

--- maker.channel.description
--- maker.channel.description=(value)

--- maker.channel.language
--- maker.channel.language=(value)

--- maker.channel.copyright
--- maker.channel.copyright=(value)

--- maker.channel.managingEditor
--- maker.channel.managingEditor=(value)

--- maker.channel.webMaster
--- maker.channel.webMaster=(value)

--- maker.channel.rating
--- maker.channel.rating=(value)

--- maker.channel.docs
--- maker.channel.docs=(value)

--- maker.channel.date
--- maker.channel.date=(value)

--- maker.channel.pubDate
     (({maker.channel.date}))の別名です．

--- maker.channel.pubDate=(value)
     (({maker.channel.date=}))の別名です．

--- maker.channel.lastBuildDate
--- maker.channel.lastBuildDate=(value)

--- maker.channel.generator
--- maker.channel.generator=(value)

--- maker.channel.ttl
--- maker.channel.ttl=(value)

--- maker.channel.categories
     (({categories}))を返します．

--- maker.channel.cloud
     (({cloud}))を返します．

--- maker.channel.skipDays
     (({skipDays}))を返します．

--- maker.channel.skipHours
     (({skipHours}))を返します．

==== maker.channel.categories

RSS 2.0を生成するときだけ利用されます．

(({#<<}))，(({#[]}))，(({#[]=}))，(({#first}))，(({#last}))，
(({#push}))，(({#pop}))，(({#shift}))，(({#unshift}))，
(({#each}))など配列と同じメソッドも持ちます．

--- maker.channel.categories.new_category
     新しく(({category}))を作成し，返します．作成された
     (({category}))は(({category}))リストの最後
     に追加されています．

+ category

(({category}))は
(({maker.channel.categories.new_category}))で作成されたオ
ブジェクトとします．

(({content}))を指定する必要があります．

--- category.domain
--- category.domain=(value)

--- category.content
--- category.content=(value)

==== maker.channel.cloud

RSS 2.0を生成するときだけ利用されます．

全ての属性を設定する必要があります．

--- maker.channel.cloud.domain
--- maker.channel.cloud.domain=(value)

--- maker.channel.cloud.port
--- maker.channel.cloud.port=(value)

--- maker.channel.cloud.path
--- maker.channel.cloud.path=(value)

--- maker.channel.cloud.registerProcedure
--- maker.channel.cloud.registerProcedure=(value)

--- maker.channel.cloud.protocol
--- maker.channel.cloud.protocol=(value)

==== maker.channel.skipDays

RSS 0.91/2.0を生成するときだけ利用されます．

(({#<<}))，(({#[]}))，(({#[]=}))，(({#first}))，(({#last}))，
(({#push}))，(({#pop}))，(({#shift}))，(({#unshift}))，
(({#each}))など配列と同じメソッドも持ちます．

--- maker.channel.skipDays.new_day
     新しく(({day}))を作成し，返します．作成された
     (({day}))は(({day}))リストの最後
     に追加されています．

+ day

(({day}))は
(({maker.channel.skipDays.new_day}))で作成されたオ
ブジェクトとします．

(({content}))を指定する必要があります．

--- day.content
--- day.content=(value)

==== maker.channel.skipHours

RSS 0.91/2.0を生成するときだけ利用されます．

(({#<<}))，(({#[]}))，(({#[]=}))，(({#first}))，(({#last}))，
(({#push}))，(({#pop}))，(({#shift}))，(({#unshift}))，
(({#each}))など配列と同じメソッドも持ちます．

--- maker.channel.skipHours.new_hour
     新しく(({hour}))を作成し，返します．作成された
     (({hour}))は(({hour}))リストの最後
     に追加されています．

+ hour

(({hour}))は
(({maker.channel.skipHours.new_hour}))で作成されたオ
ブジェクトとします．

(({content}))を指定する必要があります．

--- hour.content
--- hour.content=(value)

=== maker.image

RSS 1.0の場合は(({url}))，(({title}))，
(({maker.channel.link}))，(({maker.channel}))が適切に設定さ
れている必要があります．

RSS 0.91/2.0の場合は(({url}))，(({title}))，
(({maker.channel.link}))が適切に設定されている必要があります．

--- maker.image.title
--- maker.image.title=(value)

--- maker.image.url
--- maker.image.url=(value)

--- maker.image.width
--- maker.image.width=(value)

--- maker.image.height
--- maker.image.height=(value)

--- maker.image.description
--- maker.image.description=(value)

=== maker.items

(({#<<}))，(({#[]}))，(({#[]=}))，(({#first}))，(({#last}))，
(({#push}))，(({#pop}))，(({#shift}))，(({#unshift}))，
(({#each}))など配列と同じメソッドも持ちます．

--- maker.items.new_item
     新しく(({item}))を作成し，返します．作成された
     (({item}))は(({item}))リストの最後に追加されています．

--- maker.items.do_sort
     現在の(({do_sort}))の値を取得します．デフォルトでは
     (({false}))になっています．

--- maker.items.do_sort=(boolean_or_proc)
     (({true}))に設定すると(({item.date}))が新しい順に並び替
     えます．(({Proc}))オブジェクトを指定することにより並び
     替え方法をカスタマイズすることができます．

--- maker.items.max_size
     現在の(({max_size}))の値を取得します．デフォルトでは
     (({-1}))になっています．

--- maker.items.max_size=(integer)
     出力する(({item}))の数の最大値を設定します．


==== item

(({item}))は(({maker.items.new_item}))で作成されたオブジェク
トとします．

RSS 1.0/0.91の場合は(({title}))，(({link}))を設定する必要があ
ります．

RSS 2.0の場合は(({title}))または(({description}))を設定する
必要があります．


--- item.title
--- item.title=(value)

--- item.link
--- item.link=(value)

--- item.description
--- item.description=(value)

--- item.date
--- item.date=(value)

--- item.pubDate
     (({item.date}))の別名です．

--- item.pubDate=(value)
     (({item.date=}))の別名です．

--- item.author
--- item.author=(value)

--- item.comments
--- item.comments=(value)

--- item.guid
--- item.enclosure
--- item.source
--- item.categories

+ item.guid

RSS 2.0を生成するときだけ利用されます．

(({content}))を設定する必要があります．

--- item.guid.isPermaLink
--- item.guid.isPermaLink=(value)

--- item.guid.content
--- item.guid.content=(value)

+ item.enclosure

RSS 2.0を生成するときだけ利用されます．

(({url}))，(({length}))，(({type}))を設定する必要があります．

--- item.enclosure.url
--- item.enclosure.url=(value)

--- item.enclosure.length
--- item.enclosure.length=(value)

--- item.enclosure.type
--- item.enclosure.type=(value)

+ item.source

RSS 2.0を生成するときだけ利用されます．

(({url}))，(({content}))を設定する必要があります．

--- item.source.url
--- item.source.url=(value)

--- item.source.content
--- item.source.content=(value)

+ item.categories

RSS 2.0を生成するときだけ利用されます．

(({#<<}))，(({#[]}))，(({#[]=}))，(({#first}))，(({#last}))，
(({#push}))，(({#pop}))，(({#shift}))，(({#unshift}))，
(({#each}))など配列と同じメソッドも持ちます．

--- item.categories.new_category
     新しく(({category}))を作成し，返します．作成された
     (({category}))は(({category}))リストの最後
     に追加されています．
     
     (({item.categories.new_category}))が作成する
     (({category}))は
     (({maker.channel.categories.new_category}))が作成する
     (({category}))と同じAPIを持ちます．

=== maker.textinput

RSS 1.0の場合は(({title}))，(({description}))，(({name}))，
(({link}))，(({maker.channel}))を適切に設定する必要がありま
す．

RSS 0.91/2.0の場合は(({title}))，(({description}))，
(({name}))，(({link}))を設定する必要があります．

--- maker.textinput.title
--- maker.textinput.title=(value)

--- maker.textinput.description
--- maker.textinput.description=(value)

--- maker.textinput.name
--- maker.textinput.name=(value)

--- maker.textinput.link
--- maker.textinput.link=(value)

== モジュール

以下のモジュールが組み込まれています．

  * Content
  * Dublin Core
  * Syndication
  * TrackBack

=== Content

以下のメソッドを(({item}))に追加します．

--- content_encoded
--- content_encoded=(value)

=== Dublin Core

以下のメソッドを(({maker.channel}))，(({maker.image}))，
(({item}))，(({maker.textinput}))に追加します．

--- dc_title
--- dc_title=(value)

--- dc_description
--- dc_description=(value)

--- dc_creator
--- dc_creator=(value)

--- dc_subject
--- dc_subject=(value)

--- dc_publisher
--- dc_publisher=(value)

--- dc_contributor
--- dc_contributor=(value)

--- dc_type
--- dc_type=(value)

--- dc_format
--- dc_format=(value)

--- dc_identifier
--- dc_identifier=(value)

--- dc_source
--- dc_source=(value)

--- dc_language
--- dc_language=(value)

--- dc_relation
--- dc_relation=(value)

--- dc_coverage
--- dc_coverage=(value)

--- dc_rights
--- dc_rights=(value)

--- dc_date
     (({maker.channel}))と(({item}))では(({date}))の別名です．

--- dc_date=(value)
     (({maker.channel}))と(({item}))では(({date=}))の別名です．

=== Syndication

以下のメソッドを(({maker.channel}))に追加します．

--- sy_updatePeriod
--- sy_updatePeriod=(value)

--- sy_updateFrequency
--- sy_updateFrequency=(value)

--- sy_updateBase
--- sy_updateBase=(value)

=== TrackBack

以下のメソッドを(({item}))に追加します．

--- trackback_ping
--- trackback_ping=(value)

--- trackback_abouts

=== trackback_abouts

(({#<<}))，(({#[]}))，(({#[]=}))，(({#first}))，(({#last}))，
(({#push}))，(({#pop}))，(({#shift}))，(({#unshift}))，
(({#each}))など配列と同じメソッドも持ちます．

--- trackback_abouts.new_about
     新しく(({about}))を作成し，返します．作成された
     (({about}))は(({about}))リストの最後に追加されています．

==== about

(({about}))は(({trackback_abouts.new_about}))で作成されたオブジェク
トとします．

--- value
--- value=(new_value)

--- resource
    (({value}))の別名です．
--- resource=(new_value)
    (({value=}))の別名です．

--- content
    (({value}))の別名です．
--- content=(new_value)
    (({value=}))の別名です．
