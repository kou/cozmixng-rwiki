= LVM

Logical Volume Manager.

論理的なパーティション（論理ボリューム）を作成することにより，パーティションのサイズを後から簡単に変更できるようにする．

== 前提

バックアップ領域に使いたいハードディスク/dev/sdaがある．
これを/backupとしてマウントして使いたい．
ただ，今後/backupのサイズを増量したくなるかもしれない．

== 基本

LVM領域を作成する方法．

=== パーティションの作成

まず，cfdiskなどで/dev/sda1と/dev/sda2にわける（普通のパーティション）．

たぶん，パーティションは細かくわけた方がよいと思う．

((*うさんくさい考え*)):
それは，一つのパーティションが壊れたら（たぶん！）他のパーティションに自動でデータが書き込まれるようになるからだ．もし，壊れたパーティションの容量が大きいと，残ったパーティションに壊れたパーティション分の空き容量が無い可能性が高いのではないだろうか．

それぞれのパーティションのタイプはLinux LVMにしておく．

=== 物理ボリュームの作成

今わけたパーティションを使って物理ボリュームを作成する．

  % sudo pvcreate /dev/sda1
  % sudo pvcreate /dev/sda2

複数のパーティションで一つの物理ボリュームを作成することも出来る．

  % sudo pvcreate /dev/sda1 /dev/sda2

論理ボリュームはpvscanやpvdisplayで確認できる．

  % sudo pvscan
  % sudo pvdisplay

=== ボリュームグループの作成

複数の物理ボリュームをまとめてボリュームグループを作成する．

今回は今作った物理ボリュームをまとめて「data」というボリュームグループを作成する．

  % sudo vgcreate data /dev/sdb1 /dev/sdb2

ボリュームグループはvgscanやvgdisplayで確認できる．

  % sudo vgscan
  % sudo vgdisplay

ボリュームグループの名前はvgrenameで変更できる．

例えば，「data」という名前のボリュームグループを「data2」という名前に変えたければ以下のようにする．

  % sudo vgrename /dev/data /dev/data2

=== 論理ボリュームの作成

いよいよ，実際にパーティションのように使える論理ボリュームを作成する．

60GB分の「backup」という名前の論理ボリュームを「data」という名前のボリュームグループに作成する．

  % sudo lvcreate -L60G -n backup /dev/data

論理ボリュームはlvscanやlvdisplayで確認できる．

  % sudo lvscan
  % sudo lvdisplay

=== 論理ボリュームのフォーマット

パーティションと同じようにmkfsで論理ボリュームをフォーマットする．

  % sudo mkfs -t ext3 /dev/data/backup

あとは/backupにマウントするだけである．

  % sudo mkdir -p /backup
  % sudo mount -t ext3 /backup /dev/data/backup

/etc/fstabにこんなのを書いておいてもよいだろう．

  /dev/data/backup       /backup            ext3    defaults        0       2

== 管理

サイズを拡張したりなど．

=== 論理ボリュームを拡張

lvextendを使って拡張できる．

「data」ボリュームグループ内の「backup」論理ボリュームを10GB拡張する場合は以下のようにする．

  % sudo lvextend -L+10G /dev/data/backup

ただ，領域は拡張されてもファイルシステムは拡張されていないのでext2resizeなどでファイルシステムも拡張する必要がある．

  % sudo umount /backup
  % sudo ext2resize /dev/data/backup

ext2resizeにはデバイス名の後にサイズを指定することもできるが，省略すると最大サイズまで拡張してくれるので，今回は省略した．

=== ボリュームグループを拡張

vgextendを使って拡張できる．

まず，ボリュームグループに加えたい物理ボリュームを作成する．

  % sudo pvcreate /dev/sda3

これを「data」ボリュームグループに加えたい場合は以下のようにする．

  % sudo vgextend data /dev/sda3

=== ディスクの取り換え

...

== 参考URL

  * ((<Logical Volume Manager HOWTO|URL:http://www.linux.or.jp/JF/JFdocs/LVM-HOWTO.html>))
    * 論理ボリュームやボリュームグループなどの関係は
      ((<Logical Volume Manager HOWTO: 基本的な原則|URL:http://www.linux.or.jp/JF/JFdocs/LVM-HOWTO-3.html>))
      を見るとよい．
