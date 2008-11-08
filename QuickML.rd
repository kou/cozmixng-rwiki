= QuickML

== インストール

  % sudo nice -20 /usr/local/sbin/portupgrade -NRr quickml

== 設定

/usr/local/etc/quickmlrc.sampleを基に/usr/local/etc/quickmlrcを作成．

最低限の変更点は以下の通り．portを10025にしなかったのは((<Postfix>))がもうすでに使っていたから．

  # _
  :port => 20025,
  :bind_address => "127.0.0.1",
  :smtp_host => 'localhost',
  :domain => 'ml.cozmixng.org',

後は，適当に．

=== Postfixが転送する設定

XXX@ml.cozmxing.org宛のメールと，XXX@YYY.ml.cozmixng.org宛のメールをQuickMLに転送するように，/usr/local/etc/postfix/transportに以下を追加．

  ml.cozmixng.org smtp:[127.0.0.1:20025]
  .ml.cozmixng.org smtp:[127.0.0.1:20025]

postmapを忘れずに．

  % sudo postmap /usr/local/etc/postfix/transport

再読み込みも忘れずに．

  % sudo env - /usr/local/etc/rc.d/postfix.sh reload

== 起動

/etc/rc.confに以下を追加

  quickml_enable="YES"

起動．

  % sudo env - /usr/local/etc/rc.d/quickml.sh start

== quickml-analog

QuickMLのログを読んでグラフ化してくれる．

出力用ディレクトリの作成．

  % sudo mkdir /usr/local/var/quickml-analog
  % sudo chown quickml:quickml /usr/local/var/quickml-analog

((<Apache>))で公開するように設定．/usr/local/etc/apache2/httpd.confに以下を追加．

  Alias /quickml /usr/local/var/quickml-analog

quickmlユーザのcrontabを編集してquickml-analogを定期的に動かすようにする．

  % sudo -u quickml crontab -l
  50 5 * * *      /usr/local/bin/quickml-analog -i -o /usr/local/var/quickml-analog /var/log/quickml.log

FreeBSDだとgnuplotの構文でエラーがでるのでパッチを当てておく．

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
