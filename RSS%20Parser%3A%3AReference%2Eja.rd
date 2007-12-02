# -*- rd -*-

= Reference.ja

$Id: Reference.ja 341 2007-12-02 06:07:26Z kou $

RSS Maker�Υ�ե���󥹤Ǥ���

RSS Parser��API��RSS/Atom�����Ǥ��ΤäƤ���лȤ���Ϥ��ʤΤ�
��ά���ޤ��������ʤ�����

== ���

Ruby������Ū��(({Class#instance_method}))��
(({Class.class_method}))�Ȥ���ɽ����Ȥ��ޤ��󡥼ºݤ˥�����
�˽񤯤Ȥ���Ʊ��ɽ����Ȥ��ޤ����Ĥޤꡤ(({obj}))�Υ��󥹥�
�󥹥᥽�å�(({meth}))�򼨤�����˰ʲ��Τ褦�˽񤭤ޤ���

  obj.meth

�ʲ��˸����(({maker}))��(({RSS::Maker.make}))���Ϥ����֥��
���ؤΰ���̾�Ȥ��ޤ����Ĥޤꡤ�ʲ��Τ褦�ˤ�������
(({maker}))�Ȥ������ȤǤ���

  RSS::Maker.make(...) do |maker|
    ...
  end

--- RSS::Maker.make(version, &block)
     ((|version|))�ˤ�(({"1.0"}))�ޤ���(({"0.9"}))�ޤ���
     (({"0.91"}))�ޤ���(({"2.0"}))����ꤷ�ޤ���(({"0.9"}))
     ��(({"0.91"}))��Ʊ���Ǥ��뤳�Ȥ���դ��Ƥ����������С�
     ������ֹ������(({"rss"}))��Ĥ��Ƥ��Τ褦�˻��ꤹ�뤳
     �Ȥ����ޤ�:
     (({"rss1.0"}))/(({"rss2.0"}))/(({"rss0.9"}))/(({"rss0.91"}))

     Atom�ե�����ʸ��������������
     (({"atom"}))/(({"atom:feed"}))/(({"atom1.0"}))/(({"atom1.0:feed"}))
     ����ꤷ�Ƥ���������

     Atom����ȥ�ʸ��������������
     (({"atom:entry"}))/(({"atom1.0:entry"}))����ꤷ�Ƥ���������

     ((|block|))��¹Ԥ������Ȥ�(({maker}))���֥������Ȥ���
     RSS���֥������Ȥ����������֤��ޤ���

== ��ǥ�

�����Ĥ��Υ��֥������Ȥ϶��̤�API����äƤ��ޤ���

=== AtomTextConstruct

Atom�Υ��ݡ��Ȥˤ�ꡢ(({maker.channel.title}))�ʤɤ�ñ�ʤ�
�ƥ����Ȥ����ǤϤʤ��������Ť����줿�ƥ����Ȥ�XML���Ǥ����
�Ǥ���褦�ˤʤ�ޤ����������ϰʲ��Τ褦�ʥ᥽�åɤ������
����

--- type
     ���Ƥμ�����֤��ޤ���
--- type=(value)
     ((|value|))��text/html/xhtml�Τ����줫����ꤷ�ޤ���

--- content
     ���बtext/html�ξ������Ƥ��֤��ޤ���
--- content=(value)
     ���बtext/html�ξ������Ƥ����ꤷ�ޤ���

--- xml_content
     ���बxhtml�ξ������Ƥ��֤��ޤ���
--- xml_content=(value)
     ���बxhtml�ξ������Ƥ����ꤷ�ޤ���ʸ����ޤ���
     RSS::XML::Element�ǻ��ꤷ�ޤ������뤤�ϡ������������
     ���ꤹ�뤳�Ȥ����ޤ���

--- xhtml
     (({xml_content}))����̾�Ǥ���
--- xhtml=(value)
     (({xml_content=}))����̾�Ǥ���

=== AtomPersonConstruct

Atom�Υ��ݡ��Ȥˤ�ꡢ�ͤ�ɽ�������ǥ뤬Ƴ������ޤ�������
��ϰʲ��Τ褦�ʥ᥽�åɤ�����ޤ���

--- name
--- name=(value)

--- uri
--- uri=(value)

--- email
--- email=(value)

== maker

RSS/Atom�Υ롼�����Ǥ��������륪�֥������ȤǤ���

(({maker.channel}))�ޤ���(({maker.items}))��Ŭ�ڤ����ꤷ�ʤ�
���RSS/Atom����������ޤ���

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

--- maker.feed_version
     ��������ե����ɤΥС��������֤��ޤ���

--- maker.rss_version
     (({maker.feed_version}))����̾�Ǥ���

--- maker.xml_stylesheets
     (({xml_stylesheet}))��������륪�֥������Ȥ��֤��ޤ���
     
--- maker.channel
     channel���Ǥ��������륪�֥������Ȥ��֤��ޤ���Atom�ե���
     ��ʸ��Ǥ�atom:feed���Ǥ��������ޤ���
     
--- maker.image
     image���Ǥ��������륪�֥������Ȥ��֤��ޤ���Atom�ե���
     ��ʸ��Ǥ�atom:feed/atom:logo���Ǥ��������ޤ���
     
--- maker.items
     item���Ǥ��������륪�֥������Ȥ�������륪�֥������Ȥ�
     �֤��ޤ���Atom�ե�����ʸ��Ǥ�atom:feed/atom:entry����
     ���б����ޤ���Atom����ȥ�ʸ��ǤϺǽ��item�Τߤ�����
     ����ޤ���
     
--- maker.textinput
     textinput���Ǥ��������륪�֥������Ȥ��֤��ޤ���
     
=== maker.xml_stylsheets

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.xml_stylesheets.new_xml_stylesheet
     ������(({xml_stylesheet}))����������֤��ޤ����������줿
     (({xml_stylesheet}))��(({xml_stylesheet}))�ꥹ�ȤκǸ�
     ���ɲä���Ƥ��ޤ����֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�
     ������侩���ޤ���

       maker.xml_stylesheets.new_xml_stylesheet do |xss|
         xss.XXX = XXX
         ...
       end

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

== maker.channel

channel���Ǥ��ͤ����ꤷ�ޤ���Atom�ե�����ʸ��ξ���
atom:feed���Ǥ��б����ޤ���Atom����ȥ�ʸ��ξ��Ϥ����Ĥ�
���ͤ��ǥե�����ͤȤ������Ѥ���ޤ���

RSS 1.0�������������(({about}))��(({title}))��(({link}))��
(({description}))�����ꤷ�ʤ���Ф����ޤ���

RSS 0.91�������������(({title}))��(({link}))��
(({description}))��(({language}))�����ꤷ�ʤ���Ф����ޤ���

RSS 2.0�������������(({title}))��(({link}))��
(({description}))�����ꤷ�ʤ���Ф����ޤ���

Atom�ե�����ʸ��������������(({title}))��(({updated}))��
(({id}))�����ꤷ�ʤ���Ф����ޤ��󡣤⤷��maker.items��Τ�
��item��(({author}))�����ꤷ�ʤ�����(({author}))�����ꤷ��
����Ф����ޤ���

�嵭��(({maker.channel}))���׵᤹���ͤ����ꤷ�Ƥ��ʤ�����
(({RSS::NotSetError}))�㳰��ȯ�����ޤ���

�������ʤ��᥽�åɤ�ñ�ʤ륢�������Ǥ���

--- maker.channel.about
--- maker.channel.about=(value)

--- maker.channel.title
     (({title.content}))���֤��ޤ���0.1.6������Ʊ����ư�Ǥ���
--- maker.channel.title {|title| ...}
     �֥�å���(({title}))���Ϥ��ޤ���
--- maker.channel.title=(value)
     (({title.content}))��((|value|))�����ꤷ�ޤ���

--- maker.channel.links
     (({links}))���֤��ޤ���
--- maker.channel.link
     (({links}))�κǽ�����Ǥ�(({href}))���֤��ޤ���
     (({links}))�����ξ���(({nil}))���֤��ޤ���
--- maker.channel.link=(value)
     (({links}))�κǽ�����Ǥ�(({href}))��((|value|))������
     ���ޤ���(({links}))�����ξ���(({links.new_link}))�ǿ�
     ������������(({href}))�����ꤷ�ޤ���

--- maker.channel.description
     (({description.content}))���֤��ޤ���0.1.6������Ʊ����ư�Ǥ���
--- maker.channel.description {|description| ...}
     �֥�å���(({description}))���Ϥ��ޤ���
--- maker.channel.description=(value)
     (({description.content}))��((|value|))�����ꤷ�ޤ���

--- maker.channel.subtitle
     (({maker.channel.description}))����̾�Ǥ���
--- maker.channel.subtitle=(value)
     (({maker.channel.description=}))����̾�Ǥ���

--- maker.channel.language
--- maker.channel.language=(value)

--- maker.channel.copyright
     (({copyright.content}))���֤��ޤ���0.1.6������Ʊ����ư�Ǥ���
--- maker.channel.copyright {|copyright| ...}
     �֥�å���(({copyright}))���Ϥ��ޤ���
--- maker.channel.copyright=(value)
     (({copyright.content}))��((|value|))�����ꤷ�ޤ���

--- maker.channel.rights
--- maker.channel.rights {|rights| ...}
     (({maker.channel.copyright}))����̾�Ǥ���
--- maker.channel.rights=(value)
     (({maker.channel.copyright=}))����̾�Ǥ���

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

--- maker.channel.updated
     (({maker.channel.date}))����̾�Ǥ���
--- maker.channel.updated=(value)
     (({maker.channel.date=}))����̾�Ǥ���

--- maker.channel.lastBuildDate
--- maker.channel.lastBuildDate=(value)

--- maker.channel.generator
     (({generator.content}))���֤��ޤ���
--- maker.channel.generator {|generator| ...}
     �֥�å���(({generator}))���Ϥ��ޤ���
--- maker.channel.generator=(value)
     (({generator.content}))��((|value|))�����ꤷ�ޤ���

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

--- maker.channel.authors
     (({authors}))���֤��ޤ���
--- maker.channel.author
     (({authors}))�κǽ�����Ǥ�(({name}))���֤��ޤ���
     (({authors}))�����ξ���(({nil}))���֤��ޤ���
--- maker.channel.author=(value)
     (({authors}))�κǽ�����Ǥ�(({name}))��((|value|))������
     ���ޤ���(({authors}))�����ξ���(({authors.new_author}))�ǿ�
     ������������(({name}))�����ꤷ�ޤ���

--- maker.channel.contributors
     (({contributors}))���֤��ޤ���
--- maker.channel.contibutor
     (({contibutors}))�κǽ�����Ǥ�(({name}))���֤��ޤ���
     (({contibutors}))�����ξ���(({nil}))���֤��ޤ���
--- maker.channel.contibutor=(value)
     (({contibutors}))�κǽ�����Ǥ�(({name}))��((|value|))������
     ���ޤ���(({contibutors}))�����ξ���
     (({contibutors.new_contibutor}))�ǿ�������������
     (({name}))�����ꤷ�ޤ���

--- maker.channel.icon
     (({maker.channel.image_favicon.about}))����̾�Ǥ���
--- maker.channel.icon=(value)
     (({maker.channel.image_favicon.about=}))����̾�Ǥ���

--- maker.channel.logo
     (({maker.image.url}))����̾�Ǥ���
--- maker.channel.logo=(value)
     (({maker.image.url=}))����̾�Ǥ���

=== maker.channel.title

AtomTextConstruct�򻲾Ȥ��Ƥ���������

RSS����������Ȥ���(({content}))�������Ѥ���ޤ���

=== maker.channel.links

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.channel.links.new_link
     ������(({link}))����������֤��ޤ����������줿
     (({link}))��(({link}))�ꥹ�ȤκǸ���ɲä���Ƥ��ޤ���
     �֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�������侩���ޤ���

       maker.channel.links.new_link do |link|
         link.XXX = XXX
         ...
       end

==== link

(({link}))��(({maker.channel.links.new_link}))�Ǻ������줿��
�֥������ȤȤ��ޤ���

(({href}))����ꤹ��ɬ�פ�����ޤ���

--- link.href
--- link.href=(value)

--- link.rel
--- link.rel=(value)

--- link.type
--- link.type=(value)

--- link.hreflang
--- link.hreflang=(value)

--- link.title
--- link.title=(value)

--- link.length
--- link.length=(value)

=== maker.channel.description

AtomTextConstruct�򻲾Ȥ��Ƥ���������

RSS����������Ȥ���(({content}))�������Ѥ���ޤ���

=== maker.channel.copyright

AtomTextConstruct�򻲾Ȥ��Ƥ���������

RSS����������Ȥ���(({content}))�������Ѥ���ޤ���

=== maker.channel.generator

RSS 2.0/Atom�ե�����ʸ�����������Ȥ������Ѥ���ޤ���

RSS 2.0����������Ȥ���(({content}))�������Ѥ���ޤ���

--- maker.channel.generator.uri
--- maker.channel.generator.uri=(value)

--- maker.channel.generator.version
--- maker.channel.generator.version=(value)

--- maker.channel.generator.content
--- maker.channel.generator.content=(value)

=== maker.channel.categories

RSS 2.0����������Ȥ��������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.channel.categories.new_category
     ������(({category}))����������֤��ޤ����������줿
     (({category}))��(({category}))�ꥹ�ȤκǸ�
     ���ɲä���Ƥ��ޤ����֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�
     ������侩���ޤ���

       maker.channel.categories.new_category do |category|
         category.XXX = XXX
         ...
       end

==== category

(({category}))��
(({maker.channel.categories.new_category}))�Ǻ������줿��
�֥������ȤȤ��ޤ���

(({content}))����ꤹ��ɬ�פ�����ޤ���

--- category.domain
--- category.domain=(value)

--- category.content
--- category.content=(value)

=== maker.channel.cloud

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

=== maker.channel.skipDays

RSS 0.91/2.0����������Ȥ��������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.channel.skipDays.new_day
     ������(({day}))����������֤��ޤ����������줿
     (({day}))��(({day}))�ꥹ�ȤκǸ�
     ���ɲä���Ƥ��ޤ����֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�
     ������侩���ޤ���

       maker.channel.skipDays.new_day do |day|
         day.XXX = XXX
         ...
       end

==== day

(({day}))��
(({maker.channel.skipDays.new_day}))�Ǻ������줿��
�֥������ȤȤ��ޤ���

(({content}))����ꤹ��ɬ�פ�����ޤ���

--- day.content
--- day.content=(value)

=== maker.channel.skipHours

RSS 0.91/2.0����������Ȥ��������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.channel.skipHours.new_hour
     ������(({hour}))����������֤��ޤ����������줿
     (({hour}))��(({hour}))�ꥹ�ȤκǸ�
     ���ɲä���Ƥ��ޤ����֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�
     ������侩���ޤ���

       maker.channel.skipHours.new_hour do |hour|
         hour.XXX = XXX
         ...
       end

==== hour

(({hour}))��
(({maker.channel.skipHours.new_hour}))�Ǻ������줿��
�֥������ȤȤ��ޤ���

(({content}))����ꤹ��ɬ�פ�����ޤ���

--- hour.content
--- hour.content=(value)

=== maker.channel.authors

Atom����������Ȥ��������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.channel.authors.new_author
     ������(({author}))����������֤��ޤ����������줿
     (({author}))��(({author}))�ꥹ�ȤκǸ���ɲä���Ƥ��ޤ���
     �֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�������侩���ޤ���

       maker.channel.authors.new_author do |author|
         author.XXX = XXX
         ...
       end

==== author

AtomPersonConstruct�򻲾Ȥ��Ƥ���������

=== maker.channel.contributors

Atom����������Ȥ��������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.channel.contributors.new_contributor
     ������(({contributor}))����������֤��ޤ����������줿
     (({contributor}))��(({contributor}))�ꥹ�ȤκǸ���ɲä���Ƥ��ޤ���
     �֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�������侩���ޤ���

       maker.channel.contributors.new_contributor do |contributor|
         contributor.XXX = XXX
         ...
       end

==== contributor

AtomPersonConstruct�򻲾Ȥ��Ƥ���������

== maker.image

RSS 1.0�ξ���(({url}))��(({title}))��
(({maker.channel.link}))��(({maker.channel}))��Ŭ�ڤ����ꤵ
��Ƥ���ɬ�פ�����ޤ���

RSS 0.91/2.0�ξ���(({url}))��(({title}))��
(({maker.channel.link}))��Ŭ�ڤ����ꤵ��Ƥ���ɬ�פ�����ޤ���

Atom�ե����ɤξ���(({url}))��Ŭ�ڤ����ꤵ��Ƥ���ɬ�פ�����
�ޤ���

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

== maker.items

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- maker.items.new_item
     ������(({item}))����������֤��ޤ����������줿
     (({item}))��(({item}))�ꥹ�ȤκǸ���ɲä���Ƥ��ޤ���
     �֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�������侩���ޤ���

       maker.items.new_item do |item|
         item.XXX = XXX
         ...
       end

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


=== item

(({item}))��(({maker.items.new_item}))�Ǻ������줿���֥�����
�ȤȤ��ޤ���

RSS 1.0/0.91�ξ���(({title}))��(({link}))�����ꤹ��ɬ�פ���
��ޤ���

RSS 2.0�ξ���(({title}))�ޤ���(({description}))�����ꤹ��
ɬ�פ�����ޤ���

Atom�ե����ɤξ���(({id}))��(({title}))��(({updated}))����
�ꤹ��ɬ�פ�����ޤ���(({id}))�����ꤵ��Ƥ��ʤ�����
(({link}))�����Ѥ��ޤ���

Atom����ȥ�ξ���(({id}))��(({title}))��(({updated}))����
�Ͱʾ��(({authors}))�����ꤹ��ɬ�פ�����ޤ���(({id}))������
����Ƥ��ʤ�����(({link}))�����Ѥ��ޤ���(({authors}))����
�ͤ����ꤵ��Ƥ��ʤ�����(({maker.channel.authors}))������
���ޤ���

--- item.title
     (({title.content}))���֤��ޤ���0.1.6������Ʊ����ư�Ǥ���
--- item.title {|title| ...}
     �֥�å���(({title}))���Ϥ��ޤ���
--- item.title=(value)
     (({title.content}))��((|value|))�����ꤷ�ޤ���

--- item.links
     (({links}))���֤��ޤ���
--- item.link
     (({title}))���֤��ޤ���0.1.6������String��nil�Ǥ�����
--- item.title=(value)
     (({title.content}))��((|value|))�����ꤷ�ޤ���

--- item.links
     (({links}))���֤��ޤ���
--- item.link
     (({links}))�κǽ�����Ǥ�(({href}))���֤��ޤ���
     (({links}))�����ξ���(({nil}))���֤��ޤ���
--- item.link=(value)
     (({links}))�κǽ�����Ǥ�(({href}))��((|value|))������
     ���ޤ���(({links}))�����ξ���(({links.new_link}))�ǿ�
     ������������(({href}))�����ꤷ�ޤ���

--- item.description
     (({description.content}))���֤��ޤ���0.1.6������Ʊ����ư�Ǥ���
--- item.description {|description| ....}
     �֥�å�(({description}))���Ϥ��ޤ���
--- item.description=(value)
     (({description.content}))��((|value|))�����ꤷ�ޤ���

--- item.summary
--- item.summary {|summary| ...}
     (({item.description}))����̾�Ǥ���
--- item.summary=(value)
     (({item.description=}))����̾�Ǥ���

--- item.date
--- item.date=(value)

--- item.pubDate
     (({item.date}))����̾�Ǥ���
--- item.pubDate=(value)
     (({item.date=}))����̾�Ǥ���

--- item.updated
     (({item.date}))����̾�Ǥ���
--- item.updated=(value)
     (({item.date=}))����̾�Ǥ���

--- item.authors
     (({authors}))���֤��ޤ���
--- item.author
     (({authors}))�κǽ�����Ǥ�(({name}))���֤��ޤ���
     (({authors}))�����ξ���(({nil}))���֤��ޤ���
--- item.author=(value)
     (({authors}))�κǽ�����Ǥ�(({name}))��((|value|))������
     ���ޤ���(({authors}))�����ξ���(({authors.new_author}))�ǿ�
     ������������(({name}))�����ꤷ�ޤ���

--- item.contibutors
     (({contibutors}))���֤��ޤ���
--- item.contibutor
     (({contibutors}))�κǽ�����Ǥ�(({name}))���֤��ޤ���
     (({contibutors}))�����ξ���(({nil}))���֤��ޤ���
--- item.contibutor=(value)
     (({contibutors}))�κǽ�����Ǥ�(({name}))��((|value|))������
     ���ޤ���(({contibutors}))�����ξ���
     (({contibutors.new_contibutor}))�ǿ�������������
     (({name}))�����ꤷ�ޤ���

--- item.comments
--- item.comments=(value)

--- item.guid
     (({guid}))���֤��ޤ���
--- item.enclosure
     (({enclosure}))���֤��ޤ���
--- item.source
     (({source}))���֤��ޤ���
--- item.categories
     (({categories}))���֤��ޤ���

--- item.rights
     (({rights.content}))���֤��ޤ���0.1.6������Ʊ����ư�Ǥ���
--- item.rights {|rights| ...}
     �֥�å���(({rights}))���Ϥ��ޤ���
--- item.rights=(value)
     (({rights.content}))��((|value|))�����ꤷ�ޤ���

--- item.content
     (({content}))���֤��ޤ���

--- item.id
--- item.id=(value)

--- item.published
--- item.published=(value)

==== item.title

AtomTextConstruct�򻲾Ȥ��Ƥ���������

RSS����������Ȥ���(({content}))�������Ѥ���ޤ���

==== item.links

RSS 2.0/Atom����������Ȥ������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- item.links.new_link
     ������(({link}))����������֤��ޤ����������줿
     (({link}))��(({link}))�ꥹ�ȤκǸ���ɲä���Ƥ��ޤ���
     �֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�������侩���ޤ���

       item.links.new_link do |link|
         link.XXX = XXX
         ...
       end

     (({item.links.new_link}))����������(({link}))��
     (({maker.channel.links.new_link}))����������
     (({link}))��Ʊ��API������ޤ���

==== item.description

AtomTextConstruct�򻲾Ȥ��Ƥ���������

RSS����������Ȥ���(({content}))�������Ѥ���ޤ���

==== item.authors

RSS 2.0/Atom����������Ȥ������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- item.authors.new_author
     ������(({author}))����������֤��ޤ����������줿
     (({author}))��(({author}))�ꥹ�ȤκǸ���ɲä���Ƥ��ޤ���
     �֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�������侩���ޤ���

       item.authors.new_author do |author|
         author.XXX = XXX
         ...
       end

     (({item.authors.new_author}))����������(({author}))��
     (({maker.channel.authors.new_author}))����������
     (({author}))��Ʊ��API������ޤ���

==== item.contributors

Atom����������Ȥ��������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- item.contributors.new_contributor
     ������(({contributor}))����������֤��ޤ����������줿
     (({contributor}))��(({contributor}))�ꥹ�ȤκǸ���ɲä���Ƥ��ޤ���
     �֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�������侩���ޤ���

       item.contributors.new_contributor do |contributor|
         contributor.XXX = XXX
         ...
       end

     (({item.contributors.new_contributor}))����������(({contributor}))��
     (({maker.channel.contributors.new_contributor}))����������
     (({contributor}))��Ʊ��API������ޤ���

==== item.guid

RSS 2.0����������Ȥ��������Ѥ���ޤ���

(({content}))�����ꤹ��ɬ�פ�����ޤ���

--- item.guid.isPermaLink
--- item.guid.isPermaLink=(value)

--- item.guid.content
--- item.guid.content=(value)

==== item.enclosure

RSS 2.0����������Ȥ��������Ѥ���ޤ���

(({url}))��(({length}))��(({type}))�����ꤹ��ɬ�פ�����ޤ���

--- item.enclosure.url
--- item.enclosure.url=(value)

--- item.enclosure.length
--- item.enclosure.length=(value)

--- item.enclosure.type
--- item.enclosure.type=(value)

==== item.source

RSS 2.0����������Ȥ��������Ѥ���ޤ���

(({url}))��(({content}))�����ꤹ��ɬ�פ�����ޤ���

--- item.source.url
--- item.source.url=(value)

--- item.source.content
--- item.source.content=(value)

==== item.categories

RSS 2.0����������Ȥ��������Ѥ���ޤ���

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- item.categories.new_category
     ������(({category}))����������֤��ޤ����������줿
     (({category}))��(({category}))�ꥹ�ȤκǸ�
     ���ɲä���Ƥ��ޤ���
     �֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�������侩���ޤ���

       item.categories.new_category do |category|
         category.XXX = XXX
         ...
       end

     (({item.categories.new_category}))����������
     (({category}))��
     (({maker.channel.categories.new_category}))����������
     (({category}))��Ʊ��API������ޤ���

==== item.rights

AtomTextConstruct�򻲾Ȥ��Ƥ���������

RSS����������Ȥ���(({content}))�������Ѥ���ޤ���

==== item.content

Atom����������Ȥ��Τ����Ѥ���ޤ���

--- type
     ���Ƥμ�����֤��ޤ���
--- type=(value)
     ((|value|))��text��html��xhtml�ޤ���MIME�����פ���ꤷ��
     ����

--- src
     ���बMIME�����פΤȤ������Ƥ�IRI���֤��ޤ���
--- src=(value)
     ���बMIME�����פΤȤ������Ƥ�IRI����ꤷ�ޤ���

--- content
     ���बtext��html���뤤��XML�Ѱʳ���MIME�����פξ���
     ���Ƥ��֤��ޤ���
--- content=(value)
     ���बtext��html���뤤��XML�Ѱʳ���MIME�����פξ�����
     �Ƥ����ꤷ�ޤ���Base64���󥳡��ǥ��󥰤�ɬ�פ�MIME����
     �פξ��Ǥ�Base64���󥳡��ǥ��󥰤�Ԥä�ʸ��������
     ����ɬ�פϤ���ޤ���

--- xml_content
     ���बxhtml���뤤��XML�Ѥ�MIME�����פξ������Ƥ��֤�
     �ޤ���
--- xml_content=(value)
     ���बxhtml���뤤��XML�Ѥ�MIME�����פξ������Ƥ����ꤷ
     �ޤ���ʸ����ޤ���RSS::XML::Element�ǻ��ꤷ�ޤ������뤤
     �ϡ�����������ǻ��ꤹ�뤳�Ȥ����ޤ���

--- xhtml
     (({xml_content}))����̾�Ǥ���
--- xhtml=(value)
     (({xml_content=}))����̾�Ǥ���

--- xml
     (({xml_content}))����̾�Ǥ���
--- xml=(value)
     (({xml_content=}))����̾�Ǥ���

== maker.textinput

RSS 1.0�ξ���(({title}))��(({description}))��(({name}))��
(({link}))��(({maker.channel}))��Ŭ�ڤ����ꤹ��ɬ�פ������
����

RSS 0.91/2.0�ξ���(({title}))��(({description}))��
(({name}))��(({link}))�����ꤹ��ɬ�פ�����ޤ���

Atom�Ǥ����Ѥ���ޤ���

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
  * Image
  * ITunes
  * Slash

=== Content

�ʲ��Υ᥽�åɤ�(({item}))���ɲä��ޤ���

--- content_encoded
--- content_encoded=(value)

=== Dublin Core

�ʲ��Υ᥽�åɤ�(({maker.channel}))��(({maker.image}))��
(({item}))��(({maker.textinput}))���ɲä��ޤ���

RSS Maker��0.1.3���ʣ����Dublin Core�����Ǥ򥵥ݡ��Ȥ��ޤ�
�������Τ��ᡤDublin Core�����API���ѹ�����ޤ�������0.1.2
������API��ߴ����Τ���˻Ĥ���Ƥ���Τ�0.1.2�����Τ���˺�
�����줿������ץȤ�ư���Ϥ��Ǥ���

--- dc_titles.new_title
     ������<dc:title>���Ǥ��ɲä���������֤��ޤ���
     �֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�������侩���ޤ���

       dc_titles.new_title do |title|
         title.XXX = XXX
         ...
       end

     �ͤ����ꤹ��ˤ�(({dc_titles.new_title.value=}))�䡤(({value=}))
     ����̾�Ǥ���(({dc_titles.new_title.content=}))�����ѤǤ�
     �ޤ���

     �������ꤷ�Ƥ����ͤ��������ˤ�(({value}))��(({value}))
     ����̾�Ǥ���(({content}))�����ѤǤ��ޤ���

--- dc_descriptions.new_description
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_creators.new_creator
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_subjects.new_subject
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_publishers.new_publisher
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_contributors.new_contributor
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_types.new_type
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_formats.new_format
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_identifiers.new_identifier
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_sources.new_source
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_languages.new_language
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_relations.new_relation
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_coverages.new_coverage
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_rights_list.new_rights
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���

--- dc_rightses.new_rights
     (({dc_rights_list.new_rights}))����̾�Ǥ���

--- dc_dates.new_date
     ������ˡ��(({dc_titles.new_title}))��Ʊ�ͤǤ���


�ߴ����Τ���ˡ�1�ֽ��˸����Dublin Core�����Ǥ������
���Υ᥽�åɤ��ɲä��ޤ���

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

==== trackback_abouts

(({#<<}))��(({#[]}))��(({#[]=}))��(({#first}))��(({#last}))��
(({#push}))��(({#pop}))��(({#shift}))��(({#unshift}))��
(({#each}))��(({#size}))��(({#empty?}))��(({#clear}))��
(({#replace}))�ʤ������Ʊ���᥽�åɤ�����ޤ���

--- trackback_abouts.new_about
     ������(({about}))����������֤��ޤ����������줿
     (({about}))��(({about}))�ꥹ�ȤκǸ���ɲä���Ƥ��ޤ���
     �֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�������侩���ޤ���

       trackback_abouts.new_about do |about|
         about.XXX = XXX
         ...
       end

+ about

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

=== Image

�ʲ��Υ᥽�åɤ�(({item}))���ɲä��ޤ���

--- image_item

�ޤ����ʲ��Υ᥽�åɤ�(({channel}))���ɲä��ޤ���

--- image_favicon

==== image_item

Dublin Core�Υ᥽�åɤ�Ȥ��ޤ���

--- image_item.about
--- image_item.about=

--- image_item.resource
--- image_item.resource=

--- image_item.image_width
--- image_item.image_width=

--- image_item.width
     (({image_item.image_width}))����̾�Ǥ���
--- image_item.width=
     (({image_item.image_width=}))����̾�Ǥ���

--- image_item.image_height
--- image_item.image_height=

--- image_item.height
     (({image_item.image_height}))����̾�Ǥ���
--- image_item.height=
     (({image_item.image_height=}))����̾�Ǥ���

==== image_favicon

Dublin Core�Υ᥽�åɤ�Ȥ��ޤ���

--- image_item.about
--- image_item.about=

--- image_item.image_size
--- image_item.image_size=

--- image_item.size
     (({image_item.image_size}))����̾�Ǥ���
--- image_item.size=
     (({image_item.image_size=}))����̾�Ǥ���

=== ITunes

Podcast�Ѥξ�����������ޤ���RSS 2.0������������Τ����Ѥ�
��ޤ���

�ʲ��Υ᥽�åɤ�(({channel}))���ɲä��ޤ���

--- itunes_author
--- itunes_author=

--- itunes_block
--- itunes_block=

--- itunes_block?
     (({itunes_block}))��(({"yes"}))�ޤ���(({true}))�ΤȤ���
     (({true}))���֤��ޤ�����ʸ����ʸ���϶��̤���ޤ���

--- itunes_categories

--- new_itunes_category(text=nil)
     ������(({itunes_category}))����������֤��ޤ���
     ((|text|))��(({itunes_category.text}))�����ꤵ��ޤ���
     (({itunes_category}))��(({itunes_categories}))�ꥹ�Ȥκ�
     ����ɲä���Ƥ��ޤ���

     (({itunes_categories.new_category}))���������Ǥ���

--- itunes_image
--- itunes_image=

--- itunes_explicit
--- itunes_explicit=

--- itunes_explicit?
     (({itunes_explicit}))��(({"yes"}))�ޤ���(({true}))�ΤȤ���
     (({true}))���֤���(({"clean"}))�ޤ���(({false}))�ΤȤ�
     ��(({false}))���֤�������ʳ��ΤȤ���(({nil}))���֤���
     ������ʸ����ʸ���϶��̤���ޤ���

--- itunes_keywords
--- itunes_keywords=(keywords)
     ((|keywords|))������ޤ���CSV������ʸ����ǻ��ꤷ�ޤ���

--- itunes_new_feed_url
--- itunes_new_feed_url=

--- itunes_owner

--- itunes_subtitle
--- itunes_subtitle=

--- itunes_summary
--- itunes_summary=

�ʲ��Υ᥽�åɤ�(({item}))���ɲä��ޤ���

--- itunes_author
--- itunes_author=

--- itunes_block
--- itunes_block=

--- itunes_block?
     (({itunes_block}))��(({"yes"}))�ޤ���(({true}))�ΤȤ���
     (({true}))���֤��ޤ�����ʸ����ʸ���϶��̤���ޤ���

--- itunes_duration
--- itunes_duration=

--- itunes_duration {|itunes_duration| ...}
     �֥�å���(({itunes_duration}))���Ϥ��ޤ���

--- itunes_explicit
--- itunes_explicit=

--- itunes_explicit?
     (({itunes_explicit}))��(({"yes"}))�ޤ���(({true}))�ΤȤ���
     (({true}))���֤���(({"clean"}))�ޤ���(({false}))�ΤȤ�
     ��(({false}))���֤�������ʳ��ΤȤ���(({nil}))���֤���
     ������ʸ����ʸ���϶��̤���ޤ���

--- itunes_keywords
--- itunes_keywords=(keywords)
     ((|keywords|))������ޤ���CSV������ʸ����ǻ��ꤷ�ޤ���

--- itunes_subtitle
--- itunes_subtitle=

--- itunes_summary
--- itunes_summary=

==== itunes_categories

--- itunes_categories.new_category

     ������<itunes:category>���Ǥ��ɲä���������֤��ޤ���
     �֥�å�����ꤷ���ʲ��Τ褦�ʻȤ�������侩���ޤ���

       itunes_categories.new_category do |category|
         category.text = CATEGORY_NAME
         ...
       end

     �ͤ����ꤹ��ˤ�(({itunes_category.text=}))��Ȥ��ޤ���

     �������ꤷ�Ƥ����ͤ��������ˤ�
     (({itunes_category.text}))��Ȥ��ޤ���

     ���֥��ƥ������ꤹ��ˤ�
     (({itunes_category.new_category.text=}))�Ȥ��ޤ���

+ itunes_category

--- itunes_category.text
--- itunes_category.text=
     ���ƥ���̾����������ꤷ�ޤ���

--- itunes_category.new_category
     ���֥��ƥ������ꤷ�ޤ���������ˡ��
     (({itunes_categories.new_category}))��Ʊ�ͤǤ���

==== itunes_owner

--- itunes_owner.itunes_name
--- itunes_owner.itunes_name=

--- itunes_owner.itunes_email
--- itunes_owner.itunes_email=

==== itunes_duration

--- itunes_duration.content
--- itunes_duration.content=(content)
     ���Τɤ줫�η����Ǻ������֤���ꤷ�ޤ�����H: ����, M:
     ʬ, S: �á�
       * HH:MM:SS
       * H:MM:SS
       * MM:SS
       * M:SS

--- itunes_duration.hour
--- itunes_duration.hour=

--- itunes_duration.minute
--- itunes_duration.minute=

--- itunes_duration.second
--- itunes_duration.second=

=== Slash

�ʲ��Υ᥽�åɤ�(({item}))���ɲä��ޤ���

--- slash_section
--- slash_section=(value)

--- slash_department
--- slash_department=(value)

--- slash_comments
--- slash_comments=(value)

--- slash_hit_parade

     slash:hit_parade���ͤ�������������֤��ޤ�������޶��ڤ�
     ��������ʸ����ǤϤʤ��Τ���դ��Ƥ���������

--- slash_hit_parade=(value)

     ((|value|))�ϥ���޶��ڤ��������ʸ����Ǥ������������
     ��ɤ���Ǥ⤫�ޤ��ޤ���

--- slash_hit_parades
     slash_hit_parade����̾�Ǥ���

--- slash_hit_parades=(value)
     slash_hit_parade=����̾�Ǥ���
