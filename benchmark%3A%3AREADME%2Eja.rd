# -*- rd -*-

= README.ja

$Id: README.ja 169 2004-06-12 14:52:24Z kou $

== ���

Kouhei Sutou <kou@cozmixng.org>

== �饤����

GPL or BSD License

== �᡼��󥰥ꥹ��

((<COZMIXNG RWiki - Ϣ����|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))�������������

== �ʤˤ��졩

ruby��ɸ��ź�դ���Ƥ���benchmark.rb�򻲹ͤ˺��줿���٥��
�ޡ����饤�֥��Ǥ���

== ������ˡ

((<URL:http://www.cozmixng.org/~kou/download/benchmark.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/benchmark/trunk benchmark

== ���󥹥ȡ���

  # gosh install/install.scm

== ����ˡ

��ñ�ʻȤ����ϰʲ����̤�Ǥ���

  (use benchmark)

  (bm (lambda (r)
        (report r (lambda () �٥���ޡ�����Ȥꤿ�����Ȥ򤳤��Ǥ���))
        ...))

����Ū�ʻȤ����ϡ�sample/�ʲ��򸫤Ƥ���������
