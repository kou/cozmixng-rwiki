= FreeBSD

FreeBSD�ط��κ�ȵ�Ͽ�Ǥ���

== NFS�����Фˤʤ�

/etc/rc.conf�˰ʲ��򵭽ҡ�

  nfs_server_enable="YES"
  nfs_reserved_port_only="YES"

portmap_enable="YES"�Ϥ��äƤ�ʤ��Ƥ⤤����

/etc/exports�˰ʲ��򵭽ҡ�

  /path/to/export/dir  client1 client2

www��streaming���ɤ߹��ߤΤߤ�/usr/local�Ȥ��Υ��֥ǥ��쥯�ȥ�⥨�����ݡ��Ȥ������ʤ顤�ʲ��Τ褦�˵��Ҥ��롥

  /usr/local -ro -alldirs www streaming

�Ƶ�ư���롥

== �ƥޥ���Ȥ���

  # mount -u /hoge/fuga

== NFS����˥�����ե����륷���ƥ��ޥ���Ȥ���

NFS����˥ޥ���Ȥ�����������ե����륷���ƥ�Υ��ץ�����noauto��ä��롥

  /dev/ad0s1f /usr/local/etc ufs,noauto 0 0

/etc/rc.local�ǥޥ���Ȥ��롥

  #!/bin/sh

  mount /usr/local/etc

/etc/rc�Ǥϡ��ޤ�NFS�ʳ��Τ�Τ�ޥ���Ȥ��Ƥ���NFS��ޥ���Ȥ��Ƥ���ΤǤ������ʤ���Ф����ʤ�(�Ȼפ�)���ޤ���/etc/rc.local��¹Ԥ������/usr/local/etc/rc.d/�򸫤Ƥ���褦�ʤΤǤ���ʤ�Ǥ������ʤȡ�

== ���֤򤢤碌��

/etc/rc.conf�˰ʲ��򵭽�

  ntpdate_enable="YES"
  ntpdate_flags="-b ntp.tohoku.ac.jp"
  xntpd_enable="YES"

ntpd������ˤĤ��Ƥ�((<NTP>))

== ����tty�ο��򸺤餹

/etc/ttys��ɬ�פ�ʬ����ttyv?��on�ˤ��ƻĤ��off�ˤ��롥

== CVSup��Ports�򥢥åץ��졼��

  (1) /etc/make.conf�˰ʲ����ɲ�
        SUP_UPDATE=     yes

        SUP=    /usr/local/bin/cvsup
        SUPFLAGS=       -g -L 2
        SUPHOST=        cvsup.jp.FreeBSD.org
        PORTSSUPFILE=   /usr/share/examples/cvsup/ports-supfile

  (2) ����ʤ���Τϻ��ä���ʤ��褦�ˤ��롣/usr/sup/refuse�˰ʲ���񤯡�
        ports/chinese
        ports/french
        ports/german
        ports/hungarian
        ports/korean
        ports/hebrew
        ports/russian
        ports/vietnamese
  (4) �¹ԡ�
        % (cd /usr/ports; make update)

portupgrade��������

== ���Υ��ơ������

FreeBSD�Ǥ�newsyslog��Ȥ��Τ��ڤ餷����

�Ȥ������Ȥǡ�Apache�Υ�����ơ�����󤷤Ƥߤ褦��

=== ����

�ե������/etc/newsyslog.conf��

���1����0���˥��ơ�����󤷤ƺ���12����ʬ��¸���Ƥ�������ϰʲ��Τ褦�ʴ�����

  /var/log/httpd-access.log                       644  12    *    $M1D0     Z     /var/run/httpd.pid
  /var/log/httpd-error.log                        644  12    *    $M1D0     Z     /var/run/httpd.pid
  /var/log/httpd-suexec.log                        644  12    *    $M1D0     Z     /var/run/httpd.pid

Z(+����)�θ��pid�ν񤤤Ƥ���ե�����̾(�㤨��/var/run/httpd.pid)��񤯤ȥ����ʥ�(�ǥե���ȤǤ�SIGHUP)�����롣((<Apache>))������SIGUSR1(30���ä�)������ȥ��ե������close/open����餷�������֤󡣤��ʤߤˤ���������Ǥ�Apache��Ƶ�ư����close/open���Ƥޤ��͡�

newsyslog��(�ǥե���ȤǤ�)cron�������ư���Ƥ���ΤǺƵ�ư�Ȥ���ɬ�פʤ���

== SWAP���ɲ�

FreeBSD��VM�Υڡ����󥰥��르�ꥺ����Թ�塤�ᥤ������2�ܰʾ�SWAP���ʤ����Ϥ�Ф��ڤ�ʤ��餷����see tuning(7)�ˡ��Ȥ������Ȥǡ�����ڤ�SWAP���ɲä�����ˡ��

=== SWAP�ѥե��������

�㤨�С�/usr/local/SWAPFILE��512MB��SWAP�ѥե�����ˤ���ˤϰʲ����ͤˤ��롥

  % sudo dd if=/dev/zero of=/usr/local/SWAPFILE bs=1024k count=512

1G�ˤ��������count=512��count=1024�ˤ��롥

=== SWAP�Ȥ���ǧ��������

/etc/rc.conf�˰ʲ��Τ褦�˵��Ҥ��ƺƵ�ư��

  swapfile="/usr/local/SWAPFILE"

���뤤�ϡ�4.9�ξ��ϰʲ���¹ԡ�

  % sudo vnconfig -e /dev/vn0b /usr/local/SWAPFILE swap

5.x�ξ��ϰʲ���¹ԡ�

  % sudo env - PATH=/sbin:/usr/sbin:/bin:/usr/bin /etc/rc.d/addswap start

=== ��ǧ

  % /usr/sbin/pstat -s
