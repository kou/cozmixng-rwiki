# -*- rd -*-

= README.ja

$Id: README.ja 574 2005-05-20 13:56:34Z kou $

== ���

Kouhei Sutou <kou@cozmixng.org>

== �饤����

Ruby's

̵�ݾڤǤ���

== ���ꤤ

GalleryAdministrator��¿���첽���줿���եȥ������Ǥ�����������
�䤬����Ǥ��ʤ��������ܸ��(����äݤ�)�Ѹ�ʳ��Υ�å�����
���ѰդǤ��ޤ��󡥤��Τ��ᡤ���(���ä��ꤷ��)�Ѹ��ե��
�����Υ�å������ե��������Ƥ��ޤ���

== �᡼��󥰥ꥹ��

((<COZMIXNG RWiki - Ϣ����
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
�������������

== �Х��ȥ�å��󥰥����ƥ�

���ո�����˾�Զ��������Ϻ�ԤؤΥ᡼�롤�嵭�Υ᡼��󥰥�
���ȡ�RWiki�ؤν񤭹��ߤޤ���((<����
|URL:http://www.cozmixng.org/~kagemai/?project=gallery;action=top>))
�����Ѳ�������

== �ʤˤ��졩

((<RAA:RubyPhoto>))��
((<zphoto|URL:http://namazu.org/~satoru/zphoto>))�Υ᡼���
CGI�Υ��󥿡��ե������Ǥ���

����ˤϳ�ĥ��RubyPhoto����°���Ƥ���ޤ�����ĥ�ǤǤʤ���ư���ޤ���
�ޤ������ꥸ�ʥ�Υ���ץ����°���Ƥ��ޤ���

zphoto�ϡ��С������1.1�ʾ�Τ�Τ�Ȥ��Ȥʤ��褤�Ǥ���

ʣ���θ�����б����������꡼�������Ǥ��ޤ���

����ץ�Ȥ���(tDiary��)�ơ��ޤ�桼�����ѹ��Ǥ��륮���꡼
�Υƥ�ץ졼�Ȥ�JavaScript�������ѤΥ����꡼����������ƥ�
�ץ졼�Ȥ���°���Ƥ��ޤ���

== ��¸�饤�֥��

  * ((<RAA:RubyPhoto>))��(���������֤˴ޤޤ�Ƥ��ޤ���)
  * ((<RAA:RMagick>))�ޤ���((<RAA:Imlib2-Ruby>))�ޤ���
    ImageMagick�Υ��ޥ��(convert��identify)
  * ((<RAA:rss>))(���ܸ��Ȥ��ΤǤ����ɬ��)
  * Iconv�Х���ǥ��󥰤ޤ���((<RAA:Uconv>))(((<RAA:Uconv>))������������)
  * XML�ץ���(((<RAA:REXML>))2.5.0�ʾ�ޤ���
    ((<RAA:xmlscan>))�ޤ���((<RAA:xmlparser>)))

=== ����Ф����饤�֥��

  * ((<RAA:TMail>))(�᡼�륤�󥿡��ե�������Ȥ��ΤǤ����ɬ��)

=== ����Ф������

  * ((<zphoto|URL:http://www.namazu.org/~satoru/zphoto/>))

== ������ˡ

((<URL:http://www.cozmixng.org/~kou/download/gallery.tar.gz>))

  % svn co http://www.cozmixng.org/repos/ruby/gallery/trunk gallery

== ���󥹥ȡ���

  % ruby setup.rb config
  % ruby setup.rb setup
  # ruby setup.rb install

== ����

�����Ĥ��Υե�����򥳥ԡ�(cp)�ޤ��ϥ��(ln -s)���ơ�����
�ե�����(admin.rb��shared.xml)���Խ����Ƥ����������ʲ������
�ϥ��ԡ����Ƥ��ޤ���

=== CGI��

  % cp interface/admin.rb /HTTP�ǥ�����������ǥ��쥯�ȥ�/
  % cp sample/counter.rb /admin.rb��Ʊ���ǥ��쥯�ȥ�/
  % cp sample/{http,gallery}.conf /���ɥѥ����̤äƤ���ǥ��쥯�ȥ�/
  % cp sample/dot.htaccess /HTTP�ǥ�����������ǥ��쥯�ȥ�/.htaccess
  % cp sample/scripts/* /JS_PATH�����ꤷ���ǥ��쥯�ȥ�/
  % cp sample/dot.rubyphoto-ignore /ENV["HOME"]�����ꤷ���ǥ��쥯�ȥ�/.rubyphoto-ignore

���Ȥϡ�

  * admin.rb, httpd.conf, gallery.conf��������ѹ�
  * admin.rb��CGI�Ȥ��Ƽ¹ԤǤ���褦������ʼ¹Ը����ɲä�����ʤɡ�
  * admin.rb��GALLERY_DIR��GALLERY_DATA_DIR�˽񤭹����褦������

���Ʋ�������

=== �ƥ�ץ졼����

sample/templates/�ˤ����Ĥ��ƥ�ץ졼�Ȥ��Ѱդ��Ƥ���Τǹ����ʤ�Τ�
���򤷤Ʋ�������ʣ�����򤷤Ƥ⤫�ޤ��ޤ��󡥤����󡤼�ʬ�Ǻ�äƤ⤫
�ޤ��ޤ���

zphoto�ǻϤޤ�ƥ�ץ졼�Ȥ�zphoto�ѤΥƥ�ץ졼�Ȥˤʤ�ޤ���

  % cp -R sample/templates/�����ʥƥ�ץ졼�� /TEMPLATES_DIR�����ꤷ���ǥ��쥯�ȥ�/
  % cp sample/css/* /CSS�ѤΥǥ��쥯�ȥ�/
  % cp sample/images/* /����(����������)�ѤΥǥ��쥯�ȥ�/

���Ȥϳƥƥ�ץ졼�Ȥ�shared.xml��������ѹ����Ʋ�������

=== RubyPhoto��

   % cp sample/dot.rubyphoto-ignore /ENV['HOME']�����ꤷ���ǥ��쥯�ȥ�/

  * ���ܸ���

      % cp sample/album.xml.ja /�����꡼�Υǥ��쥯�ȥ�/album.xml.ja
      % cp sample/album.xml.ja /�����꡼�ǡ����Υǥ��쥯�ȥ�/album.xml.ja

  * �Ѹ���

      % cp sample/album.xml.en /�����꡼�Υǥ��쥯�ȥ�/album.xml.en
      % cp sample/album.xml.en /�����꡼�ǡ����Υǥ��쥯�ȥ�/album.xml.en

=== �᡼����

�᡼��ǲ�������Ƥ��������ϡ��ʲ��κ�Ȥ�ɬ�פˤʤ�ޤ���

  % cp sample/mail.conf /���ɥѥ����̤äƤ���ǥ��쥯�ȥ�/
  % cp interface/mail_admin.rb /�ɤ���/

ɬ�פʤ�С�

  % cp sample/dot.forward /�ۡ���ǥ��쥯�ȥ�/.forward

== �Ȥ�

�֥饦����admin.rb�˥����������Ʋ�������

== Tips

=== �����ԤΥѥ��������

"."�ϴ����Ը��¤���ä��桼���ˤʤ�ޤ����ʤΤǡ��ޤ����֥桼
����Ͽ�פ�"."�Υѥ���ɤ����ꤷ�Ʋ�������

=== �Хå����å�

GALLERY_DATA_DIR�����Хå����åפ����GALLERY_DIR����������
��HTML�ϴ���������Ǥ��ޤ����⤷��GALLERY_DIR�����Ƥ��ä���
���ޤä����ϰʲ��Τ褦�ˤ��Ʋ�������

  * GALLERY_DATA_DIR��GALLERY_DIR�˥��ԡ�

    % rm -rf GALLERY_DIR; cp -r GALLERY_DATA_DIR GALLERY_DIR

  * gallery.conf��ALWAYS_OUTPUT_ALL_HTML��true���ѹ�
  * admin.rb�ǡ�Ŭ���ʥ����꡼�ޤ��ϲ����������ʤɤ��ѹ���
    ����¸���롥

  * ���ʤ���֤�������Ȼפ��ޤ�����HTML����������ޤ�������
    ����Flash��¾����Υڡ����ؤΥ�󥯤���������ʤ��Ȼפ�
    �ΤǤ⤦����Ŭ���ʥ����꡼�ޤ��ϲ����������ʤɤ��ѹ���
    ����¸����Ȥ����Ǥ��礦������ˡ��ۡ���ڡ�����᡼�륢
    �ɥ쥹�ؤΥ�󥯤�����admin.rb�˥����󤷤��ͤΤ�Τˤ�
    ��Ϥ��ʤΤǡ��ơ��Υ桼���˥����󤷤Ƥ��ä�HTML���
    �������ʤ���Ф����ޤ���

�����󡤤���ޤ�򤷤��ʤ��Ǥ��͡�

=== ���󥽡��뤫�饢�åץǡ���

sample/initgallery.rb��Ȥ��ޤ���

  % initgallery.rb --config-file gallery.conf�ؤΥѥ� --lang .ja

�㤨�С�gallery.conf��~gallery/site/gallery.conf�ˤ������
����ʴ�����

  % initgallery.rb --config-file ~gallery/site/gallery.conf --lang .ja

�ʹԾ�����ɽ���������ä���--verbosity 3����ꤹ�롥

  % initgallery.rb --config-file ~gallery/site/gallery.conf --lang .ja --verbosity 3

���ʤߤˡ��Ѹ��ѤΥ����꡼�򹹿�����������--lang .en���
���Ѥ�--lang .ja.i����ꤷ�Ƥ���������

== ����

  * ���Ф�����: ��������ΥХ���ݡ��Ȥȡ������Ĥ��Υѥå���
    ĺ���ޤ��������꤬�Ȥ��������ޤ���
