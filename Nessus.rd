= Nessus

�������ƥ��������

== ���󥹥ȡ���

  % sudo /usr/local/sbin/portupgrade -NRr nessus-plugins-devel

nessus-devel�Ǥ���������ɡ��ɤ��������nessus-devel���Τ⥤�󥹥ȡ��뤵��뤷���������ʤȡ�

nessud��ư����褦��/etc/rc.conf�˰ʲ����ɲá�

  nessusd_enable="YES"

nessusd�˥��������Ǥ���ۥ��Ȥ����¤������Ȥ��ϰʲ�����ꤷ
�Ƥ����Ȥ褤���⡥

  nessusd_flags="-D -a 127.0.0.1"

== �桼������

  % sudo /usr/local/sbin/nessus-adduser

ʹ���줿�Τ������Ƥ����Х桼�����ɲä���롥

�Ǹ�ˡ����Υ桼���Ϥɤη׻���������å��Ǥ���Τ�����ꤹ�롥

�ʲ��Τ褦�ˤ����192.168.1.0/24�η׻����Τߥ����å��Ǥ��롥

  accept 192.168.1.0/24
  default deny

�ְ�äƥ桼�����äƤ��ޤä����Ϥ��졥

  % sudo /usr/local/sbin/nessus-rmuser

== ���������

�桼��ǧ�ڤ�Ź沽���뤿��˻��Ѥ����������롥

  % sudo /usr/local/sbin/nessus-mkcert

�����openssl��Ȥä�����ʹ������Ĥ�����Ʊ����nessus-mkcert�ǤϾ���˻��ꤵ��Ƥ���ܤ�����Τ�ʹ�������ܤ����ʤ��ˡ�

== �ץ饰����μ�ư���åץǡ���

�ץ饰����򾡼�˥��åץǡ��Ȥ��Ƥ����褦��
/etc/periodic/weekly/�ʲ��ˤǤ⤳��ʥե�������äƤ�����
�ե�����̾��500.nessus-update-plugins�Ȥ�Ŭ���ˤĤ��롥

  #!/bin/sh

  PATH=/sbin:/usr/local/sbin:/usr/sbin:/bin:/usr/local/bin:/usr/bin
  export PATH

  /usr/local/sbin/nessus-update-plugins

== ���Ū�˥�ݡ�������

/etc/periodic/daily/�ʲ��ˤ���ʥե�������դ��äơ�����������
���̤Υ�ݡ��Ȥ�����������褦�ˤ��Ƥ�褤���⤷��ʤ����ե�
����̾��600.nessus�Ȥ�Ŭ���ˡ�

�����ե�������˥ѥ���ɤ�񤫤ʤ��㤤���ʤ��Τ�chmod 600
�ˤ��Ƥ������Ȥ�˺�줺�ˡ�

  #!/bin/sh

  PATH=/bin:/usr/local/bin:/usr/bin
  export PATH
  HOME=/usr/local/etc/nessus
  export HOME

  type=html_graph
  host=localhost
  port=1241
  user=nessus-user
  password=nessus-password
  targets=/usr/local/etc/nessus/targets
  result=/usr/local/var/www/data/nessus/index.html

  nessus -T $type -x -q $host $port $user $password $targets $result
