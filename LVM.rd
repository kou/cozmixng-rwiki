= LVM

Logical Volume Manager.

����Ū�ʥѡ��ƥ������������ܥ�塼��ˤ�������뤳�Ȥˤ�ꡤ�ѡ��ƥ������Υ�������夫���ñ���ѹ��Ǥ���褦�ˤ��롥

== ����

�Хå����å��ΰ�˻Ȥ������ϡ��ɥǥ�����/dev/sda�����롥
�����/backup�Ȥ��ƥޥ���Ȥ��ƻȤ�������
����������/backup�Υ����������̤������ʤ뤫�⤷��ʤ���

== ����

LVM�ΰ�����������ˡ��

=== �ѡ��ƥ������κ���

�ޤ���cfdisk�ʤɤ�/dev/sda1��/dev/sda2�ˤ櫓������̤Υѡ��ƥ������ˡ�

���֤󡤥ѡ��ƥ������Ϻ٤����櫓�������褤�Ȼפ���

((*�����󤯤����ͤ�*)):
����ϡ���ĤΥѡ��ƥ�����󤬲��줿��ʤ��֤󡪡�¾�Υѡ��ƥ������˼�ư�ǥǡ������񤭹��ޤ��褦�ˤʤ뤫������⤷�����줿�ѡ��ƥ����������̤��礭���ȡ��Ĥä��ѡ��ƥ������˲��줿�ѡ��ƥ������ʬ�ζ������̤�̵����ǽ�����⤤�ΤǤϤʤ���������

���줾��Υѡ��ƥ������Υ����פ�Linux LVM�ˤ��Ƥ�����

=== ʪ���ܥ�塼��κ���

���櫓���ѡ��ƥ�������Ȥä�ʪ���ܥ�塼���������롥

  % sudo pvcreate /dev/sda1
  % sudo pvcreate /dev/sda2

ʣ���Υѡ��ƥ������ǰ�Ĥ�ʪ���ܥ�塼���������뤳�Ȥ����롥

  % sudo pvcreate /dev/sda1 /dev/sda2

�����ܥ�塼���pvscan��pvdisplay�ǳ�ǧ�Ǥ��롥

  % sudo pvscan
  % sudo pvdisplay

=== �ܥ�塼�॰�롼�פκ���

ʣ����ʪ���ܥ�塼���ޤȤ�ƥܥ�塼�॰�롼�פ�������롥

����Ϻ���ä�ʪ���ܥ�塼���ޤȤ�ơ�data�פȤ����ܥ�塼�॰�롼�פ�������롥

  % sudo vgcreate data /dev/sdb1 /dev/sdb2

�ܥ�塼�॰�롼�פ�vgscan��vgdisplay�ǳ�ǧ�Ǥ��롥

  % sudo vgscan
  % sudo vgdisplay

�ܥ�塼�॰�롼�פ�̾����vgrename���ѹ��Ǥ��롥

�㤨�С���data�פȤ���̾���Υܥ�塼�॰�롼�פ��data2�פȤ���̾�����Ѥ�������аʲ��Τ褦�ˤ��롥

  % sudo vgrename /dev/data /dev/data2

=== �����ܥ�塼��κ���

���褤�衤�ºݤ˥ѡ��ƥ������Τ褦�˻Ȥ��������ܥ�塼���������롥

60GBʬ�Ρ�backup�פȤ���̾���������ܥ�塼����data�פȤ���̾���Υܥ�塼�॰�롼�פ˺������롥

  % sudo lvcreate -L60G -n backup /dev/data

�����ܥ�塼���lvscan��lvdisplay�ǳ�ǧ�Ǥ��롥

  % sudo lvscan
  % sudo lvdisplay

=== �����ܥ�塼��Υե����ޥå�

�ѡ��ƥ�������Ʊ���褦��mkfs�������ܥ�塼���ե����ޥåȤ��롥

  % sudo mkfs -t ext3 /dev/data/backup

���Ȥ�/backup�˥ޥ���Ȥ�������Ǥ��롥

  % sudo mkdir -p /backup
  % sudo mount -t ext3 /backup /dev/data/backup

/etc/fstab�ˤ���ʤΤ�񤤤Ƥ����Ƥ�褤������

  /dev/data/backup       /backup            ext3    defaults        0       2

== ����

���������ĥ������ʤɡ�

=== �����ܥ�塼����ĥ

lvextend��ȤäƳ�ĥ�Ǥ��롥

��data�ץܥ�塼�॰�롼����Ρ�backup�������ܥ�塼���10GB��ĥ������ϰʲ��Τ褦�ˤ��롥

  % sudo lvextend -L+10G /dev/data/backup

�������ΰ�ϳ�ĥ����Ƥ�ե����륷���ƥ�ϳ�ĥ����Ƥ��ʤ��Τ�ext2resize�ʤɤǥե����륷���ƥ���ĥ����ɬ�פ����롥

  % sudo umount /backup
  % sudo ext2resize /dev/data/backup

ext2resize�ˤϥǥХ���̾�θ�˥���������ꤹ�뤳�Ȥ�Ǥ��뤬����ά����Ⱥ��祵�����ޤǳ�ĥ���Ƥ����Τǡ�����Ͼ�ά������

=== �ܥ�塼�॰�롼�פ��ĥ

vgextend��ȤäƳ�ĥ�Ǥ��롥

�ޤ����ܥ�塼�॰�롼�פ˲ä�����ʪ���ܥ�塼���������롥

  % sudo pvcreate /dev/sda3

������data�ץܥ�塼�॰�롼�פ˲ä��������ϰʲ��Τ褦�ˤ��롥

  % sudo vgextend data /dev/sda3

=== �ǥ������μ�괹��

...

== ����URL

  * ((<Logical Volume Manager HOWTO|URL:http://www.linux.or.jp/JF/JFdocs/LVM-HOWTO.html>))
    * �����ܥ�塼���ܥ�塼�॰�롼�פʤɤδط���
      ((<Logical Volume Manager HOWTO: ����Ū�ʸ�§|URL:http://www.linux.or.jp/JF/JFdocs/LVM-HOWTO-3.html>))
      �򸫤�Ȥ褤��
