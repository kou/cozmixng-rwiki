= トラフィック

トラフィック関係の作業記録です。

== MRTG

((<ここ|URL:/mrtg/>))で動いている．

設定ファイルの生成方法(一応communityはふせておこう)

  % cfgmaker --global "WorkDir: /usr/local/var/www/data/mrtg" \
      --global "Language: eucjp" \
      --global "IconDir: /mrtg/icons/" \
      --global "Options[_]: growright, gauge" \
      --global "LoadMIBs: /usr/local/share/snmp/mibs/UCD-SNMP-MIB.txt" \
      HOGE@www1.cozmixng.org \
      HOGE@pub.cozmixng.org \
      HOGE@streaming.cozmixng.org \
      HOGE@160.29.167.2 > ~/mrtg.cfg

LoadMIBsを入れておくと，.1.3.6.1.4.1.2021.10.1.5.1じゃなくてlaLoadInt.1と書くことができるようになる．

設定ファイルを/usr/local/var/www/mrtg.cfgに置き，mrtgで生成したHTMLを置くディレクトリは/usr/local/var/www/data/mrtg/とする．

  % sudo cp ~/mrtg.cfg /usr/local/var/www/mrtg.cfg
  % sudo crontab -u www -e

  */5 * * * * (cd /usr/local/bin; ./mrtg /usr/local/var/www/mrtg.cfg)
  */5 * * * * (cd /usr/local/bin; ./indexmaker --columns=2 --output=/usr/local/var/www/data/mrtg/index.html /usr/local/var/www/mrtg.cfg)

  % cd /usr/local/var/www/data/mrtg
  % sudo ln -s /usr/local/share/mrtg/ icons

mrtgとかindexmakerの起動を

  /usr/local/bin/mrtg ...

とかにせずに

  (cd /usr/local/bin; ./mrtg ...)

にしているのは，前者だとperlのFindBinがうまく動かないから．

たぶん，wwwユーザのcrontabだからダメなんだと思う．でもなんで？HOMEが/nonexistentだからダメなのか？SHELLが/usr/sbin/nologinだから？

== Analog

  * Analogを((<仕込んで|URL:/analog/>))みました。 - ((<kou>))

  * 設定ファイルは/usr/local/etc/analog.cfg

  * めぼしいところはここらへん
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

  * cronで動かす
      10 5 * * *     /usr/local/bin/analog

  * 個人でAnalogしたい場合は~/local/etc/analog.cfg等という名前の自分用の設定ファイルを作り以下のように実行して下さい。
      % analog -g~/local/etc/analog.cfg

  * 以下は~/local/etc/analog.cfgの例です。
      OUTFILE /home/kou/public_html/analog/index.html
      FILEEXCLUDE *
      FILEINCLUDE /~kou/*
      FILEEXCLUDE /~kou/analog/*
      DNS READ

  * あと以下のようなAnalogが出力するHTMLファイルがあるディレクトリ(上の例では~kou/public_html/analog/)に以下のような.htaccessを仕込んでおくと幸せになれるかもしれません(/analog/にも仕込んである)。
      AddDefaultCharset UTF-8
