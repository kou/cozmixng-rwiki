= Qpopper

Qpopper�ط��κ�ȵ�Ͽ

== ���󥹥ȡ���

((<DRAC>))��Ĥ��Ǥ˥��󥹥ȡ��롥WITH_POSTFIX=yes��DRAC�Τ��ᡥ

  % sudo /usr/local/sbin/portupgrade -m "WITH_DRAC=yes WITH_POSTFIX=yes" -N qpopper

== ����Ū������

=== xinetd�ǵ�ư����褦�ˤ��롥

���󥹥ȡ����

  % sudo /usr/local/sbin/portupgrade -N xinetd


inetd��ߤ��Τǡ�/etc/rc.conf�˰ʲ����ɲ�

  inetd_enable="NO"

����ե������/usr/local/etc/xinetd.conf

  service pop3
  {
          disable         = no
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = root
          server          = /usr/local/libexec/qpopper
          server_args     = -s -p 1
  }

  service pop3s
  {
          disable         = no
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = root
          server          = /usr/local/libexec/qpopper
          server_args     = -s -f /usr/local/etc/qpopper/config
  }

/usr/local/etc/qpopper/config�ϰʲ��Τ褦�ʴ���

  set clear-text-password = tls
  set tls-support = alternate-port
  set tls-server-cert-file = /usr/local/etc/qpopper/certs/cert.pem

������κ�����ϰʲ��Τ褦�ʴ���

  (1) �ޤ����ꥯ�������Ѥ��롥�⤷��/usr/local/openssl/openssl.cnf��̵���ä��顤/usr/local/openssl/openssl.cnf.sample�򥳥ԡ����Ƥ�����

	 % sudo mkdir -p -m660 /usr/local/etc/qpopper/certs
	 % sudo chown root:mail /usr/local/etc/qpopper/certs
	 % sudo openssl req -new -nodes -out req.pem -keyout /usr/local/etc/qpopper/certs/cert.pem
	 % sudo chmod 600 /usr/local/etc/qpopper/certs/cert.pem
	 % sudo chown root:0 /usr/local/etc/qpopper/certs/cert.pem

  (1)  ������ǧ�ڶɤ���

	 % sudo openssl genrsa -des3 -out ca.key 1024
	 % sudo openssl req -new -x509 -days 365 -key ca.key -out ca.crt
	 % sudo openssl x509 -req -CA ca.crt -CAkey ca.key -days 365 -in req.pem -out signed-req.pem -CAcreateserial

  (1) ��ʬ��ǧ�ڤ���

	 # cat signed-req.pem >> /usr/local/etc/qpopper/certs/cert.pem

  (1) /usr/local/etc/qpopper/certs/ca.crt�ϸ����������������Τ��ʡ�

����������ȡ����Υѥ���ɤϰ��ڼ������ޤ���APOP�ޤ���POP over SSL/TLS��ȤäƤ���������

==== ���

Mew���ȡ�APOP�Ϥ��ޤ��������ɡ�SSL�Ϥ��ޤ������ʤ����Ȥꤢ������

  (setq mew-prog-ssl "/usr/sbin/stunnel")

�Ȥ���

  (setq mew-config-alist
     ...
         ("pop-ssl"       . 't)
     ...)

�Ȥ��񤤤Ƥ����ȡ�SSL��Ȥ����Ȥ��뤱�ɡ����ޤ����äƤ��ʤ��ߤ���������2003-04-19

���Ȥǡ�((<URL:http://acorn.zive.net/~oyaji/>))�򸫤Ƥ�������2003-04-19
  
=== ǧ���ѥǡ����١���������

  % sudo -u pop qpopauth -init

== �桼���ɲ�

  % sudo -u pop qpopauth -user kou

