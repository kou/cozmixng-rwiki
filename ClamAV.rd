= ClamAV

�ե꡼�Υ���������륹���ե�

((<AMaViS>))�Ȱ��˻Ȥ�

== ���󥹥ȡ���

  % sudo portupgrade -NRr clamav

== ����

/usr/local/etc/clamav.conf

vscan�桼���Ǽ¹Ԥ���褦�ˤ��롥

  User vscan

���ե�����Ȥ���vscan�˽�ͭ�Ԥ��Ѥ��롥

  % sudo chown -R vscan:vscan /var/run/clamav
  % sudo touch /var/log/clamav/clamd.log
  % sudo chown -R vscan:vscan /var/log/clamav/clamd.log

/etc/rc.conf�˰ʲ����ɲ�

  clamav_clamd_enable="YES"
  clamav_freshclam_enable="YES"

��ư

  % sudo env - /usr/local/etc/rc.d/clamav-clamd.sh start
  % sudo env - /usr/local/etc/rc.d/clamav-freshclam.sh start

/usr/local/etc/amavisd.conf��ClamAV�ΤȤ���Υ����Ȥ򳰤��ƥ����åȤΥ��ɥ쥹��Ŭ�����Ѥ��롥

  ### http://clamav.elektrapro.com/
  ['Clam Antivirus-clamd',
    \&ask_daemon, ["CONTSCAN {}\n", '/var/run/clamav/clamd'],
    qr/\bOK$/, qr/\bFOUND$/,
    qr/^.*?: (?!Infected Archive)(.*) FOUND$/ ],
  # NOTE: run clamd under the same user as amavisd,
  # match the socket name in clamav.conf to the socket name in this entry

�Ƶ�ư

  % sudo env - /usr/local/etc/rc.d/amavisd.sh restart
