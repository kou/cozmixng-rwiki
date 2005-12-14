= PHP

== 設定

httpd.confに以下を記述

  LoadModule php5_module        libexec/apache22/libphp5.so

  AddType application/x-httpd-php .php
  AddType application/x-httpd-php-source .phps

あまけでDirectoryIndexにindex.phpを付け加えてもよし
