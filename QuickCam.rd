= QuickCam

Logitech��USB��³�Υ����֥���顥

�����Linux��ư������������ꡥ�ºݤ�ư���Ƥ��뤫�Υƥ�����ˡ�ϰ��ֲ��˽񤤤Ƥ��롥

�����ͥ�2.6.24���餤�ʹߤ��Ȥ����������Ȣ��򤷤ʤ��Ƥ�USB���ޤ������ǻȤ��롣

== QuickCam Messenger

����������ġ�

  % lsusb | grep Logitech
  Bus 001 Device 009: ID 046d:08f0 Logitech, Inc. QuickCam Messenger

=== �ɥ饤��

ư��������ˤ�((<�ɥ饤��|URL:http://qce-ga.sourceforge.net/>))��Debian�Ǥ�qc-usb-source�ˤ򥤥󥹥ȡ��뤹��ɬ�פ����롥�����ɡ����ե������ʤ�Ĥ����б����Ƥ��ʤ���

�ʤΤǡ�((<Quickcam Messenger & Communicate driver for Linux|URL:http://home.mag.cx/messenger/>))��Ȥ��ʤ��Υڡ����ϥ��ե������ڡ���������󥯤���Ƥ���ˡ�

���󥹥ȡ��뤹��ˤϥ��������֤���ˤ��롥make all����make install�����������������make all����Ȥ��˥����ͥ�Υإå��ե����뤬����ǥ��쥯�ȥ����ꤹ�뤳�ȡ�Debian�Ǹ����Ф���ʴ�����

  % sudo aptitude -V -r install linux-headers-`uname -r`
  % make all LINUX_DIR=/usr/src/linux-headers-`uname -r`
  % sudo make install

��ʬ��make����󤸤�ʤ��ơ����󥹥ȡ��륹����ץȤ�Ȥ����Ȥ�Ǥ��롥���ΤȤ���USB��ؤ��Ƥ����������褤���⡥

  % sudo ./quickcam.sh

�ɥ饤�Ф򥤥󥹥ȡ��뤷���顤���Ȥ�USB��ȴ�������Ǥ⤹���ǧ�������Ϥ���

== QuickCam Communicate STX

����������ġ�

  % lsusb | grep Logitech
  Bus 001 Device 003: ID 046d:08ad Logitech, Inc.

QuickCam Messenger������ǽ���褤��

=== �ɥ饤��

((<spca5xx|URL:http://mxhaard.free.fr/spca5xx.html>))��Ȥ��Ф褤��Debian�ʤ餳��ʴ�����

  % sudo aptitude -V -r install module-assistant
  % sudo module-assistant prepare # ���뤤��sudo m-a prepare
  % sudo aptitude -V -r install spca5xx-source
  % sudo module-assistant auto-install spca5xx # ���뤤��m-a a-i spca5xx

���Ȥ�USB��ȴ�������Ǥ⤹���ǧ�������Ϥ���

== �ƥ���

�ƥ��Ȥ�gqcam�Ȥ�gnomemeeting��Ekiga?�ˤǤ�Ȥ���OK��
