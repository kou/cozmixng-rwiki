= CVSup

== �ߥ顼����

  % sudo /usr/local/sbin/portupgrade -NRr cvsup-mirror

�Ϥ���ˤ�����ʹ�����Τ������Ƥ�����

   Master site for your updates [cvsup-master.freebsd.org]?

fastest_cvsup�Ȥ��Ǥ褵���ʤȤ����Ĵ�٤Ƥ������ꤹ����ɤ���

  % fastest_cvsup -c JP

���Ȥϡ�((<CVSup �����Ф���پ���|URL:http://home.jp.freebsd.org/stats/mrtg/cvsup/>))�⻲�ͤˡ�

  How many hours between updates of your files [1]?

�̤�1������˥��åץǡ��Ȥ���ɬ�פϤʤ��Τǡ�24��1����ˤȤ����ꤷ�Ƥ�����


����ϥ����������ɤΥ�ݥ��ȥ�����ߥ顼����Ĥ��ʤΤǡ�

  Do you wish to mirror the main source repository [y]?

����y�ˤ��ơ��Ĥ��

  Do you wish to mirror the installed World Wide Web data [y]?
  Do you wish to mirror the GNATS bug tracking database [y]?
  Do you wish to mirror the mailing list archive [y]?

��n�ˤ��Ƥ�����

�Ĥ�μ���ϥǥե���ȤǤ褤������

���åץǡ��Ȥ�cron�ǹԤ��롥cron���¹Ԥ����ޤǺǽ�μ¸����Ԥ�����ʤ��Ȥ��ϼ�ư�ǥ��åץǡ��Ȥ���Ф褤��

  % sudo env - /usr/local/etc/cvsup/update.sh

���ȡ�cvsupd��ư���Ƥ��뤳�Ȥ��ǧ��ǰ�Τ���start���Ƥ����Ф褤������

  % sudo env - /usr/local/etc/rc.d/cvsupd.sh start
