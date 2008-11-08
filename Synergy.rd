= Synergy

ネットワーク経由でキーボードとマウスを共有するためのソフトウェア。Linux/Mac OS X/Windowsなどいろんなプラットフォームで動く。

LinuxではMac OS XではMacPortsにもなっている。

== 設定

共有したいキーボードとマウスを持っている側がサーバ、そのキーボードとマウスを使って動かしたいホストがクライアント。

サーバ側の~/.synergy.confに設定を書く。以下のような状況の時の設定ファイルの例。

: サーバのホスト名
   linux-server

: クライアントのホスト名
   mac-client

: 配置
   linux-serverのディスプレイの左側にmac-clientのディスプレイが置いてある。

     +----------+  +------------+
     |mac-client|  |linux-server|
     +----++----+  +-----++-----+
          ||             ||
        ======        ========

~/.synergyc.conf

  section: screens
    linux-server:
    mac-client:
  end

  section: links
    linux-server:
      left = mac-client
    mac-client:
      right = linux-server
  end

ここではクライアントは一台だが複数台の設定もできる。

== 起動

サーバ側:
  % synergys -f

クライアント側:
  % synergyc -f linux-server

クライアント側がlinux-serverでサーバのホスト名を解決できない場合はIPアドレスで指定しても良い。

  % synergyc -f 192.168.1.123

