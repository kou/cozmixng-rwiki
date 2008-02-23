= SIP Express Router

SIPサーバ。

SIP Express Router (ser) is a high-performance, configurable, free SIP ( RFC3261 ) server . It can act as registrar, proxy or redirect server.

== インストール

ユーザ管理にはMySQLを使うのでmysql-serverも入れる。

  % sudo portupgrade -NRr ser mysql-server

== 初期設定

MySQLにSER用のデータベースserを作成する。このためにser_mysql.shというシェルスクリプトが用意されている。

  % sudo /usr/local/sbin/ser_mysql.sh create
  MySql password for root: <- MySQLのrootのパスワードを入力
  Enter password: <- MySQLのrootのパスワードを入力
  Domain (realm) for the default user 'admin': sip.cozmixng.org <- SIPサーバで使うドメイン名を入力
  
  creating database ser ...
  Enter password: <- MySQLのrootのパスワードを入力

SIPサーバで使うドメイン名は/etc/hostsに書いておくこと。デバッグモードで起動すると自分のドメイン名として使っているドメイン名をみることができる。

  % sudo /usr/local/sbin/ser -d -D 
  Listening on
  ...
  Aliases:
  ... この中にSIPサーバで使うドメイン名があること
  ^C
  %

再初期化するときはcreateじゃなくてreinitを使う。

  % sudo /usr/local/sbin/ser_mysql.sh reinit

ser_mysql.shで作成されたデータベースserにアクセスするためのMySQLのユーザを作成する。ここではserユーザでSECRETというパスワードにする。

  % sudo -u mysql -H mysql -u root
  mysql> GRANT ALL ON ser.* TO ser@localhost IDENTIFIED BY 'SECRET';

== ユーザ登録

ユーザ登録にはserctlを使う。SIPアドレスがkou@sip.cozmixng.org（sip.cozmixng.orgはser_mysql.sh createで指定したドメイン名）でパスワードがMY-SECRETでメールアドレスがkou@cozmixng.orgなユーザは以下のように登録する。

  % sudo /usr/local/sbin/serctl add kou@sip.cozmixng.org MY-SECRET kou@cozmixng.org
  MySql password: <- MySQLのserユーザのパスワード、↑の例だとSECRETを入力

削除はSIPアドレスだけを指定する。

  % sudo /usr/local/sbin/serctl rm kou@sip.cozmixng.org

あとで接続テストをするので、もうひとつユーザを作っておく。

  % sudo /usr/local/sbin/serctl add test@sip.cozmixng.org TEST-SECRET test@cozmixng.org

== 設定

まず、/etc/rc.confにser_enable="YES"を追加する。

続いてSERの設定。

MySQLにあるデータを使うように/usr/local/etc/ser/ser.cfgを書き換える。

まず、MySQL用のモジュールを読み込む。

  # _
  # Uncomment this if you want to use SQL database
  #loadmodule "/usr/local/lib/ser/modules/mysql.so"

↓

  # _
  # Uncomment this if you want to use SQL database
  loadmodule "/usr/local/lib/ser/modules/mysql.so"

認証用のモジュールも読み込む。

  # _
  # Uncomment this if you want digest authentication
  # mysql.so must be loaded !
  #loadmodule "/usr/local/lib/ser/modules/auth.so"
  #loadmodule "/usr/local/lib/ser/modules/auth_db.so"

↓

  # _
  # Uncomment this if you want digest authentication
  # mysql.so must be loaded !
  loadmodule "/usr/local/lib/ser/modules/auth.so"
  loadmodule "/usr/local/lib/ser/modules/auth_db.so"

ユーザの位置情報（ログインしたユーザがどのIPアドレスを持っているかとか）をメモリ上じゃなくて、データベースに保存するようにする。（db_modeが0だとメモリ上だけで、1か2だとデータベースにも書き出して、次回起動時に復元する。2は0のときみたいにメモリ上にもデータを持つから遅くならない。）

  modparam("usrloc", "db_mode",   0)
 
  # Uncomment this if you want to use SQL database 
  # for persistent storage and comment the previous line
  #modparam("usrloc", "db_mode", 2)

↓

  # _
  #modparam("usrloc", "db_mode",   0)

  # Uncomment this if you want to use SQL database 
  # for persistent storage and comment the previous line
  modparam("usrloc", "db_mode", 2)

  modparam("usrloc", "db_url", "mysql://ser:SECRET@localhost/ser")

db_urlの「ser:SECRET」の部分は「ユーザ名:パスワード」で、localhostで動いているMySQLのデータベースserに接続するために使われる。

認証まわりのモジュールauth_dbの設定もする。

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

↓

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

auth_dbのdb_urlはusrlocのdb_urlと同じ書式。

最後に、実際に認証を行う設定をする。

  # _
  # Uncomment this if you want to use digest authentication
  #                        if (!www_authorize("iptel.org", "subscriber")) {
  #                                www_challenge("iptel.org", "0");
  #                                break;
  #                        };

↓

  # _
  # Uncomment this if you want to use digest authentication
                          if (!www_authorize("sip.cozmixng.org", "subscriber")) {
                                  www_challenge("sip.cozmixng.org", "0");
                                  break;
                          };

sip.cozmixng.orgの部分はser_mysql.shで指定したドメイン名。

== 起動

  % sudo /usr/local/etc/rc.d/ser start

== クライアントの設定

=== Ekiga

編集→アカウント。

: アカウント名
   kou（好きなもの）

: プロトコル
   SIP

: レジストラ
   sip.cozmixng.org（ser_mysql.shで指定したドメイン名）

: 名前
   kou（serctl addしたときの@より前の部分）

: パスワード
   MY-SECRET（serctl addしたときに設定したパスワード）

設定したらアカウント一覧画面の一番左にある「A」という見出しがついた列にチェックを入れる。成功するとメイン画面の「登録済みのアカウント数: n」の「n」の部分が1になる。

テストのために、Ekigaはこのままつないでおく。

=== KPhone

最初の起動時に出るやつの設定(File->Identity)

: Full Name
   Test User（自分の名前）
: User Part of SIP URL
   test（serctl addしたときの@よりも前の部分）
: Host Part of SIP URL
   sip.cozmixng.org（ser_mysql.shで指定したドメイン名）
: Authentication Username (optional)
   test（省略可能。serctl addしたときの@よりも前の部分）

電話をかけるにはFile->New CallにいってDial

: Remote:
   相手のアドレス(例: kou@sip.cozmixng.org)

これでEkigaの方で電話の呼び出し音がなったら成功。
