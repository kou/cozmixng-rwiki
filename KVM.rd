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

