= SIP Express Router

SIP�����С�

SIP Express Router (ser) is a high-performance, configurable, free SIP ( RFC3261 ) server . It can act as registrar, proxy or redirect server.

== ���󥹥ȡ���

�桼�������ˤ�MySQL��Ȥ��Τ�mysql-server������롣

  % sudo portupgrade -NRr ser mysql-server

== �������

MySQL��SER�ѤΥǡ����١���ser��������롣���Τ����ser_mysql.sh�Ȥ��������륹����ץȤ��Ѱդ���Ƥ��롣

  % sudo /usr/local/sbin/ser_mysql.sh create
  MySql password for root: <- MySQL��root�Υѥ���ɤ�����
  Enter password: <- MySQL��root�Υѥ���ɤ�����
  Domain (realm) for the default user 'admin': sip.cozmixng.org <- SIP�����ФǻȤ��ɥᥤ��̾������
  
  creating database ser ...
  Enter password: <- MySQL��root�Υѥ���ɤ�����

SIP�����ФǻȤ��ɥᥤ��̾��/etc/hosts�˽񤤤Ƥ������ȡ��ǥХå��⡼�ɤǵ�ư����ȼ�ʬ�Υɥᥤ��̾�Ȥ��ƻȤäƤ���ɥᥤ��̾��ߤ뤳�Ȥ��Ǥ��롣

  % sudo /usr/local/sbin/ser -d -D 
  Listening on
  ...
  Aliases:
  ... �������SIP�����ФǻȤ��ɥᥤ��̾�����뤳��
  ^C
  %

�ƽ��������Ȥ���create����ʤ���reinit��Ȥ���

  % sudo /usr/local/sbin/ser_mysql.sh reinit

ser_mysql.sh�Ǻ������줿�ǡ����١���ser�˥����������뤿���MySQL�Υ桼����������롣�����Ǥ�ser�桼����SECRET�Ȥ����ѥ���ɤˤ��롣

  % sudo -u mysql -H mysql -u root
  mysql> GRANT ALL ON ser.* TO ser@localhost IDENTIFIED BY 'SECRET';

== �桼����Ͽ

�桼����Ͽ�ˤ�serctl��Ȥ���SIP���ɥ쥹��kou@sip.cozmixng.org��sip.cozmixng.org��ser_mysql.sh create�ǻ��ꤷ���ɥᥤ��̾�ˤǥѥ���ɤ�MY-SECRET�ǥ᡼�륢�ɥ쥹��kou@cozmixng.org�ʥ桼���ϰʲ��Τ褦����Ͽ���롣

  % sudo /usr/local/sbin/serctl add kou@sip.cozmixng.org MY-SECRET kou@cozmixng.org
  MySql password: <- MySQL��ser�桼���Υѥ���ɡ����������SECRET������

�����SIP���ɥ쥹��������ꤹ�롣

  % sudo /usr/local/sbin/serctl rm kou@sip.cozmixng.org

���Ȥ���³�ƥ��Ȥ򤹤�Τǡ��⤦�ҤȤĥ桼�����äƤ�����

  % sudo /usr/local/sbin/serctl add test@sip.cozmixng.org TEST-SECRET test@cozmixng.org

== ����

�ޤ���/etc/rc.conf��ser_enable="YES"���ɲä��롣

³����SER�����ꡣ

MySQL�ˤ���ǡ�����Ȥ��褦��/usr/local/etc/ser/ser.cfg��񤭴����롣

�ޤ���MySQL�ѤΥ⥸�塼����ɤ߹��ࡣ

  # _
  # Uncomment this if you want to use SQL database
  #loadmodule "/usr/local/lib/ser/modules/mysql.so"

��

  # _
  # Uncomment this if you want to use SQL database
  loadmodule "/usr/local/lib/ser/modules/mysql.so"

ǧ���ѤΥ⥸�塼����ɤ߹��ࡣ

  # _
  # Uncomment this if you want digest authentication
  # mysql.so must be loaded !
  #loadmodule "/usr/local/lib/ser/modules/auth.so"
  #loadmodule "/usr/local/lib/ser/modules/auth_db.so"

��

  # _
  # Uncomment this if you want digest authentication
  # mysql.so must be loaded !
  loadmodule "/usr/local/lib/ser/modules/auth.so"
  loadmodule "/usr/local/lib/ser/modules/auth_db.so"

�桼���ΰ��־���ʥ����󤷤��桼�����ɤ�IP���ɥ쥹����äƤ��뤫�Ȥ��ˤ����夸��ʤ��ơ��ǡ����١�������¸����褦�ˤ��롣��db_mode��0���ȥ��������ǡ�1��2���ȥǡ����١����ˤ�񤭽Ф��ơ�����ư�����������롣2��0�ΤȤ��ߤ����˥����ˤ�ǡ�������Ĥ����٤��ʤ�ʤ�����

  modparam("usrloc", "db_mode",   0)
 
  # Uncomment this if you want to use SQL database 
  # for persistent storage and comment the previous line
  #modparam("usrloc", "db_mode", 2)

��

  # _
  #modparam("usrloc", "db_mode",   0)

  # Uncomment this if you want to use SQL database 
  # for persistent storage and comment the previous line
  modparam("usrloc", "db_mode", 2)

  modparam("usrloc", "db_url", "mysql://ser:SECRET@localhost/ser")

db_url�Ρ�ser:SECRET�פ���ʬ�ϡ֥桼��̾:�ѥ���ɡפǡ�localhost��ư���Ƥ���MySQL�Υǡ����١���ser����³���뤿��˻Ȥ��롣

ǧ�ڤޤ��Υ⥸�塼��auth_db������⤹�롣

  # _
  # -- auth params --
  # Uncomment if you are using auth module
  #
  #modparam("auth_db", "calculate_ha1", yes)
  #
  # If you set "calculate_ha1" parameter to yes (which true in this config), 
  # uncomment also the following parameter)
  #
  #modparam("auth_db", "password_column", "password")

��

  # _
  # -- auth params --
  # Uncomment if you are using auth module
  #
  modparam("auth_db", "calculate_ha1", yes)
  #
  # If you set "calculate_ha1" parameter to yes (which true in this config), 
  # uncomment also the following parameter)
  #
  modparam("auth_db", "password_column", "password")

  modparam("auth_db", "db_url", "mysql://ser:SECRET@localhost/ser")

auth_db��db_url��usrloc��db_url��Ʊ���񼰡�

�Ǹ�ˡ��ºݤ�ǧ�ڤ�Ԥ�����򤹤롣

  # _
  # Uncomment this if you want to use digest authentication
  #                        if (!www_authorize("iptel.org", "subscriber")) {
  #                                www_challenge("iptel.org", "0");
  #                                break;
  #                        };

��

  # _
  # Uncomment this if you want to use digest authentication
                          if (!www_authorize("sip.cozmixng.org", "subscriber")) {
                                  www_challenge("sip.cozmixng.org", "0");
                                  break;
                          };

sip.cozmixng.org����ʬ��ser_mysql.sh�ǻ��ꤷ���ɥᥤ��̾��

== ��ư

  % sudo /usr/local/etc/rc.d/ser start

== ���饤����Ȥ�����

=== Ekiga

�Խ�����������ȡ�

: ���������̾
   kou�ʹ����ʤ�Ρ�

: �ץ�ȥ���
   SIP

: �쥸���ȥ�
   sip.cozmixng.org��ser_mysql.sh�ǻ��ꤷ���ɥᥤ��̾��

: ̾��
   kou��serctl add�����Ȥ���@���������ʬ��

: �ѥ����
   MY-SECRET��serctl add�����Ȥ������ꤷ���ѥ���ɡ�

���ꤷ���饢������Ȱ������̤ΰ��ֺ��ˤ����A�פȤ������Ф����Ĥ�����˥����å�������롣��������ȥᥤ����̤Ρ���Ͽ�ѤߤΥ�������ȿ�: n�פΡ�n�פ���ʬ��1�ˤʤ롣

�ƥ��ȤΤ���ˡ�Ekiga�Ϥ��ΤޤޤĤʤ��Ǥ�����

=== KPhone

�ǽ�ε�ư���˽Ф��Ĥ�����(File->Identity)

: Full Name
   Test User�ʼ�ʬ��̾����
: User Part of SIP URL
   test��serctl add�����Ȥ���@����������ʬ��
: Host Part of SIP URL
   sip.cozmixng.org��ser_mysql.sh�ǻ��ꤷ���ɥᥤ��̾��
: Authentication Username (optional)
   test�ʾ�ά��ǽ��serctl add�����Ȥ���@����������ʬ��

���ä򤫤���ˤ�File->New Call�ˤ��ä�Dial

: Remote:
   ���Υ��ɥ쥹(��: kou@sip.cozmixng.org)

�����Ekiga���������äθƤӽФ������ʤä���������
