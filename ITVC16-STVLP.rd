= ITVC16-STVLP

���ͻظ���TV���塼�ʥ�����
((<ITVC16-STVLP|URL:http://www.kuroutoshikou.com/products/tvcuner/itvc16.html>))
��Debian��ư�������ꡣ

lspci�Ǹ����Ȥ���ʤ�ġ�

  % lspci | grep iTVC16
  00:07.0 Multimedia video controller: Internext Compression Inc iTVC16 (CX23416) MPEG-2 Encoder (rev 01)

== ���󥹥ȡ���

�ʲ��Τ褦�˥���ѥ���ѤߤΥ����ͥ�⥸�塼��򥤥󥹥ȡ��뤹��ʥѥå�����̾�ϴĶ��˹�碌�ơˡ�

  % sudo aptitude -V -r install ivtv-modules-2.6-k7

���뤤�ϡ���ʬ�ǥ���ѥ��뤹�롣

  % sudo aptitude -V -r install module-assistant
  % m-a a-i ivtv

�����ͥ�⥸�塼��򥤥󥹥ȡ��뤷����ե����०�����򥤥󥹥ȡ��뤹�롣���Τ���ˡ��ʲ���/etc/apt/sources.list���ɲä��롣

  deb http://www.hellion.org.uk/debian sid main
  deb-src http://www.hellion.org.uk/debian sid main

�����ơ����󥹥ȡ��롣

  % sudo aptitude -V -r install ivtv-firmware

== ����

�Ѱդ��Ǥ����Τǡ������ͥ�⥸�塼����ɤ߹��ࡣ

  % sudo modprobe -v ivtv cardtype=5 tuner=17

cardtype=5�ϼ�ư���Ф�̵���ˤ���ITVC16-STVLP������Ū�˻��ꤹ��Ȥ������ȡ�

tuner=17�ϼ�ư���Ф�̵���ˤ���Philips�Υ��塼�ʤ�����Ū�˻��ꤹ��Ȥ������ȡʤ��Ȼפ��ˡ�
���塼�ʤμ���ϰʲ��򸫤�Ф褤��

  /usr/src/linux-headers-`uname -r`/include/media/tuner.h

== �ƥ�Ӥ�Ѥ�

MythTV�򥤥󥹥ȡ��뤹�롣
