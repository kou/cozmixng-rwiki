= VNC

xinetd��ͳ��VNC��ư����X�����Ф�ɤ��ˤ��롥

�����Debian GNU/Linux����ѡ�

== ɬ�פʤ��

  * VNC 4.X: VNC 3.X������̯�����꤬�ۤʤ�ޤ���
  * xinetd
  * gdm: ¾�Υǥ����ץ쥤�ޥ͡�����Ǥ�褤

== ����

800x600, 1024x768, 1152x864, 1280x1024�β����٤�VNC�����Ф�ư���뤳�Ȥˤ��롥�Ĥ��Ǥˡ����줾��ˤĤ��ƿ���16bit�Ǥ�24bit�Ǥ��Ѱդ��롥

=== �����ӥ����ɲ�

/etc/services�˰ʲ����ɲ�

  vnc-800x600x16         5950/tcp
  vnc-800x600x24         5951/tcp
  vnc-1024x768x16        5952/tcp
  vnc-1024x768x24        5953/tcp
  vnc-1152x864x16        5954/tcp
  vnc-1152x864x24        5955/tcp
  vnc-1280x1024x16       5956/tcp
  vnc-1280x1024x24       5957/tcp

=== xinetd������

/etc/xinetd.d/vnc�Ȥ��ưʲ����ͤ����ƤΥե������������롥

192.168.0.3����ʬ��VNC�����Ф�Х���ɤ��륤�󥿡��ե�������IP���ɥ쥹���ۥ���̾���ѹ����롥

VNC 3.X����Ѥ��Ƥ������

  -SecurityTypes None

���ץ����Ϥ���ʤ���

  service vnc-800x600x16
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 800x600 -depth 16 -SecurityTypes None
  }

  service vnc-800x600x24
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 800x600 -depth 24 -SecurityTypes None
  }

  service vnc-1024x768x16
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1024x768 -depth 16 -SecurityTypes None
  }

  service vnc-1024x768x24
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1024x768 -depth 24 -SecurityTypes None
  }
  service vnc-1152x864x16
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1152x864 -depth 16 -SecurityTypes None
  }

  service vnc-1152x864x24
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1152x864 -depth 24 -SecurityTypes None
  }

  service vnc-1280x1024x16
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1280x1024 -depth 16 -SecurityTypes None
  }

  service vnc-1280x1024x24
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1280x1024 -depth 24 -SecurityTypes None
  }

=== xinetd��Ƶ�ư

  % sudo env - /etc/init.d/xinetd restart

=== gdm��xdmcp��ͭ���ˤ���

/etc/gdm/gdm.conf�����

  [xdmcp]

������������

  Enable=false

��

  Enable=true

���ѹ����롥

=== gdm��Ƶ�ư

  % sudo env - /etc/init.d/gdm restart

== ��³

=== xvncviewer

  % xvncviewer 192.168.0.3:5953
