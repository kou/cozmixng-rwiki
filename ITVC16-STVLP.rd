= ITVC16-STVLP

���ͻظ���TV���塼�ʥ�����
((<ITVC16-STVLP|URL:http://www.kuroutoshikou.com/products/tvcuner/itvc16.html>))
��Debian��ư�������ꡣ

lspci�Ǹ����Ȥ���ʤ�ġ�

  % lspci | grep iTVC16
  00:07.0 Multimedia video controller: Internext Compression Inc iTVC16 (CX23416) MPEG-2 Encoder (rev 01)

== ���󥹥ȡ���

�Ƕ�Υ����ͥ�ʾ��ʤ��Ȥ�2.6.22�ˤ��ȥ����ͥ��ivtv�⥸�塼�뤬�Ȥ߹��ޤ�Ƥ��롣

�����������ӥե����०�����򥤥󥹥ȡ��뤹��ɬ�פ����롣���Τ���ˡ��ʲ���/etc/apt/sources.list���ɲä��롣

  deb http://www.hellion.org.uk/debian sid main
  deb-src http://www.hellion.org.uk/debian sid main

�����ơ����󥹥ȡ��롣

  % sudo aptitude -V -r install ivtv-firmware

== ����

�Ѱդ��Ǥ����Τǡ������ͥ�⥸�塼����ɤ߹��ࡣ

�ʲ��Τ褦�����Ƥ�/etc/modprobe.d/ivtv�������

  options ivtv cardtype=5 tuner=17

cardtype=5�ϼ�ư���Ф�̵���ˤ���ITVC16-STVLP������Ū�˻��ꤹ��Ȥ������ȡ�

tuner=17�ϼ�ư���Ф�̵���ˤ���Philips�Υ��塼�ʤ�����Ū�˻��ꤹ��Ȥ������ȡʤ��Ȼפ��ˡ�
���塼�ʤμ���ϰʲ��򸫤�Ф褤��

  /usr/src/linux-headers-`uname -r`/include/media/tuner.h

�ɤ߹��ࡣ

  % sudo modprobe -v ivtv

�����ɤ������ǧ�����줿����dmesg�ǳ�ǧ���롣

�����ǧ�����줿���ϰʲ��Τ褦�ˤ��ƥ��塼�ʤ���MPEG2�������Ǥ��롣

  % cat /dev/video0 > /tmp/XXX.mpg

���Ƥϰʲ��Τ褦�ˤ��Ƴ�ǧ�Ǥ��롣

  % xine /tmp/xxx.mpg

������������

== MythTV�Υ��󥹥ȡ���

�ƥ�Ӥ�Ѥ뤿���MythTV��Ȥ���

MythTV�򥤥󥹥ȡ��뤹�뤿��ˡ��ʲ���/etc/apt/sources.list���ɲä��롣

  deb http://www.debian-multimedia.org sid main
  deb-src http://www.debian-multimedia.org sid main

�����ơ����󥹥ȡ��롣

  % sudo aptitude -V -r install mythtv

��ʬ��mythtv���롼�פ��ɲá�

  % sudo adduser kou mythtv

�ѹ���ȿ�Ǥ��뤿��˺ƥ�����

== MythTV������

MythTV��MySQL��Ȥ��Τǡ�MythTV�ѤΥ桼����������롣

  % mysql -u root
  mysql> grant all on *.* to mythtv@localhost identified by 'mythtv';
  mysql> exit

MythTV������ץ�����ư���롣

  % mythtv-setup --geometry 600x480

�ʲ����������ơ��񤤤Ƥ��ʤ��Ȥ���Ϥ�����ʤ����ȡ��㤨�С�TV�ե����ޥåȤ�NTSC���顢�褫��Ȼפä�NTSC-JP�ˤ���ȤϤޤ롣

���β��̤����ˤ�Esc��

  * Select your prefered language

    Nihongo

  * 1. ����: �Хå�����ɤ�����: �����ͥ���ȿ��ơ��֥�

    japan-bcast

  * 2. ����ץ��㡼������: ����ץ��㡼������

    ��������ץ��㡼������

    * ����ץ��㡼����������: �����ɥ�����

      MPEG-2���󥳡�����������(CX23416GYC-STVLP, GV-MVP/RX)

  * 3. �ӥǥ�������: �ӥǥ�������

    �����ӥǥ�������

    * �ӥǥ�����������: �ӥǥ�������̾

      TV-Japan��Ǥ�ա�

    * �ӥǥ�����������: Listings grabber

      Japan (xmltv)

      �ϰ�ʤɤ򥿡��ߥʥ�����ꡣ

  * 4. ���Ϥȥ���������³: ������³

    [MPEG: /dev/video0] (Tuner 1) -> (̵��)

    * �����������Ϥ���³: ɽ��̾(Ǥ�ա�

      TV

    * �����������Ϥ���³: �ӥǥ�������

      TV-Japan��3.�����ꤷ���ƥ�ӤΥӥǥ�������������


���ٽ�λ�������ͥ�򹹿����Ƥ��ʤ��Τǽ�λ��������������ޤ������Ȥ�ʹ����뤬���������ʤ��ǽ�λ���롣

���̤����꤬����ä��Τǡ�������mythtv-backend��ư���롣

  % sudo /etc/init.d/mythtv-backend start

��ư������ɽ�򹹿���

  % mythfilldatabase

�ʾ�����꽪λ���ʤ⤷�������颬��--manual���ץ�����Ĥ�������Ū�˥����ͥ����ꤷ�ʤ��Ȥ����ʤ����⤷��ʤ�����

== TV��Ѥ�

  % mythfrontend

== ����ɽ�����Ū�˹���

  % crontab -e
  @daily nice -20 /usr/bin/mythfilldatabase
  %
