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
