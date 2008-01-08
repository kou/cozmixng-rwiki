= DHCP

Debianでの話。

PXEブートをサポートするため、BOOTP対応のDHCPサーバの設定。

== インストール

  % sudo aptitude -V -r install dhcp3-server

== 設定

以下のような設定とする。

: ネットワーク
   192.168.0.0

: デフォルトゲートウェイ/ルータ
   192.168.0.1

: DNSサーバ
   192.168.0.2

: ドメイン名
   local.net

: 割り当て範囲
   192.168.0.100 - 192.168.0.120

: TFTPでダウンロードするファイル名
   /pxelinux.0

/etc/dhcp3/dhcpd.confの変更点のみ。

  option domain-name "local.net";
  option domain-name-servers 192.168.0.2;

  subnet 192.168.0.0 netmask 255.255.255.0 {
    filename "/pxelinux.0";
    range dynamic-bootp 192.168.0.100 192.168.0.120;
    option routers 192.168.0.1;
  }

rangeのdynamic-bootpがポイント。


