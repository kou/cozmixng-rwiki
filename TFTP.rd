= TFTP

Debian�Ǥ��á�

((<PXE>))�ѤΥ֡��ȥ��������ۤ��뤿��˻Ȥ���

== ���󥹥ȡ���

  % sudo aptitude -V -r install tftpd-hpa

== ����

�ä�̵����/var/lib/tftpboot/�ʲ��ˤ����и�������롣

== ��ǧ

TFTP���饤����Ȥ򥤥󥹥ȡ��롣

  % sudo aptitude -V -r install tftp-hpa

���åץ��ɤ����ե�������������ɤ��Ƥߤ롣

  % cd /tmp
  % echo data > data.txt
  % sudo cp data.txt /var/lib/tftpboot/xxx.txt
  % tftp localhost -c get xxx.txt
  % cat xxx.txt
  data
  %

== �ͥåȥ���֡��ȥ��󥹥ȡ����Ѥ�����

�ͥåȥ���֡��ȥ��󥹥ȡ���򤹤뤿��˥ե��������������㡣

((<netboot|URL:http://cdn.debian.or.jp/debian/dists/etch/main/installer-i386/current//images/netboot/>))
�ѤΥ��᡼�����������ɤ��롣netboot.tar.gz���������ɤ���Ф褤��

  % cd /var/lib/tftpboot
  % sudo tar xvfz /tmp/netboot.tar.gz

���Ȥϡ�((<DHCP>))(BOOTP)�����Ф����饤����Ȥˡ�/pxelinux.0���ɤ�פ��ֻ��򤹤�Ф褤��
