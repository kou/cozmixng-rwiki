= PostgreSQL

== ���åץǡ���

  % # PostgreSQL��ȤäƤ��륢�ץꥱ��������λ
  % sudo -u pgsql -H sh -c 'pg_dumpall > ~pgsql/dump.sql'
  % sudo env - /usr/local/etc/rc.d/postgresql stop
  % sudo /usr/local/sbin/portupgrade -Rr postgresql-server
  % sudo -u pgsql -H mv ~pgsql/data{,.`date +%Y%m%d`}
  % sudo env - /usr/local/etc/rc.d/postgresql initdb
  % sudo -u pgsql -H sh -c 'psql -f ~pgsql/dump.sql postgres'
  % sudo env - /usr/local/etc/rc.d/postgresql start
