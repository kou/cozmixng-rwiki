= FastCGI

== ���󥹥ȡ���

/usr/local/etc/pkgtools.conf��MAKE_ARGS�˰ʲ����ɲá�

  'www/mod_fastcgi' => 'WITH_APACHE2=yes',

www/mod_fastcgi�򥤥󥹥ȡ���

  % sudo /usr/local/sbin/portupgrade -NRr mod_fastcgi

== ����

/usr/local/etc/apache2/httpd.conf�˰ʲ����ɲá�

  LoadModule fastcgi_module     libexec/apache2/mod_fastcgi.so
  <IfModule mod_fastcgi.c>
    AddHandler fastcgi-script .fcgi .frb
    FastCgiSuexec On
  </IfModule>

�Ǥ⡤�������ʤ���socket����³�Ǥ��ʤ��Ȥ����äƤ��롥�����󡤤ʤ�ǡ�

  FastCgiIpcDir /tmp

�Ȥ�����ȡ�/tmp/dynamic�Ȥ����ߤ��������ɡ�����Ǥ���ᡥ�����󡥡���
