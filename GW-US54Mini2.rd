= GW-US54Mini2

PLANEX��USB�����ץ�((<GW-US54Mini2|URL:http://www.planex.co.jp/support/download/wireless/gw-us54mini2/>))��Debian GNU/Linux��ǻȤ����ꡣ

USB ID�Ϥ���ʴ�����

  % lsusb
  Bus 004 Device 029: ID 2019:ab50  

((<GW-US54GXS>))��Ʊ�����åפ�ȤäƤ��뤫�Ȼפä���ä���㤦���åפ��ä���
�ɥ饤�Ф�Master�⡼�ɤ��б����Ƥ��ʤ����饢�������ݥ���ȤˤǤ��ʤ����ʥ��åפ��б����Ƥ���ߤ�������

== �ɥ饤��

2.6.24���ȥ����ͥ����Τ˼����ޤ�Ƥ�����

���������ե����०�����������Ѱդ��ʤ��Ȥ����ʤ���

== �ե����०����

((<�饤���󥹤��ǧ|URL:http://rt2x00.serialmonkey.com/wiki/index.php?title=Firmware_license>))����rt73��((<�ե����०��������������|URL:http://www.ralinktech.com.tw/data/RT71W_Firmware_V1.8.zip>))���롣((-.zip����ˤ�饤���󥹤����äƤ��롣-))

.zip�����rt73.bin���ե����०�����ʤΤǡ������/lib/firmware/�˥��ԡ����롣

  % unzip RT71W_Firmware_V1.8.zip
  % sudo cp RT71W_Firmware_V1.8/rt73.bin /lib/firmware/

== ����

/etc/network/interfaces�ˤ���ʤΤ�񤯡�

  allow-hotplug wlan0
  iface wlan0 inet dhcp
      wireless-essid your-essid
      wireless-key XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XX
