= QuickML

== ���󥹥ȡ���

  % sudo nice -20 /usr/local/sbin/portupgrade -NRr quickml

== ����

/usr/local/etc/quickmlrc.sample����/usr/local/etc/quickmlrc�������

����¤��ѹ����ϰʲ����̤ꡥport��10025�ˤ��ʤ��ä��Τ�((<Postfix>))���⤦���Ǥ˻ȤäƤ������顥

  # _
  :port => 20025,
  :bind_address => "127.0.0.1",
  :smtp_host => 'localhost',
  :domain => 'ml.cozmixng.org',

��ϡ�Ŭ���ˡ�

=== Postfix��ž����������

XXX@ml.cozmxing.org���Υ᡼��ȡ�XXX@YYY.ml.cozmixng.org���Υ᡼���QuickML��ž������褦�ˡ�/usr/local/etc/postfix/transport�˰ʲ����ɲá�

  ml.cozmixng.org smtp:[127.0.0.1:20025]
  .ml.cozmixng.org smtp:[127.0.0.1:20025]

postmap��˺�줺�ˡ�

  % sudo postmap /usr/local/etc/postfix/transport

���ɤ߹��ߤ�˺�줺�ˡ�

  % sudo env - /usr/local/etc/rc.d/postfix.sh reload

== ��ư

/etc/rc.conf�˰ʲ����ɲ�

  quickml_enable="YES"

��ư��

  % sudo env - /usr/local/etc/rc.d/quickml.sh start

== quickml-analog

QuickML�Υ����ɤ�ǥ���ղ����Ƥ���롥

�����ѥǥ��쥯�ȥ�κ�����

  % sudo mkdir /usr/local/var/quickml-analog
  % sudo chown quickml:quickml /usr/local/var/quickml-analog

((<Apache>))�Ǹ�������褦�����ꡥ/usr/local/etc/apache2/httpd.conf�˰ʲ����ɲá�

  Alias /quickml /usr/local/var/quickml-analog

quickml�桼����crontab���Խ�����quickml-analog�����Ū��ư�����褦�ˤ��롥

  % sudo -u quickml crontab -l
  50 5 * * *      /usr/local/bin/quickml-analog -i -o /usr/local/var/quickml-analog /var/log/quickml.log

FreeBSD����gnuplot�ι�ʸ�ǥ��顼���Ǥ�Τǥѥå������ƤƤ�����

  # enscript diffu
  --- /usr/ports/mail/quickml/work/quickml-0.7/quickml-analog     Fri Dec 10 12:41:57 2004
  +++ /usr/local/bin/quickml-analog       Fri Dec 10 12:32:50 2004
  @@ -400,12 +400,12 @@
       set timefmt "%y%m%d%H"
       set xdata time
       set size ratio 0.76
  -    set linestyle 1 linetype 1 linewidth 5
  -    set linestyle 2 linetype 3 linewidth 5
  -    set linestyle 3 linetype 2 linewidth 5
  -    set linestyle 4 linetype 4 linewidth 5
  -    set linestyle 5 linetype 5 linewidth 5
  -    set linestyle 6 linetype 7 linewidth 5
  +    set style line 1 linetype 1 linewidth 5
  +    set style line 2 linetype 3 linewidth 5
  +    set style line 3 linetype 2 linewidth 5
  +    set style line 4 linetype 4 linewidth 5
  +    set style line 5 linetype 5 linewidth 5
  +    set style line 6 linetype 7 linewidth 5
  
       '.gsub(/^    /, "")
     end
