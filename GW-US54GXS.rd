= GW-US54GXS

PLANEXのUSBアダプタ
((<GW-US54GXS|URL:http://www.planex.co.jp/product/wireless/gw-us54gxs.shtml>))
をDebian GNU/Linux上でアクセスポイント兼ルータとして動作させる設定。

USB IDはこんな感じ。

  % lsusb
  Bus 004 Device 001: ID 2019:5303

== 必要なもの

  * ドライバ
  * DHCPサーバ
  * DNSサーバ

=== ドライバ

((<URL:http://zd1211.ath.cx/>))にあるZD1211というドライバを使う。

ただ、最新版(r83)ではGW-US54GXSは正式にサポートされていない
ので、ソースを持ってきて少しいじる。ということで、最新版を持っ
てくる。

  % svn co http://zd1211.ath.cx/repos/trunk zd1211

== コンパイル

とりあえず、こんなパッチをあてる。

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

これを/tmp/zd1211-gw-us54gxs.diffとかで保存したならこうする。

  % cd zd1211
  % patch -p0 < /tmp/zd1211-gw-us54gxs.diff

あとは、コンパイルしてインストールする。

  % make
  % sudo make install

== 設定

必要なパッケージをインストールする．

  % sudo aptitude -V -r install wireless-tools zd1211-firmware

=== カーネルモジュールの設定

/etc/modulesに以下を追加。

  zd1211b
  iptable_nat

=== インターフェイスの設定

/etc/network/interfacesにこんなのを書く。

  auto wlan0
  allow-hotplug wlan0
  iface wlan0 inet static
      address 192.168.1.1
      netmask 255.255.255.0
      network 192.168.1.0
      broadcast 192.168.1.255
      wireless_essid local-wireless
      wireless_mode master
      wireless_key XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XX
      pre-up /sbin/iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
      pre-up /etc/init.d/dhcp stop
      pre-up /etc/init.d/bind stop
      post-up iwpriv wlan0 set_mac_mode 1
      post-up /etc/init.d/dhcp start
      post-up /etc/init.d/bind start
      post-down /sbin/iptables -t nat -D POSTROUTING -s 192.168.1.0/24 -j MASQUERADE

wireless_keyに設定する

  XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XX

は16進で書く。適当なやつでいいのならこんなんでも生成できる。

  % ruby -e '26.times {|i| print "%X" % rand(16); print "-" if (i % 4) == 3}; puts'

=== パケットフォワーディングの設定

/etc/network/optionsに以下を追加。

  ip_forward=yes

有効にする．

  % sudo /etc/init.d/networking restart

=== DHCPサーバの設定

とりあえず，インストール．

  % sudo aptitude -V -r install dhcp

/etc/dhcpd.confに以下のようなやつを書く。

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

/etc/default/dhcpの

  INTERFACES="..."

にwlan0を加える。

  INTERFACES="... wlan0"

=== DNSサーバの設定

インストールするだけでOK．

  % sudo aptitude -V -r install bind

== 動作

手順はこんな感じ．

  * 無線LANアダプタを挿す
  * インターフェイスを有効にする

      % sudo /sbin/ifup wlan0

  * 使う
  * インターフェイスを無効にする

      % sudo /sbin/ifdown wlan0

  * 無線LANアダプタを抜く
