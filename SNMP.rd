= SNMP

SNMP�ط��κ�ȵ�Ͽ�Ǥ���

== ���󥹥ȡ���

  % sudo portupgrade -N net-snmp

/etc/rc.conf�˰ʲ����ɲ�

  snmpd_enable="YES"

���ʤߤˡ�

  net_snmpd_enable="YES"

��obsolete�餷��

== ����

  % cd /usr/local/share/snmp
  % sudo snmpconf -g basic_setup

�Ѹ�����ɤ褯�ɤ�Ф狼�롥�����Ϥ���

=== �ǥ��������̤ξ�����󶡤���

/usr/local/share/snmp/snmpd.conf(Debian�ʤ�/etc/snmp/snmpd.conf)�˰ʲ��򵭽�

  disk /usr/local/var 10000
  disk /var 10000
  disk /home 10000

����ǡ�

  % snmpwalk -v 1 -c hogehoge localhost .1.3.6.1.4.1.2021.9.1.9.1

�ǡ�/usr/local/var�Υǥ����������̤��ѡ�����Ȥ������롥

  % snmpwalk -v 1 -c hogehoge localhost .1.3.6.1.4.1.2021.9.1.9.2

���ȡ�/var

  % snmpwalk -v 1 -c hogehoge localhost .1.3.6.1.4.1.2021.9.1.9.3

���ȡ�/home

=== httpd�ε�ư�����󶡤���

  proc  httpd 20 

������Ⱥ����20�ץ�����ư���뤳�Ȥ���Ĥ���Ȥ�����̣��

  % snmpwalk -v 1 -c hogehoge localhost .1.3.6.1.4.1.2021.2.1.5.1

�ǵ�ư��Υץ�����

  % snmpwalk -v 1 -c hogehoge localhost .1.3.6.1.4.1.2021.2.1.4.1

�ǵ�ư�Ǥ���ץ��������狼�롥
