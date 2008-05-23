= QuickCam

LogitechのUSB接続のウェブカメラ．

これをLinuxで動かすための設定．実際に動いているかのテスト方法は一番下に書いてある．

カーネル2.6.24くらい以降だとこういうこと↓をしなくてもUSBを挿すだけで使える。

== QuickCam Messenger

こういうやつ．

  % lsusb | grep Logitech
  Bus 001 Device 009: ID 046d:08f0 Logitech, Inc. QuickCam Messenger

=== ドライバ

動かすためには((<ドライバ|URL:http://qce-ga.sourceforge.net/>))（Debianではqc-usb-source）をインストールする必要がある．だけど，オフィシャルなやつだと対応していない．

なので，((<Quickcam Messenger & Communicate driver for Linux|URL:http://home.mag.cx/messenger/>))を使う（このページはオフィシャルページからもリンクされている）．

インストールするにはアーカイブの中にある．make allしてmake installするだけ．ただし，make allするときにカーネルのヘッダファイルがあるディレクトリを指定すること．Debianで言えばこんな感じ．

  % sudo aptitude -V -r install linux-headers-`uname -r`
  % make all LINUX_DIR=/usr/src/linux-headers-`uname -r`
  % sudo make install

自分でmakeするんじゃなくて，インストールスクリプトを使うこともできる．このときはUSBを指しておいた方がよいかも．

  % sudo ./quickcam.sh

ドライバをインストールしたら，あとはUSBを抜き差しでもすれば認識されるはず．

== QuickCam Communicate STX

こういうやつ．

  % lsusb | grep Logitech
  Bus 001 Device 003: ID 046d:08ad Logitech, Inc.

QuickCam Messengerよりも性能がよい．

=== ドライバ

((<spca5xx|URL:http://mxhaard.free.fr/spca5xx.html>))を使えばよい．Debianならこんな感じ．

  % sudo aptitude -V -r install module-assistant
  % sudo module-assistant prepare # あるいはsudo m-a prepare
  % sudo aptitude -V -r install spca5xx-source
  % sudo module-assistant auto-install spca5xx # あるいはm-a a-i spca5xx

あとはUSBを抜き差しでもすれば認識されるはず．

== テスト

テストはgqcamとかgnomemeeting（Ekiga?）でも使えばOK．
