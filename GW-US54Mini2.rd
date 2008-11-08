= GW-US54Mini2

PLANEXのUSBアダプタ((<GW-US54Mini2|URL:http://www.planex.co.jp/support/download/wireless/gw-us54mini2/>))をDebian GNU/Linux上で使う設定。

USB IDはこんな感じ。

  % lsusb
  Bus 004 Device 029: ID 2019:ab50  

((<GW-US54GXS>))と同じチップを使っているかと思って買ったら違うチップだった。
ドライバがMasterモードに対応していないからアクセスポイントにできない。（チップは対応しているみたい。）

== ドライバ

2.6.24だとカーネル本体に取り込まれていた。

ただし、ファームウェアは別途用意しないといけない。

== ファームウェア

((<ライセンスを確認|URL:http://rt2x00.serialmonkey.com/wiki/index.php?title=Firmware_license>))してrt73の((<ファームウェアをダウンロード|URL:http://www.ralinktech.com.tw/data/RT71W_Firmware_V1.8.zip>))する。((-.zipの中にもライセンスが入っている。-))

.zipの中のrt73.binがファームウェアなので、それを/lib/firmware/にコピーする。

  % unzip RT71W_Firmware_V1.8.zip
  % sudo cp RT71W_Firmware_V1.8/rt73.bin /lib/firmware/

== 設定

/etc/network/interfacesにこんなのを書く。

  allow-hotplug wlan0
  iface wlan0 inet dhcp
      wireless-essid your-essid
      wireless-key XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XX
