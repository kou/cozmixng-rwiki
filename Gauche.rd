= Gauche

Guahce�ط��κ�ȵ�Ͽ

== Gauche

=== ports�ǥ��󥹥ȡ���

  %  sudo /usr/local/sbin/portupgrade -N -m "GAUCHE_THREADS=pthreads GAUCHE_ENCODING=euc-jp" gauche

gauche-gdbm��<gdbm.h>�����Ĥ���ʤ��Τǥ���ѥ��뤵��ʤ������Ĥ���ʤ���ͳ��(g)cc��include path��/usr/local/include���ޤޤ�Ƥ��ʤ����顥

�Ȥ������Ȥ�lang/gauche/Makefile���ѹ�

  CONFIGURE_ARGS= --enable-threads=${GAUCHE_THREADS} \
  -    --enable-multibyte=${GAUCHE_ENCODING}
  +    --enable-multibyte=${GAUCHE_ENCODING} \
  +    --with-iconv-lib=iconv \
  +    --with-local=${PREFIX}


include path��(g)cc�������ߤʤΡ�����ե�������ɤ���ꤷ�Ƥ���櫓�ǤϤʤ��Ρ�

=== ���̤˥��󥹥ȡ���

(1) ������
     http://www.shiro.dreamhost.com/scheme/gauche/download-j.html
     http://prdownloads.sourceforge.net/gauche/Gauche-0.6.7.1.tgz
(2) confiugre���ץ����
     ./configure --enable-multibyte=euc-jp --with-iconv=/usr/local --with-local=/usr/local
(3) ��Ū��memo
    * make test ����ư����ǧ���뤳��
    * enable-multibyte=euc-jp��default. FreeBSD ��configure ��utf-8 ����ꤷ�Ƥ��롥
    * enable-multithread=no ��FreeBSD��default.
      * FreeBSD�Ǥ�Boehm GC ��pthread safe �ǤϤʤ��餷��
      * Lisp�Ǥ�BoehmGC �Ȥ����������
      * make test ��thread ��pass�����Ǥ�����

== WiLiKi

=== CVS�Τ򥤥󥹥ȡ��� by ((<kou>))

  # cd /usr/local/share
  # cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/wiliki login
  # cvs -z3 -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/wiliki co WiLiKi
  # cd WiLiKi
  # ./DIST gen
  # ./configure
  # make
  # make install

wiliki.cgi�Ȥ���src�ʲ��ˤ��롥

=== ���󥹥ȡ��� by ((<szk>))

WiLiKi-0.3 �򥤥󥹥ȡ��뤷�ޤ�������������

(1) ������
     http://www.shiro.dreamhost.com/scheme/wiliki/wiliki.cgi?WiLiKi%3aRSSMix&l=jp
     http://prdownloads.sourceforge.net/gauche/SXML-gauche-0.9.tgz
(2) ���󥹥ȡ������

     `gauche-config --sitelibdir`

(1) wiliki.cgi, rssmix.cgi, wiliki-sample.css �Ϥޤ� ~suzuki/gauche/WiLiKi/src �β�

(2) �ޤ�rssmix.cgi ��ư���ޤ��󡥤ϤƤʡ�
    �ޤ� gauche �����ޤ��Ȥ��ʤ��������ϥå����� debug��
    * --enable-multithread=no��configure����Ƥ����Τ�, RSS�򽸤�뤿���thread ����Ȥ����not implemented �� error ��raise.
    * cgi-main �� :on-error ��error ��catch����ERROR �ڡ�����ɽ������롥
    * ports��Makefile �ˤ� BoehmGC��FreeBSDpthread�����ܤ餷���Ƚ񤤤Ƥ��롥
    * �Ǥ� multithread ��configure���ơ�ư�����Ƥߤ�����thread ��ư���褦������RSS�ϥ��åȤǤ���������ޤ�ˡ�����
    * ���θ�Ĵ�٤��顤thread�����http-get������äƤ��Ƥ��ʤ���褦�����Ǥϡ�HTTP ��GET������˽���äƤ���褦�˸����롥�Ϥơ�
    * thread ���Ƥߤ��RSS�ϤȤ��褦�ˤʤ뤬��SXML�ǥ��顼��
