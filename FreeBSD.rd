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

/etc/exportsを再読み込み．

  % sudo kill -HUP `cat /var/run/mountd.pid`

以下じゃダメなので注意！

  % sudo env - /etc/rc.d/mountd restart

とか

  % sudo env - /etc/rc.d/mountd reload


== exportsの状況を確認

  % showmount -e [hostname]

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

ファイルは/etc/newsyslog.conf。

=== Apacheのログをローテーション

毎月1日の0時にローテーションして最大12ヵ月分保存しておく設定は以下のような感じ。

  /var/log/httpd-access.log                       644  12    *    $M1D0     Z     /var/run/httpd.pid
  /var/log/httpd-error.log                        644  12    *    $M1D0     Z     /var/run/httpd.pid
  /var/log/httpd-suexec.log                        644  12    *    $M1D0     Z     /var/run/httpd.pid

Z(+空白)の後にpidの書いてあるファイル名(例えば/var/run/httpd.pid)を書くとシグナル(デフォルトではSIGHUP)を送る。((<Apache>))ちゃんはSIGUSR1(30だって)を送るとログファイルをclose/openするらしい。たぶん。ちなみにこの設定例ではApacheを再起動してclose/openしてますね。

newsyslogは(デフォルトでは)cronで毎時間動いているので再起動とかは必要なし。

=== ひとつのファイルに複数のローテーション規則を指定

そのファイル用のエントリを複数行書けばよいみたい．

以下は/var/log/all.logを以下のどちらかの条件にマッチしたらローテーションする設定．

   * 毎日0時
   * ファイルサイズが1GBを越えた

  /var/log/all.log                        600  7     *    @T00  J
  /var/log/all.log                        600  7     100000       *  J

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

== msk(4)が動かなくなる

RELENG_7に入ったmsk(4)を使っていてネットワークに負荷をかけると/var/log/messagesに以下のようなログを吐きつづけてネットワークが使えなくなる時の対処法。

  kernel: msk0: watchdog timeout (missed Tx interrupts) -- recovering

/bool/loader.confに以下を追加して再起動。

  hw.msk.msi_disable="1"

== coreを吐かせる

プロセスがSEGVなどで異常終了したときにcoreを吐かせるようにする設定。

通常のプロセスはsysctl kern.coredumpが1になっていればcoreを吐く。これはデフォルトの設定なので、通常のプロセスについては特にすることはない。

  % sudo /sbin/sysctl kern.coredump
  kern.coredump: 1

setuid/setgidされたプロセスはsysctl kern.sugid_coredumpが1になっていればcoreを吐く。これはデフォルトの設定ではないので設定する必要がある。

  % sudo /sbin/sysctl kern.sugid_coredump
  kern.sugid_coredump: 0
  % sudo /sbin/sysctl kern.sugid_coredump=1
  kern.sugid_coredump: 0 -> 1
  % sudo /sbin/sysctl kern.sugid_coredump
  kern.sugid_coredump: 1

coreが吐かれるファイルはsysctl kern.corefileで確認できる。

  % sudo /sbin/sysctl kern.corefile
  kern.corefile: %N.core

デフォルトではカレントディレクトリに吐かれるがsetuid/setgidするプロセスは/にchdirしていることが多く、/はroot権限がなければ書き込むことができないことが多いため、coreは吐こうとするがcoreファイルの作成には失敗する。（たぶん。予想。）

ということで、sysctl kern.corefileのパスに書き込み可能なフルパスを指定するとcoreファイルを作成できるようになる。

  % sudo /sbin/sysctl kern.corefile=/var/tmp/%N.%U.core
  kern.corefile: %N.core -> /var/tmp/%N.%U.core

%Nはプログラム名、%UはユーザIDに展開される。（%PはプロセスID）

この設定を起動時に行うためには/etc/sysctl.confに以下の内容を追記する。

  kern.sugid_coredump=1
  kern.corefile=/var/tmp/%N.%U.core

また、各ユーザ毎の設定も注意する必要がある。coreのサイズの上限は以下で確認できる。

  % limits -c
  Resource limits (current):
    coredumpsize-max infinity kB
    coredumpsize-cur        0 kB

coreのサイズの上限をなくするには以下のようにする。

  % eval `limits -e -c infinity`

もし、特定のコマンドのみ上限をなくする場合は以下のようにすることもできる。

  % limits -c infinty コマンド
