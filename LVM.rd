= LVM

Logical Volume Manager.

論理的なパーティション（論理ボリューム）を作成することにより，パーティションのサイズを後から簡単に変更できるようにする．

== 前提

バックアップ領域に使いたいハードディスク/dev/sdaがある．
これを/backupとしてマウントして使いたい．
ただ，今後/backupのサイズを増量したくなるかもしれない．

== パーティションの作成

まず，cfdiskなどで/dev/sda1と/dev/sda2にわける（普通のパーティション）．
ふたつにわける理由は特にない．
強いて言えば，物理ボリュームを2つ作ってみたかっただけ．

それぞれのパーティションのタイプはLinux LVMにしておく．

== 物理ボリュームの作成

今わけたパーティションを使って物理ボリュームを作成する．

  % sudo pvcreate /dev/sda1
  % sudo pvcreate /dev/sda2

複数のパーティションで一つの物理ボリュームを作成することも出来る．

  % sudo pvcreate /dev/sda1 /dev/sda2

論理ボリュームはpvscanやpvdisplayで確認できる．

  % sudo pvscan
  % sudo pvdisplay

== ボリュームグループの作成

複数の物理ボリュームをまとめてボリュームグループを作成する．

今回は今作った物理ボリュームをまとめて「data」というボリュームグループを作成する．

  % sudo vgcreate data /dev/sdb1 /dev/sdb2

ボリュームグループはvgscanやvgdisplayで確認できる．

  % sudo vgscan
  % sudo vgdisplay

ボリュームグループの名前はvgrenameで変更できる．

例えば，「data」という名前のボリュームグループを「data2」という名前に変えたければ以下のようにする．

  % sudo vgrename /dev/data /dev/data2

== 論理ボリュームの作成

いよいよ，実際にパーティションのように使える論理ボリュームを作成する．

60GB分の「backup」という名前の論理ボリュームを「data」という名前のボリュームグループに作成する．

  % sudo lvcreate -L60G -n backup /dev/data

論理ボリュームはlvscanやlvdisplayで確認できる．

  % sudo lvscan
  % sudo lvdisplay

== 論理ボリュームのフォーマット

パーティションと同じようにmkfsで論理ボリュームをフォーマットする．

  % sudo mkfs -t ext3 /dev/data/backup

あとは/backupにマウントするだけである．

  % sudo mkdir -p /backup
  % sudo mount -t ext3 /backup /dev/data/backup

/etc/fstabにこんなのを書いておいてもよいだろう．

  /dev/data/backup       /backup            ext3    defaults        0       2

== 参考URL

  * ((<Logical Volume Manager HOWTO|URL:http://www.linux.or.jp/JF/JFdocs/LVM-HOWTO.html>))
    * 論理ボリュームやボリュームグループなどの関係は
      ((<Logical Volume Manager HOWTO: 基本的な原則|URL:http://www.linux.or.jp/JF/JFdocs/LVM-HOWTO-3.html>))
      を見るとよい．
