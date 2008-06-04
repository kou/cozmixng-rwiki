# -*- rd -*-

= README.ja

$Id: README.ja 457 2008-06-04 00:21:29Z kou $

== ���

Kouhei Sutou <kou@cozmixng.org>

== �饤����

GPL or BSD License

== ���

Gauche 0.8.13�ѤǤ�������������ư�����ɤ����Ϥ狼��ޤ���

== �ʤˤ��졩

GaUnit��Gauche�Ǽ������줿Unit Testing Framework�Ǥ���

Ʊ�ͤΤ�Τ�
((<SchemeUnit|URL:http://schematics.sourceforge.net/schemeunit.html>))
������ޤ���

== �ɤ�ͤ���

�֤��ˤäȡפȤ��Ϥɤ��Ǥ��礦��

== ������ˡ

((<URL:http://www.cozmixng.org/~kou/download/gaunit.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/gaunit/trunk gaunit

== ���󥹥ȡ���

  % sudo gosh install/install.scm

== �Ȥ���

�ƥ����ѤΥ⥸�塼�����������ץ������Ѱդ��ޤ���

  (define-module test-your-module
    (extend test.unit.test-case)
    (use your-module))
  (select-module test-your-module)

  (define (test-your-module-function1)
    (assert-equal "Good!" (your-module-function1))
    ...
    #f)

  (define (test-your-module-function2)
    (assert-equal 29 (your-module-function2))
    ...
    #f)

  (provide "test-your-module")

'test-'����Ϥޤ�ؿ���1�ĤΥƥ��ȤȤ��Ƽ¹Ԥ���ޤ���

'-u test.unit'���ץ�����դ��ǥץ�����¹Ԥ��ޤ���GaUnit
��test.unit�⥸�塼��ǥƥ��Ȥ����餻��(({main}))��³������
���Ƥ��ޤ���test.unit��use����С�(({main}))��³�����������
ɬ�פϤ���ޤ���

  % gosh -u test.unit test-your-module.scm

������������Τ���˰ʲ��Τ褦�ʥƥ��ȵ�ư������ץ�
run-test.scm���������Ȥ褤�Ǥ��礦��

run-test.scm:
  #!/usr/bin/env gosh

  (add-load-path ".")

  (use test.unit)

  (define base-dir (sys-dirname *program-name*))
  (for-each load (glob #`",|base-dir|/**/test-*.scm"))

�ʲ��Τ褦�˼¹Ԥ��ޤ���

  % gosh run-test.scm

=== ���ץ����

GaUnit���󶡤��Ƥ���(({main}))��³���Ϥ����Ĥ����ץ������
���դ��ޤ���

: -uUI, --ui=UI
   �ƥ��ȷ�̤�ɽ������桼�����󥿥ե���������ꤷ�ޤ���
   ((|UI|))�ˤϰʲ��Τ�Τ�����Ǥ��ޤ���

   : t[ext]
      �ƥ������ǤΥ桼�����󥿥ե���������Ѥ��ޤ����ǥե���
      �ȤǤ���

   : g[tk]
      ((*����ư���ޤ���*))

      GTK+�ǤΥ桼�����󥿥ե���������Ѥ��ޤ����ʲ��Τ褦��
      �����Х���ɤ���Ƥ��ޤ��������Υ�����Ctrl��Alt�ʤ�
      �ν����������դ��Ƥ��Ƥ�ư��ޤ����Ĥޤꡤl�Ǥ�Ctrl
      + l�Ǥ�Alt + l�Ǥ�ư��ޤ���
      
      : l
         Load�ܥ���򲡤��ޤ���
      
      : r
         Run�ܥ���򲡤��ޤ���
       
      : q, ESC
         ��λ���ޤ���


: -vLEVEL, --vervose=LEVEL
   �ƥ��ȷ�̤�ɤ����پܺ٤�ɽ�����뤫����ꤷ�ޤ������ߤ�
   �Ȥ����ƥ������ǤΥ桼�����󥿥ե������ǤΤ߰�̣������
   �ޤ���((|LEVEL|))�ˤϰʲ��Τ�Τ�����Ǥ��ޤ���

   : s[ilent]
      �ƥ��Ȥ����Ԥ����Ȥ������뤤�ϥ��顼��ȯ�������Ȥ��Τ�
      ���ξܺ٤�ɽ�����ޤ����ƥ��Ȥ����������Ȥ��Ϥʤˤ����
      ���ޤ���

   : p[rogress]
      �ƥ��Ȥ����������Ȥ���"."�����Ϥ���ޤ�������ʳ���
      silent��Ʊ���Ǥ���

   : n[ormal]
      �ƥ��ȥ������Ȥμ¹Ի��ˤ��Υƥ��ȥ������Ȥ�̾����ɽ
      �����ޤ����ޤ����ƥ��Ȥ�����ä��Ȥ��ˡ��ƥ��ȿ�����ɽ
      ��������������ɽ���������Ԥ���ɽ���������顼�����ƥ���
      �ˤ����ä����֤�ɽ�����ޤ�������ʳ���progress��Ʊ����
      �����ǥե���ȤǤ���

   : v[erbose]
      �ƥ��ȥ������μ¹Ի��ˤ��Υƥ��ȥ�������̾����ɽ������
      ��������ʳ���normal��Ʊ���Ǥ���

: -sREGEXP, --test-suite=REGEXP

   ����ɽ��REGEXP�˥ޥå�����ƥ��ȥ�������̾����ĥƥ��ȥ�
   �����ȤΤ߼¹Ԥ��ޤ���

: -cREGEXP, --test-case=REGEXP

   ����ɽ��REGEXP�˥ޥå�����ƥ��ȥ�����̾����ĥƥ��ȥ���
   ���Τ߼¹Ԥ��ޤ���

: -tREGEXP, --test=REGEXP

   ����ɽ��REGEXP�˥ޥå�����ƥ���̾����ĥƥ��ȤΤ߼¹Ԥ�
   �ޤ���

: -h, --help
   ����ˡ��ɽ�����ƽ�λ���ޤ���

�㤨�С��桼�����󥿥ե������Ȥ���GTK+�Ǥ�Ȥ�������аʲ���
�褦�ˤ��ޤ���

  % gosh test-program.scm -ug

�ܺ٤ʥ���ɽ����������аʲ��Τ褦�ˤ��ޤ���

  % gosh test-program.scm -vv

=== ��ե����

==== ɽ��¾

GaUnit�ϰʲ��˼����ƥ��Ȥ򤹤뤿��μ�³�����Ѱդ��Ƥ��ޤ���

((|[message]|))�ϥ��ץ����Ǥ������Ի��Υ�å������Ǥ���ʸ
���󤫡�������ҤȤĤȤ��³������ꤷ�ޤ�����³���ξ��ϥ�
���ȷ�̤������Ȥ����Ϥ���ޤ���

--- fail([message])
    
    ɬ�����Ԥ��ޤ���

--- assert(pred expected actual [message])
    
    (({(pred expected actual)}))��#f�Ǥʤ��ʤ���������ޤ���

--- assert-equal(expected actual [message])
    
    (({(equal? expected actual)}))��#t���֤����������ޤ���

--- assert-not-equal(expected actual [message])
    
    (({(not (equal? expected actual))}))��#t���֤����������ޤ���

--- assert-null(actual [message])
    
    (({(null? actual)}))��#t���֤����������ޤ���

--- assert-not-null(actual [message])
    
    (({(not (null? actual))}))��#t���֤����������ޤ���

--- assert-true(actual [message])
    
    ((|actual|))��#t�ʤ���������ޤ���

--- assert-false(actual [message])
    
    ((|actual|))��#f�ʤ���������ޤ���

--- assert-instance-of(expected-class object [message])
    
    ((|object|))��((|expected-class|))�Υ��󥹥��󥹤Ǥ����
    �������ޤ���

--- assert-raise(expected-class thunk [message])
    
    ((|thunk|))(����̵���μ�³��)��ǵ����ä��㳰��
    ((|expected-class|))�Υ��󥹥��󥹤Ǥ�����������ޤ���

--- assert-error(tunk [message])
    
    ((|thunk|))(����̵���μ�³��)����㳰��ȯ��������������ޤ���

--- assert-each(assert-proc lst &keyword :apply-if-can :run-assert :prepare)
    
    ((|assert-proc|))��((|lst|))�γ����Ǥ��Ф���Ŭ�Ѥ��ޤ���
    
    ((|lst|))�γ����Ǥ�((|prepare|))��Ŭ�Ѥ��졤
    ((|run-assert|))�ˤ�ä�((|assert-proc|))��Ŭ�Ѥ���ޤ���
    
    �⤷��((|prepare|))�����ͤ��ꥹ�Ȥ�((|apply-if-can|))��
    #t(�ǥե����)�ʤ�((|assert-proc|))��((|apply|))����ޤ���
    
    ���᡼���Ȥ��ƤϤ���ʴ����Ǥ���

      (define (run-assert assert-proc args)
        (if (and (list? args) apply-if-can)
            (apply assert-proc args)
            (assert-proc args)))
      (for-each (lambda (item)
                  (run-assert assert-proc (prepare item)))
                lst)

--- assert-macro(expanded form [message])
    
    (({(equal? expanded (macroexpand form))}))�������֤����������ޤ���
    
--- assert-macro1(expanded form [message])
    
    (({(equal? expanded (macroexpand-1 form))}))�������֤����������ޤ���
    
--- assert-lset-equal(expected actual [message])
    
    (({(lset= equal? expected actual)}))�������֤����������ޤ���
    
--- assert-values-equal(expected productor [message])
    
    (({(receive actual (productor) (equal? expected
    actual))}))�������֤����������ޤ���
    
--- assert-in-delta(expected delta actual [message])
    
    (({(<= (- expected delta) actual (+ expected delta))}))
    �������֤����������ޤ���
    
--- assert-output(expected thunk [message])
    
    (({(equal? expected (with-output-to-string thunk))}))��
    �����֤����������ޤ����Ĥޤꡤ((|expected|))��
    (({(thunk)}))�ν��Ϸ�̤�����������������ޤ���
    
    �⤷��((|expected|))������ɽ������ꤷ�Ƥ�������
    (({(rxmatch expected (with-output-to-string thunk))}))��
    #f�ʳ����֤����������ޤ����Ĥޤꡤ(({(trunk)}))�ν��Ϸ�
    �̤�((|expected|))�˥ޥå�������������ޤ���

--- assert-match(expected actual [message])
    
    (({(rxmatch expected actual)}))��#f�ʳ����֤�����������
    ����

--- pend(message [thunk])

    ���Υƥ��Ȥ���α�ˤ��ޤ���((|message|))����α����ͳ�ˤ�
    ��ޤ����⤷�������ʤ��δؿ�((|thunk|))����ꤷ�Ƥ��ơ�
    ����((|thunk|))��¹Ԥ��Ƥ⥨�顼���������ꡢɽ��������
    ���ʤ����ϡ����Υƥ��Ȥϼ��Ԥ��ޤ�������ϡ�
    ((|thunk|))�����Ƥ����꤬���뤫����α�ˤ��Ƥ��롢�Ȥ���
    �տޤ�ȿ����((|thunk|))�����Ƥ����꤬�ʤ��ä��ΤǼ��ԡ�
    �Ȥ����ͤ��˴�Ť��Ƥ��ޤ���
