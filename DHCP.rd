= DHCP

Debian�Ǥ��á�

PXE�֡��Ȥ򥵥ݡ��Ȥ��뤿�ᡢBOOTP�б���DHCP�����Ф����ꡣ

== ���󥹥ȡ���

  % sudo aptitude -V -r install dhcp3-server

== ����

�ʲ��Τ褦������Ȥ��롣

: �ͥåȥ��
   192.168.0.0

: �ǥե���ȥ����ȥ�����/�롼��
   192.168.0.1

: DNS������
   192.168.0.2

: �ɥᥤ��̾
   local.net

: ��������ϰ�
   192.168.0.100 - 192.168.0.120

: TFTP�ǥ�������ɤ���ե�����̾
   /pxelinux.0

/etc/dhcp3/dhcpd.conf���ѹ����Τߡ�

  option domain-name "local.net";
  option domain-name-servers 192.168.0.2;

  subnet 192.168.0.0 netmask 255.255.255.0 {
    filename "/pxelinux.0";
    range dynamic-bootp 192.168.0.100 192.168.0.120;
    option routers 192.168.0.1;
  }

range��dynamic-bootp���ݥ���ȡ�


