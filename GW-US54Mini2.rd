= GW-US54Mini2

PLANEX��USB�����ץ�((<GW-US54Mini2|URL:http://www.planex.co.jp/support/download/wireless/gw-us54mini2/>))��Debian GNU/Linux��ǻȤ����ꡣ

USB ID�Ϥ���ʴ�����

  % lsusb
  Bus 004 Device 029: ID 2019:ab50  

((<GW-US54GXS>))��Ʊ�����åפ�ȤäƤ��뤫�Ȼפä���ä���㤦���åפ��ä���
�ɥ饤�Ф�Master�⡼�ɤ��б����Ƥ��ʤ����饢�������ݥ���ȤˤǤ��ʤ����ʥ��åפ��б����Ƥ���ߤ�������

== �ɥ饤��

((<rt2x00�ץ�������|URL:http://rt2x00.serialmonkey.com/>))��rt73�Ȥ����⥸�塼��ʡ��ɥ饤�С��ˤ�Ȥ���

Debian�ˤ�rt73-source�Ȥ����ѥå����������ä�module-assistant��Ȥ��аʲ��Τ褦�˥ӥ�ɤǤ��������ɡ��ѥå������ˤʤäƤ����ĤϾ����Ť���2.6.21�Ȥ�����ӥ�ɤǤ��ʤ���

  % m-a a-i rt73

�Ȥ������Ȥǡ�CVS�Τ�Ĥ�Ȥ���

  % cvs -z3 -d:pserver:anonymous@rt2400.cvs.sourceforge.net:/cvsroot/rt2400 co -P -d rt73 source/rt73

�ӥ�ɤϴ�ñ��

  % cd rt73
  % make
  % sudo make install

�⤦�����Ȥ�������ɤ�����ʤ餳��ʥѥå������ƤƤ����Ȥ������⡣

  # enscript diffu
  Index: rtmp_info.c
  ===================================================================
  RCS file: /cvsroot/rt2400/source/rt73/Module/rtmp_info.c,v
  retrieving revision 1.24
  diff -u -p -r1.24 rtmp_info.c
  --- rtmp_info.c 14 May 2007 04:33:46 -0000      1.24
  +++ rtmp_info.c 26 May 2007 12:34:10 -0000
  @@ -875,8 +875,8 @@ int rt_ioctl_siwessid(struct net_device 
          ULONG           Length;

       //check if the interface is down
  -    if (pAdapter->RTUSBCmdThr_pid < 0)
  -        return -ENETDOWN;
  +/*     if (pAdapter->RTUSBCmdThr_pid < 0) */
  +/*         return -ENETDOWN; */

       memset(&Ssid, 0, sizeof(NDIS_802_11_SSID));

  @@ -1100,8 +1100,8 @@ int rt_ioctl_siwencode(struct net_device
          CHAR    kid = 0;

       //check if the interface is down
  -    if (pAdapter->RTUSBCmdThr_pid < 0)
  -        return -ENETDOWN;
  +/*     if (pAdapter->RTUSBCmdThr_pid < 0) */
  +/*         return -ENETDOWN; */

          memset(&WepKey, 0, sizeof(WepKey));

���󥿡��ե�������up���Ƥ��ʤ��Ƥ�essid��key������Ǥ���褦�ˤ��Ƥ��롣down���Ƥ��뤫�ɤ���������Ū�˥����å����Ƥ��뤱�ɡ������å����ʤ��Ȥʤˤ����꤬����Τ����顣

== ����

/etc/network/interfaces�ˤ���ʤΤ�񤯡�

  allow-hotplug wlan0
  iface wlan0 inet dhcp
      wireless-essid your-essid
      wireless-key XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XX

�ѥå������ƤƤ�����ޤ���������ư�������ƤƤ��ʤ�����ޤ������Ȥ˼�ư��ifup/ifdown���ʤ�����

  % sudo /sbin/ifdown wlan0
  % sudo /sbin/ifup wlan0
