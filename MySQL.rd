= MySQL

MySQL関係の作業記録です。

== インストール

  % sudo /usr/local/sbin/portupgrade -m "DB_DIR=/usr/local/var/db/mysql BUILD_OPTIMIZED=no" -N mysql-server

== 設定

DBの初期化

  % sudo -u mysql mysql_install_db

管理者ユーザのパスワード変更

  % mysqladmin -u root password "PASSWORD"

== 使う

DBの作成

  % mysqladmin -u root -p create znz

ユーザのパスワードを設定(ユーザの登録という概念はないのかなぁ)．

  % mysqladmin -u znz password "PASSWORD"

ユーザに権限を与える．

  mysql> GRANT ALL ON znz.* TO znz@localhost;

