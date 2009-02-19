= Xen

Xenを使って、CentOS 5.2の上でDebian GNU/Linux lennyを動かす。

Ubuntuは8.10 Intrepid IbexからXenをサポートしなくなった（代わりにKVMをサポート）ので、lennyにする。

== CentOSの設定

デフォルトでXen用のカーネルを使うようにする。kernel-xenパッケージを入れる前に、/etc/sysconfig/kernelを編集する必要がある。

変更前:
  DEFAULTKERNEL=kernel

変更後:
  DEFAULTKERNEL=kernel-xen

Xen関連のパッケージをインストールする。

  % sudo yum install -y xen

VMWare上のCentOSだとブリッジモードにするとネットワークがおかしくなるので、XenをNATモードで動かす。あと、Xenで動いているホストは後ろ側に隠したいし。

/etc/xen/xend-config.sxpを編集する。

変更前:
  ...
  (network-script network-bridge)
  ...
  (vif-script vif-bridge)
  ...
  #(network-script network-nat)
  #(vif-script     vif-nat)
  ...

変更後:
  ...
  #(network-script network-bridge)
  ...
  #(vif-script vif-bridge)
  ...
  (network-script network-nat)
  (vif-script     vif-nat)
  ...

再起動する。

== Debian GNU/Linux lennyのインストール

lennyはdebootstrapでインストールする。

XenのDomU関連のものは/var/xen/lenny以下に置くことにする。

  % sudo mkdir -p /var/xen/lenny

まず、インストール先のディスクを用意する。容量は10GBにする。スワップは512MBにする。

  % cd /var/xen/lenny
  % sudo dd if=/dev/zero of=disk.img bs=1M count=10240
  % sudo /sbin/mkfs -t ext3 disk.img
  % sudo dd if=/dev/zero of=swap.img bs=1M count=256
  % sudo /sbin/mkswap swap.img

作成したディスクをマウントし、debootstrapでlennyをインストールする。（参考: ((<lenny用debootstrapパッケージのページ|URL:http://packages.debian.org/source/lenny/debootstrap>))）

  % cd /tmp
  % wget http://ftp.de.debian.org/debian/pool/main/d/debootstrap/debootstrap_1.0.10lenny1.tar.gz
  % tar xvzf debootstrap_1.0.10lenny1.tar.gz
  % cd debootstrap
  % sudo make
  % sudo mount -o loop /var/xen/lenny/disk.img /mnt
  % sudo su - -c "DEBOOTSTRAP_DIR=$PWD $PWD/debootstrap --arch i386 lenny /mnt http://cdn.debian.or.jp/debian/ $PWD/scripts/debian/sid"

ベースシステムがインストールできたら、chrootして基本的な設定を行う。

  % sudo su - -c "/sbin/chroot /mnt"
  lenny# apt-key update
  lenny# aptitude update
  lenny# aptitude install -V -D -y sudo ssh linux-image-xen-686 lv vim

ホスト名の設定:
  lenny# echo 'xm-lenny' > /etc/hostname

/etc/hosts:
  127.0.0.1 localhost
  127.0.1.1 xm-lenny.example.com xm-lenny

  # The following lines are desirable for IPv6 capable hosts
  ::1     ip6-localhost ip6-loopback
  fe00::0 ip6-localnet
  ff00::0 ip6-mcastprefix
  ff02::1 ip6-allnodes
  ff02::2 ip6-allrouters
  ff02::3 ip6-allhosts

/etc/fstab:
  # _
  # /etc/fstab: static file system information.
  #
  # <file system> <mount point>   <type>  <options>       <dump>  <pass>
  proc            /proc           proc    defaults        0       0
  /dev/sda1       /               ext3    defaults,errors=remount-ro 0       1
  /dev/sda2       none            swap    sw              0       0

ネットワークの設定。lennyのIPアドレスとして192.168.1.2を使う。このアドレスはあとでXenの設定をするときに使う。

デフォルトゲートウェイはIPアドレスの最後の数字に127を足したものにする。この場合は192.168.1.129になる。（127は/etc/xen/scripts/vif-natの中で使われている数字。）

/etc/network/interfaces:
  # _
  # Used by ifup(8) and ifdown(8). See the interfaces(5) manpage or
  # /usr/share/doc/ifupdown/examples for more information.
  
  auto lo
  iface lo inet loopback
  
  auto eth0
  iface eth0 inet static
    address 192.168.1.2
    netmask 255.255.255.0
    gateway 192.168.1.129

設定が完了したら、chrootを抜けて、ホスト側にlennyのカーネルを取り出す。

アンマウントする。

  lenny# exit
  % sudo cp /mnt/boot/{vmlinuz,initrd.img}-2.6.26-1-xen-686 /var/xen/lenny/
  % cd /var/xen/lenny
  % sudo ln -s vmlinuz-2.6.26-1-xen-686 vmlinuz
  % sudo ln -s initrd.img-2.6.26-1-xen-686 initrd.img
  % sudo umount /mnt

== DomainUとして登録

インストールしたlennyをDomUとして登録する。設定は/etc/xen/xm-lennyとする。

注意する点は、vifのIPアドレスはlennyに設定したIPアドレスと同じにすることと、extraにxencons=ttyを設定すること。

IPアドレスが異なると外に出られない。xencons=ttyをつけないと、起動時に止まってしまう。

/etc/xen/xm-lenny:
  kernel  = '/var/xen/lenny/vmlinuz'
  ramdisk = '/var/xen/lenny/initrd.img'
  memory  = '256'
  root    = '/dev/sda1 ro'
  disk    = ['file:/var/xen/lenny/disk.img,sda1,w', 'file:/var/xen/lenny/swap.img,sda2,w']
  name    = 'lenny'
  vif     = ['ip=192.168.1.2']
  on_poweroff = 'destroy'
  on_reboot   = 'restart'
  on_crash    = 'restart'
  extra   = 'xencons=tty'

ためしに起動してみる。

  % sudo /usr/sbin/xm create /etc/xen/xm-lenny -c

ログインプロンプトがでたら成功。パスワードなしでrootでログインできる。

ユーザを作成し、sudoの設定をしたらrootのパスワードは潰す。

  # adduser kou
  # visudo
  # passwd -l
  # exit

lennyのコンソールからはCtrl+]で抜けられる。

自動起動するようにする場合は、/etc/xen/xm-lennyへのリンクを/etc/xen/auto/以下に置く。

  % sudo ln -s /etc/xen/xm-lenny /etc/xen/auto/

これで起動・終了・再起動などができるようになる。

  % sudo /sbin/service xendomains start
  % sudo /sbin/service xendomains stop
  % sudo /sbin/service xendomains restart

起動しているDomUは以下で確認できる。

  % sudo /usr/sbin/xm list

lennyが起動したら、通常のホストのようにsshで接続し作業する。
