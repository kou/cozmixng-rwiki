= MySQL

MySQL�ط��κ�ȵ�Ͽ�Ǥ���

== ���󥹥ȡ���

  % sudo /usr/local/sbin/portupgrade -m "DB_DIR=/usr/local/var/db/mysql BUILD_OPTIMIZED=no" -N mysql-server

== ����

DB�ν����

  % sudo -u mysql mysql_install_db

�����ԥ桼���Υѥ�����ѹ�

  % mysqladmin -u root password "PASSWORD"

== �Ȥ�

DB�κ���

  % mysqladmin -u root -p create znz

�桼���Υѥ���ɤ�����(�桼������Ͽ�Ȥ�����ǰ�Ϥʤ��Τ��ʤ�)��

  % mysqladmin -u znz password "PASSWORD"

�桼���˸��¤�Ϳ���롥

  mysql> GRANT ALL ON znz.* TO znz@localhost;

