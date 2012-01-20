= KVM

Kernel-based Virtual Machine。

Linuxの仮想化システム。

== 前提

Debian GNU/Linux Squeezeをホスト機として、その上にゲスト機としてFreeBSD 9 amd64とDebian GNU/Linux Squeeze amd64をインストールする。ゲスト機はホスト機のNICと同じセグメントにいれる。そのため、ホスト機とゲスト機をブリッジ接続する。また、ホスト機は2枚のNICがあり、それぞれ別セグメントにする。

== インストール

KVM自体とKVMを管理するツールであるlibvirt((-もう少し言うとKVMだけではなくXenやVirtualBoxなど多くの仮想化システムに対応した管理ツールである。-))をインストールする。

  % sudo aptitude -V -r -D -y install kvm libvirt-bin virt-top virt-viewer virtinst

libvirt-binが仮想マシン管理システムを提供する。libvirtdが管理用のサーバーでvirshがサーバーにつないでいろいろ操作するシェル。

virt-topは仮想マシン用のtopを提供する。

virt-viewerは仮想マシンにVNCでつないで、仮想マシンをGUIで操作するためにつかう。インストール時とか初期設定のときとかに使う。

virtinstは新しい仮想マシンのインストールを簡単にやってくれる便利ツール。

libvirt関連のツールはrootユーザーかlibvirtグループに入っているユーザーしか使えないので、作業用の一般ユーザーをlibvirtグループに入れておく。

  % sudo adduser kou libvirt

グループの設定を反映させるためにログインしなおす。

== 設定

=== ブリッジの設定

/etc/network/interfacesを編集する。

編集する前にバックアップをとっておく。

  % sudo cp -p /etc/network/interfaces{,.no-bridge}

基本的な流れは以下の通り。

  * 既存のethNの設定をbrNに移す。
  * ethNにはIPの設定をしない。
  * brNにethNをNICとして使うブリッジ用の設定を追加。

既存のeth0の設定が以下のようにあるとする。

  allow-hotplug eth0
  iface eth0 inet static
  	address 192.168.0.127
  	netmask 255.255.255.0
  	network 192.168.0.0
  	broadcast 192.168.0.255
  	gateway 192.168.0.254
  	# dns-* options are implemented by the resolvconf package, if installed
  	dns-nameservers 192.168.0.254
  	dns-search example.com

これをブリッジ用インターフェイスbr0として使うには以下のようにする。

  allow-hotplug eth0
  iface eth0 inet static
  	address 0.0.0.0

  auto br0
  iface br0 inet static
  	bridge_ports eth0
  	bridge_stp on
  	bridge_maxwait 0
  	address 192.168.0.127
  	netmask 255.255.255.0
  	network 192.168.0.0
  	broadcast 192.168.0.255
  	gateway 192.168.0.254
  	# dns-* options are implemented by the resolvconf package, if installed
  	dns-nameservers 192.168.0.254
  	dns-search example.com

以下のようにすれば反映できる。（ifup/ifdownでも個別にできるが、2つのインターフェイスの設定を変えないといけないためこっちの方が楽だと思う。あるいは再起動する。）

  % sudo /usr/sbin/service networking restart

ただ、リモートから作業しているとネットワークの設定をするのは怖い。なので、以下のように万が一うまくいかないときは自動で元の設定に戻すようにするのがいいのではないかと思う。

まず、ブリッジの設定をした設定をバックアップする。

  % sudo cp -p /etc/network/interfaces{,.bridge}

以下のようなシェルスクリプトを用意する。/usr/local/sbin/以下が適切な気もするが、とりあえず、/etc/recover-network.shとしておく。

  #!/bin/sh
  
  ping -c 1 -w 10 google.com > /dev/null && exit
  
  cp -p /etc/network/interfaces.no-bridge /etc/network/interfaces

  /sbin/shutdown -r now

もし内部ネットワークでインターネットにでれないならgoogle.comのところを内部のどこかのマシンにする。

実行権をつけるのを忘れずに。

  % sudo chmod +x /etc/recover-network.sh

で、これをcronに登録する。一時的なものなので/etc/crontabでいい。

/etc/crontab:
  30 * * * * root /etc/recover-network.sh

ここでは実行される時間を毎時30分にしているが、再起動する時間の5分後くらいに動くようにしておくこと。そうしないと、ネットワークの設定がうまくいかないときになかなか復活しない。

あとは再起動して少し待ってsshする。つながらなかったらcronが動くまで待ってそれからsshする。これでもダメなら残念。リモートから復旧はできない。

  % sudo /sbin/shutdown -r now

NICが2枚あるという設定なので同様にeth1とbr1も設定する。

=== FreeBSD 9 amd64のインストール

まずはインストールCDのISOをダウンロードする。

  % wget -c ftp://ftp.jp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/ISO-IMAGES/9.0/FreeBSD-9.0-RELEASE-amd64-disc1.iso

ISOはどこに置いていてもいいが、libvirt関連のファイルが/var/lib/libvirt/以下にまとまっていそうなのでその下に置くことにする。

  % sudo mkdir -p /var/lib/libvirt/isos
  % sudo mv FreeBSD-9.0-RELEASE-amd64-disc1.iso /var/lib/libvirt/isos/

以下のような設定で仮想マシンを作成する。

: 名前（ゲスト機のホスト名ではなくてホスト機からみたゲストマシンの名前）
    www
: メモリー
    1GB
: ディスク容量
    40GB（実体は/var/lib/libvirt/images/www.imgというファイル）
: ネットワーク
    br0を使ったブリッジ接続
: インストールCD
    /var/lib/libvirt/isos/FreeBSD-9.0-RELEASE-amd64-disc1.iso

virt-installでこれらの設定をしてインストールする。

  % virt-install --connect qemu:///system --name www --ram 1024 --disk path=/var/lib/libvirt/images/www.img,size=40 --network bridge=br0 --cdrom /var/lib/libvirt/isos/FreeBSD-9.0-RELEASE-amd64-disc1.iso

もし、作業するユーザーがlibvirgグループに入っていない場合は失敗するので注意。また、ssh -YとかでXを転送するようにしていなくてもエラーになるので注意。

中途半端に作られてしまった場合は以下のようにして仮想マシンを削除できる。

  % virsh --connect qemu:///system destroy www
  % virsh --connect qemu:///system undefine www

destroyで仮想マシンを止めて、undefineで登録を削除する。

VNCクライアントが立ち上がったらインストーラーを使ってインストールする。


インストールが終わったらbr1用のネットワークを追加する。virsh attach-interfaceでいけそうな雰囲気があるけど、KVMだからなのかうまく動かなかったので直接設定ファイルを編集する。

  % virsh --connect qemu:///system edit www

エディタが立ち上がってXMLを編集することになる。その中に以下のような<interface>という部分がある。

  ...
    <interface type='bridge'>
      <mac address='52:54:00:fc:39:5f'/>
      <source bridge='br0'/>
      <target dev='vnet0'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
    </interface>
  ...

これをコピペしてブリッジのインターフェイス、MACアドレス、PCIバスのスロット番号（たぶんXML内を見渡すと0x04まで使っているはずなので0x05を使う）を変えた項目を追加する。

  ...
    <interface type='bridge'>
      <mac address='52:54:00:fc:39:5f'/>
      <source bridge='br0'/>
      <target dev='vnet0'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
    </interface>
    <interface type='bridge'>
      <mac address='52:54:00:fc:39:6f'/>
      <source bridge='br1'/>
      <target dev='vnet1'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x05' function='0x0'/>
    </interface>
  ...

これで一度仮想マシンを止めてから立ち上げ直すとインターフェイスが追加されているはず。

まず、ゲスト機にログインしてシャットダウンする。

  host% ssh www
  www% sudo /sbin/shutdown -p now

終了しているかどうかを確認する。

  % virsh --connect qemu:///system list --all
   Id Name                 State
  ----------------------------------
    - www                  shut off

Stateがshut offになっていれば終了している。以下のようにすれば仮想マシンが起動する。

  % virsh --connect qemu:///system start www

最後に自動起動するようにしておく。もし、たまにしか動かさない仮想マシンではこの設定をする必要はない。

  % virsh --connect qemu:///system autostart www

後で自動起動を無効にしたい場合は以下のように--disableをつける。

  % virsh --connect qemu:///system autostart www --disable

あとは普通のマシンようにセットアップする。

=== Debian GNU/Linux Squeeze amd64のインストール

インストールCDが違うだけで後は同じ。

  % wget -c http://cdimage.debian.org/debian-cd/6.0.3/amd64/iso-cd/debian-6.0.3-amd64-netinst.iso
