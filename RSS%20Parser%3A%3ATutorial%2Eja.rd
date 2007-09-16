# -*- rd -*-

= Tutorial.ja

$Id: Tutorial.ja 325 2007-09-09 10:18:31Z kou $

== ���

RSS Parser��RSS 0.9x/1.0/2.0�򥵥ݡ��Ȥ��Ƥ��ޤ�����RSS 0.90
�ϥ��ݡ��Ȥ��Ƥޤ��󡥤����ʤ�����

Atom��Podcast�ѥ⥸�塼���itunes:XXX���ǡˤ�Ȥ���������
0.1.8�ʹߤ�ȤäƤ���������

Slash�⥸�塼���slash:XXX���ǡˤ�Ȥ���������0.2.0�ʹߤ�
�ȤäƤ���������

== require

0.1.4�����Ϥ�����require���ʤ��Ȥ����ʤ��ä���Ǥ�����
0.1.5����ϰʲ��ΤҤȤĤ�require�Ǥ褯�ʤ�ޤ�����

  require 'rss'

== �ѡ���

�ե����ɤ�ѡ�������������RSS::Parser���饹��Ȥ��ޤ���
RSS::Parser.parse�ϥե����ɤ�ʸ���󡤥ե�����̾�ޤ���URI����
�������Ȥ�ѡ������ޤ���RSS 1.0��ѡ�����������RSS::RDF����
�������Ȥ�RSS 0.9x/2.0��ѡ�����������RSS::Rss���֥�����
�Ȥ�Atom��ѡ�����������RSS::Feed���֥������Ȥ��֤��ޤ���
�ѡ��������ե����ɤ�well formed��XML��̵�����ϡ�RSS::Error
�Υ��֥��饹(RSS::NotWellFormedError)���㳰��ȯ�����ޤ���
well formed��XML�ʤΤˡ�RSS 0.9x/1.0/2.0, Atom�Τ�����Ǥ��
�����ϡ�nil���֤�ޤ���

�㤨�С�RSS 1.0��Х�ǡ�������դ��ǥѡ�������ˤϰʲ��Τ�
���ˤ��ޤ��������ǡ��ѿ�(({rss_source}))�ˤ�RSS 1.0������ʸ
���󤬳�Ǽ����Ƥ����ΤȤ��ޤ���

  require 'rss'
  rss = RSS::Parser.parse(rss_source, true)

RSS::Parser.parse����������Ͼ�ά�����true�����ꤵ�줿���
�Ȥߤʤ����Τǡ�����ϰʲ��Τ褦�ˤ�񤱤ޤ���

  require 'rss'
  rss = RSS::Parser.parse(rss_source)

�ǽ�ϥХ�ǡ�������դ��ǥѡ������ơ�valid�ǤϤʤ�RSS���ä�
���ϥХ�ǡ������̵���ǥѡ�������ˤϰʲ��Τ褦�˽񤭤ޤ���

  require 'rss'
  rss = nil
  begin
    rss = RSS::Parser.parse(rss_source)
  rescue RSS::InvalidRSSError
    rss = RSS::Parser.parse(rss_source, false)
  end

�����(({rss_source}))��RSS 0.9x/1.0/2.0, Atom�Τɤ줫ʬ����
�ʤ����ˤ�ͭ���Ǥ���

=== �Τ�ʤ����Ǥΰ���

�ѡ����ϥǥե���ȤǤ��Τ�ʤ�����(���ͽ�˵��ꤵ��Ƥ��ʤ�
����)��̵�뤷�ޤ����⤷���Τ�ʤ����Ǥ��������������㳰��ȯ
������������С�RSS::Parser.parse���軰������false����ꤷ��
������������������ȡ��ѡ�������Τ�ʤ����Ǥ�������������
RSS::UnknownTagError�㳰��ȯ�����ޤ���RSS::UnknownTagError��
�饹��RSS::InvalidError���饹�Υ��֥��饹�Ǥ���

�ʲ��Τ褦�ˤ���ȡ���긷̩�˥ѡ����Ǥ��ޤ���

  RSS::Parser.parse(rss_source, true, false)

== �ѡ������줿�ե�����

�ե����ɤ�ѡ��������RSS::RDF, RSS::RDF::Channel, RSS::Rss,
Atom::Feed���Υ��֥������Ȥˤʤ�ޤ����ƥ��֥������Ȥǻ�����
���֥������Ȥ˥����������뤿��ˡ�����̾��Ʊ��̾���Υ�������
������ޤ���

=== �꡼��(reader)

rdf:RDF���Ǥλ����ǤǤ���channel���Ǥ򻲾Ȥ���ˤϡ��ʲ��Τ褦
�ˤ��ޤ���

  rss = RSS::Parser.parse(rss_source)
  rss.channel # => /rdf:RDF/channel����; RSS::RDF::Channel

�⤷�����Ǥ������Ǥ�°��������ʤ�����String���֤äƤ��ޤ���
�������Ǥ���ά��ǽ�ʤ��nil���֤ä���뤫�⤷��ޤ��󡣤���
�����Ǥ������Ǥޤ���°������ľ���Ʊ�ͤǤ���

  rss = RSS::Parser.parse(rss_source)
  rss.channel.description # => /rdf:RDF/channel/text(); String

°���˥��������������Ʊ�ͤǤ���channel���Ǥ�rdf:about°����
������������ˤϰʲ��Τ褦�ˤ��ޤ���°�����ͤ�String��nil��
����

  rss = RSS::Parser.parse(rss_source)
  rss.channel.about # => /rdf:RDF/channel/@about°��; String �ޤ��� nil

Ʊ̾��ʣ���λ����Ǥ����뤫�⤷��ʤ��Ȥ���Ʊ�ͤǤ�����������
�꡼���˰�������ꤷ�ʤ��Ⱥǽ�λ����Ǥ��֤äƤ��ޤ����㤨�С�
rdf:RDF���Ǥκǽ��item���Ǥ˥�����������ˤϰʲ��Τ褦�ˤ�
�ޤ���

  rss = RSS::Parser.parse(rss_source)
  rss.item # => /rdf:RDF/item[1]����; RSS::RDF::Item

3���ܤ�item���Ǥ˥�����������ˤϰʲ��Τ褦�ˤ��ޤ�����ά��
��ʤ��ä��꡼���ΰ�����Array#[]�ΰ�����Ʊ���褦�˰����ޤ���

  rss = RSS::Parser.parse(rss_source)
  rss.item(2) # => /rdf:RDF/item[3]����; RSS::RDF::Item

�����Ǥ��٤Ƥ�����������Ȥ�������̾��ʣ�������꡼���Ȥʤ��
�������٤Ƥ�item���Ǥ��������ˤϰʲ��Τ褦�ˤ��ޤ���

  rss = RSS::Parser.parse(rss_source)
  rss.items # => /rdf:RDF/item���Ǥ�����; [RSS::RDF::Item, ...]

=== �饤��(writer)

rdf:RDF���Ǥλ����ǤǤ���channel���Ǥ����ꤹ��ˤϰʲ��Τ褦
�ˤ��ޤ���RSS::RDF::Channel.new���������ˤ�rdf:about°����
�ͤ���ꤹ�뤳�Ȥ�Ǥ��ޤ���

  rss = RSS::Parser.parse(rss_source)
  rss.channel = RSS::RDF::Channel.new(rdf_about_value)

°���ͤ����ꤹ�����Ʊ�ͤǤ���

  rss = RSS::Parser.parse(rss_source)
  rss.channel.about = "http://cozmixng.www.cozmixng.org/"

Ʊ̾��ʣ���λ����Ǥ�¸�ߤ�����Ͼ����ۤʤ�ޤ�������̾��ʣ
�����ǤΥ᥽�åɤ����Ǥ������������ơ�����������Ф���
Array#<<��Array#[]=�ʤɤ��Ѥ������Ǥ����ꤷ�ޤ���

  rss = RSS::Parser.parse(rss_source)
  item = RSS::RDF::Item.new(rdf_about_value)
  rss.items << item
  rss.items.last == item # => true

���: item=/set_item�ʤɤ�Ruby�äݤ��ʤ��ΤǻȤ�ʤ��Ǥ�����
����

== ����

RSS Parser�Ȥ��äƤ���ΤǸ�򤵤줬���Ǥ�����RSS/Atom�����
���뤳�Ȥ�Ǥ��ޤ���

=== ����

(({to_s}))�����RSS�ޤ���Atom������ʸ������֤��ޤ���

RSS/Atom����Ϥ���ή��ϰʲ��Τ褦�ˤʤ�ޤ���

  * RSS/Atom���֥������ȡ�(({RSS::RDF}))�Ȥ�(({RSS::Rss}))��
    ��(({RSS::Atom::Feed}))���饹�Υ��֥������ȡˤ��������

  * ���ϥ��󥳡��ǥ��󥰤���ꤹ��(��ά��)

  * RSS/Atom���֥������Ȥ�(({to_s}))�᥽�åɤ�Ƥ�

=== xml-stylesheet

xml-stylesheet����Ϥ��뤳�Ȥ��Ǥ��ޤ���

RSS�Υ롼�����ǡ�(({RSS::RDF}))�ޤ���(({RSS::Rss}))�˥��֥���
���Ȥ����Atom�Υ롼�����ǡ�(({RSS::Atom::Feed}))�ޤ���
(({RSS::Atom::Entry}))�˥��֥������Ȥ�xml_stylesheets�Ȥ���̾
�����������äƤ��ޤ������������(({RSS::XMLStyleSheet}))��
�֥������Ȥ��������뤳�Ȥ�RSS/Atom��xml-stylesheet���Ϣ�Ť�
�뤳�Ȥ��Ǥ��ޤ���

  rss.xml_stylesheets << RSS::XMLStyleSheet.new(...)

(({RSS::XMLStyleSheet.new}))�ˤϰʲ��Τ褦��(({Hash}))�ޤ���
Ϣ��������Ϥ��ޤ������������(({RSS::XMLStyleSheet}))���֥���
���Ȥ�Ϳ����줿�����ˤ�äƽ��������ޤ���

(({Hash})):

  {
    :href => "...",
    :type => "...",
    :title => "...",
    :media => "...",
    :charset => "...",
    :alternate => "...",
  }

Ϣ������:

  [
    [:href, "..."],
    [:type, "..."],
    [:title, "..."],
    [:media, "..."],
    [:charset, "..."],
    [:alternate, "..."],
  ]

���ƤΥ����Ͼ�ά��ǽ�Ǥ���

�㤨�С�xml-stylesheet�Ȥ���sample.xsl����ꤹ����ϰʲ���
�褦�ˤ��ޤ���

  rss.xml_stylesheets << RSS::XMLStyleSheet.new({:href => "sample.xsl"})

������(({{:type => "text/xsl"}}))����ꤷ�ʤ��Ȥ����ʤ��Ȥ�
��Ǥ�������ĥ�Ҥ�.xsl�ޤ��ϡ�.css�ξ���Ŭ���˿�¬���Ƥ���
��ΤǾ�ά��ǽ�Ǥ���

=== RSS/Atom���֥������Ȥ���

��¸��RSS/Atom��ѡ��������ˡ��줫�鿷����RSS/Atom���������
�ˤ�RSS Maker�������Ǥ���

�ʲ��Τ褦�˻Ȥ��ޤ���

  require "rss"
  
  rss = RSS::Maker.make("�С������") do |maker|
    maker.XXX = YYY
    ...
  end

==== ����ץ��RSS

�㤨�С��ʲ��Τ褦�ʾ�������RSS 1.0����������Ȥ��ޤ���

  * �����Ȥ�URL��http://example.com/
  * �����Ȥ�����ʸ��Example Site
  * ������̾��Example
  * RSS 1.0��http://example.com/index.rdf���֤�
  * ����ȥ��1��
    * URL��http://example.com/article.html
    * �����ȥ��Sample Article

���ξ��ϰʲ��Τ褦�ˤʤ�ޤ���

  require "rss"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"
    
    maker.items.new_item do |item|
      item.link = "http://example.com/article.html"
      item.title = "Sample Article"
    end
  end

==== ����������ɲ�

�⤷����Υ���ȥ꤬

  * 2004/11/1 10:10

�Τ�Τʤ餳�����ޤ���

  require "rss"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.new_item do |item|
      item.link = "http://example.com/article.html"
      item.title = "Sample Article"
      item.date = Time.parse("2004/11/1 10:10")
    end
  end

����ץ����

  item.date = ...

��

  item.dc_date = ...

�Ǥ⹽���ޤ���(({#dc_date=}))��(({#date=}))��ñ�ʤ���̾��
����

==== ����˥���ȥ���ɲ�

����ˡ�

  * http://example.com/article2.html�ˤ���
  * Sample Article2�Ȥ���
  * 2004/11/2 10:10�˺������줿

����ȥ����Ĥʤ�ʲ��Τ褦�ˤ��ޤ���

  require "rss"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.new_item do |item|
      item.link = "http://example.com/article.html"
      item.title = "Sample Article"
      item.date = Time.parse("2004/11/1 10:10")
    end

    maker.items.new_item do |item|
      item.link = "http://example.com/article2.html"
      item.title = "Sample Article2"
      item.date = Time.parse("2004/11/2 10:10")
    end
  end

==== ����ȥ���¤��ؤ���

�⤷��������������������¤��ؤ��������

  maker.items.do_sort = true

���ɲä����ʲ��Τ褦�ˤ��ޤ���

  require "rss"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.do_sort = true

    maker.items.new_item do |item|
      item.link = "http://example.com/article.html"
      item.title = "Sample Article"
      item.date = Time.parse("2004/11/1 10:10")
    end

    maker.items.new_item do |item|
      item.link = "http://example.com/article2.html"
      item.title = "Sample Article2"
      item.date = Time.parse("2004/11/2 10:10")
    end
  end

==== ���λ���

�⤷�������Ȥ�

  * Example Site�Ȥ���̾����
  * http://example.com/logo.png�Ȥ�����

��������ϰʲ��Τ褦�ˤ��ޤ���

  require "rss"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.do_sort = true

    maker.items.new_item do |item|
      item.link = "http://example.com/article.html"
      item.title = "Sample Article"
      item.date = Time.parse("2004/11/1 10:10")
    end

    maker.items.new_item do |item|
      item.link = "http://example.com/article2.html"
      item.title = "Sample Article2"
      item.date = Time.parse("2004/11/2 10:10")
    end

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"
  end

==== �����ڡ����λ���

�⤷��

  * http://example.com/search.cgi��
  * keyword�Ȥ����ѥ�᥿̾�Ǹ����Ǥ���
  * Search Example Site�Ȥ���̾����
  * Search Example Site's all text�Ȥ��������դ���

�����ѥڡ��������ä���ʲ��Τ褦�ˤ��ޤ���

  require "rss"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.do_sort = true

    maker.items.new_item do |item|
      item.link = "http://example.com/article.html"
      item.title = "Sample Article"
      item.date = Time.parse("2004/11/1 10:10")
    end

    maker.items.new_item do |item|
      item.link = "http://example.com/article2.html"
      item.title = "Sample Article2"
      item.date = Time.parse("2004/11/2 10:10")
    end

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"

    maker.textinput.title = "Search Example Site"
    maker.textinput.description = "Search Example Site's all text"
    maker.textinput.name = "keyword"
    maker.textinput.link = "http://example.com/search.cgi"
  end

==== XML�������륷���Ȥλ���

�⤷��

  * http://example.com/index.xsl�ˤ���

xml-stylesheet���ɲä��������ϰʲ��Τ褦�ˤ��ޤ���

  require "rss"
  
  rss = RSS::Maker.make("1.0") do |maker|
    xss = maker.xml_stylesheets.new_xml_stylesheet
    xss.href = "http://example.com/index.xsl"

    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.do_sort = true

    maker.items.new_item do |item|
      item.link = "http://example.com/article.html"
      item.title = "Sample Article"
      item.date = Time.parse("2004/11/1 10:10")
    end

    maker.items.new_item do |item|
      item.link = "http://example.com/article2.html"
      item.title = "Sample Article2"
      item.date = Time.parse("2004/11/2 10:10")
    end

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"

    maker.textinput.title = "Search Example Site"
    maker.textinput.description = "Search Example Site's all text"
    maker.textinput.name = "keyword"
    maker.textinput.link = "http://example.com/search.cgi"
  end

==== RSS 2.0������

�⤷��RSS 2.0���������������ϰʲ��Τ褦�ˡ�
(({RSS::Maker.make}))�����������ѹ����ޤ���

  require "rss"
  
  rss = RSS::Maker.make("2.0") do |maker|
    xss = maker.xml_stylesheets.new_xml_stylesheet
    xss.href = "http://example.com/index.xsl"

    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.do_sort = true

    maker.items.new_item do |item|
      item.link = "http://example.com/article.html"
      item.title = "Sample Article"
      item.date = Time.parse("2004/11/1 10:10")
    end

    maker.items.new_item do |item|
      item.link = "http://example.com/article2.html"
      item.title = "Sample Article2"
      item.date = Time.parse("2004/11/2 10:10")
    end

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"

    maker.textinput.title = "Search Example Site"
    maker.textinput.description = "Search Example Site's all text"
    maker.textinput.name = "keyword"
    maker.textinput.link = "http://example.com/search.cgi"
  end

==== RSS 0.91������

�⤷��RSS 0.91���������������ϡ�RSS 2.0�ξ���Ʊ�ͤ�
(({RSS::Maker.make}))����������(({"0.91"}))���ѹ����ޤ���

  rss = RSS::Maker.make("0.91") do |maker|
    ...
  end

==== Atom 1.0������

�⤷��Atom 1.0���������������ϡ�RSS 0.91��2.0�ξ���Ʊ�ͤ�
(({RSS::Maker.make}))����������(({"atom"}))���ѹ����ޤ���

  rss = RSS::Maker.make("atom") do |maker|
    ...
  end

����������������ǤϽ�ʬ�ǤϤ���ޤ��󡣤���ϡ�Atom 1.0�Ǥ�
RSS 1.0/2.0/0.91�Ǥ�ɬ�ܤǤϤʤ��ä��ʲ��ξ���ɬ�פȤʤ뤫
��Ǥ���

  * ����Atom 1.0�κ��
  * ����Atom 1.0�ι�����

��äơ�����ޤǤΥ�����ץȤ�Atom 1.0����Ϥ���褦�ˤ��뤿
��ˤϰʲ��Τ褦���ѹ�����ɬ�פ�����ޤ���

  * (({RSS::Maker.make}))����������(({"atom"}))���ѹ�
  * maker.channel.author������
  * maker.channel.date������

�⤷��

  * ��Ԥ�Bob��
  * ���ä������������줿

Atom 1.0�ʤ�ʲ��Τ褦�ˤʤ�ޤ���

  require "rss"
  
  atom = RSS::Maker.make("atom") do |maker|
    xss = maker.xml_stylesheets.new_xml_stylesheet
    xss.href = "http://example.com/index.xsl"

    maker.channel.about = "http://example.com/atom.xml"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.channel.author = "Bob"
    maker.channel.date = Time.now

    maker.items.do_sort = true

    maker.items.new_item do |item|
      item.link = "http://example.com/article.html"
      item.title = "Sample Article"
      item.date = Time.parse("2004/11/1 10:10")
    end

    maker.items.new_item do |item|
      item.link = "http://example.com/article2.html"
      item.title = "Sample Article2"
      item.date = Time.parse("2004/11/2 10:10")
    end

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"

    maker.textinput.title = "Search Example Site"
    maker.textinput.description = "Search Example Site's all text"
    maker.textinput.name = "keyword"
    maker.textinput.link = "http://example.com/search.cgi"
  end

Atom 1.0�Ѥξ����ä������Υ�����ץȤ�ǽ��RSS 1.0���
�Ϥ��륹����ץȤ��᤹���ϡ�(({RSS::Maker.make}))������
����(({"1.0"}))���Ѥ�������Ǥ���Atom 1.0�Ѥ��ɲä��������
�������ɬ�פϤ���ޤ��󡣤�����ñ��̵�뤵��ޤ���

=== RSS/Atom���֥������Ȥ��Ѵ�����

�ե����ɤμ��बRSS 1.0/2.0�Ǥ�Atom�Ǥ�ѡ������뤿���API��
�ʲ��Τ褦�˶��̤Ǥ���

  feed = RSS::Parser.parse(feed_xml)

���������֤äƤ��륪�֥������Ȥ�RSS 1.0���֥�������
��RSS::RDF�ˤ��⤷��ޤ��󤷡�Atom���֥�������
��RSS::Atom::Feed�ˤ��⤷��ޤ��󡣤��Τ��ᡢ�ѡ����������
��Ȥ����ϥե����ɤμ����ռ����ʤ��ƤϤʤ����Ȥ��Ť餯��
��ޤ���

RSS Parser���󶡤�������ˡ�ϥ桼���˹��ߤΥե����ɤμ����
����Ǥ�餦�Ȥ�����ΤǤ����㤨�С��ʲ��Τ褦�ˤ���RSS 1.0
��RSS 2.0���Ѵ����뤳�Ȥ��Ǥ��ޤ���

o  require 'rss'
  rss10 = RSS::Parser.parse(rss10_xml)
  rss20 = rss10.to_feed("rss2.0")

���ब�狼��ʤ�ʣ���Υե����ɤ򰷤����ϰʲ��Τ褦�ˤ�����
�٤ƤΥե����ɤ�RSS 2.0�Τ褦�˰������Ȥ��Ǥ��ޤ���

  feeds.each do |xml|
    rss20 = RSS::Parser.parse(xml).to_feed("rss2.0")
    ...
  end

�ޤ���to_feed�ϰʲ��Τ褦�˽񤯤��Ȥ����ޤ���

  feed.to_rss("1.0") # == feed.to_feed("rss1.0")
  feed.to_rss("2.0") # == feed.to_feed("rss2.0")
  feed.to_atom("1.0") # == feed.to_feed("atom1.0")

�������Ѵ������Ȥ�������ˤʤ�Τϡ��Ѵ����Υ��֥������Ȥ���
����η�����ɬ�ܤξ������äƤ��ʤ����Ǥ������ξ����Ѵ�
�˼��Ԥ��ޤ���RSS::Error�Υ��֥��饹���㳰��ȯ�����ޤ��ˡ���
�Τ��ᡢŬ����ɬ�פʾ�����䤦ɬ�פ�����ޤ������Ȥ��С�RSS
1.0�Ǥϳ�item���Ǥ˥����ȥ뤬ɬ�ܤǤ�����RSS 2.0�ǤϾ�ά��ǽ
�Ǥ������Τ褦�ʾ����б����뤿��ˡ��ʲ��Τ褦�˥֥�å���
���Ѥ��뤳�Ȥ�����ޤ���

  rss10 = feed.to_rss("1.0") do |maker|
    maker.items.each do |item|
      item.title.content ||= "No title"
    end
  end

to_feed�Υ֥�å���ǽ���뤳�Ȥ����򤹤뤿��ˤϡ�to_feed��
�ɤΤ褦��ư��뤫�����򤹤�Ȥ褤�Ǥ����ѡ�����̤Υ��֥���
���Ȥϥե����ɤμ���˴ؤ�餺setup_maker�Ȥ����᥽�åɤ����
�Ƥ��ޤ�������ϡ���ʬ�����äƤ�������RSS Maker��Ϳ����᥽��
�ɤǤ���to_feed��RSS::Maker.make�Ǻ�ä�RSS Maker���Ф���
setup_maker��Ԥ���¾�η������Ѵ����褦�Ȥ��ޤ����֥�å��ˤ�
setup_maker��Ԥä����RSS Maker���Ϥ���ޤ����Ĥޤꡢ
to_feed�Υ֥�å���ǽ���뤳�Ȥ�RSS Maker���Ф��ƽ���뤳��
��Ʊ���Ǥ���

=== �ե����ɤη������Ѵ�����

�嵭����ˡ�ǥѡ����ѤߤΥ��֥������Ȥ��Ѵ��Ǥ���Τǡ��ե���
�ɤ�ۤʤ������XML���Ѵ����뤳�Ȥϴ�ñ�Ǥ���

  feed = RSS::Parser.parse(feed_xml)
  new_feed_xml = feed.to_feed("atom1.0").to_s

�����Ԥ�����������ʥ᥽�å�to_xml������ޤ���to_xml��Ȥ�
�Ȱʲ��Τ褦�˽�ľ�����Ȥ��Ǥ��ޤ���

  feed = RSS::Parser.parse(feed_xml)
  new_feed_xml = feed.to_xml("atom1.0")

���������ޤ��Ѥ��ޤ���͡�to_feed���Ѥ�������Ʊ���褦��
�֥�å�����ꤷ��RSS Maker�����뤳�Ȥ����ޤ����ޤ���
���Ѥ��ޤ���͡�

to_feed().to_s�ǤϤʤ���to_xml��Ȥ����Ȥˤϰ�Ĺ��û�������
����to_xml���Ѵ����Υե����ɤμ�����Ѵ���Υե����ɤμ��ब
Ʊ������ñ��to_s��ƤӽФ������Ǥ�������ˤ�ꡢƱ��������
�Ѵ��������®�٤�������ޤ���RSS Maker���ä��Ѵ����Ȥ���
���Ȥ��ά����Τ������Ǥ��ˡ����������֥�å�����ꤷ���Ѵ�
��η�̤�Ĵ�����뤳�Ȥ��Ǥ��ޤ����㤨�С��ʲ��Τ褦��RSS
1.0����RSS 2.0���Ѵ�������ϥ֥�å����ƤФ�ޤ���

  rss10.to_xml("rss2.0") do |maker|
    # maker�����Ǥ���
  end

���������ʲ��Τ褦��RSS 1.0����RSS 1.0���Ѵ����褦�Ȥ������
�ϥ֥�å��ϸƤӽФ���ޤ���

  rss10.to_xml("rss1.0") do |maker|
    # �֥�å����ƤӽФ���ʤ��Τ�maker�����Ǥ��ʤ���
  end

����API�˴ؤ��Ƥϡ��ɤ�������褤�Τ��ޤ�Ǻ��Ǥ��ޤ����⤷��
�ʤˤ������ǥ���������ж����Ƥ���������

== ����ץ�

RSS Parser�Υ���ץ륹����ץȤ򤤤��Ĥ��Ҳ𤷤ޤ���������
������ץȤ�sample/�ʲ������äƤ��ޤ���

=== ����ץ�1 - ���ܰ���

����Ǥϡ�ʣ���Υե����ɤ�ѡ�������item���Ǥ�ɽ�����륹����
�ץȤ�񤤤Ƥߤޤ��礦��

�ѡ�������ե����ɤϥե��������¸����Ƥ��ư�����Ϳ������
��ΤȤ��ޤ���

  require 'rss'
  ARGV.each do |fname|
    feed = nil
    begin
      feed = RSS::Parser.parse(File.read(fname), false)
    rescue RSS::Error
    end

    if feed.nil?
      puts "#{fname}��RSS 0.9x/1.0/2.0, Atom 1.0�Τ�����Ǥ⤢��ޤ���"
    else
      print_items(feed)
    end
  end

���Ȥ�print_items�Ȥ����᥽�åɤ������������Ǥ���

RSS::RDF/RSS::Rss/RSS::Atom::Feed/RSS::Atom::Entry�ˤ�������
�����items�Ȥ����᥽�åɤ��������Ƥ��ޤ���
RSS::RDF/RSS::Rss�ˤ�image�Ȥ����᥽�åɤ��������Ƥ��ޤ���

items�Ϥ��줾��ʲ����֤��ޤ���

  * RSS::RDF: ���Ƥ�/rdf:RDF/item���Ǥ�����
  * RSS::Rss: ���Ƥ�/rss/channel/item���Ǥ�����
  * RSS::Atom::Feed: ���Ƥ�/atom:feed/atom:entry���Ǥ�����
  * RSS::Atom::Entry: /atom:entry���ǤΤߤ��ޤޤ������

image�Ϥ��줾��ʲ����֤��ޤ���

  * RSS::RDF: /rdf:RDF/image����
  * RSS::Rss: /rss/channel/image����

�����Ǥϡ�items��ȤäƳƹ��ܤ�ɽ�����ޤ���

  def print_items(feed)
    feed.items.each do |item|
      puts "#{item.title} : #{item.description}"
    end
  end

����ϡ�RSS�ե����ɤ��Ф��ƤϤ��ޤ�ư���ޤ�����Atom�ե����ɤ�
�Ф��ƤϤ��ޤ�ư���ޤ��󡣤����Atom�ե����ɤˤ�description��
�Ǥ��ʤ�����Ǥ��������ǡ�Atom�ե����ɤ�RSS�ե����ɤ��Ѥ���
�������Ȥˤ��ޤ���

  def print_items(feed)
    convert_to_rss10(feed).items.each do |item|
      puts "#{item.title} : #{item.description}"
    end
  end

convert_to_rss10�ϰʲ��Τ褦�ˤʤ�ޤ���

  def convert_to_rss10(feed)
    feed.to_rss("1.0") do |maker|
      maker.channel.about ||= maker.channel.link
      maker.channel.description.content ||= "No description"
      maker.items.each do |item|
        item.title.content ||= "No title"
        item.link ||= "UNKNOWN"
      end
    end
  end

̤����β�ǽ�����������Ǥ˥ǥե�����ͤ����ꤷ�Ƥ��ޤ���

���Ϥ���ʸ�������ɤ��ѹ�����ˤ�output_encoding=���Ȥ��ޤ���
�⤷���Ѵ��Ǥ��ʤ����󥳡��ǥ��󥰤����ꤵ�줿����
RSS::UnknownConversionMethodError�㳰��ȯ�����ޤ���

������print_items��EUC-JP�ǽ��Ϥ���褦�˽񤭴����Ƥߤޤ��礦��

  def print_items(feed)
    rss10 = convert_to_rss10(feed)
    begin
      rss10.output_encoding = "EUC-JP"
    rescue RSS::UnknownConversionMethodError
    end
    rss10.items.each do |item|
      puts "#{item.title} : #{item.description}"
    end
  end

=== ����ץ�2 - ������ɽ��

����Dublin Core�⥸�塼���date°����Ȥäƹ������item��ɽ
�����Ƥߤޤ��礦��

�ǽ�˸��줿Dublin Core�⥸�塼������Ǥ˥�����������ˤ�
��dc_����̾�פȤ��������������Ѱդ���Ƥ��ޤ������Ƥ����Ǥ�
����˥�����������ˤϡ�dc_���Ǥ�ʣ�����ס�dc_rights��
dc_rights_list�ˤʤ�ޤ��ˤȤ��ޤ���

ʣ�����ǥ��������������ϡ����Ǥ����Ƥ�ɽ��ʸ����פǤϤʤ���
�����Ǥ�ɽ�����֥������ȡפ������֤�ޤ��������Ǥ�ɽ������
�������ȡפ�������Ǥ����Ƥ�ɽ��ʸ����פ��������ˤ�
(({content}))�᥽�åɤ䤽����̾�Ǥ���(({value}))�᥽�åɤ���
�Ѥ��ޤ��������Ǥ����Ƥ�ɽ��ʸ����פ����ꤹ��ˤ�
(({content=}))�᥽�åɤ䤽����̾�Ǥ���(({value=}))�᥽�åɤ�
���Ѥ��ޤ���

  rss.channel.dc_title  # => �����Ǥ����Ƥ�ɽ��ʸ�����
                        # ��"My site"�ʤɡ�

  rss.channel.dc_titles # => �����Ǥ�ɽ�����֥������ȡפ�����
                        # ��[DublinCoreTitle���֥�������, ...]��

  rss.channel.dc_titles.collect {|title| title.value}
                        # => �����Ǥ����Ƥ�ɽ��ʸ����פ�����
                        # ��["My site", ...]�ʤɡ�

  rss.channel.dc_titles.first.value == rss.channel.dc_title
                        # => true
  # ��̩�ˤϤ���
  first_title = rss.channel.dc_titles.first
  first_title = first_title.value if first_title
  first_title == rss.channel.dc_title
                        # => true

���ʤߤ�Syndication�⥸�塼������Ǥ˥�����������ˤϡ�sy_��
��̾�פȤ���������������Content�⥸�塼������Ǥ˥���������
��ˤϡ�content_����̾�פȤ��������������Ѱդ���Ƥ��ޤ���

����ץ�1��Ʊ���褦�˥ѡ�������RSS�ϥե��������¸����Ƥ���
������Ϳ�������ΤȤ��ޤ���

  require 'rss'
  items = []
  ARGV.each do |fname|
    rss_source = nil
    File.open(fname) do |f|
      rss_source = f.read
    end

    rss = nil
    begin
      rss = RSS::Parser.parse(rss_source, true)
    rescue RSS::Error
    end

    if rss.nil?
      puts "#{fname}��RSS 1.0�ǤϤ���ޤ���"
    else
      begin
        rss.output_encoding = "euc-jp"
      rescue RSS::UnknownConversionMethodError
      end
      rss.items.each do |item|
        items << item if item.dc_date
      end
    end
  end
  print_items(items)

���Ȥ�print_items�Ȥ����᥽�åɤ������������Ǥ���

Item#dc_date��Time���֥������Ȥ�nil���֤��ޤ���������
(({items}))�ˤ�dc_date��nil�ǤϤʤ���Τ����ޤޤ�Ƥ��ʤ���
���ʤΤǰʲ��Τ褦�˥����ȤǤ��ޤ���

  def print_items(items)
    items.sort do |x, y|
      y.dc_date <=> x.dc_date
    end.each do |item|
      puts "#{item.dc_date.localtime.iso8601} : #{item.title} : #{item.description}"
    end
  end

=== ����ץ�3 - ʣ���Υե����ɤ�֥���

TODO: sample/blend.rb�򸵤ˤ�������ץ��񤯡�

=== ����ץ�4 - �ե����ɤ��Ѵ�����

TODO: sample/convert.rb�򸵤ˤ�������ץ��񤯡�
