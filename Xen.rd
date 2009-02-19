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

=== トラブルシューティング

CentOS 5.2のkernel-xen-2.6.18-92.1.22.el5ではr8169カーネルモジュールがうまく動かない？

== Debian GNU/Linux lennyのインストール

debootstrapでインストールする。
