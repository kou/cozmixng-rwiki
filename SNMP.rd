= SNMP

SNMP関係の作業記録です。

== インストール

  % sudo portupgrade -N net-snmp

/etc/rc.confに以下を追加

  snmpd_enable="YES"

ちなみに，

  net_snmpd_enable="YES"

はobsoleteらしい

== 設定

  % cd /usr/local/share/snmp
  % sudo snmpconf -g basic_setup

英語だけどよく読めばわかる．．．はず．

=== ディスク容量の情報を提供する

/usr/local/share/snmp/snmpd.conf(Debianなら/etc/snmp/snmpd.conf)に以下を記述

  disk /usr/local/var 10000
  disk /var 10000
  disk /home 10000

これで，

  % snmpwalk -v 1 -c hogehoge localhost .1.3.6.1.4.1.2021.9.1.9.1

で，/usr/local/varのディスク使用量がパーセントで得られる．

  % snmpwalk -v 1 -c hogehoge localhost .1.3.6.1.4.1.2021.9.1.9.2

だと，/var

  % snmpwalk -v 1 -c hogehoge localhost .1.3.6.1.4.1.2021.9.1.9.3

だと，/home

=== httpdの起動数を提供する

  proc  httpd 20 

これだと最大で20プロセス起動することを許可するという意味．

  % snmpwalk -v 1 -c hogehoge localhost .1.3.6.1.4.1.2021.2.1.5.1

で起動中のプロセス数

  % snmpwalk -v 1 -c hogehoge localhost .1.3.6.1.4.1.2021.2.1.4.1

で起動できるプロセス数がわかる．
