= �ȥ�ե��å�

�ȥ�ե��å��ط��κ�ȵ�Ͽ�Ǥ���

== MRTG

((<����|URL:/mrtg/>))��ư���Ƥ��롥

����ե������������ˡ(���community�Ϥդ��Ƥ�����)

  % cfgmaker --global "WorkDir: /usr/local/var/www/data/mrtg" \
      --global "Language: eucjp" \
      --global "IconDir: /mrtg/icons/" \
      --global "Options[_]: growright, gauge" \
      --global "LoadMIBs: /usr/local/share/snmp/mibs/UCD-SNMP-MIB.txt" \
      HOGE@www1.cozmixng.org \
      HOGE@pub.cozmixng.org \
      HOGE@streaming.cozmixng.org \
      HOGE@160.29.167.2 > ~/mrtg.cfg

LoadMIBs������Ƥ����ȡ�.1.3.6.1.4.1.2021.10.1.5.1����ʤ���laLoadInt.1�Ƚ񤯤��Ȥ��Ǥ���褦�ˤʤ롥

����ե������/usr/local/var/www/mrtg.cfg���֤���mrtg����������HTML���֤��ǥ��쥯�ȥ��/usr/local/var/www/data/mrtg/�Ȥ��롥

  % sudo cp ~/mrtg.cfg /usr/local/var/www/mrtg.cfg
  % sudo crontab -u www -e

  */5 * * * * (cd /usr/local/bin; ./mrtg /usr/local/var/www/mrtg.cfg)
  */5 * * * * (cd /usr/local/bin; ./indexmaker --columns=2 --output=/usr/local/var/www/data/mrtg/index.html /usr/local/var/www/mrtg.cfg)

  % cd /usr/local/var/www/data/mrtg
  % sudo ln -s /usr/local/share/mrtg/ icons

mrtg�Ȥ�indexmaker�ε�ư��

  /usr/local/bin/mrtg ...

�Ȥ��ˤ�����

  (cd /usr/local/bin; ./mrtg ...)

�ˤ��Ƥ���Τϡ����Ԥ���perl��FindBin�����ޤ�ư���ʤ����顥

���֤�www�桼����crontab���������ʤ���Ȼפ����Ǥ�ʤ�ǡ�HOME��/nonexistent���������ʤΤ���SHELL��/usr/sbin/nologin�����顩

== Analog

  * Analog��((<�Ź����|URL:/analog/>))�ߤޤ����� - ((<kou>))

  * ����ե������/usr/local/etc/analog.cfg

  * ��ܤ����Ȥ���Ϥ�����ؤ�
      FILEEXCLUDE "/~*"
      FILEEXCLUDE "/analog/*"
      LANGUAGE JAPANESE-UTF
      SEARCHCHARCONVERT ON
      SEARCHQUERYFLOOR 1r
      REQCHART ON
      ALLCHART ON
      STYLESHEET /cozmixng.css
      REQUEST ON
      ORGANISATION ON
      DOMAIN ON
      REFERRER ON
      REFFLOOR 1r
      REFREPEXCLUDE http://*cozmixng.org/*
      REFREPEXCLUDE https://*cozmixng.org/*
      REFREPEXCLUDE http://cozmixng.sgk.iwate-u.ac.jp/*
      REFREPEXCLUDE https://cozmixng.sgk.iwate-u.ac.jp/*
      REFREPEXCLUDE http://160.29.167.*/*
      REFREPEXCLUDE https://160.29.167.*/*
      SEARCHWORD ON
      STATUS OFF
      DNSFILE /usr/local/etc/dnscache
      DNSLOCKFILE /usr/tmp/dnslock
      DNS WRITE

  * cron��ư����
      10 5 * * *     /usr/local/bin/analog

  * �Ŀͤ�Analog����������~/local/etc/analog.cfg���Ȥ���̾���μ�ʬ�Ѥ�����ե��������ʲ��Τ褦�˼¹Ԥ��Ʋ�������
      % analog -g~/local/etc/analog.cfg

  * �ʲ���~/local/etc/analog.cfg����Ǥ���
      OUTFILE /home/kou/public_html/analog/index.html
      FILEEXCLUDE *
      FILEINCLUDE /~kou/*
      FILEEXCLUDE /~kou/analog/*
      DNS READ

  * ���Ȱʲ��Τ褦��Analog�����Ϥ���HTML�ե����뤬����ǥ��쥯�ȥ�(�����Ǥ�~kou/public_html/analog/)�˰ʲ��Τ褦��.htaccess��Ź���Ǥ����ȹ����ˤʤ�뤫�⤷��ޤ���(/analog/�ˤ�Ź���Ǥ���)��
      AddDefaultCharset UTF-8
