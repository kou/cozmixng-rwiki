= Ruby

Ruby関係の作業記録

== RWiki

=== CVS + cron

  RD_DIR=/usr/local/var/rwiki/rd
  CVSROOT=~rwiki/CVSREPOS
  DIFF_MAILTO="kou,suzuki"
  5 2 * * *       (cd $RD_DIR; ls | grep -v -e '^CVS$' | xargs cvs add --; cvs diff -u | /usr/local/bin/nkf | mail -s "RWiki diff" $DIFF_MAILTO; cvs ci -m "    * commit by rwiki using cron on `date`") 2>&1 /dev/null

=== RWikiのHEADを使おう

ToDoとかストーリーカードが使えるらしい。

==== インストール

  % cvs -d :pserver:anonymous@cvs.ruby-lang.org:/src login
  % cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/src co -d rwiki app/rwiki
  % cd rwiki
  # ruby install.rb

=== daemontoolsで動かそう

==== daemontoolsのインストール

  % sudo /usr/local/sbin/portupgrade -N daemontools
  % sudo mv /usr/local/etc/rc.d/svscan.sh.sample /usr/local/etc/rc.d/svscan.sh
  % suod mkdir -p /var/service

==== RWikiの準備

  (1) ((<rwiki.rbをdaemontoolsで動かすパッチ|URL:http://rwiki.jin.gr.jp/cgi-bin/rw-cgi.rb?cmd=view;name=rwiki.rb%A4%F2daemontools%A4%C7%C6%B0%A4%AB%A4%B9%A5%D1%A5%C3%A5%C1>))を参考にrwiki.rbを書き換える．

  (2) daemontools用のディレクトリ他を作る(rw-config.rb等で設定しているRDファイルを格納するディレクトリのパスなどは絶対パスに変換しておくこと)

        % sudo mkdir -p /var/service/rwiki/log/main
        % sudo /usr/sbin/chown rwiki:rwiki /var/service/rwiki/log/main

  (3) daemontools用のスクリプトを書いて((*実行権を付ける*))

      * /var/service/rwiki/run

          #!/bin/sh
          exec 2>&1
          export PATH=/usr/local/bin:/usr/bin:/bin
          exec setuidgid rwiki ruby -Ke -I/home/rwiki/site /home/rwiki/site/rwiki.rb

      * /var/service/rwiki/log/run

          #!/bin/sh
          exec setuidgid rwiki multilog t ./main

  (4) (daemontoolsを)実行

        % sudo /usr/local/etc/rc.d/svscan start

==== TIPS

  * 再起動するにはどうしたらいいの？

      % sudo svc -t /var/service/rwiki

  * rhtmlだけ再読み込みさせるにはどうしたらいいの？

      % sudo svc -h /var/service/rwiki

  * 終了させるにはどうしたらいいの？

      % sudo svc -d /var/service/rwiki

  * 起動させるにはどうしたらいいの？

      % sudo svc -u /var/service/rwiki

  * 起動状況はどうやって見るの？

      % sudo svstat /var/service/rwiki

  * ログはどうやって見るの？

      % sudo cat /var/service/rwiki/log/main/current | tai64nlocal | lv


== tDiary

テーマの更新．

  % cd /usr/local/share/tdiary
  % sudo cvs up
  % cd theme
  % sudo sh -c 'for x in *; do [ -L $x -a "" = "` echo $x | grep -e \"^\(hiki\|CVS$\)\"`" ] && rm $x; done'
  % sudo sh -c 'for x in ../theme2/*; do [ `basename $x` != "CVS" ] && ln -fs $x ./; done'

== 影舞

((<URL:http://www.daifukuya.com/kagemai/index.html>))

BTS

((<RAA:xmlscan>)) 1.xが必要．

=== インストール

  (1) ダウンロード

        % cd /usr/local/share
        % sudo cvs -d :pserver:anonymous@jump.daifukuya.com:/cvs login 
        % sudo cvs -z4 -d :pserver:anonymous@jump.daifukuya.com:/cvs co -P kagemai
      必要なら((<RAA:xmlscan>))の1.xを/usr/local/share/kagemai/lib/以下にコピーしておく


  (2) 設定

      影舞用のユーザkagemaiは使ってあるとする

        % sudo -u kagemai cp /usr/local/share/kagemai/html/* ~kagemai/public_html/
        % sudo -u kagemai ln /usr/local/share/kagemai/lib ~kagemai/ 
        % sudo -u kagemai ln /usr/local/share/kagemai/resource ~kagemai/
        % cd ~kagemai/public_html
        % sudo -u kagemai ln guest.cgi index.rb

      ~kagemai/public_html/guest.cgiの最初の方を以下のように変更

        work_dir = File.dirname(File.dirname(File.expand_path(__FILE__))).untaint # setup
        kagemai_root = work_dir # setup
        config_file  = "#{work_dir}/kagemai.conf" # setup

        $:.unshift("#{kagemai_root}/lib")

      以下のような~kagemai/public_html/.htaccessを作る

        <Files "*.conf*">
                deny from all
        </Files>

        AuthName      Kagemai
        AuthType      Basic
        AuthUserFile  /home/kagemai/.htpasswd

        <Files user.cgi>
                Require       valid-user
        </Files>
                                                                           
        <Files admin.cgi>
                Require       user hoge
        </Files>


      ((<URL:/~kagemai/>))にアクセスしてあとはCGI経由で設定

      メールのためにbin/mailif.rbの最初を以下のように変更


        work_dir = File.dirname(File.dirname(File.expand_path(__FILE__))).untaint # setup

        kagemai_root = work_dir # setup
        config_file  = "#{work_dir}/kagemai.conf" # setup

        $LOGFILE = "#{work_dir}/kagemai.log"  # setup

        $:.unshift("#{kagemai_root}/lib")

      最後の方も少し変更

        project_id = ARGV.shift.dup

      を

        project_id = ARGV.shift

      にして

        app = Kagemai::MailApp.new(project_id, Kagemai::Config[:language])

      を

        app = Kagemai::MailApp.new(project_id.dup.untaint, Kagemai::Config[:language])

      にする．

      メールの受け取りは((<Postfix>))のmain.cfに

        recipient_delimiter = +
        allow_mail_to_commands = alias,forward,include

      を設定して~kagemai/.forward+rssとかに

        ((':'))include:/usr/local/var/kagemai/projects/rss/include

      とかと書いておく．

=== MRTGの設定

/usr/local/share/kagemai/mrtg/mrtg.cfgを参考にして以下のような~kagemai/mrtg.cfgを作る

  ### Global Config Options
  
  ### Global Defaults

  HtmlDir: /home/kagemai/public_html/mrtg
  ImageDir: /home/kagemai/public_html/mrtg
  LogDir:   /usr/local/var/kagemai/mrtg
  IconDir: /mrtg/icons/
  Language: eucjp

  ## 影舞
  ## project = gallery
  Target[gallery]: `/usr/local/bin/w3m -dump 'http://www.cozmixng.org/~kagemai/guest.cgi?project=gallery&action=mrtg&t=2'`
  Title[gallery]: 累積レポート数/終了レポート数の推移 [gallery]
  PageTop[gallery]: <H1>累積レポート数/終了レポート数の推移 [gallery]</H1>
  PageFoot[gallery]: &nbsp; <hr><a href="/~kagemai/guest.cgi?project=gallery&action=top">戻る</a>
  Suppress[gallery]: y
  MaxBytes[gallery]: 10000
  Options[gallery]: gauge,nopercent,integer,nobanner,nolegend,noinfo,growright,dorelpercent
  YLegend[gallery]: Reports
  ShortLegend[gallery]: &nbsp;
  LegendI[gallery]: 終了レポート数: &nbsp;
  LegendO[gallery]: 累積レポート数: &nbsp;
