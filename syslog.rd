= syslog

== pub.cozmixng.org ��reboot by ((<szk>)) 2003/10/31 9:00 �� 
* �������ꡤwww.cozmixng.org �إ��������Ǥ��ʤ��ʤ�
* www �� pub:/usr/local �ޥ���Ȥ� pub NFS not responding ��å�����
* pub �� /var/log/messages ��
  * mountd �ؤ� kill -HUP 
  * nfsd ��socket create error, nfsd nfssvc ���顼

    * streaming.cozmixng.org��NFS not reponding�ȤʤäƤ����ΤǤ��������äƤ���Ǥ����ʤ�ǡ�www�ϥޥ���ȤǤ��Ƥ���Τ�streaming�ϥޥ���ȤǤ��ʤ�������ȡ� - ((<kou>))

* ¿ʬ, mountd �� nfsd ���̿���ǽ�ˤʤä��ȿ�¬
* pub �� reboot ���ޤ�����
  * �Ƥä���apache��ư���Ƥ��ʤ�������Ȼפ��ޤ����� - ((<kou>))
