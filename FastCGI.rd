= FastCGI

== インストール

/usr/local/etc/pkgtools.confのMAKE_ARGSに以下を追加．

  'www/mod_fastcgi' => 'WITH_APACHE2=yes',

www/mod_fastcgiをインストール

  % sudo /usr/local/sbin/portupgrade -NRr mod_fastcgi

== 設定

/usr/local/etc/apache2/httpd.confに以下を追加．

  LoadModule fastcgi_module     libexec/apache2/mod_fastcgi.so
  <IfModule mod_fastcgi.c>
    AddHandler fastcgi-script .fcgi .frb
    FastCgiSuexec On
  </IfModule>

でも，うごかない．socketに接続できないとか言っている．うーん，なんで？

  FastCgiIpcDir /tmp

とかすると，/tmp/dynamicとか作るみたいだけど，それでもだめ．うーん．．．
