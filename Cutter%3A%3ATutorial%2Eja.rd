# -*- rd -*-

= Tutorial.ja

$Id: Tutorial.ja 17 2004-09-14 06:47:53Z kou $

== ������

�ޤ����ƥ��Ȥ�������뤿��β������򤷤ޤ���
((<GaUnit|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=GaUnit>))
���դ��Ƥ���run-test.el��Ȥ��Ȳ��ꤷ���ä�ʤ�ޤ���

����ϡ���§�黻��Ԥ��ץ�����������ޤ���

=== �ǥ��쥯�ȥ깽��

�ޤ����ץ�����������뤿��Υǥ��쥯�ȥ���Ѱդ��ޤ�����
���calc�Ȥ��ޤ��礦��

  % cd ~/work/c/ # �Ȥ��ץ��������ѥǥ��쥯�ȥ�˰�ư
  % mkdir calc
  % cd calc

³���ơ�calc/�ǥ��쥯�ȥ�ʲ��˥ץ�����ѥǥ��쥯�ȥ�src/
�ȡ��ƥ��ȥץ�����ѥǥ��쥯�ȥ�test/��������ޤ���

  [calc]% mkdir src
  [calc]% mkdir test

�Ĥޤꡤ�ǥ��쥯�ȥ깽���ϰʲ��Τ褦�ˤʤ�ޤ���

  calc/ -+- src/ �������ե�������֤�
         |
         +- test/ �ƥ����ѤΥե�������֤�

=== �ƥ��ȵ�ư�μ�ư��

�ǥ��쥯�ȥ깽�������褿�Τǡ����ˡ��ƥ��Ȥ�ư��ư������
����Υե������������ޤ���

�ޤ����ƥ��ȵ�ư�ѥ�����ץ�calc/test/run-test.sh���������
�������Ƥϰʲ��Τ褦�ˤ��ޤ���make��GNU Make��Ȥ��褦�ˤ���
���������������ƥ�ˤ�äƤ�gmake�Ȥ������ޥ�ɤǥ��󥹥ȡ�
�뤵��Ƥ��뤫�⤷��ޤ���Ŭ���ѹ����Ƥ���������

  #!/bin/sh
  make test

�¹Ը����դ���Τ�˺��ʤ��Ǥ���������

  [calc]% chmod +x test/run-test.sh

���ˡ�calc/Makefile��������ޤ������Ƥϰʲ��Τ褦�ˤ��ޤ���

  include Makefile.test

calc/Makefile.test�ϡ�$PREFIX/share/cutter/Makefile.test��
��$PREFIX��./configure����--prefix�ǻ��ꤷ���͡ˤ򥳥ԡ�����
���ޤ������뤤�ϡ��������������sample/calc/Makefile.test��
���ԡ����Ƥ�褤�Ǥ���

�Ȥ������Ȥǡ����ߤϰʲ��Τ褦�ʹ����ˤʤäƤ���Ϥ��Ǥ���

  calc/ -+- Makefile <- ����
         |
         +- Makefile.test <- ���ԡ�
         |
         +- src/
         |
         +- test/ -+- run-test.sh <- ����


== �ƥ��Ȥκ���

�ƥ��Ȥ�test/�ʲ���test_XXX.c�Ȥ���̾���Ǻ������ޤ��������
test/test_calc.c�Ȥ��ƥƥ��Ȥ�񤭤ޤ��礦��

�ޤ���­�����Υƥ��Ȥ�񤭤ޤ���

  #include <cutter/cutter.h>
  
  #include "calc.h"
  
  UT_DEF(add_test)
  {
    UT_ASSERT_EQUAL_INT(3, add(1, 2), "1 + 2");
    UT_PASS;
  }
  
  UT_REGISTER_BEGIN("calc test")
  UT_REGISTER(add_test, "add test")
  UT_REGISTER_END

���Υƥ��ȤǤϡ�(({add(1, 2)}))�η�̤�(({3}))�ˤʤ뤫��ƥ�
�Ȥ��Ƥ��ޤ�������Ǥϡ�run-test.el��ȤäƤ������C-cC-t
�ǥƥ��Ȥ�¹Ԥ��Ƥߤޤ��礦���ȤäƤ��ʤ����ϰʲ��Υ��ޥ�
�ɤǥƥ��Ȥ�¹Ԥ��ޤ���

  [calc]% test/run-test.sh

�ʲ��Τ褦�ʷ�̤ˤʤ�Ǥ��礦��

  Need to run make depend
  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG test/test_calc.c | sed -e 's,^\(.*\):,test/\1:,' > .depend.test
  cat .depend.src .depend.test > .depend
  rm .depend.src .depend.test

����ϡ��ե�����֤ΰ�¸�ط���ư�׻����Ƥ��ޤ���ɬ�פʤȤ�
�ʺ��Τ褦�˥ե��������������Ȥ����ѹ����줿�Ȥ��ˤ˼�ư��
�¹Ԥ���ޤ���

��¸�ط����׻����줿�ΤǤ⤦����C-cC-t�ǥƥ��Ȥ��Ƥߤޤ��礦��

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include` -o test/test_calc.o -c test/test_calc.c
  test/test_calc.c:3:18: calc.h: No such file or directory
  test/test_calc.c: In function `add_test':
  test/test_calc.c:7: warning: implicit declaration of function `add'
  gmake: *** [test/test_calc.o] ���顼 1

calc.h���ʤ��Τǥ���ѥ��륨�顼�ˤʤäƤ��ޤ����Ȥ������Ȥǡ�
src/calc.h��������ޤ��礦��

  int add(int x, int y);

���ä���Ȥ�������ˤ��Ƥ�褤�Ǥ���

  #ifndef CALC_H
  #define CALC_H

  int add(int x, int y);

  #endif

����Ǥϡ�C-cC-t�ǥƥ��Ȥ����餻�ޤ��礦��

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include` -o test/test_calc.o -c test/test_calc.c
  gcc -L./ -shared -o test/libtest_calc.so test/test_calc.o
  cutter -vp
  dlopen() failed: ./test/libtest_calc.so: Undefined symbol "add"
  Assertion ((null)) failed load.c:43
  gmake: *** [do-test] Abort trap (��������פ��ޤ���)
  rm test/test_calc.o

(({add}))���������Ƥ��ʤ��Τ�core���Ǥ��ƽ�λ���ޤ�������
��Ǥϡ�src/calc.c��(({add}))�������񤭤ޤ��礦���ƥ��Ȥ�
��(({add})) ��(({1})), (({2}))������Ȥ��Ƽ�����ä��顤
(({3}))���֤����ȤˤʤäƤ��ޤ�����

  #include "calc.h"

  int
  add(int x, int y)
  {
    return 3;
  }

­�������Ƥ��ʤ��Ȼפ����⤷��ޤ��󤬡�����Ǥ����ΤǤ�����
���Ȥ�(({3}))���֤����Ȥ���Ԥ��Ƥ���ΤǤ����顥

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  cutter -vp
  .
  [1/1](100.00%) tests passed.
  rm test/test_calc.o src/calc.o

����ѥ����˥ƥ��Ȥ�¹ԡ�cutter -vp�ˤ��Ƥ��ޤ�����tests
passed.�פȤ����Τ򸫤Ƥ�狼���̤ꡤ�ƥ��Ȥ�ѥ����Ƥ��ޤ���
ͽ���̤�Ǥ��͡�

����������(({add}))����������3�ˤʤ��礷��������ư��ޤ�
��¾�ξ��Ǥ�ư���褦�˥ƥ��Ȥ��ɲä��ơ����ɤ��ޤ���
����

test/test_calc.c��ʲ��Τ褦���ѹ����ޤ���

  UT_DEF(add_test)
  {
    UT_ASSERT_EQUAL_INT(3, add(1, 2), "1 + 2");
    UT_ASSERT_EQUAL_INT(1, add(3, -2), "3 + -2");
    UT_PASS;
  }

�Ĥޤꡤ(({1 + 2}))�η�̤�(({3}))�ˤʤ�����ǤϤʤ���(({3 +
-2}))�η�̤�(({1}))�ˤʤ�ɬ�פ�����ޤ���

����Ǥϡ�C-cC-t�ǥƥ��Ȥ��ޤ��礦��

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  cutter -vp
  E
  Errors:
  ./test/test_calc.c:8: - calc test add test - 3 + -2
   expected: <1>
    but was: <3>

  [0/1](0.00%) tests passed.
  gmake: *** [do-test] ���顼 1
  rm test/test_calc.o src/calc.o

ͽ���̤꼺�Ԥ��ޤ�����(({3 + -2}))�Ǥ��̤�3�ˤʤäƤ��ޤ���

����Ǥϡ��ƥ��Ȥ�ѥ�����褦��src/calc.c����ѹ����ޤ��礦��

  int
  add(int x, int y)
  {
    return x + y;
  }

C-cC-t�ǥƥ��Ȥ��ޤ���

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  cutter -vp
  .
  [1/1](100.00%) tests passed.
  rm test/test_calc.o src/calc.o

�ѥ����ޤ��������Ȥϡ����μ��򷫤��֤��Ƥ����Ф褤�Ǥ�����
�ޤꡤ�����������ȤǤ���

  * �ƥ��Ȥκ���
  * �ƥ��Ȥμ¹ԡʥ��顼�ˤʤ뤳�Ȥ��ǧ��
  * �ƥ��Ȥ�ѥ�����褦�˥��������ѹ�
  * �ƥ��Ȥμ¹ԡʥƥ��Ȥ˥ѥ����뤳�Ȥ��ǧ���ѥ�����ޤǤ�
    ���Υƥ��Ȥ��ɲä��ʤ���

������������������껻�Ͻ���Ȥ��ޤ��礦��

== ���ޤ�

�Ȼפ��ޤ������������������ɲä��Ƥߤޤ��礦����ʬ�Ǥ�ꤿ��
�ͤϸ��ʤ��Ǥ���������

�ޤ���test/test_calc.c�˥ƥ��Ȥ��ɲä��ޤ���

  UT_DEF(sub_test)
  {
    UT_ASSERT_EQUAL_INT(1, sub(3, 2), "3 - 2");
    UT_PASS;
  }

�ƥ��Ȥ���Ͽ���뤳�Ȥ�˺��ƤϤ����ޤ���

  UT_REGISTER_BEGIN("calc test")
  UT_REGISTER(add_test, "add test")
  UT_REGISTER(sub_test, "sub test") /* <- �ɲ� */
  UT_REGISTER_END

C-cC-t�ǥƥ��Ȥ�¹Ԥ��ޤ���

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  test/test_calc.c: In function `sub_test':
  test/test_calc.c:14: warning: implicit declaration of function `sub'
  cutter -vp
  dlopen() failed: ./test/libtest_calc.so: Undefined symbol "sub"
  Assertion ((null)) failed load.c:43
  gmake: *** [do-test] Abort trap (��������פ��ޤ���)
  rm test/test_calc.o src/calc.o

(({sub}))������򤷤Ƥ��ʤ����Ȥˤ��ٹ𤬽ФƤ��ޤ����ޤ���
(({sub}))��������Ƥ��ʤ������core���Ǥ��Ƥ��ޤ���

�ޤ���src/calc.h��(({sub}))�Υץ�ȥ�����������ɲä��ޤ���
����

  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  cutter -vp
  dlopen() failed: ./test/libtest_calc.so: Undefined symbol "sub"
  Assertion ((null)) failed load.c:43
  gmake: *** [do-test] Abort trap (��������פ��ޤ���)

(({sub}))��������ʤ��Ȥ����ٹ𤬤ʤ��ʤ�ޤ�����

src/calc.c�������񤭤ޤ��礦��

  int
  sub(int x, int y)
  {
    return x - y;
  }

��ñ�Ǥ��͡�

C-cC-t�ǥƥ��Ȥ��ޤ��礦��
  gcc -Wall -ggdb -Isrc -Itest -I`echo ~/local/include`   -MM -MG src/calc.c | sed -e 's,^\(.*\):,src/\1:,' > .depend.src
  ...
  cutter -vp
  ..
  [2/2](100.00%) tests passed.

�ѥ����ޤ�����

�ʾ�Ǥ����������ȳ�껻�������˽���Ǥ���

