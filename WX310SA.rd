= WX310SA

Debian GNU/Linux���顤WILLCOM��PHP��WX310SA��Ȥäƥ��󥿡��ͥåȤ���³�������ꡥ
��³���WILLCOM���󶡤��Ƥ���PRIN(PRovider INcluded)��Ȥ���

== �ɥ饤��

�����ͥ�����äƤ���cdc_acm�Ǥ����롥

WX310SA��ǧ������Ƥ���С�dmesg�˥�å��������Ǥơ��ɤΥǥХ����˳�����Ƥ������狼�롥

  % dmesg | grep cdc_acm
  cdc_acm 2-1:1.0: ttyACM0: USB ACM device
  ...

���ξ���/dev/ttyACM0��ͳ��PPP��Ԥ���

== ����

pppconfig��Ȥ��Τ��ڡ�

���������ɷ����ǿʤࡥ����ʴ����Ǥ�����Ϥ���

: �ץ�Х���̾
   prin��Ǥ�ա�

: DNS������
   Dynamic

: ǧ����ˡ
   PAP

: �桼��̾
   prin

: �ѥ����
   prin

: ®��
   115200�ʥǥե���ȡ�

: �ѥ륹�ޤ��ϥȡ���
   Tone�ʥȡ����

: �����ֹ�
   0570570711##64��4�ѥ��å������ξ���

: ��ǥ�ݡ���
   Manual��/dev/ttyACM0������dmesg�ǳ�ǧ������ġ�

���Finished�ǥե�����˽񤭽Ф��ơ���λ��((*�ե�����˽񤭽Ф��Τ�˺�줺��*))


== ��³

  % sudo pon prin

prin��pppconfig�����ꤷ���ץ�Х���̾��

���Ǥ���Ȥ���poff��

  % sudo poff prin
