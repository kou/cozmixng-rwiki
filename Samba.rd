= Samba

3.x����

== ̾����§

�ޥ���̾�ˤϺǸ��$���Ĥ���

== �������ޥ����ä���(��ư)

UNIX��������Ȥ����

�ޥ����ѤΥ��롼��machines�����Ǥ�¸�ߤ��Ƥ���Ȥ��롣

  % sudo /usr/sbin/useradd -g machines -c Machine -d /dev/null -s /bin/false �ޥ���̾$

Samba�Υ�������Ȥ����

  % sudo /usr/bin/smbpasswd -a -m �ޥ���̾

== �������ޥ����ä���(��ư)

smb.conf��[global]���������˰ʲ����ɲá�

������⡢�ޥ����ѤΥ��롼��machines�����Ǥ�¸�ߤ��Ƥ���Ȥ��롣

   add user script = /usr/sbin/useradd %u
   add group script = /usr/sbin/groupadd %g
   add machine script = /usr/sbin/useradd -g machines -c Machine -d /dev/null -s /bin/false %m$
   delete user script = /usr/sbin/userdel %u
   delete user from group script = /usr/sbin/deluser %u %g
   delete group script = /usr/sbin/groupdel %g

== �ޥ�����ɲä��븢�¤�Ϳ����桼�������ꤹ��

���ꤵ�줿�桼���Ͽ������ޥ����ɥᥤ��˲ä��뤳�Ȥ�����롣

smb.conf��[global]���������˰ʲ����ɲä��롣

  admin users = �桼��̾1 �桼��̾2 ...

�桼��̾1������˥��롼��̾����ꤹ����ϥ��롼��̾������@���դ��롣

  admin users = @admingrp

== smbpasswd��Ȥ�

smb.conf��[global]���������˰ʲ����ɲá�

  passdb backend = smbpasswd

== �Хå����å�(Debian)

Debian�Ǥ�cron��/var/backups�ʲ���smbpasswd�ΥХå����åפ��äƤ���Ƥ��롣
