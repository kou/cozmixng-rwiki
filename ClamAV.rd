= ClamAV

フリーのアンチウイルスソフト

((<AMaViS>))または((<clamav-milter>))と一緒に使う。

== インストール

clamav-milterもインストールするため、/usr/local/etc/pkgtools.confのMAKE_ARGSに以下を追加する。

  'security/clamav' => 'WITH_MILTER=yes',

インストール。

  % sudo /usr/local/sbin/portupgrade -NRr clamav

== 設定

/usr/local/etc/clamav.conf

vscanユーザで実行するようにする．

  User vscan

ログファイルとかのvscanに所有者を変える．

  % sudo chown -R vscan:vscan /var/run/clamav
  % sudo touch /var/log/clamav/clamd.log
  % sudo chown -R vscan:vscan /var/log/clamav/clamd.log

/etc/rc.confに以下を追加

  clamav_clamd_enable="YES"
  clamav_freshclam_enable="YES"

起動

  % sudo env - /usr/local/etc/rc.d/clamav-clamd start
  % sudo env - /usr/local/etc/rc.d/clamav-freshclam start

=== AMaViSの設定

clamav-milterと使う場合は必要ない。

/usr/local/etc/amavisd.confのClamAVのところのコメントを外してソケットのアドレスを適当に変える．

  ### http://clamav.elektrapro.com/
  ['Clam Antivirus-clamd',
    \&ask_daemon, ["CONTSCAN {}\n", '/var/run/clamav/clamd.sock'],
    qr/\bOK$/, qr/\bFOUND$/,
    qr/^.*?: (?!Infected Archive)(.*) FOUND$/ ],
  # NOTE: run clamd under the same user as amavisd,
  # match the socket name in clamav.conf to the socket name in this entry

再起動

  % sudo env - /usr/local/etc/rc.d/amavisd restart
