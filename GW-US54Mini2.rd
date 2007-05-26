= GW-US54Mini2

PLANEXのUSBアダプタ((<GW-US54Mini2|URL:http://www.planex.co.jp/support/download/wireless/gw-us54mini2/>))をDebian GNU/Linux上で使う設定。

USB IDはこんな感じ。

  % lsusb
  Bus 004 Device 029: ID 2019:ab50  

((<GW-US54GXS>))と同じチップを使っているかと思って買ったら違うチップだった。
ドライバがMasterモードに対応していないからアクセスポイントにできない。（チップは対応しているみたい。）

== ドライバ

((<rt2x00プロジェクト|URL:http://rt2x00.serialmonkey.com/>))のrt73というモジュール（？ドライバ？）を使う。

Debianにもrt73-sourceというパッケージがあってmodule-assistantを使えば以下のようにビルドできるんだけど、パッケージになっているやつは少し古くて2.6.21とかじゃビルドできない。

  % m-a a-i rt73

ということで、CVSのやつを使う。

  % cvs -z3 -d:pserver:anonymous@rt2400.cvs.sourceforge.net:/cvsroot/rt2400 co -P -d rt73 source/rt73

ビルドは簡単。

  % cd rt73
  % make
  % sudo make install

もう少し使い勝手を良くするならこんなパッチを当てておくといいかも。

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

インターフェイスがupしていなくてもessidとkeyを設定できるようにしている。downしているかどうかを明示的にチェックしているけど、チェックしないとなにか問題があるのかしら。

== 設定

/etc/network/interfacesにこんなのを書く。

  allow-hotplug wlan0
  iface wlan0 inet dhcp
      wireless-essid your-essid
      wireless-key XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XX

パッチを当てていれば挿しただけで動く。当てていなければ挿したあとに手動でifup/ifdownしなおす。

  % sudo /sbin/ifdown wlan0
  % sudo /sbin/ifup wlan0
