# -*- rd -*-

= Reference.ja

$Id: Reference.ja 521 2004-11-28 07:36:24Z kou $

RSS Maker�Υ�ե���󥹤Ǥ���

RSS Parser��API��RSS�����Ǥ��ΤäƤ���лȤ���Ϥ��ʤΤǾ�ά
���ޤ��������ʤ�����

== ���

Ruby������Ū��(({Class#instance_method}))��
(({Class.class_method}))�Ȥ���ɽ����Ȥ��ޤ��󡥼ºݤ˥�����
�˽񤯤Ȥ���Ʊ��ɽ����Ȥ��ޤ����Ĥޤꡤ(({obj}))�Υ��󥹥�
�󥹥᥽�å�(({meth}))�򼨤�����˰ʲ��Τ褦�˽񤭤ޤ���

  obj.meth

�ޤ����ʲ���ɽ���(({maker}))��(({RSS::Maker.make}))���Ϥ���
�֥�å��ؤΰ���̾�Ȥ��ޤ����Ĥޤꡤ�ʲ��Τ褦�ˤ�������
(({maker}))�Ȥ������ȤǤ���

  RSS::Maker.make(...) do |maker|
    ...
  end

--- RSS::Maker.make(version, &block)
     ((|version|))�ˤ�(({"1.0"}))�ޤ���(({"0.9"}))�ޤ���
     (({"0.91"}))�ޤ���(({"2.0"}))����ꤷ�ޤ���(({"0.9"}))
     ��(({"0.91"}))��Ʊ���Ǥ��뤳�Ȥ���դ��Ƥ���������
     
     ((|block|))��¹Ԥ������Ȥ�(({maker}))���֥������Ȥ���
     RSS���֥������Ȥ����������֤��ޤ���

== maker

RSS�Υ롼�����Ǥ��������륪�֥������ȤǤ���

(({maker.channel}))��Ŭ�ڤ����ꤷ�ʤ����RSS����������ޤ���

--- maker.version
     ��������XML�ΥС��������֤��ޤ���

--- maker.version=(value)
     ��������XML�ΥС����������ꤷ�ޤ���

--- maker.encoding
     ��������XML�Υ��󥳡��ǥ��󥰤��֤��ޤ����ǥե���Ȥ�
     UTF-8�Ǥ���

--- maker.encoding=(value)
     ��������XML�Υ��󥳡��ǥ��󥰤����ꤷ�ޤ���(({maker}))
     �����ꤹ��ݤΥ��󥳡��ǥ��󥰤Ϥ����ǻ��ꤷ����Τˤ�
     ��ɬ�פ�����ޤ���

--- maker.standalone
     ��������XML��standalone���֤��ޤ���

--- maker.standalone=(value)
     ��������XML��standalone�����ꤷ�ޤ���

--- maker.rss_version
     ��������RSS�ΥС��������֤��ޤ���

--- maker.xml_stylesheets
     (({xml_stylesheet}))��������륪�֥������Ȥ��֤��ޤ���
     
--- maker.channel
     channel���Ǥ��������륪�֥������Ȥ��֤��ޤ���
     
--- maker.image
     image���Ǥ��������륪�֥������Ȥ��֤��ޤ���
     
--- maker.items
     item���Ǥ��������륪�֥������Ȥ�������륪�֥������Ȥ�
     �֤��ޤ���
     
--- maker.textinput
     textinput���Ǥ��������륪�֥������Ȥ��֤��ޤ���
     
=== maker.xml_stylsheets

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.xml_stylesheets.new_xml_stylesheet
     ������(({xml_stylesheet}))����������֤��ޤ����������줿
     (({xml_stylesheet}))��(({xml_stylesheet}))�ꥹ�ȤκǸ�
     ���ɲä���Ƥ��ޤ���

==== xml_stylesheet

(({xml_stylesheet}))��
(({maker.xml_stylesheet.new_xml_stylesheet}))�Ǻ������줿��
�֥������ȤȤ��ޤ���

(({href}))��(({type}))��ɬ�����ꤹ��ɬ�פ�����ޤ�����������
(({href}))�����ꤷ���ͤγ�ĥ�Ҥ�.xsl�ޤ���.css�ξ���
(({type}))����ꤹ��ɬ�פϤ���ޤ��󡥼�ư�ǿ�¬���ޤ���

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

channel���Ǥ��ͤ����ꤷ�ޤ���

RSS 1.0�������������(({about}))��(({title}))��(({link}))��
(({description}))�����ꤷ�ʤ���Ф����ޤ���

RSS 0.91�������������(({title}))��(({link}))��
(({description}))��(({language}))�����ꤷ�ʤ���Ф����ޤ���

RSS 2.0�������������(({title}))��(({link}))��
(({description}))�����ꤷ�ʤ���Ф����ޤ���

(({maker.channel}))�ˤʤ�餫���ͤ����ꤷ�Ƥ����ʤ��顤�嵭
��(({maker.channel}))���׵᤹���ͤ����ꤷ�Ƥ��ʤ�����
(({RSS::NotSetError}))�㳰��ȯ�����ޤ����ɤ��ͤ����ꤷ�Ƥ���
�������㳰��ȯ�����ޤ���

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
     (({maker.channel.date}))����̾�Ǥ���

--- maker.channel.pubDate=(value)
     (({maker.channel.date=}))����̾�Ǥ���

--- maker.channel.lastBuildDate
--- maker.channel.lastBuildDate=(value)

--- maker.channel.generator
--- maker.channel.generator=(value)

--- maker.channel.ttl
--- maker.channel.ttl=(value)

--- maker.channel.categories
     (({categories}))���֤��ޤ���

--- maker.channel.cloud
     (({cloud}))���֤��ޤ���

--- maker.channel.skipDays
     (({skipDays}))���֤��ޤ���

--- maker.channel.skipHours
     (({skipHours}))���֤��ޤ���

==== maker.channel.categories

RSS 2.0����������Ȥ��������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.channel.categories.new_category
     ������(({category}))����������֤��ޤ����������줿
     (({category}))��(({category}))�ꥹ�ȤκǸ�
     ���ɲä���Ƥ��ޤ���

+ category

(({category}))��
(({maker.channel.categories.new_category}))�Ǻ������줿��
�֥������ȤȤ��ޤ���

(({content}))����ꤹ��ɬ�פ�����ޤ���

--- category.domain
--- category.domain=(value)

--- category.content
--- category.content=(value)

==== maker.channel.cloud

RSS 2.0����������Ȥ��������Ѥ���ޤ���

���Ƥ�°�������ꤹ��ɬ�פ�����ޤ���

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

RSS 0.91/2.0����������Ȥ��������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.channel.skipDays.new_day
     ������(({day}))����������֤��ޤ����������줿
     (({day}))��(({day}))�ꥹ�ȤκǸ�
     ���ɲä���Ƥ��ޤ���

+ day

(({day}))��
(({maker.channel.skipDays.new_day}))�Ǻ������줿��
�֥������ȤȤ��ޤ���

(({content}))����ꤹ��ɬ�פ�����ޤ���

--- day.content
--- day.content=(value)

==== maker.channel.skipHours

RSS 0.91/2.0����������Ȥ��������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.channel.skipHours.new_hour
     ������(({hour}))����������֤��ޤ����������줿
     (({hour}))��(({hour}))�ꥹ�ȤκǸ�
     ���ɲä���Ƥ��ޤ���

+ hour

(({hour}))��
(({maker.channel.skipHours.new_hour}))�Ǻ������줿��
�֥������ȤȤ��ޤ���

(({content}))����ꤹ��ɬ�פ�����ޤ���

--- hour.content
--- hour.content=(value)

=== maker.image

RSS 1.0�ξ���(({url}))��(({title}))��
(({maker.channel.link}))��(({maker.channel}))��Ŭ�ڤ����ꤵ
��Ƥ���ɬ�פ�����ޤ���

RSS 0.91/2.0�ξ���(({url}))��(({title}))��
(({maker.channel.link}))��Ŭ�ڤ����ꤵ��Ƥ���ɬ�פ�����ޤ���

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

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.items.new_item
     ������(({item}))����������֤��ޤ����������줿
     (({item}))��(({item}))�ꥹ�ȤκǸ���ɲä���Ƥ��ޤ���

--- maker.items.do_sort
     ���ߤ�(({do_sort}))���ͤ�������ޤ����ǥե���ȤǤ�
     (({false}))�ˤʤäƤ��ޤ���

--- maker.items.do_sort=(boolean_or_proc)
     (({true}))�����ꤹ���(({item.date}))������������¤���
     ���ޤ���(({Proc}))���֥������Ȥ���ꤹ�뤳�Ȥˤ���¤�
     �ؤ���ˡ�򥫥����ޥ������뤳�Ȥ��Ǥ��ޤ���

--- maker.items.max_size
     ���ߤ�(({max_size}))���ͤ�������ޤ����ǥե���ȤǤ�
     (({-1}))�ˤʤäƤ��ޤ���

--- maker.items.max_size=(integer)
     ���Ϥ���(({item}))�ο��κ����ͤ����ꤷ�ޤ���


==== item

(({item}))��(({maker.items.new_item}))�Ǻ������줿���֥�����
�ȤȤ��ޤ���

RSS 1.0/0.91�ξ���(({title}))��(({link}))�����ꤹ��ɬ�פ���
��ޤ���

RSS 2.0�ξ���(({title}))�ޤ���(({description}))�����ꤹ��
ɬ�פ�����ޤ���


--- item.title
--- item.title=(value)

--- item.link
--- item.link=(value)

--- item.description
--- item.description=(value)

--- item.date
--- item.date=(value)

--- item.pubDate
     (({item.date}))����̾�Ǥ���

--- item.pubDate=(value)
     (({item.date=}))����̾�Ǥ���

--- item.author
--- item.author=(value)

--- item.comments
--- item.comments=(value)

--- item.guid
--- item.enclosure
--- item.source
--- item.categories

+ item.guid

RSS 2.0����������Ȥ��������Ѥ���ޤ���

(({content}))�����ꤹ��ɬ�פ�����ޤ���

--- item.guid.isPermaLink
--- item.guid.isPermaLink=(value)

--- item.guid.content
--- item.guid.content=(value)

+ item.enclosure

RSS 2.0����������Ȥ��������Ѥ���ޤ���

(({url}))��(({length}))��(({type}))�����ꤹ��ɬ�פ�����ޤ���

--- item.enclosure.url
--- item.enclosure.url=(value)

--- item.enclosure.length
--- item.enclosure.length=(value)

--- item.enclosure.type
--- item.enclosure.type=(value)

+ item.source

RSS 2.0����������Ȥ��������Ѥ���ޤ���

(({url}))��(({content}))�����ꤹ��ɬ�פ�����ޤ���

--- item.source.url
--- item.source.url=(value)

--- item.source.content
--- item.source.content=(value)

+ item.categories

RSS 2.0����������Ȥ��������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- item.categories.new_category
     ������(({category}))����������֤��ޤ����������줿
     (({category}))��(({category}))�ꥹ�ȤκǸ�
     ���ɲä���Ƥ��ޤ���
     
     (({item.categories.new_category}))����������
     (({category}))��
     (({maker.channel.categories.new_category}))����������
     (({category}))��Ʊ��API������ޤ���

=== maker.textinput

RSS 1.0�ξ���(({title}))��(({description}))��(({name}))��
(({link}))��(({maker.channel}))��Ŭ�ڤ����ꤹ��ɬ�פ������
����

RSS 0.91/2.0�ξ���(({title}))��(({description}))��
(({name}))��(({link}))�����ꤹ��ɬ�פ�����ޤ���

--- maker.textinput.title
--- maker.textinput.title=(value)

--- maker.textinput.description
--- maker.textinput.description=(value)

--- maker.textinput.name
--- maker.textinput.name=(value)

--- maker.textinput.link
--- maker.textinput.link=(value)

== �⥸�塼��

�ʲ��Υ⥸�塼�뤬�Ȥ߹��ޤ�Ƥ��ޤ���

  * Content
  * Dublin Core
  * Syndication
  * TrackBack

=== Content

�ʲ��Υ᥽�åɤ�(({item}))���ɲä��ޤ���

--- content_encoded
--- content_encoded=(value)

=== Dublin Core

�ʲ��Υ᥽�åɤ�(({maker.channel}))��(({maker.image}))��
(({item}))��(({maker.textinput}))���ɲä��ޤ���

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
     (({maker.channel}))��(({item}))�Ǥ�(({date}))����̾�Ǥ���

--- dc_date=(value)
     (({maker.channel}))��(({item}))�Ǥ�(({date=}))����̾�Ǥ���

=== Syndication

�ʲ��Υ᥽�åɤ�(({maker.channel}))���ɲä��ޤ���

--- sy_updatePeriod
--- sy_updatePeriod=(value)

--- sy_updateFrequency
--- sy_updateFrequency=(value)

--- sy_updateBase
--- sy_updateBase=(value)

=== TrackBack

�ʲ��Υ᥽�åɤ�(({item}))���ɲä��ޤ���

--- trackback_ping
--- trackback_ping=(value)

--- trackback_abouts

=== trackback_abouts

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- trackback_abouts.new_about
     ������(({about}))����������֤��ޤ����������줿
     (({about}))��(({about}))�ꥹ�ȤκǸ���ɲä���Ƥ��ޤ���

==== about

(({about}))��(({trackback_abouts.new_about}))�Ǻ������줿���֥�����
�ȤȤ��ޤ���

--- value
--- value=(new_value)

--- resource
    (({value}))����̾�Ǥ���
--- resource=(new_value)
    (({value=}))����̾�Ǥ���

--- content
    (({value}))����̾�Ǥ���
--- content=(new_value)
    (({value=}))����̾�Ǥ���
