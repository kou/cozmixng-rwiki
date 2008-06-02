# -*- rd -*-

= README.ja

$Id: README.ja 4 2008-06-02 23:51:41Z  $

== ̾��

run-test.el

== ���

Kouhei Sutou <kou@cozmixng.org>

== �饤����

GPL

== �ʤˤ��졩

�ƥ��Ȥμ¹Ԥ�ٱ礹��Emacs-Lisp�Ǥ���

== ������ˡ

((<URL:http://www.cozmixng.org/~kou/download/run-test.tar.gz>))

  % svn co http://www.cozmixng.org/repos/elisp/run-test/trunk run-test

== ���󥹥ȡ���

  % sudo ...

== �Ȥ���

lib/run-test.el��Emacs��ǤΥƥ��Ȥμ¹Ԥ�ٱ礹��Emacs-Lisp
�Ǥ���lib/run-test-setting.el��run-test.el��Ȥ������������
�Ǥ���

�Ȥ��ˤϡ��ޤ���.emacs�˰ʲ��򵭽Ҥ��ޤ���

  (setq load-path (cons run-test{,-setting}.el������ǥ��쥯�ȥ� load-path))
  (load "run-test-setting")

�����Ǥ�
((<GaUnit|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=GaUnit>))
�Υƥ��Ȥ�¹Ԥ���Ȥ��ޤ���

run-test.el�Τ�����Ѱդ����Τϥƥ��Ȥ�¹Ԥ��륹����ץ�
�Ǥ����㤨�С��ʲ��Τ褦��run-test.scm�Ȥ���������ץȤǤ���

  #!/usr/bin/env gosh

  (add-load-path ".")

  (use test.unit)

  (define base-dir (sys-dirname *program-name*))
  (for-each load (glob #`",|base-dir|/**/test-*.scm"))

�����ơ�test�Ȥ����ǥ��쥯�ȥ���äơ�����run-test.scm�˼�
�Ը����դ��Ƥ����Ƥ����ޤ���

�ƥ��ȥե������test�Ȥ����ǥ��쥯�ȥ�ʲ���
test-your-module.scm�Ȥ���̾���Ǻ�äƤ����ޤ����Ĥޤꡤ�ǥ�
�쥯�ȥ깽���ϰʲ����ͤˤʤ�ޤ���

  topdir --- test --- run-test.scm
                   |
                   +- test-hoge.scm
                   |
                   .
                   .
                   .
                   |
                   +- test-fuga.scm

�ƥ���(run-test.scm)��topdir�ǵ�ư����ޤ����Ĥޤꡤ

  % test/run-test.cm

�Ȥ����褦�˵�ư����ޤ���

run-test.scm��񤯤Ȥ��Ϥ��Τ��Ȥ���դ��ޤ��礦��

����Ϥ���ǽ�λ�Ǥ���

topdir�ʲ��ˤ���Ȥ���C-cC-t(run-test)��
topdir/test/run-test.scm���¹ԤǤ��ޤ����¹Է�̤�*run-test*
�Хåե�����������ޤ����ƥ��Ȥ�¹Ԥ��Ƽ���/���顼��������
�饨�顼��ȯ������assertion��C-x`�ǥ����פ��뤳�Ȥ��Ǥ��ޤ���

C-cT(run-test-in-new-frame)�Ȥ��ȡ��������ե졼��������
��topdir/test/run-test.scm��¹Ԥ��ޤ����ǽ�˥ƥ��Ȥ����餻
����˻Ȥ��Ȥ褤�Ǥ��礦��

����Ǽ�ڤ����ˤ˥ƥ��Ȥ�¹ԤǤ��ޤ��͡�Happy testing!!

== �����Х����

: C-cC-t
   �ƥ��Ȥ����餻��

: C-cT
   �ƥ��Ȥ����餻�롣�ƥ��ȷ�̤Ͽ������ե졼���������Ƥ�
   ����ɽ�����롣

== �������ޥ����ѿ�

: run-test-file-names
   �ƥ��Ȥ�¹Ԥ��륹����ץȤγ�ĥ�Ҥ�������ե�����̾�Υ�
   ���ȤǤ���
   
   �ǥե����: ("test/run-test" "test/runner" "run-test")

: run-test-suffixes
   run-test-file���ղä����ĥ�ҤΥꥹ�ȤǤ�����Ƭ�����ˤ����ĥ����
   ͥ�褵��ޤ���
   
   �ǥե����: ("" ".scm" ".rb" ".py" ".sh")
