= RD2TeX

RD����(La)TeX���Ѵ�����饤�֥�ꡥ

== ���������

���ߡ����������֤Ϥ���ޤ���
((<��ݥ��ȥ�|URL:http://www.cozmixng.org/repos/ruby/rd2tex/>))��������å������Ȥ��Ƥ���������

  svn co http://www.cozmixng.org/repos/ruby/rd2tex/trunk rd2tex

== �ޤޤ�Ƥ�����

=== RD -> LaTeX

RD�������̤�LaTeX���Ѵ�����饤�֥�ꡥ

  % rd2 -r rd/rd2tex-lib XXX.rd

$LOAD_PATH���ѹ����ơ��������ޥ��������ƥ�ץ졼�Ȥ��ɤ߹��ޤ��뤳�Ȥˤ����Ϥ򥫥����ޥ����Ǥ��롥

��ʸ�Ѥäݤ�LaTeX����Ϥ�����:

  % ruby -I rd2tex/sample/thesis -S rd2 -r rd/rd2tex-lib XXX.rd

=== RD -> prosper

RD����prosper��LaTeX���Ѵ�����饤�֥�ꡥ

  % rd2 -r rd/rd2prosper-lib XXX.rd

�񼰤�((<Rabbit>))�ߤ����˽񤯡�
