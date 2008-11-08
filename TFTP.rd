= TFTP

Debianでの話。

((<PXE>))用のブートローダを配布するために使う。

== インストール

  % sudo aptitude -V -r install tftpd-hpa

== 設定

特に無し。/var/lib/tftpboot/以下におけば公開される。

== 確認

TFTPクライアントをインストール。

  % sudo aptitude -V -r install tftp-hpa

アップロードしたファイルをダウンロードしてみる。

  % cd /tmp
  % echo data > data.txt
  % sudo cp data.txt /var/lib/tftpboot/xxx.txt
  % tftp localhost -c get xxx.txt
  % cat xxx.txt
  data
  %

== ネットワークブートインストール用の設定

ネットワークブートインストールをするためにファイルを公開する例。

((<netboot|URL:http://cdn.debian.or.jp/debian/dists/etch/main/installer-i386/current//images/netboot/>))
用のイメージをダウンロードする。netboot.tar.gzをダウンロードすればよい。

  % cd /var/lib/tftpboot
  % sudo tar xvfz /tmp/netboot.tar.gz

あとは、((<DHCP>))(BOOTP)サーバがクライアントに「/pxelinux.0を読め」と返事をすればよい。
