= GW-US54GXS

PLANEX��USB�����ץ�((<GW-US54GXS|URL:http://www.planex.co.jp/product/wireless/gw-us54gxs.shtml>))��Debian GNU/Linux��ǥ��������ݥ���ȤȤ���ư��������ꡣ

USB ID�Ϥ���ʴ�����

  % lsusb
  Bus 004 Device 001: ID 2019:5303

== ɬ�פʤ��

  * �ɥ饤��
  * DHCP������
  * DNS������

=== �ɥ饤��

((<URL:http://zd1211.ath.cx/>))�ˤ���ZD1211�Ȥ����ɥ饤�Ф�Ȥ���

�������ǿ���(r83)�Ǥ�GW-US54GXS�������˥��ݡ��Ȥ���Ƥ��ʤ��Τǡ�����������äƤ��ƾ��������롣�Ȥ������Ȥǡ��ǿ��Ǥ���äƤ��롣

  % svn co http://zd1211.ath.cx/repos/trunk zd1211

== ����ѥ���

�Ȥꤢ����������ʥѥå��򤢤Ƥ롣

  # enscript diffu
  Index: src/zdusb.c
  ===================================================================
  --- src/zdusb.c (revision 83)
  +++ src/zdusb.c (working copy)
  @@ -81,6 +81,7 @@
                   { USB_DEVICE(0x1233, 0x0471) },
                   { USB_DEVICE(0x157e, 0x300d) },
                   { USB_DEVICE(0x1582, 0x6003) },
  +                { USB_DEVICE(0x2019, 0x5303) },
   #elif defined(ZD1211)
                   { USB_DEVICE(0x0105, 0x145f) },
                   { USB_DEVICE(0x0586, 0x3401) },
  Index: Makefile
  ===================================================================
  --- Makefile  (revision 83)
  +++ Makefile  (working copy)
  @@ -19,7 +19,7 @@
   #KERNEL_SOURCE=/usr/src/linux

   # set to 1 for zd1211b
  -ZD1211REV_B=0
  +ZD1211REV_B=1

   SRC_DIR=src
   DEFINES=-D__KERNEL__ -DMODULE=1

�����/tmp/zd1211-gw-us54gxs.diff�Ȥ�����¸�����ʤ餳�����롣

  % cd zd1211
  % patch -p0 < /tmp/zd1211-gw-us54gxs.diff

���Ȥϡ�����ѥ��뤷�ƥ��󥹥ȡ��뤹�롣

  % make
  % sudo make install

== ����

=== ���󥿡��ե�����������

/etc/network/interfaces�ˤ���ʤΤ�񤯡�

  auto wlan0
  iface wlan0 inet static
      address 192.168.1.1
      netmask 255.255.255.0
      network 192.168.1.0
      broadcast 192.168.1.255
      wireless_essid local-wireless
      wireless_mode master
      wireless_key XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XX
      pre-up /etc/init.d/dhcp stop
      post-up iwpriv wlan0 set_mac_mode 1
      post-up /etc/init.d/dhcp start

wireless_key�����ꤹ��

  XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XX

��16�ʤǽ񤯡�Ŭ���ʤ�ĤǤ����Τʤ餳��ʤ�Ǥ������Ǥ��롣

  % ruby -e '26.times {|i| print "%X" % rand(16); print "-" if (i % 4) == 3}; puts'

=== DHCP�����Ф�����

/etc/dhcpd.conf�˰ʲ��Τ褦�ʤ�Ĥ�񤯡�

  subnet 192.168.1.0 netmask 255.255.255.0 {
       range 192.168.1.2 192.168.1.20;
       option routers 192.168.1.1;
       option subnet-mask 255.255.255.0;
       option broadcast-address 192.168.1.255;
       option domain-name "local.net";
       option domain-name-servers 192.168.1.1;
       default-lease-time 6000;
       max-lease-time 72000;
  }

=== DNS�����Ф�����

...
