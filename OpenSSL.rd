= OpenSSL

== �ѥ��ե졼��̵���ξ�������롥

  % openssl req -new -x509 -nodes -keyout server.key -out server.crt

== ���������Ȥ򸫤롥

  % openssl x509 -text -in xxx.crt

== ������Υϥå������

/etc/ldap/ldap.conf��TLS_CACERTDIR����ꤹ��Ȥ��ʤɤ�ɬ�ס�

  % c_rehash �����񤬤���ǥ��쥯�ȥ�
