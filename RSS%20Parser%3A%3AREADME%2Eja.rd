# -*- rd -*-

= README.ja

$Id: README.ja 247 2007-03-17 08:11:06Z kou $

== ̾��

RSS Parser

== ���

Kouhei Sutou <kou@cozmixng.org>

== �饤����

Ruby's

== ���

  * RSS Parser 0.1.7�ʹߤǤ�ruby 1.8.2�ʹߤǤʤ���ư���ޤ���
  * Atom�򥵥ݡ��Ȥ��Ƥ���Τ�RSS Parser 0.1.7�ʹߤǤ���
  * �С�������Ťͤ뤴�Ȥˤ�긷̩��ư���褦�ˤʤäƤ�
    �ޤ������ޤǤ�#to_s��RSS������줿��Τ���ʸ�����֤��
    ���ˤʤäƤ��뤫�⤷��ޤ��󡣤��ξ���#validate��Ƥ�
    �Ȥɤ������꤫�狼��Ǥ��礦��

== �ʤˤ��졩

((<RSS(RDF Site Summary)
1.0|URL:http://web.resource.org/rss/1.0/>))��RSS 0.9x/2.0
��0.90������ˡ�((<Atom
1.0|URL:http://www.ietf.org/rfc/rfc4287.txt>))������������
�ʥХ�ǡ��������դ��ʤ��뤤��̵���ˤǥѡ������ޤ���

ruby�����ۥե�����ˤ����äƤ��ޤ���

== ��¸�饤�֥��

  * XML�ץ���(((<RAA:REXML>))2.5.0�ʾ�ޤ���
    ((<RAA:xmlscan>))�ޤ���((<RAA:xmlparser>)))

=== ����Ф����饤�֥��

  * Iconv�Х���ǥ���
  * ((<RAA:Uconv>))

== ������ˡ

((<URL:http://www.cozmixng.org/~kou/download/rss.tar.gz>))

  % svn co http://www.cozmixng.org/repos/rss/trunk rss

== ���󥹥ȡ���

  % ruby setup.rb config
  % ruby setup.rb setup
  # ruby setup.rb install

���뤤��

  # ruby setup.rb

== FAQ

=== RSS 0.90��ѡ���������

RSS 0.90��RSS 1.0�Ȥ��ư����뤳�Ȥ⤢��ޤ����⤷��RSS 0.90
��ѡ������������ϡ��ʲ��Τ褦��RSS 1.0�Ȥ��ƥѡ������뤳
�Ȥ�����ޤ���

  def rss090_to_rss10(feed)
    feed.sub(%r{xmlns=(['"])http://my.netscape.com/rdf/simple/0.9/\1},
             'xmlns="http://purl.org/rss/1.0/"')
  end
  rss = RSS::Parser.parse(rss090_to_rss10(feed), false)

== ����

  * �����Ҥ�����: ������Х�����𤷤Ƥ���ޤ�����
  * ������ϯ����: �ɥ�����ȤΥХ�����𤷤Ƥ���ޤ�����
  * Chris Lee����: �Х�����𤷤Ƥ���ޤ�����
  * Ronald Pijnacker����: �Х�����𤷤Ƥ���ޤ�����
  * �����¹�����: �ɥ�����ȤΥХ�����𤷤Ƥ���ޤ�����
  * Christian W. Zuckschwerdt����: RSS 0.90�ΰ����ˤĤ��ƥ�
    �ɥХ������Ƥ���ޤ�����
