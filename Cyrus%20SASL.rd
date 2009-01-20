= Cyrus SASL

== インストール

  % sudo /usr/local/sbin/portupgrade -NRr cyrus-sasl2

== 設定

以下のような内容の/usr/local/lib/sasl2/smtpd.confを作成。（今は自動でできる？こんな内容の設定を書いた記憶がない。。。）

  pwcheck_method: auxprop
  auxprop_plugin: sasldb
  mech_list: PLAIN LOGIN CRAM-MD5 DIGEST-MD5

SMTPSで接続するので平文も許可。

認証データベースを作成

  % sudo saslpasswd2 -c -u `sudo postconf -h mydomain` kou
  % sudo chown postfix:postfix /usr/local/etc/sasldb2.db

mydomainの部分はPostfixのsmtpd_sasl_local_domainで指定したやつに合わせる．
