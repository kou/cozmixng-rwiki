= Cyrus SASL

== ���󥹥ȡ���

  % sudo portupgrade -N cyrus-sasl

== ����

�����Ǥ�cyrus-sasl2�򥤥󥹥ȡ��뤷����ΤȤ��롥

�ʲ��Τ褦�����Ƥ�/usr/local/lib/sasl2/smtpd.conf�����

  pwcheck_method: sasldb

ǧ�ڥǡ����١��������

  % sudo saslpasswd2 -c -u `sudo postconf -h myhostname` kou
  % sudo chown postfix:postfix /usr/local/etc/sasldb2.db
