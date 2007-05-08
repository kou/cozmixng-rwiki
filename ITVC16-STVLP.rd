= ITVC16-STVLP

玄人指向のTVチューナカード
((<ITVC16-STVLP|URL:http://www.kuroutoshikou.com/products/tvcuner/itvc16.html>))
をDebianで動かす設定。

lspciで言うとこんなやつ。

  % lspci | grep iTVC16
  00:07.0 Multimedia video controller: Internext Compression Inc iTVC16 (CX23416) MPEG-2 Encoder (rev 01)

== インストール

以下のようにコンパイル済みのカーネルモジュールをインストールする（パッケージ名は環境に合わせて）。

  % sudo aptitude -V -r install ivtv-modules-2.6-k7

あるいは、自分でコンパイルする。

  % sudo aptitude -V -r install module-assistant
  % m-a a-i ivtv

カーネルモジュールをインストールしたらファームウェアをインストールする。そのために、以下を/etc/apt/sources.listに追加する。

  deb http://www.hellion.org.uk/debian sid main
  deb-src http://www.hellion.org.uk/debian sid main

そして、インストール。

  % sudo aptitude -V -r install ivtv-firmware

== 設定

用意ができたので、カーネルモジュールを読み込む。

  % sudo modprobe -v ivtv cardtype=5 tuner=17

cardtype=5は自動検出を無効にしてITVC16-STVLPを明示的に指定するということ。

tuner=17は自動検出を無効にしてPhilipsのチューナを明示的に指定するということ（だと思う）。
チューナの種類は以下を見ればよい。

  /usr/src/linux-headers-`uname -r`/include/media/tuner.h

カードが正常に認識されたかはdmesgで確認する。

正常に認識された場合は以下のようにしてチューナからMPEG2を生成できる。

  % cat /dev/video0 > /tmp/XXX.mpg

内容は以下のようにして確認できる。

  % xine /tmp/xxx.mpg

ただし、砂嵐。

== テレビを観る

MythTVをインストールする。そのために、以下を/etc/apt/sources.listに追加する。

  deb http://www.debian-multimedia.org sid main
  deb-src http://www.debian-multimedia.org sid main

そして、インストール。

  % sudo aptitude -V -r install mythtv
