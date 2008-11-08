= Debian GNU/Linux

Debian GNU/Linux関係の作業記録

== wheelグループ以外su出来ないようにする

/etc/pam.d/suの以下のコメント行を有効にする．

  # auth       required   pam_wheel.so group=wheel

group=wheelを省略するとgourp=rootが指定されたものとみなされる．

== sshdでrootのログインを拒否する

/etc/ssh/sshd_configの以下の行をコメントアウトする．または，yesを((*no*))にする．

  PermitRootLogin yes


== {CD,DVD}-R/RWを使う

/etc/modulesに以下を記述

  ide-scsi
  sg

/boot/grub/menu.lstのkernelの行にhdc=ide-scsiを追加

  title Debian GNU/Linux
  root (hd0,0)
  kernel /vmlinuz root=/dev/hda1 hdc=ide-scsi
  initrd /initrd.img

再起動

/dev/sr0を/dev/cdromにシンボリックリンクする

  % cd /dev
  % sudo ln -s sr0 cdrom

以下必要だったかなぁ？

/dev/scd0のグループをcdromにする

  % sudo chgrp cdrom /dev/scd0
  % sudo chmod g+rw /dev/scd0

{CD,DVD}-R/RWを使うユーザをcdromグループにいれる

  % sudo adduser hoge cdrom

== NFSでマウントする

((*portmapをインストールしておかないといけません．*))

  % sudo mount -t nfs サーバ名:/hoge /fuga/hoge

== IPv6のアドレスを設定する

/etc/network/interfacesに以下のように記述する．

以下は自分のアドレスが，AAAA:BBBB:CCCC:DDDD::fff0/64が自分のIPv6のアドレス，AAAA:BBBB:CCCC:DDDD::1がデフォルトルータのIPv6アドレスの場合．

  iface eth0 inet6 static
    address AAAA:BBBB:CCCC:DDDD::fff0
    netmask 64
    gateway AAAA:BBBB:CCCC:DDDD::1

手動でやるにはこう．

  % sudo /sbin/ifconfig eth0 add AAAA:BBBB:CCCC:DDDD::fff0/64
  % sudo /sbin/route -A inet6 add ::/1 dev eth0 gw AAAA:BBBB:CCCC:DDDD::1
