= PTM-UBT3S

Debian GNU/LinuxをUSB接続のBluetoothアダプタPTM-UBT3Sを使ってP902iSのAudio Sinkにしたい。
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

Bluetooth対応端末が、自分はこんなことができるよ、とかいうのがプロファイルらしい。
今回はAudio Sink（音声再生）ができると言いたい。

/etc/default/bluetoothの一番最後に書いてあるSDPTOOL_OPTIONSにadd A2SNKを追加。
  SDPTOOL_OPTIONS="add A2SNK"

複数書くときは「 ; 」で区切る。
  SDPTOOL_OPTIONS="add A2SNK ; add AVRTG ; add OPUSH ; add HS"

OPUSHはファイル共有（？）でHSはハンドセットらしい。

反映させるためにbluetoothサービスを再起動。

  % sudo /etc/init.d/bluetooth stop
  % sudo /etc/init.d/bluetooth start

restartを使うとプロファイルの設定が反映されないので注意。

以下でいろいろ出てきたらたぶん大丈夫。

  % sdptool browse local
  ...
  Service Name: Audio Sink
  Service RecHandle: 0x10002
  Service Class ID List:
    "Audio Sink" (0x110b)
  Protocol Descriptor List:
    "L2CAP" (0x0100)
      PSM: 25
    "AVDTP" (0x0019)
      uint16: 0x100
  Profile Descriptor List:
    "Advanced Audio" (0x110d)
      Version: 0x0100
  ...

== 音声受信設定

Bluetooth経由で音声を受信するためにはbluetoothd-service-audioを使う。

けど、Debianのbluez-utilsパッケージは--enable-audioでコンパイルされていないのでbluetoothd-service-audioがインストールされない。たぶん、Ubuntuだとインストールされてる気がする。残念でした。

ではあれなので、audio/以下でbluetoothd-service-audio関連だけmake installしてもう少し頑張ってみた。ログとソースを見ながら手探り。

=== 必要なファイル

audio/以下でmake installするとインストールされるファイルが足りない。具体的には以下のとおり。

  * /etc/bluetooth/audio.conf
  * /etc/bluetooth/audio.service
  * /usr/lib/bluetooth/bluetoothd-service-audio

=== 自動起動

/etc/bluetooth/audio.confのAutostartを変更して、hcidが起動したら音声サービス用のサーバbluetoothd-service-audioも起動するようにする。

  Autostart=true

再起動を忘れずに。

  % sudo /etc/init.d/bluetooth stop
  % sudo /etc/init.d/bluetooth start

以下で/org/bluez/service_audioが出力されたら大丈夫。

  % sudo dbus-send --system --print-reply --dest=org.bluez /org/bluez org.bluez.Manager.ListServices
  method return sender=:1.106 -> dest=:1.108 reply_serial=2
     array [
        string "/org/bluez/service_audio"
     ]

== 接続設定
