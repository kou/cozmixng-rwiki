# -*- rd -*-

= README.ja

$Id: README.ja 563 2005-02-28 00:43:34Z kou $

== ̾��

gdchart

== ���

Kouhei Sutou <kou@cozmixng.org>

== �饤����

Ruby's

== �᡼��󥰥ꥹ��

((<COZMIXNG RWiki - Ϣ����
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
�������������

== �ʤˤ��졩

((<GDChart|URL:http://www.fred.net/brv/chart/>))��Ruby�Х���
�ǥ��󥰤Ǥ���Ruby��C�Υ��󥿡��ե�������
((<SWIG|URL:http://www.swig.org/>))���������Ƥ��ޤ���

Ʊ�ͤΤ�Τˡ�((<RAA:ruby-gdchart>))������ޤ���

== ��¸���Ƥ�����

  * ((<GD|URL:www.boutell.com/gd/>))
  * ((<GDChart|URL:http://www.fred.net/brv/chart/>))
  * ((<SWIG|URL:http://www.swig.org/>))

=== ����Ф褤���

GDChart�⤳�������Ѥ��ƥ���ѥ��뤵��Ƥ���ɬ�פ�����ޤ���

  * ((<libfreetype|URL:http://sourceforge.net/projects/freetype/>))
    �����ܸ�򰷤��������ɬ�ܡ�
  * ((<libjpeg|URL:http://www.ijg.org/>))

== ������ˡ

((<URL:http://www.cozmixng.org/~kou/download/gdchart.tar.gz>))

  % svn co http://www.cozmixng.org/repos/ruby/gdchart/trunk gdchart

== ���󥹥ȡ���

  % ruby setup.rb config

�⤷�����󥯥롼�ɥѥ����ɲä�������аʲ��Τ褦�ˤ��Ƥ�����
����

  % ruby setup.rb config -- -I�ѥ�1 -I�ѥ�2 ...

���ȤϤ��Ĥ��̤�Ǥ���

  % ruby setup.rb setup
  # ruby setup.rb install

== �Ȥ���

sample/�ʲ��򻲹ͤˤ��Ƥ��������������ʤ������ܤ������Ȥ�
��ǽ񤭤ޤ������֤�

���ܸ�򰷤���������sample/*_ja.rb�����ͤˤʤ�Ȼפ��ޤ���


���ΤȤ���ϡ��Ȥꤢ������~/.irbrc�˰ʲ��Τ褦�˽񤤤�TAB��
�᥽�å�̾���䴰���Ƥ��ޤ����Ƥ��Ƥ���������

  require 'irb/completion'

�㤨�С��ߥ���դ�������������ϰʲ��Τ褦�ˤ���Ȥ褤����
����ޤ���

  % irb -r gdchart/pie
  irb(main):001:0> pie = GDChart::Pie.new
  irb(main):002:0> pie.[TAB]


���뤤�ϡ�lib/gdchart/base.rb�Ȥ�lib/gdchart/graph.rb�Ȥ�
lib/gdchart/pie.rb�ΰʲ��Υ����Ȥ��񤫤줿��ʬ��겼�ΤȤ�
��򸫤�Ȥ褤���⤷��ޤ���

  # _
  ### method generation

=== ���ܸ��Ȥ��Ȥ������

��Ϥꡤ�礷�����ȤϽ񤫤ʤ��ΤǤ��������ܸ��Ȥ��Ȥ��ϰʲ�
�Τ��Ȥ���դ��Ƥ���������

  * ʸ�������ɤ�UTF-8�ˤ��Ƥ���������GD�Υ���ѥ���λ�����
    ��ä��Ѥ�äƤ��뤫��ˡ�

  * �ե���Ȥ����ܸ��TrueType�ե���Ȥ���ꤷ�Ƥ���������

  * �ե���Ȥ����Ǥʤ���������size����ʤ���ptsize�����ˤ��
    �ꤷ�Ƥ���������
    
    �㤨�С�����դΥ����ȥ�����ꤹ����ϰʲ��Τ褦�ˤ���
    ����
    
      graph = GDChart::Graph.new
      graph.title = "�����Ȥ�"
      graph.title_font = ".../mikachan.ttf"
      graph.title_ptsize = 20.0

== ����

  * Markus����: �Х���𤷤Ƥ���ޤ�����
