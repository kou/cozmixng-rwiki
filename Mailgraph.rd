= Mailgraph

((<Postfix>))�Υ�����᡼���ή�̤򥰥�ղ����륽�եȥ�������

== ���󥹥ȡ���

  % sudo portupgrade -NRr mailgraph

== ����

/etc/rc.conf�˰ʲ����ɲá�

  mailgraph_enable="YES"
  mailgraph_user="postfix"
  mailgraph_group="postfix"

/usr/local/sbin/mailgraph.pl�ϡ�/var/log/maillog����᡼���ή�̤�((<RRDTool>))���Ȥ���ǡ������������롥�ǥե���Ȥ���www�桼�����¤�ư������������ȡ�/var/log/maillog��www�桼�����¤��ɤ߹��߲�ǽ�Ǥʤ���Ф����ʤ�������ϵ�����������

�Ȥ������Ȥǡ�postfix�桼�������롼�׸��¤�ư���褦�ˤ��ơ�/var/log/maillog�Υ��롼�פ��ѹ���

  % sudo chgrp postfix /var/log/maillog

�Ĥ��Ǥˡ�RRDTool�ѥǡ����ν�����/var/db/mailgraph�θ��¤��ѹ���

  % sudo chown -R postfix:postfix /var/db/mailgraph


