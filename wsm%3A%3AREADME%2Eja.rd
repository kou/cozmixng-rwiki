# -*- RD -*-

= README.ja

$Id: README.ja 50 2004-06-24 16:24:15Z kou $

== ���

  * Kouhei Sutou <kou@cozmixng.org>
  * ��ƣ���� <shuetsu@star.odn.ne.jp>

== �饤����

GPL or BSD License

== �᡼��󥰥ꥹ��

((<COZMIXNG RWiki - Ϣ����|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))�������������

== �ʤˤ��졩

�ʤ�Ƥ��ȤϤʤ�Wiki���󥸥�Ǥ���

== ��¸�饤�֥��

  * ((<Gauche|URL:http://www.shiro.dreamhost.com/scheme/gauche/>)) >= 0.7.4
  * ((<esm|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=esm>))
  * ((<dsm|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=dsm>))
  * ((<marshal|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=marshal>))

== ������ˡ

((<URL:http://www.cozmixng.org/~kou/download/wsm.tar.gz>))

  % svn co http://www.cozmixng.org/repos/wsm/trunk wsm

== ���󥹥ȡ���

  # gosh install/install.scm

��˥塼���ݲ�(���ߤ����ܸ�ȱѸ�Τ�)�������ʤ�po/#{����}.po��
/usr/share/locale/#{����}/LC_MESSAGES/wsm.po�Ȥ��ƥ��ԡ����Ƥ���
������

��:
  # cp po/ja.po /usr/share/locale/ja/LC_MESSAGES/wsm.po

�⤷��������/usr/share/locale/����ʤ���
/usr/local/share/locale/���⤷��ޤ���

== �Ȥ�

bin/wsm-server.scm��ư

  % bin/wsm-server.scm

bin/cgi.scm��CGI�Ȥ��Ƽ¹Ԥ����֥饦�����饢����������

��:

  % mkdir -p ~/public_html/wsm/
  % cp bin/cgi.scm ~/public_html/wsm/index.cgi
  % chmod +x ~/public_html/wsm/index.cgi

== WiLiKi����wsm�ذܹ�

sample/wiliki2wsm.scm��Ȥ���WiLiKi�Υǡ�����wsm�Υǡ���(1�ڡ�
��1�ե��������)���Ѵ��Ǥ��ޤ���

  % gosh sample/wiliki2wsm.scm <WiLiKi��db�Υѥ�> <wsm�Υǡ�����base-path>
