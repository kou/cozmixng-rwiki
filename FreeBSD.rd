= FreeBSD

FreeBSD関係の作業記録です。

== NFSサーバになる

/etc/rc.confに以下を記述．

  nfs_server_enable="YES"
  nfs_reserved_port_only="YES"

portmap_enable="YES"はあってもなくてもいい．

/etc/exportsに以下を記述．

  /path/to/export/dir  client1 client2

wwwとstreamingに読み込みのみで/usr/localとそのサブディレクトリもエクスポートしたいなら，以下のように記述する．

  /usr/local -ro -alldirs www streaming

再起動する．

== 再マウントする

  # mount -u /hoge/fuga

== NFSより後にローカルファイルシステムをマウントする

NFSより後にマウントしたいローカルファイルシステムのオプションにnoautoを加える．

  /dev/ad0s1f /usr/local/etc ufs,noauto 0 0

/etc/rc.localでマウントする．

  #!/bin/sh

  mount /usr/local/etc

/etc/rcでは，まずNFS以外のものをマウントしてからNFSをマウントしているのでこうしなければいけない(と思う)．まぁ，/etc/rc.localを実行した後に/usr/local/etc/rc.d/を見ているようなのでこんなんでいいかなと．

== 時間をあわせる

/etc/rc.confに以下を記述

  ntpdate_enable="YES"
  ntpdate_flags="-b ntp.tohoku.ac.jp"
  xntpd_enable="YES"

ntpdの設定については((<NTP>))

== 仮想ttyの数を減らす

/etc/ttysで必要な分だけttyv?をonにして残りをoffにする．

== CVSupでPortsをアップグレード

  (1) /etc/make.confに以下を追加
        SUP_UPDATE=     yes

        SUP=    /usr/local/bin/cvsup
        SUPFLAGS=       -g -L 2
        SUPHOST=        cvsup.jp.FreeBSD.org
        PORTSSUPFILE=   /usr/share/examples/cvsup/ports-supfile

  (2) いらないものは持って来ないようにする。/usr/sup/refuseに以下を書く。
        ports/chinese
        ports/french
        ports/german
        ports/hungarian
        ports/korean
        ports/hebrew
        ports/russian
        ports/vietnamese
  (4) 実行！
        % (cd /usr/ports; make update)

portupgradeは便利。

== ログのローテーション

FreeBSDではnewsyslogを使うのが筋らしい。

ということで、Apacheのログをローテーションしてみよう。

=== 設定

ファイルは/etc/newsyslog.conf。

毎月1日の0時にローテーションして最大12ヵ月分保存しておく設定は以下のような感じ。

  /var/log/httpd-access.log                       644  12    *    $M1D0     Z     /var/run/httpd.pid
  /var/log/httpd-error.log                        644  12    *    $M1D0     Z     /var/run/httpd.pid
  /var/log/httpd-suexec.log                        644  12    *    $M1D0     Z     /var/run/httpd.pid

Z(+空白)の後にpidの書いてあるファイル名(例えば/var/run/httpd.pid)を書くとシグナル(デフォルトではSIGHUP)を送る。((<Apache>))ちゃんはSIGUSR1(30だって)を送るとログファイルをclose/openするらしい。たぶん。ちなみにこの設定例ではApacheを再起動してclose/openしてますね。

newsyslogは(デフォルトでは)cronで毎時間動いているので再起動とかは必要なし。

== SWAPを追加

FreeBSDはVMのページングアルゴリズムの都合上，メインメモリの2倍以上SWAPがないと力を出し切れないらしい（see tuning(7)）．ということで，お手軽にSWAPを追加する方法．

=== SWAP用ファイルを作る

例えば，/usr/local/SWAPFILEを512MBのSWAP用ファイルにするには以下の様にする．

  % sudo dd if=/dev/zero of=/usr/local/SWAPFILE bs=1024k count=512

1Gにしたければcount=512をcount=1024にする．

=== SWAPとして認識させる

/etc/rc.confに以下のように記述して再起動．

  swapfile="/usr/local/SWAPFILE"

あるいは，4.9の場合は以下を実行．

  % sudo vnconfig -e /dev/vn0b /usr/local/SWAPFILE swap

5.xの場合は以下を実行．

  % sudo env - PATH=/sbin:/usr/sbin:/bin:/usr/bin /etc/rc.d/addswap start

=== 確認

  % /usr/sbin/pstat -s
