# -*- rd -*-

= README.ja

$Id: README.ja 14 2004-09-14 05:23:13Z kou $

== ̾��

Cutter

== ���

Kouhei Sutou <kou@cozmixng.org>

== �饤����

LGPL

== �᡼��󥰥ꥹ��

((<COZMIXNG RWiki - Ϣ����
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
�������������

== �ʤˤ��졩

((<CUnit|URL:http://www.gethos.net/opensource/cunit>))���¤
����C�Τ����Unit Testing Framework�Ǥ���CUnit����°���Ƥ���
�ɥ�����Ȥ�CUnit/�ʲ��ˤ���ޤ���

�ƥ��Ȥ�ͭ�饤�֥��Ȥ��ƺ�������Τ���Ĺ�Ǥ���

== ��¸�饤�֥��

�ä�̵��

=== ����Ф褤���

  * ((<GaUnit|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=GaUnit>))
    ���դ��Ƥ���run-test.el��Emacs��ǳڤ˥ƥ��Ȥ���������

== ������ˡ

((<URL:http://www.cozmixng.org/~kou/download/cutter.tar.gz>))

  % svn co http://www.cozmixng.org/repos/c/cutter/trunk cutter

== ���󥹥ȡ���

  % ./configure
  % make
  # make install

== �Ȥ���

  % cutter [���ץ����] [libtest_*.so������ǥ��쥯�ȥ�]

=== ���ץ����

: -vLEVEL, --verbose=LEVEL

   ���Ϥξܺ٤�����ꤷ�ޤ���LEVEL�ˤ�silent, normal,
   progress, verbose������Ǥ��ޤ��ʤ��줾��s, n, p, v�Ǥ�ġˡ�
   �������ۤɾܺ٤ˤʤ�ޤ���
   
: -bBASE, --base=BASE
   
   �ƥ��Ȥ����Ԥ������˥ե�����̾������BASE���ղä��ޤ���
   Cutter�ν��Ϥ���ƥ��Ȥ����Ԥ����ս�˥����פ���ġ���
   ��Emacs�ʤɡˤ�Ϣ�Ȥ��뤿��ε�ǽ�Ǥ���

== �ƥ��Ȥκ����

�ƥ��Ȥμ¹Ԥϰʲ��Τ褦��ή��ˤʤ�ޤ���

  (1) �ƥ��Ȥ��������
  (2) ����ѥ��뤷��libtest_*.so���������
  (3) cutter��ư����libtest_*.so���ɤ߹��ޤ����ƥ��Ȥ򤹤�

�ܤ�����Tutorial.ja�򻲹ͤˤ��Ʋ�������

== ��ե����

=== ɽ��

UT_ASSERT*�ΰ����Ǥ��������ˤ���(({message}))��ɽ�������Ԥ���
����ɽ������ޤ���

--- UT_PASS
    
    ɬ���ѥ����ޤ���

--- UT_FAIL(message)
    
    ɬ�����Ԥ��ޤ���

--- UT_ASSERT(expect, message)
    
    (({expect}))��0�ʳ��ʤ�ѥ����ޤ���

--- UT_ASSERT_EQUAL_INT(expect, actual, message)
    
    (({expect}))��(({actual}))����������Хѥ����ޤ����ɤ���
    ��int�����뤤�Ϥ��ΰ����long�Ȥ��ˤǤ���ɬ�פ�����ޤ���

--- UT_ASSERT_EQUAL_FLOAT(expect, actual, message)
    
    (({expect}))��(({actual}))����������Хѥ����ޤ����ɤ���
    ��float�����뤤�Ϥ��ΰ����double�Ȥ��ˤǤ���ɬ�פ�����
    �ޤ���

--- UT_ASSERT_EQUAL_STRING(expect, actual, message)
    
    (({expect}))��(({actual}))��Ʊ�����Ƥ�ʸ����Ǥ���Хѥ�
    ���ޤ���

=== ����

�ƥ��Ȥο����ϰʲ��Τ褦�ˤʤ�ޤ���

  #include <cutter/cutter.h>
  
  #include "��ʬ�Υץ����Υإå��ե�����"
  
  UT_DEF(�ƥ���̾1)
  {
    UT_ASSERT�ʤ�Ȥ�;
    ...
    UT_PASS; /* �����ޤ��褿��ƥ��Ȥ˥ѥ������Ȥ������� */
  }
  
  UT_DEF(�ƥ���̾2)
  {
    ...
  }
  
  ...
  
  /* �ƥ��Ȥ���Ͽ */
  UT_REGISTER_BEGIN("�ƥ������Τ�̾��") /* ;���դ��ʤ� */
  UT_REGISTER(�ƥ���̾1, "�ƥ��Ȥ�����") /* ;���դ��ʤ� */
  UT_REGISTER(�ƥ���̾2, "�ƥ��Ȥ�����") /* ;���դ��ʤ� */
  ...
  UT_REGISTER_END

