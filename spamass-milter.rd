= spamass-milter

((<SpamAssassin>))の((<milter>))インターフェイス。

== インストール

  % sudo /usr/local/sbin/portupgrade -NRr spamass-milter

== 設定

mailnullユーザ、mailグループで動かし、接続はUNIXドメインソケット/var/run/milter/spamass-milter.sockで受け付ける。ソケットのパーミッションは0660にし、mailグループに所属しているユーザ（((<Postfix>))の実効ユーザなど）からも接続を受け付けるようにする。ソケットは作ったり削除されたりするので、/var/run/milter/ディレクトリはmailnullユーザで読み書きできるようにしておかなければいけない。

スパム判定されたメールのSubjectや本文などはいじらない。（spamass_milter_localflagsの"-m"オプション）

スパムチェックはすべてspamdユーザ権限で行う。（spamass_milter_localflagsの"-- -u spamd"オプション）

/etc/rc.conf:
  spamass_milter_enable="YES"
  spamass_milter_user="mailnull"
  spamass_milter_group="mail"
  spamass_milter_socket="/var/run/milter/spamass-milter.sock"
  spamass_milter_socket_owner="mailnull"
  spamass_milter_socket_group="mail"
  spamass_milter_socket_mode="660"
  spamass_milter_localflags="-m -- -u spamd"

ソケット用ディレクトリの作成。

  % sudo mkdir -p /var/run/milter
  % sudo chown -R mailnull:mail /var/run/milter

起動。

  % sudo /usr/local/etc/rc.d/spamass-milter start

((<SpamAssassin>))のspamdも起動しておかないとspamass-milterはスパムチェックできないことに注意すること。

== 確認

動いているかは((<milter-manager>))のmilter-test-serverで試すことができる。（mailグループに所属しているユーザで実行すること。）

  % milter-test-server -s unix:/var/run/milter/spamass-milter.sock

spamass-milterが動いていない場合は以下のようなエラーメッセージが表示される。
  Failed to connect to unix:/var/run/milter/spamass-mitler.sock: No such file or directory

spamdが動いていない場合は以下のようなエラーメッセージが/var/log/mailinfoにでる。

  Jan  3 17:22:37 mail spamc[7134]: connect to spamd on 127.0.0.1 failed, retrying (#1 of 3): Connection refused
  Jan  3 17:22:38 mail spamc[7134]: connect to spamd on 127.0.0.1 failed, retrying (#2 of 3): Connection refused
  Jan  3 17:22:39 mail spamc[7134]: connect to spamd on 127.0.0.1 failed, retrying (#3 of 3): Connection refused
  Jan  3 17:22:40 mail spamc[7134]: connection attempt to spamd aborted after 3 retries

正常に動いている場合は/var/log/mailinfoにspamdのログがでる。
  Jan  3 17:52:17 mail spamd[17756]: spamd: connection from localhost [127.0.0.1] at port 49470 
  Jan  3 17:52:17 mail spamd[17756]: spamd: setuid to spamd succeeded 
  Jan  3 17:52:17 mail spamd[17756]: spamd: processing message (unknown) for spamd:58 
  Jan  3 17:52:17 mail spamd[17756]: spamd: clean message (1.6/5.0) for spamd:58 in 0.1 seconds, 383 bytes. 
  Jan  3 17:52:17 mail spamd[17756]: spamd: result: . 1 - AWL,BAYES_40,MISSING_DATE,MISSING_MID,MISSING_SUBJECT,UNPARSEABLE_RELAY scantime=0.1,size=383,user=spamd,uid=58,required_score=5.0,rhost=localhost,raddr=127.0.0.1,rport=49470,mid=(unknown),bayes=0.290172,autolearn=no 
  Jan  3 17:52:17 mail spamd[17755]: prefork: child states: II 
