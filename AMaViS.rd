= AMaViS

�����륹/���ѥ�����å�(�Υե��ȥ���ɡ�)

== ���󥹥ȡ���

  % sudo portupgrade -NRr amavisd-new

== ����

/usr/local/etc/amvisd.conf-dist��/usr/local/etc/amavisd.conf�˥��ԡ������Խ�

  $mydomain = 'cozmixng.org'

�ػߤ���ե������̵����

  $final_banned_destiny     = D_PASS;

���ѥ�򾡼�˵��ݤ��ʤ�

  $final_spam_destiny       = D_PASS;

�����륹�����å��Ѥ������((<ClamAV>))�ˤ��롥

/etc/aliases��ɬ�פ����ʥ��ɥ쥹���ɲ�

  virus-quarantine: root
  spam-quarantine: root
  virusalert: root
  spam.police: root

�����������ʥ᡼�뤬�Ϥ����Ȥ����뤫�⤷��ʤ���

�ѹ���ȿ��

  % sudo postalias /etc/aliases

/etc/rc.d�˰ʲ����ɲ�

  amavisd_enable="YES"

/usr/local/etc/postfix/main.cf�˰ʲ����ɲ�

  ## for amavisd-new
  content_filter = smtp-amavis:[127.0.0.1]:10024

/usr/local/etc/postfix/master.cf�˰ʲ����ɲ�

  ## for amavisd-new
  smtp-amavis unix -      -       n       -       2  lmtp
     -o smtp_data_done_timeout=1200
     -o disable_dns_lookups=yes

  127.0.0.1:10025 inet n  -       n       -       -  smtpd
     -o content_filter=
     -o local_recipient_maps=
     -o smtpd_helo_restrictions=
     -o smtpd_client_restrictions=
     -o smtpd_sender_restrictions=
     -o smtpd_recipient_restrictions=permit_mynetworks,reject
     -o mynetworks=127.0.0.0/8

�������ɤ߹���

  % sudo env - /usr/local/etc/rc.conf/postfix.sh reload

== ���饤����Ȥ�����

((<Mew>))��4 > ��SPAM�б����äƤ��� ;-<
