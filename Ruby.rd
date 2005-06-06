= Ruby

Ruby�ط��κ�ȵ�Ͽ

== RWiki

=== CVS + cron

  RD_DIR=/usr/local/var/rwiki/rd
  CVSROOT=~rwiki/CVSREPOS
  DIFF_MAILTO="kou,suzuki"
  5 2 * * *       (cd $RD_DIR; ls | grep -v -e '^CVS$' | xargs cvs add --; cvs diff -u | /usr/local/bin/nkf | mail -s "RWiki diff" $DIFF_MAILTO; cvs ci -m "    * commit by rwiki using cron on `date`") 2>&1 /dev/null

=== RWiki��HEAD��Ȥ���

ToDo�Ȥ����ȡ��꡼�����ɤ��Ȥ���餷����

==== ���󥹥ȡ���

  % cvs -d :pserver:anonymous@cvs.ruby-lang.org:/src login
  % cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/src co -d rwiki app/rwiki
  % cd rwiki
  # ruby install.rb

=== daemontools��ư������

==== daemontools�Υ��󥹥ȡ���

  % sudo /usr/local/sbin/portupgrade -N daemontools
  % sudo mv /usr/local/etc/rc.d/svscan.sh.sample /usr/local/etc/rc.d/svscan.sh
  % suod mkdir -p /var/service

==== RWiki�ν���

  (1) ((<rwiki.rb��daemontools��ư�����ѥå�|URL:http://rwiki.jin.gr.jp/cgi-bin/rw-cgi.rb?cmd=view;name=rwiki.rb%A4%F2daemontools%A4%C7%C6%B0%A4%AB%A4%B9%A5%D1%A5%C3%A5%C1>))�򻲹ͤ�rwiki.rb��񤭴����롥

  (2) daemontools�ѤΥǥ��쥯�ȥ�¾����(rw-config.rb�������ꤷ�Ƥ���RD�ե�������Ǽ����ǥ��쥯�ȥ�Υѥ��ʤɤ����Хѥ����Ѵ����Ƥ�������)

        % sudo mkdir -p /var/service/rwiki/log/main
        % sudo /usr/sbin/chown rwiki:rwiki /var/service/rwiki/log/main

  (3) daemontools�ѤΥ�����ץȤ�񤤤�((*�¹Ը����դ���*))

      * /var/service/rwiki/run

          #!/bin/sh
          exec 2>&1
          export PATH=/usr/local/bin:/usr/bin:/bin
          exec setuidgid rwiki ruby -Ke -I/home/rwiki/site /home/rwiki/site/rwiki.rb

      * /var/service/rwiki/log/run

          #!/bin/sh
          exec setuidgid rwiki multilog t ./main

  (4) (daemontools��)�¹�

        % sudo /usr/local/etc/rc.d/svscan start

==== TIPS

  * �Ƶ�ư����ˤϤɤ������餤���Ρ�

      % sudo svc -t /var/service/rwiki

  * rhtml�������ɤ߹��ߤ�����ˤϤɤ������餤���Ρ�

      % sudo svc -h /var/service/rwiki

  * ��λ������ˤϤɤ������餤���Ρ�

      % sudo svc -d /var/service/rwiki

  * ��ư������ˤϤɤ������餤���Ρ�

      % sudo svc -u /var/service/rwiki

  * ��ư�����Ϥɤ���äƸ���Ρ�

      % sudo svstat /var/service/rwiki

  * ���Ϥɤ���äƸ���Ρ�

      % sudo cat /var/service/rwiki/log/main/current | tai64nlocal | lv


== tDiary

�ơ��ޤι�����

  % cd /usr/local/share/tdiary
  % sudo cvs up
  % cd theme
  % sudo sh -c 'for x in *; do [ -L $x -a "" = "` echo $x | grep -e \"^\(hiki\|CVS$\)\"`" ] && rm $x; done'
  % sudo sh -c 'for x in ../theme2/*; do [ `basename $x` != "CVS" ] && ln -fs $x ./; done'

== ����

((<URL:http://www.daifukuya.com/kagemai/index.html>))

BTS

((<RAA:xmlscan>)) 1.x��ɬ�ס�

=== ���󥹥ȡ���

  (1) ���������

        % cd /usr/local/share
        % sudo cvs -d :pserver:anonymous@jump.daifukuya.com:/cvs login 
        % sudo cvs -z4 -d :pserver:anonymous@jump.daifukuya.com:/cvs co -P kagemai
      ɬ�פʤ�((<RAA:xmlscan>))��1.x��/usr/local/share/kagemai/lib/�ʲ��˥��ԡ����Ƥ���


  (2) ����

      �����ѤΥ桼��kagemai�ϻȤäƤ���Ȥ���

        % sudo -u kagemai cp /usr/local/share/kagemai/html/* ~kagemai/public_html/
        % sudo -u kagemai ln /usr/local/share/kagemai/lib ~kagemai/ 
        % sudo -u kagemai ln /usr/local/share/kagemai/resource ~kagemai/
        % cd ~kagemai/public_html
        % sudo -u kagemai ln guest.cgi index.rb

      ~kagemai/public_html/guest.cgi�κǽ������ʲ��Τ褦���ѹ�

        work_dir = File.dirname(File.dirname(File.expand_path(__FILE__))).untaint # setup
        kagemai_root = work_dir # setup
        config_file  = "#{work_dir}/kagemai.conf" # setup

        $:.unshift("#{kagemai_root}/lib")

      �ʲ��Τ褦��~kagemai/public_html/.htaccess����

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


      ((<URL:/~kagemai/>))�˥����������Ƥ��Ȥ�CGI��ͳ������

      �᡼��Τ����bin/mailif.rb�κǽ��ʲ��Τ褦���ѹ�


        work_dir = File.dirname(File.dirname(File.expand_path(__FILE__))).untaint # setup

        kagemai_root = work_dir # setup
        config_file  = "#{work_dir}/kagemai.conf" # setup

        $LOGFILE = "#{work_dir}/kagemai.log"  # setup

        $:.unshift("#{kagemai_root}/lib")

      �Ǹ�����⾯���ѹ�

        project_id = ARGV.shift.dup

      ��

        project_id = ARGV.shift

      �ˤ���

        app = Kagemai::MailApp.new(project_id, Kagemai::Config[:language])

      ��

        app = Kagemai::MailApp.new(project_id.dup.untaint, Kagemai::Config[:language])

      �ˤ��롥

      �᡼��μ�������((<Postfix>))��main.cf��

        recipient_delimiter = +
        allow_mail_to_commands = alias,forward,include

      �����ꤷ��~kagemai/.forward+rss�Ȥ���

        ((':'))include:/usr/local/var/kagemai/projects/rss/include

      �Ȥ��Ƚ񤤤Ƥ�����

=== MRTG������

/usr/local/share/kagemai/mrtg/mrtg.cfg�򻲹ͤˤ��ưʲ��Τ褦��~kagemai/mrtg.cfg����

  ### Global Config Options
  
  ### Global Defaults

  HtmlDir: /home/kagemai/public_html/mrtg
  ImageDir: /home/kagemai/public_html/mrtg
  LogDir:   /usr/local/var/kagemai/mrtg
  IconDir: /mrtg/icons/
  Language: eucjp

  ## ����
  ## project = gallery
  Target[gallery]: `/usr/local/bin/w3m -dump 'http://www.cozmixng.org/~kagemai/guest.cgi?project=gallery&action=mrtg&t=2'`
  Title[gallery]: ���ѥ�ݡ��ȿ�/��λ��ݡ��ȿ��ο�� [gallery]
  PageTop[gallery]: <H1>���ѥ�ݡ��ȿ�/��λ��ݡ��ȿ��ο�� [gallery]</H1>
  PageFoot[gallery]: &nbsp; <hr><a href="/~kagemai/guest.cgi?project=gallery&action=top">���</a>
  Suppress[gallery]: y
  MaxBytes[gallery]: 10000
  Options[gallery]: gauge,nopercent,integer,nobanner,nolegend,noinfo,growright,dorelpercent
  YLegend[gallery]: Reports
  ShortLegend[gallery]: &nbsp;
  LegendI[gallery]: ��λ��ݡ��ȿ�: &nbsp;
  LegendO[gallery]: ���ѥ�ݡ��ȿ�: &nbsp;
