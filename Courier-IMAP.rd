= Courier-IMAP

Maildir�����б���POP3��IMAP�����С�((<DRAC>))�ˤ��б����Ƥ��ʤ�(((<�б������Ƥ���ͤϤ���|URL:http://www.ftserve.net/~fuji/linux/popbeforesmtp.shtml>)))��

== ���󥹥ȡ���

  % sudo /usr/local/sbin/portupgrade -NRr courier-imap

== ����

����ե������/usr/local/etc/courier-imap/{imapd,imapd-ssl,pop3d,pop3d-ssl}

�ʲ����ѹ���

=== imapd

  IMAPDSTART=YES

  IMAP_TLS_REQUIRED=0
  IMAPDSTARTTLS=0

  IMAP_CAPABILITY="IMAP4rev1 UIDPLUS CHILDREN NAMESPACE THREAD=ORDEREDSUBJECT THREAD=REFERENCES SORT QUOTA AUTH=CRAM-MD5 AUTH=CRAM-SHA1 IDLE"

=== imapd-ssl

  IMAPDSSLSTART=YES
  IMAP_TLS_REQUIRED=1

  TLS_CERTFILE=/usr/local/etc/courier-imap/imapd.pem

=== pop3d

  POP3DSTART=YES

  POP3AUTH="LOGIN CRAM-MD5 CRAM-SHA1"

  POP3_TLS_REQUIRED=0

  POP3AUTH_TLS="$POP3AUTH PLAIN"
  POP3AUTH_TLS_ORIG="$POP3AUTH PLAIN"

=== pop3d-ssl

  POP3DSSLSTART=YES
  POP3_TLS_REQUIRED=1

  TLS_CERTFILE=/usr/local/etc/courier-imap/pop3d.pem

=== UNIX��������Ȥ�¸�ߤ��ʤ����

((<Postfix>))�ǥС������ۥ��Ȥ����ꤷ�Ƥ�����

==== �桼������

  % sudo /usr/local/sbin/userdb ���������̾@cozmixng.org set \
      home=/home/mailuser/cozmixng.org/���������̾ \
      mail=/home/mailuser/cozmixng.org/���������̾/Maildir \
      uid=10000 gid=10000

��:
  % sudo /usr/local/sbin/userdb kou@cozmixng.org set \ 
      home=/home/mailuser/cozmixng.org/kou \
      mail=/home/mailuser/cozmixng.org/kou/Maildir \
      uid=10000 gid=10000

==== �桼���Υѥ���ɤ����ꤹ��

  % sudo /usr/local/sbin/userdbpw -md5 | \
      sudo /usr/local/sbin/userdb \
        ���������̾@cozmixng.org set pop3pw
  % sudo /usr/local/sbin/userdbpw -md5 | \
      sudo /usr/local/sbin/userdb \
        ���������̾@cozmixng.org set imappw
  % sudo /usr/local/sbin/makeuserdb

��:
  % sudo /usr/local/sbin/userdbpw -md5 | \
      sudo /usr/local/sbin/userdb \
        kou@cozmixng.org set pop3pw
  % sudo /usr/local/sbin/userdbpw -md5 | \
      sudo /usr/local/sbin/userdb \
        kou@cozmixng.org set imappw
  % sudo /usr/local/sbin/makeuserdb

CRAM-MD5�����Ѥ���ʤ餳����

  % sudo /usr/local/sbin/userdbpw -hmac-md5 | \
      sudo /usr/local/sbin/userdb \
        kou@cozmixng.org set hmac-md5pw
  % sudo /usr/local/sbin/makeuserdb

�����POP3�Ǥ�IMAP�Ǥⶦ�̤ǻȤ���ߤ�����

==== quota������

����ʤ��Ȥ򤹤��quota������Ǥ���ߤ��������ʤߤˡ����������100MB��

  % sudo /usr/local/sbin/userdb \
      kou@cozmixng.org set quota=100000000
  % sudo /usr/local/sbin/makeuserdb


=== �С������ۥ��Ȥ����ꤷ�Ƥ��ʤ����

==== �桼���Υۡ����Maildir����

  % maildirmake ~/Maildir

/usr/share/skel�˺�äƤ����ȿ�����Ͽ�����桼���ϼ�ʬ�Ǻ��ʤ��Ƥ��ɤ���

  % sudo maildirmake /usr/share/skel/Maildir

== ������

=== ��ʬ�Ǻ��

�������((<Apache>))��((<���ȥ꡼�ߥ�>))��((<Qpopper>))�Ȱ�

������ϡ�Courier-IMAP����̩���Ⱦ������Ʊ���ե�����ˤ��ʤ���Ф����ʤ����ȤǤ��롥�ʤΤǡ��ʲ��Τ褦�ˤ���{imapd.pem,pop3d.pem}���롥

�����롥Common Name��mail.cozmixng.org�ˤ��뤳�ȡ�

  % sudo openssl req -new \
    -out /usr/local/etc/courier-imap/server.csr \
    -keyout /usr/local/etc/courier-imap/server.pem
  % sudo openssl rsa \
    -in /usr/local/etc/courier-imap/server.pem \ 
    -out /usr/local/etc/courier-imap/server.key
  % sudo chmod 600 /usr/local/etc/courier-imap/server.{pem,key}

ǧ�ڤ���(��ά)��

���������̩������ˤ��롥

  % cd /usr/local/etc/courier-imap
  % sudo sh -c 'cat server.crt server.key > pop3d.pem'
  % sudo cp {pop3,imap}d.pem
  % sudo chmod 600 {pop3,imap}d.pem

=== mkimapdcert��Ȥ�

/usr/local/etc/courier-imap/imapd-cnf���롥/usr/local/etc/courier-imap/imapd-cnf.dist�򥳥ԡ����ơ�������Խ�����Ȥ褤������

  % sudo cp /usr/local/etc/courier-imap/imapd-cnf{.dist,}

�������

  [ req_dn ]

�����

  CN=localhost

��IMAP/POP�����ФΤ�Τ��Ѥ��뤳�ȡ�mail.cozmixng.org�Ȥ��ˡ�

��ϡ�mkimpadcert��¹Ԥ��������

  % sudo mkimapdcert

������¾��/usr/local/share/courier-imap/imapd.pem����������롥���ʤߤˡ�/usr/local/share/courier-imap/imapd.pem���⤦���Ǥˤ����mkimpadcert�Ͽ�����imapd.pem����ʤ��ʾ�񤭤��ʤ��ˤΤǡ����ʤ����Ȥ���rm���Ƥ���mkimapdcert��
�¹Ԥ��뤳�ȡ�

pop3d.pem��imapd.pem�򥳥ԡ�����Ф褤��

== ��ư

��ư����Ȥ���/usr/local/libexec/courier-imap/{imapd,pop3d}-ssl.rc��Ȥ���/usr/local/etc/rc.d/courier-imap-{impad,pop3d}-ssl.sh�Ȥ��ƥ�󥯤�ĥ�äƤ����Ȥ���������

== ���饤����Ȥ�����

���ޤ������ʤ�������

=== �ΤϤ��ޤ����ä�����

Mew�ʤ�

  (setq mew-prog-ssl "/usr/sbin/stunnel")

  (setq mew-config-alist
   ...
       ("pop-ssl"       . 't)
       ("imap-ssl"      . 't)
   ...)

�Ȥ��񤯡�����Ǥ�äơ��᡼�륵���Фξ�������äƤ��ơ�~/mail.pem�Ȥ���ˡ�~/.certs/�ʲ����֤���~/.certs/�ʲ����֤��Ȥ��Υե�����̾��"#{������Υϥå�����}.0"�ʤ���äƤ���

  % mkdir -p ~/.certs
  % cp ~/mail.pem ~/.certs/`openssl x509 -hash -noout -in ~/mail.pem`.0

���ʤߤˡ��᡼�륵���Фξ������

  -----BEGIN CERTIFICATE-----

����

  -----END CERTIFICATE-----

�ޤǤ���ʬ��mkimapdcert��imapd.pem���ä��Τʤ顤imapd.pem�ο����椢����ˤ���Ϥ���


�⤷��������򸡾ڡʡ��ˤ��ʤ��ʤ�ʲ���񤤤Ƥ�����

  (setq mew-ssl-verify-level 0)
