= Synergy

�ͥåȥ����ͳ�ǥ����ܡ��ɤȥޥ�����ͭ���뤿��Υ��եȥ�������Linux/Mac OS X/Windows�ʤɤ����ʥץ�åȥե������ư����

Linux�Ǥ�Mac OS X�Ǥ�MacPorts�ˤ�ʤäƤ��롣

== ����

��ͭ�����������ܡ��ɤȥޥ�������äƤ���¦�������С����Υ����ܡ��ɤȥޥ�����Ȥä�ư���������ۥ��Ȥ����饤����ȡ�

������¦��~/.synergy.conf�������񤯡��ʲ��Τ褦�ʾ����λ�������ե�������㡣

: �����ФΥۥ���̾
   linux-server

: ���饤����ȤΥۥ���̾
   mac-client

: ����
   linux-server�Υǥ����ץ쥤�κ�¦��mac-client�Υǥ����ץ쥤���֤��Ƥ��롣

     +----------+  +------------+
     |mac-client|  |linux-server|
     +----++----+  +-----++-----+
          ||             ||
        ======        ========

~/.synergyc.conf

  section: screens
    linux-server:
    mac-client:
  end

  section: links
    linux-server:
      left = mac-client
    mac-client:
      right = linux-server
  end

�����Ǥϥ��饤����Ȥϰ������ʣ����������Ǥ��롣

== ��ư

������¦:
  % synergys -f

���饤�����¦:
  % synergyc -f linux-server

���饤�����¦��linux-server�ǥ����ФΥۥ���̾����Ǥ��ʤ�����IP���ɥ쥹�ǻ��ꤷ�Ƥ��ɤ���

  % synergyc -f 192.168.1.123

