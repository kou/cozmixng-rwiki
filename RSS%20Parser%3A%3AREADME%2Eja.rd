# -*- rd -*-

= README.ja

$Id: README.ja 23 2005-04-07 06:38:01Z kou $

((*0.0.6�ޤǤ�ruby 1.8�Ǥ�ư�ruby 1.6��ư�����٤�10����
���Ǥ���ruby 1.8�ǻȤ�����0.0.7�ʹߤ�ȤäƤ���������*))

== ̾��

RSS Parser(Ruby/RSS�Ϥ��֤�ΤǻȤ�ʤ�)

== ���

Kouhei Sutou <kou@cozmixng.org>

== �饤����

Ruby's

== ���ꤤ

�⤦���������ܤ�RSS 0.9x/2.0��ѡ������褦�Ȼפ��ޤ������Τ�
�ᡤ���RSS 0.9x/2.0�Υƥ��ȥ���������Ƥ��ޤ���

== �᡼��󥰥ꥹ��

((<COZMIXNG RWiki - Ϣ����
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
�������������

== �Х��ȥ�å��󥰥����ƥ�

���ո�����˾�Զ��������Ϻ�ԤؤΥ᡼�롤�嵭�Υ᡼��󥰥�
���ȡ�RWiki�ؤν񤭹��ߤޤ���((<����
|URL:http://www.cozmixng.org/~kagemai/?project=rss;action=top>))
�����Ѳ�������

== �ʤˤ��졩

((<RSS(RDF Site Summary)
1.0|URL:http://web.resource.org/rss/1.0/>)), RSS 0.9x/2.0��
����������(�Х�ǡ������)�դ�(���뤤��̵��)�ǥѡ������ޤ���

����ץ�Ȥ��ơ�RSS��������Ƥ������Ƥ�ɽ������
((<tDiary|URL:http://www.tdiary.org/>))�Υץ饰�����դ���
���ޤ���

ruby��CVS HEAD�ˤ����äƤ��ޤ���

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

=== tDiary�˥��󥹥ȡ���

sample/tdiary_plugin�β��ˤ���rss-recent.rb��tDiary�Υץ饰
�����ѤΥǥ��쥯�ȥ�˥��ԡ������ꥷ��ܥ�å���󥯤�ĥ�ä�
�ꤷ�Ʋ�������

���Υץ饰����򥤥󥹥ȡ��뤹��Ȱʲ��Υ᥽�åɤ��Ȥ���褦
�ˤʤ�ޤ���

--- rss_recent(url, max=5, cache_time=3600)

     ((|url|))�ˤ���RSS��ѡ������ƺǽ�˸��줿���ܤΤ�����
     ��((|max|))���ܤ�ɽ�����ޤ���RSS��ѡ���������̤�
     ((|cache_time|))�å���å��夵��ޤ���

       * ((|url|)): RSS�Τ���URL
       * ((|max|)): ɽ��������ܿ�
       * ((|cache_time|)): RSS�򥭥�å��夷�Ƥ�������(��)

(({rss_recent}))�����椹��ʲ��Υ��ץ���󤬤���ޤ���

: @options['rss-recent.use-image-link']
     
   ���Υ��ץ����(({nil}))�ޤ���(({false}))�Ǥʤ���硤
   /rdf:RDF/image/url�ʤɡ���󥯻��˲����Ȥ��ƻȤ���褦
   �ʾ��󤬤���Ф������Ѥ��ޤ���
