= Cyrus SASL

== インストール

  % sudo portupgrade -N cyrus-sasl

== 設定

ここではcyrus-sasl2をインストールしたものとする．

以下のような内容の/usr/local/lib/sasl2/smtpd.confを作成

  pwcheck_method: sasldb

認証データベースを作成

  % sudo saslpasswd2 -c -u `sudo postconf -h myhostname` kou
  % sudo chown postfix:postfix /usr/local/etc/sasldb2.db
