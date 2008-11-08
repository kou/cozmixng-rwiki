= Samba

3.xの話

== 名前規則

マシン名には最後に$がつく。

== 新しいマシンを加える(手動)

UNIXアカウントを作成

マシン用のグループmachinesがすでに存在しているとする。

  % sudo /usr/sbin/useradd -g machines -c Machine -d /dev/null -s /bin/false マシン名$

Sambaのアカウントを作成

  % sudo /usr/bin/smbpasswd -a -m マシン名

== 新しいマシンを加える(自動)

smb.confの[global]セクションに以下を追加。

こちらも、マシン用のグループmachinesがすでに存在しているとする。

   add user script = /usr/sbin/useradd %u
   add group script = /usr/sbin/groupadd %g
   add machine script = /usr/sbin/useradd -g machines -c Machine -d /dev/null -s /bin/false %m$
   delete user script = /usr/sbin/userdel %u
   delete user from group script = /usr/sbin/deluser %u %g
   delete group script = /usr/sbin/groupdel %g

== マシンを追加する権限を与えるユーザを設定する

設定されたユーザは新しいマシンをドメインに加えることが出来る。

smb.confの[global]セクションに以下を追加する。

  admin users = ユーザ名1 ユーザ名2 ...

ユーザ名1の代わりにグループ名を指定する場合はグループ名の前に@を付ける。

  admin users = @admingrp

== smbpasswdを使う

smb.confの[global]セクションに以下を追加。

  passdb backend = smbpasswd

== バックアップ(Debian)

Debianではcronで/var/backups以下にsmbpasswdのバックアップを取ってくれている。
