# -*- RD -*-

((<URL:http://www.swig.org/Doc1.3/Arguments.html>))�ξ����
������

SWIG 1.3 - Last Modified : October 13, 2002

= �����ΰ���

((*���: ���ξϤϺ�����Ǥ���*))

3�Ϥǡ�SWIG������Ū�ʥǡ��������פȥݥ��󥿤�ɤΤ褦�˰���
�����������ޤ���������Ū�ˤ����ȡ�int��double�Τ褦�ʥץ��
�ƥ��֤ʷ��ϡ��������åȸ�����б����뷿���б����뷿���б���
�����ޤ�����¤�Ρ����饹�����󡤤���¾�Υ桼������ǡ�����
�Τ褦�ʡ��ץ�ߥƥ��֤ʷ��ǤϤʤ����ƤΥǡ��������פˤϡ���
�Υǡ��������פ�ؤ��ݥ��󥿤��Ȥ��ޤ����������������Ĥ���
���ץꥱ�������Ǥϡ�����Υǡ��������פ˴ؤ���SWIG�ΰ�����
���ѹ����뤳�Ȥ�˾�ޤ������㤨�С��ؿ��ΰ������̤���ʣ������
���֤������Ȥ��ޤ����ܾϤǤϡ������¸����뤿��Υƥ��˥å�
���������ޤ���

== typemaps.i�饤�֥��

������Ǥϡ�typemaps.i�饤�֥��ˤĤ����������ޤ������Υ饤
�֥��ϰ����Ѵ����������ѹ����뤿��˹����Ȥ��ޤ���

=== ����

�ʲ��Τ褦��C�δؿ���ͤ��ޤ���

    void add(double a, double b, double *result) {
            *result = a + b;
    }

�����������ɤ��ɤ�С����δؿ���((|double *result|))��������
����¸���뤳�Ȥ�����Ǥ�����������SWIG�ϴؿ����Τ��ɤޤʤ���
�ǡ�΢�������ư����Τ���ˡ�Ϥ���ޤ���

����򰷤�����ΤҤȤĤ���ˡ�ϡ�typemaps.i�饤�֥���Ȥä�
�ʲ��Τ褦�ʥ��󥿥ե����������ɤ�񤯤��ȤǤ���

    // Simple example using typemaps
    %module example
    %include "typemaps.i"
    
    %apply double *OUTPUT { double *result };
    extern void add(double a, double b, double *result);

((:%apply:))�ǥ��쥯�ƥ��֤ϡ����ꤷ���������̤ʷ��Ȥ��ư���
�롼���Ŭ�Ѥ��뤳�Ȥ�SWIG�˶����ޤ���((|double *OUTPUT|))�ϡ�
�ɤΤ褦��((|double *|))���ΰ�����������ͤ��֤������������
����롼���̾���Ǥ����롼������̤���((({{ ... }})))����
�٤�줿���ƤΥǡ��������פ�Ŭ�Ѥ���ޤ����������Ǥ�
(({double *result}))��Ŭ�Ѥ���ޤ���

���Υ��󥿥ե������ե������Ȥäƥ⥸�塼����������ȡ�
(Python�Ǥ�)�ʲ��Τ褦�ˤ��δؿ���Ȥ����Ȥ��Ǥ��롥

    >>> a = add(3,4)
    >>> print a
    7
    >>>

���ξ�硤�ɤΤ褦��3���ܤΰ����ؤν����ͤ��֤��줿�����狼
��ޤ����Ĥޤꡤ3���ܤΰ����ؤν����ͤ���ˡ�Τ褦�˴ؿ�����
���ͤ��Ѵ����줿�ΤǤ������̤�(({double *}))���֥������Ȥ���
�ơ��ɤ��ˤ����Ƥ����ؿ����Ϥ�ɬ�פ��ʤ��ʤä��Τǡ����餫
�˴ؿ��ϻȤ��䤹���ʤ�ޤ�����

���١����˥����ץޥåפ�Ŭ�Ѥ���ȡ��ʸ����Ƥη���̾�����Ф�
�Ƹ��̤�����ޤ����㤨�С��ʲ��Τ褦�˽񤯤��Ȥ��Ǥ��ޤ���

    %module example
    %include "typemaps.i"
    
    %apply double *OUTPUT { double *result };
    extern void add(double a, double b, double *result);
    extern void sub(double a, double b, double *result);
    extern void mul(double a, double b, double *result);
    extern void div(double a, double b, double *result);
    ...

���ξ�硤(({double *OUTPUT}))�롼��ϡ����θ�˸�������Ƥ�
�ؿ���Ŭ�Ѥ���ޤ���

�����ץޥå��Ѵ���ȤäƤ�ʣ�����ͤ��֤����Ȥ�Ǥ��ޤ����㤨
�С��ʲ��Υ����ɤ�ͤ��Ƥ���������

    %include "typemaps.i"
    %apply int *OUTPUT { int *width, int *height };
    
    // Returns a pair (width,height)
    void getwinsize(int winid, int *width, int *height);

���ξ�硤���δؿ���ʣ�����ͤ��֤��ޤ������Τ��ᡤ�ʲ��Τ褦
�˻Ȥ����Ȥ��Ǥ��ޤ���

    >>> w,h = genwinsize(wid)
    >>> print w
    400
    >>> print h
    300
    >>>

((:%apply:))�ǥ��쥯�ƥ��֤ϡ������ץޥåץ롼���ǡ�������
�פ˴�Ϣ�Ť��뤿��˻Ȥ��ޤ������롼��̾��ľ�ܰ�����˻Ȥ�
���Ȥ�Ǥ��ޤ����㤨�С��ʲ��Τ褦�ˤ�񤱤ޤ���

    // Simple example using typemaps
    %module example
    %include "typemaps.i"
    
    extern void add(double a, double b, double *OUTPUT);

�����ץޥåפϡ�����Ū�˺�����줿�ꡤ���������ʤ��¤����
���³���ޤ��������ץޥåפ�õ��ˤ�((:%clear:))�ǥ��쥯
�ƥ��֤�Ȥ��ޤ����㤨�С��ʲ��Τ褦�˻Ȥ��ޤ���

    %clear double *result;      // Remove all typemaps for double *result

=== ���ϥѥ�᡼��

�ʲ��Υ����ץޥåץ롼��ϡ��ݥ��󥿤�ñ��������ͤ������ݻ�
���Ƥ��뤳�Ȥ�SWIG�˻ؼ����ޤ���

    int *INPUT              
    short *INPUT
    long *INPUT
    unsigned int *INPUT
    unsigned short *INPUT
    unsigned long *INPUT
    double *INPUT
    float *INPUT

���Υ롼���Ȥ��ȡ��ݥ��󥿤�������ͤ��Ϥ����Ȥ��Ǥ��ޤ���
�㤨�С��ʲ��δؿ���ͤ��Ƥ���������

    double add(double *a, double *b) {
            return *a+*b;
    }

�����ʲ���SWIG���󥿥ե�������ͤ��ޤ���

    %module example
    %include "typemaps.i"
    ...
    extern double add(double *INPUT, double *INPUT);

���δؿ���������ץȸ���Υ��󥿥ץ꥿�ǻȤ���Ȥ����ʲ���
�褦��ư���ޤ���

    result = add(3,4)

=== ���ϥѥ�᡼��

�ʲ��Υ����ץޥåץ롼��ϴؿ��ν����ͤ��ݥ��󥿤Ǥ��뤳�Ȥ�
SWIG�˻ؼ����ޤ������Υ롼���Ȥ��ȡ��ؿ���ƤӽФ����˰���
��Ϳ����ɬ�פ��ʤ��ʤ�ޤ����������ꡤ�ҤȤİʾ�ν����ͤ�
�֤äƤ��ޤ���

    int *OUTPUT
    short *OUTPUT
    long *OUTPUT
    unsigned int *OUTPUT
    unsigned short *OUTPUT
    unsigned long *OUTPUT
    double *OUTPUT
    float *OUTPUT

�����Υ롼��ϡ������ˤǤƤ�����Ǽ������褦�˻Ȥ��ޤ�����
���С��ʲ��Τ褦��C�δؿ������ä��Ȥ��ޤ���

    void add(double a, double b, double *c) {
            *c = a+b;
    }

SWIG�Υ��󥿥ե������ե�����ϰʲ��Τ褦�ˤʤ�Ǥ��礦��

    %module example
    %include "typemaps.i"
    ...
    extern void add(double a, double b, double *OUTPUT);

���ξ��ϡ���Ĥ��ͤ������֤���ޤ�������Ĥ��ͤ����֤��ʤ�
�Ȥ����褦�����¤Ϥ���ޤ���(�����˼������褦��)���ϥ롼��
��ҤȤİʾ�ΰ�����Ŭ�Ѥ��뤳�Ȥǡ�Ǥ�դο����ͤ��֤����Ȥ�
�Ǥ��ޤ���

�⤷���ؿ����ͤ��֤����ϡ��ؿ����֤��ͤȰ������ͤ�������
����ޤ����㤨�С��ʲ��Τ褦�ʴؿ������ä��Ȥ��ޤ���

    extern int foo(double a, double b, double *OUTPUT);

���δؿ��ϡ��ʲ��Τ褦�ˤդ��Ĥ��ͤ��֤��ޤ���

    iresult, dresult = foo(3.5, 2)

=== �����ϥѥ�᡼��

�ݥ��󥿤������Ѥˤ�����Ѥˤ�Ȥ���Ȥ��ϡ��ʲ��Υ����ץޥ�
�ץ롼���Ȥ����Ȥ��Ǥ��ޤ���

    int *INOUT
    short *INOUT
    long *INOUT
    unsigned int *INOUT
    unsigned short *INOUT
    unsigned long *INOUT
    double *INOUT
    float *INOUT

���Υ롼���Ȥ�C�δؿ��ϡ��㤨�аʲ��Τ褦�ˤʤ�ޤ���

    void negate(double *x) {
            *x = -(*x);
    }

�����ѤȽ����ѤΤդ��Ĥε�ǽ�����((|x|))���뤿��ˡ�����
�ؿ��ϡ����󥿥ե������ե�������ǰʲ��Τ褦���������ޤ���

    %module example
    %include typemaps.i
    ...
    extern void negate(double *INOUT);

������ץ���Ǥϡ����̤˴ؿ���ƤӽФ����Ȥ��Ǥ��ޤ���

    a = negate(3);         # a = -3 after calling this

(({INOUT}))�롼����������ϡ�¿���Υ�����ץȸ��줬�ץ��
�ƥ��֤ʥ��֥������Ȥ��Ф����ѹ��Բ�ǽ�Ȥ�������������Ƥ�
�뤳�ȤǤ�(�Ĥޤꡤ������ʸ����Ȥ��ä�ñ��ʥ��֥������Ȥ�
�ѹ��Ǥ��ʤ��Ȥ������ȤǤ�)�����Τ��ᡤ�������C�δؿ�(����:
(���֤�) C�С�������(({negative})))�����Ƥ���褦�ˡ�(����:
(���֤�)������ץȸ����(({negative}))�Ǥ�)���֥������Ȥ���
���ѹ����뤳�Ȥ��Ǥ��ޤ��󡥤������äơ�(({INOUT}))�롼���
�������ϥ��֥������Ȥ��ͤ�ľ�ܾ�񤭤���ΤǤϤʤ��ơ��ѹ���
�줿�ͤ���Ŀ��������֥������Ȥ��֤��ޤ���

((*�ߴ����˴ؤ������*)): (({INOUT}))�롼��Ͻ���ΥС�����
���SWIG�Ǥ�(({BOTH}))�Ǥ�����(({BOTH}))�ϸ����ߴ����Τ����
�Ĥ���Ƥ��ޤ������侩����ޤ���

=== �ۤʤä�̾���λ���

�����˼������褦�ˡ�((:%apply:))�ǥ��쥯�ƥ��֤�(({INPUT}))��
(({OUTPUT}))��(({INOUT}))�����ץޥåפ�ۤʤä�̾���ΰ�����
Ŭ�Ѥ��뤿��˻Ȥ����Ȥ��Ǥ��ޤ����㤨�С��ʲ����̤�Ǥ���

    // Make double *result an output value
    %apply double *OUTPUT { double *result };
    
    // Make Int32 *in an input value
    %apply int *INPUT { Int32 *in };
    
    // Make long *x inout
    %apply long *INOUT {long *x};

�롼���õ�뤿��ˡ�((:%clear:))�ǥ��쥯�ƥ��֤�Ȥ��ޤ���

    %clear double *result;
    %clear Int32 *in, long *x;

�����ץޥå�����ϥ쥭�����륹�����פ���äƤ��ơ������ץޥ�
�פθ��̤����������꤫��ե�����ν���ꡤ�ޤ����б�����
((:%clear:))����ޤ�³���ޤ���

== �����ͤ������Ŭ�Ѥ���

�����ͤΰ������ѹ�����Τ˲ä��ơ������ä��뤿��˥����ץޥ�
�פ�Ȥ����Ȥ�Ǥ��ޤ����㤨�С��ͤ������ͤǤ���Ȥ����ݥ���
����NULL�Ǥʤ����Ȥ��ݾڤ��������⤷��ޤ��󡥤����
constraints.i�饤�֥��ե����������ळ�Ȥ�ã�����뤳��
���Ǥ��ޤ���

=== ��ñ���������

�ʲ��Υ��󥿥ե������ե����������饤�֥����äȤ�褯��
�����Ƥ��ޤ���

    // �����դ��Υ��󥿥ե������ե�����
    %module example
    %include "constraints.i"
    
    double exp(double x);
    double log(double POSITIVE);         // �����ͤ��������
    double sqrt(double NONNEGATIVE);     // ������ͤ�������
    double inv(double NONZERO);          // �󥼥���ͤ�������
    void   free(void *NONNULL);          // ��NULL�Υݥ��󥿤�������

���Υե������˾����̤��ư��ޤ����⤷�������Τɤ줫����
����˰�ȿ�����顤������ץȸ�����㳰�򤢤���Ǥ��礦����
�̤Ȥ��ơ��������ͤ���ª���뤳�Ȥ��Ǥ����ԲĲ�ʥץ�����
����å���ʤɤ��ɤ����Ȥ��Ǥ��ޤ���

=== ������ˡ

�������ѤǤ�������ϰʲ��Τ�ΤǤ���

    POSITIVE                     Any number > 0 (not zero)
    NEGATIVE                     Any number < 0 (not zero)
    NONNEGATIVE                  Any number >= 0
    NONPOSITIVE                  Any number <= 0
    NONZERO                      Nonzero number
    NONNULL                      Non-NULL pointer (pointers only).

=== �������ǡ��������פ������Ŭ�Ѥ���

����饤�֥��ϥץ�ߥƥ��֤�C�η������򥵥ݡ��Ȥ��Ƥ��ޤ�
����((:%apply:))��Ȥäƿ������ǡ��������פش�ñ�������Ŭ��
�Ǥ��ޤ���

    // Apply a constraint to a Real variable
    %apply Number POSITIVE { Real in };
    
    // Apply a constraint to a pointer type
    %apply Pointer NONNULL { Vector * };

"Number"��"Pointer"�Ȥ������̤ʷ��ϡ����줾�졤Ǥ�դο��ͷ���
�ݥ��󥿷���Ŭ�ѤǤ��ޤ����ʹߤ���������������ˡ��ʲ���
�褦��(({%clear}))�ǥ��쥯�ƥ��֤�Ȥ����Ȥ��Ǥ��ޤ���

    %clear Real in;
    %clear Vector *;
