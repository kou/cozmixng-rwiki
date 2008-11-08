= CVSup

== ミラーする

  % sudo /usr/local/sbin/portupgrade -NRr cvsup-mirror

はじめにいろいろ聞かれるので答えていく．

   Master site for your updates [cvsup-master.freebsd.org]?

fastest_cvsupとかでよさげなところを調べてそれを指定すれば良い．

  % fastest_cvsup -c JP

あとは，((<CVSup サーバの負荷状況|URL:http://home.jp.freebsd.org/stats/mrtg/cvsup/>))も参考に．

  How many hours between updates of your files [1]?

別に1時間毎にアップデートする必要はないので，24（1日毎）とか指定しておく．


今回はソースコードのリポジトリだけミラーするつもりなので，

  Do you wish to mirror the main source repository [y]?

だけyにして，残りの

  Do you wish to mirror the installed World Wide Web data [y]?
  Do you wish to mirror the GNATS bug tracking database [y]?
  Do you wish to mirror the mailing list archive [y]?

はnにしておく．

残りの質問はデフォルトでよいだろう．

アップデートはcronで行われる．cronが実行されるまで最初の実験を待ちきれないときは手動でアップデートすればよい．

  % sudo env - /usr/local/etc/cvsup/update.sh

あと，cvsupdが動いていることも確認．念のためstartしておけばよいだろう．

  % sudo env - /usr/local/etc/rc.d/cvsupd.sh start
