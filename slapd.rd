= slapd

((<OpenLDAP>))���󶡤���LDAP�����Ф��á�

Debian��Ǥ��á�

== TLS���ݡ���

TLS�򥵥ݡ��Ȥ��뤿��ˤϰʲ�������ե�������ɲä��ƺƵ�ư���롣

/etc/ldap/slapd.conf:
  TLSCertificateFile      /etc/ldap/certs/server.crt
  TLSCertificateKeyFile   /etc/ldap/certs/server.key

������ʤɤϰʲ��Τ褦�ˤ��ƺ����Ǥ��롣((<OpenSSL>))�⻲�ͤˡ�

  % sudo mkdir -p /etc/ldap/certs
  % cd /etc/ldap/certs
  % sudo openssl req -new -x509 -nodes -keyout server.key -out server.crt
  % sudo chmod 600 server.key
  % sudo c_rehash .

�Ǹ��c_rehash��˺��ʤ����ȡ�

=== ���饤�����¦������

���ϼ���������ʤΤǡ������Ȥä�TLS��Ȥ��ˤϥ��饤�����¦�˾��������Ͽ���ʤ��Ȥ����ʤ����ʤ��뤤�Ͼ�����γ�ǧ�ʡ��ˤ�Ŭ���ˤ���

  ldap-client% sudo mkdir -p /etc/ldap/certs
  ldap-client% scp ldap-server:/etc/ldap/certs/server.crt /tmp/
  ldap-client% cd /etc/ldap/certs
  ldap-client% mv /tmp/server.crt ./
  ldap-client% sudo c_rehash .

�Ǹ��c_rehash��˺��ʤ����ȡ�

�ǥե���Ȥ�/etc/ldap/certs/�ˤ���������Ȥ��褦�ˤ��롣

/etc/ldap/ldap.conf:
  TLS_CACERTDIR /etc/ldap/certs

OpenLDAP��TLS�ΥХå�����ɤȤ���GnuTLS�����Ѥ��Ƥ������TLS_CACERTDIR���Ȥ��ʤ��Τ�TLS_CACERT�ǥե��������ꤹ�롣

/etc/ldap/ldap.conf:
  TLS_CACERT /etc/ldap/certs/server.crt

���ʤߤˡ�������γ�ǧ�ʡ��ˤ�Ŭ���ˤ���ʤ餳����

/etc/ldap/ldap.conf:
  TLS_REQCERT never
