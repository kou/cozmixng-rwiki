= Apache

Apache�ط��κ�ȵ�Ͽ�Ǥ���

== ���󥹥ȡ���

/usr/local/etc/pkgtools.conf��MAKE_ARGS�˰ʲ����ɲá�

  'www/apache2' => [
    'WITH_SUEXEC_MODULES=yes',
    'WITH_SSL_MODULES=yes',
   ],

www/apache2�򥤥󥹥ȡ���

  % sudo /usr/local/sbin/portupgrade -NRr apache

== Digestǧ�ڤ�Ȥ�

httpd.conf��auth_digest�⥸�塼�����ɤ��뵭�Ҥ��ɲä��롣

  LoadModule auth_digest_module libexec/apache2/mod_auth_digest.so

httpd.conf��.htaccess��Digestǧ�ڤ�����򵭽Ҥ���

  AuthName realm_name
  AuthType Digest
  AuthDigestDomain /path/to/you/want/to/auth
  AuthDigestFile /path/to/digest/file
  Require valid-user

Digestǧ���ѤΥե��������

  % /usr/local/sbin/htdigest -c /path/to/digest/file realm_name user_name

�����ǡ�realm_name��AuthName�ǻ��ꤷ����ΤȤ��ʤ���Τ���ꤹ�롣

== SSL��Ȥ�

���Ȥ���������Υꥯ�����Ȥ��롥Common Name��www.cozmxing.org�Ȥ�streaming.cozmixng.org�Ȥ��ˤ��롥

  % sudo openssl req -new \
      -out /usr/local/etc/apache2/ssl.key/server.csr \
      -keyout /usr/local/etc/apache2/ssl.key/server.pem
  % sudo openssl rsa \
      -in /usr/local/etc/apache2/ssl.key/server.pem \
      -out /usr/local/etc/apache2/ssl.key/server.key
  % sudo chmod 600 /usr/local/etc/apache2/ssl.key/server.{pem,key}

�⤷��������ʲ��Τ褦��-config���ץ����ɬ�פ��⤷��ʤ���

  -config /etc/ssl/openssl.cnf

�⤷�ʤ��ä��顤ǧ�ڶɤ��롥
  % cd /usr/local/share/ca
  % sudo sh /usr/src/crypto/openssl/apps/CA.sh -newca

ǧ�ڤ��롥
  % cd /usr/local/share/ca/
  % sudo openssl ca -cert /usr/local/share/ca/demoCA/cacert.pem \
      -keyfile /usr/local/share/ca/demoCA/private/cakey.pem \
      -in /usr/local/etc/apache2/ssl.key/server.csr \
      -out /usr/local/etc/apache2/ssl.crt/server.crt

== ̾���١����ΥС������ۥ���

̾���١����ΥС������ۥ��Ȥ�����򤷤���IP���ɥ쥹����ꤹ�롥

�ɤ�IP���ɥ쥹���ɤ�����*����ꤹ�롥IP���ɥ쥹�θ�˥ݡ����ֹ�����Ǥ��롥

  NameVirtualHost *:80

��������ȡ��ɤ�IP���ɥ쥹�Ǥ�褤����80�֥ݡ��ȤΤ�̾���١����ΥС������ۥ��Ȥ����Ѥ��롥

���ˡ��С������ۥ��Ȥ���ꤹ�롥

�ƥС������ۥ��Ȥˤϡ�����Ǥ�ServerName��DocumentRoot����ꤹ�롥�ǥե���Ȥ����Ѥ��������ϡ����ֺǽ�˽񤭡�DocumentRoot��<VirtualHost>�γ��ǻ��ꤷ����Ĥ�Ʊ������ˤ��롥

<VirtualHost>��IP���ɥ쥹�λ�����ˡ�ϡʤ���������NameVirtualHost��Ʊ����

  <VirtualHost *:80>
    ServerName www.cozmixng.org
    DocumentRoot /XXX/YYY
  </VirtualHost>

  <VirtualHost *:80>
    ServerName cozmix.sgk.iwate-u.ac.jp
    DocumentRoot /YYY/ZZZ
    SuexecUserGroup cozmix cozmix
    ErrorLog /var/log/cozmix.sgk.iwate-u.ac.jp-error_log
    CustomLog /var/log/cozmix.sgk.iwate-u.ac.jp-access_log combined
  </VirtualHost>

�С������ۥ��Ȥμ¹ԥ桼�������롼�פ��ѹ�����ˤ�SuexecUserGroup����ꤹ�롥�Ť�Apache�ǻ���Ǥ���User��Group�ϻ��ѤǤ��ʤ���
