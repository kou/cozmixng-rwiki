= HT-01A

docomoのWindows Mobile 6.1端末HT-01AとDebianの話。HT-01AはHTC製。

== ファイル転送

synce-halとlibrapi2-toolsを使うとActiveSync経由でファイル転送ができる。端末との接続はUSB。WebでググるとRNDIS（rndis_host）を使うみたいなことが書いてあるけど、今は必要ないみたい。

  % sudo aptitude -V -D install synce-hal librapi2-tools
  % sudo /etc/init.d/hal restart

接続できるか確認する。接続できるとsynce-plsでマイドキュメントの中が表示できる。

  % synce-pls
  Directory               2008-10-21 12:00:12  マイ ピクチャ/
  Directory               2008-10-21 12:00:12  テンプレート/
  Directory               2008-10-21 12:00:14  個人用/
  Directory               2008-10-21 12:00:14  会社関係 (取引先)/
  Directory               2008-10-21 12:00:14  マイ ミュージック/
  Directory               2008-10-21 12:00:14  着信音/
  Directory               2008-10-21 12:03:04  マイボイス/
  Directory               2008-10-21 12:03:10  マイ ビデオ/
  Directory               2009-04-14 23:02:50  Bluetooth 共有/

接続できるとppp0ができている。

  % /sbin/ifconfig
  ...
  ppp0      Link encap:Point-to-Pointプロトコル  
            inetアドレス:192.168.131.1 P-t-P:192.168.131.129  マスク:255.255.255.255
            UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  メトリック:1
            RXパケット:66294 エラー:0 損失:0 オーバラン:0 フレーム:0
            TXパケット:114039 エラー:0 損失:0 オーバラン:0 キャリア:0
        衝突(Collisions):0 TXキュー長:3 
            RXバイト:2730015 (2.6 MiB)  TXバイト:167519080 (159.7 MiB)
  ...

HT-01AをUSBで接続するとipaqモジュールが認識してttyUSB0を作っているみたいなんだけど、それ経由で通信しているのかしら。RNDISを使うとeth?として見えると書いてあったんだけど、それの代わりにPPPでつながっているのかもしれない。

ファイル操作は以下のコマンドを使って頑張る。

  * synce-pcp: cp
  * synce-prm: rm
  * synce-pmkdir: mkdir
  * synce-prmdir: rmdir

synce-pceでコピーするときはリモートファイルのパスの先頭に":"をつけなければいけないことに注意。

  % synce-pcp local.txt :/マイストレージ/remote.txt

synce-plsだと相対パスで書くと、マイドキュメントからの相対パスになるけど、synce-pceだとルートからの相対パスになるみたい。
