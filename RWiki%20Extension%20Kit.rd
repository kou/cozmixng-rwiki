= RWiki Extension Kit

�ѥå�������
((<��������|URL:http://www.cozmixng.org/~kou/download/rwiki-ext-0.0.1.tar.gz>))
���ʥåץ���åȤ�

  % svn co http://www.cozmixng.org/repos/ruby/rwiki-ext/trunk

�Ǥɤ�����

== �ۤʤä�RWiki�֤ǤΥڡ����Υ��ԡ�

SOAP���Ѥ��롥

=== ���󥹥ȡ�����ˡ

�� : ((<RAA:SOAP4R>)) >= 1.4.8 and (((<RAA:XMLParser>)) or ((<RAA:REXML>)))

((<RAA:xmlscan>))�Ǥ�OK�������ʤ��Ȥ�((<RAA:NQXML>))�Ǥϥ��ᡣ���󥳡��ǥ��󥰤�ʬ��UTF-8����EUC-JP���Ѵ����ʤ��㤤���ʤ����顣���֤�

  require 'rwiki/soap'

=== ����ˡ

  (1) ��¦�Υ�˥塼��[((<SOAP|soap>))]�ذ�ư
  (1) ���ԡ����ڡ��������ԡ����ڡ����Τ���RWiki������(dRuby������)����³����SOAP�����С����ԡ�(�ɲ�)��ڡ���(��ά����ȥ��ԡ����ڡ������������Ȥߤʤ����)�����
  (1) copy�ޤ���append�ܥ���򲡤�
  (1) ���ԡ�(�ɲ�)��ڡ������Խ�����submit

=== Known Bugs

  * ¸�ߤ��ʤ��ڡ����򥳥ԡ����ڡ����Ȥ��ƻ��ꤹ��ȥ����Ф���³�Ǥ��ʤ��ȸ����롣

== �ۤʤä�Wiki��Recent��ɽ��

���󥹥ȡ��뤹��ȥ�˥塼��[RSS 1.0], [RSS Recent], [RSS Topic]�Ȥ�����˥塼�������ޤ���

  * [RSS 1.0]��[Recent]�ξ��15���RSS 1.0�����ǽ��Ϥ��ޤ���
  * [RSS Recent]��RSS 1.0��������ƹ������ɽ�����ޤ���
  * [RSS Topic]�ϳƥڡ�����ɽ�������ȥԥå�������򤷤ޤ���

You can find [RSS 1.0], [RSS Recent] and [RSS Topic] menus over each page when you can success installation.

  * [RSS 1.0] output top 15 of [Recent] as RSS 1.0.
  * [RSS Recent] collect RSS 1.0s and display those items with sort by update time.
  * [RSS Topic] do settings of a topic of displaying each page.

==== Customize

You can change some default settings. For example expire of cache and so on.

If you want to customize, define below constants:

  * RWiki::RSS::MINIMUM_EXPIRE (minimum cache expire(second) | default : 60 * 60)
  * RWiki::RSS::EXPIRE (default value of cache expire(second) | default : 2 * 60 * 60)
  * RWiki::RSS::DISPLAY (display or not | default : true)
  * RWiki::RSS::DISPLAY_NUMBER (display number | default : 5)
  * RWiki::RSS::DISPLAY_CHARACTERS (display characters | default : 20)
  * RWiki::RSS::TRUE_VALUES (array of value that is recognized true | default : ["�Ϥ�", "yes", "true"] | ��((<"�Ϥ�">))�� is "yes" in Japanese)

before

  require 'rwiki/rss'

=== ���󥹥ȡ�����ˡ

��: ((<RAA:rss>))

  require 'rwiki/rss'

=== Install to RWiki

Require: ((<RAA:rss>))

Add bellow to your rwiki.rb.

  require 'rwiki/rss'

=== TIPS

����å����ͭ�����¤κǾ��ͤʤɤ��ѹ���������Ǥ��ޤ���

�ѹ�����ˤ�

  require 'rwiki/rss'

��������

  * RWiki::RSS::MINIMUM_EXPIRE (���㥭��å������(��) | �ǥե���� : 60 * 60)
  * RWiki::RSS::EXPIRE (����å�����֤Υǥե������(��) | �ǥե���� : 2 * 60 * 60)
  * RWiki::RSS::DISPLAY (ɽ�����뤫�ɤ��� | �ǥե���� : true)
  * RWiki::RSS::DISPLAY_NUMBER (ɽ�������� | �ǥե���� : 5)
  * RWiki::RSS::DISPLAY_CHARACTERS (ɽ������ʸ���� | �ǥե���� : 20)
  * RWiki::RSS::TRUE_VALUES (����ǧ������ʸ��������� | �ǥե���� : ["�Ϥ�", "yes", "true"])

�Ȥ��������������Ƥ���������

You can change some default settings. For example expire of cache and so on.

If you want to customize, define below constants:

  * RWiki::RSS::MINIMUM_EXPIRE (minimum cache expire(second) | default : 60 * 60)
  * RWiki::RSS::EXPIRE (default value of cache expire(second) | default : 2 * 60 * 60)
  * RWiki::RSS::DISPLAY (display or not | default : true)
  * RWiki::RSS::DISPLAY_NUMBER (display number | default : 5)
  * RWiki::RSS::DISPLAY_CHARACTERS (display characters | default : 20)
  * RWiki::RSS::TRUE_VALUES (array of value that is recognized true | default : ["�Ϥ�", "yes", "true"] | ��((<"�Ϥ�">))�� is "yes" in Japanese)

before

  require 'rwiki/rss'

== ImportWiki

�ۤʤ�Wiki�Υڡ����򤳤�RWiki�Ǳ���/�Խ����ޤ���

=== ���󥹥ȡ�����ˡ

  require 'rwiki/importwiki'

ɬ�פ˱�����

  require 'rwiki/importrwiki'

�Ȥ�

  require 'rwiki/importwiliki'

�Ȥ���

=== TIPS

  * ��ҤΥ��ԡ���ǽ�Ȥ��碌�ƻȤ��ȡ��긵��RWiki�Υڡ�����¾��Wiki�˥��ԡ��Ǥ��롣

    ������ϡ�To:��ImportWikiName��񤯤��������Ȥ��С�((*WiLiKi:COZMIXNG:�ƥ���*))�Ȥ���


== ��˥塼��̾�����ѹ�

(�����Ǥ�)���˽ФƤ����˥塼̾���ѹ����ޤ�

=== ���󥹥ȡ�����ˡ

  require 'rwiki/rename-menu'

�ʲ���((|book|))��RWiki::Book���֥������ȡ�

  substitution_table = {
  	"Home" => "�ۡ���/Home",
  	"Info" => "����/Info",
  	"Map" => "�ޥå�/Map",
  	"Recent" => "�Ƕ�ι���/Recent",
  	"List" => "�ڡ�������/List",
  	"Page Rank" => "���Ⱦ���/Page Rank",
  	"Orphan" => "��Ω�ڡ���/Orphan",
  	"Like" => "�����ȥ븡��/Like",
  	"Concat" => "���/Concat",
  	# navi labels
  	"link" => "���/Link",
  	"src" => "������/Src",
  	"edit" => "�Խ�/Edit",
  	"help" => "�إ��/Help",
  	"search" => "����/Search",
  }

  book.rename_menu(substitution_table)

== WikiLink

Wiki��Хå�����ɤȤ�����󥯥����ƥ�

=== ���󥹥ȡ���

  require 'rwiki/link'

  RWiki::LinkSystem.install("WikiLink", "Link", "Category")

�����WikiLink�Ȥ����ڡ�����WikiLink�Ȥʤ롥�狼��Ť餤�ʡ�

=== ���

  * ��󥯤Υڡ��������Ǥ���褦�ˤ��롥

    * ������[2003-10-09]

      �����ȥ��������ä��Ⱥ������롥

  * �ڡ����˥����󥿤��դ����ɤ������Ƥ���ڡ�����ʬ����褦�ˤ��롥

    ����ϡ��ڡ�������������˥ڡ�����񤭴����Ƥ����Ф���������revision�Ϥ����������Ƥ��ޤ����ɡ�Last-modified���Ѥ�뤫��ï�����������ȤϤ�����ʬ���롥

    * ������[2003-10-09]
