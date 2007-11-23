= PTM-UBT3S

Debian GNU/LinuxでUSB接続のBluetoothアダプタPTM-UBT3Sを使ってAudio Sinkを作りたい。
けど、まだ無理という話。

== Bluetoothの設定

USB IDはこんな感じ。

  % lsusb
  Bus 004 Device 006: ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle (HCI mode)

認識させるだけなら簡単。ここらへんをインストールすれば認識されるはず。

  % sudo aptitude -V -r install bluetooth bluez-firmware bluez-utils

hcidumpもあると便利。

  % sudo aptitude -V -r install bluez-hcidump

hcitoolで自分のデバイスが見れれば認識されている。

  % hcitool dev
  Devices:
          hci0    00:11:22:33:44:55

== プロファイルの設定
