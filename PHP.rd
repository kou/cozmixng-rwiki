= PHP

== 設定

httpd.confに以下を記述

  LoadModule php4_module        libexec/apache2/libphp4.so

  AddType application/x-httpd-php .php
  AddType application/x-httpd-php-source .phps

あまけでDirectoryIndexにindex.phpを付け加えてもよし
