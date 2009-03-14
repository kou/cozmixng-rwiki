= Heimdal

フリーな（BSDライセンスな）Kerberosの実装。

ActiveLdapのテスト用に、SASL/GSSAPIで認証して((<slapd>))にアクセスするための設定。だから、安全かどうかはおいておく設定。

実運用ではこの設定をそのまま真似しないで、ちゃんと考えて設定すること。

== インストール

SASL/GSSAPI経由で使うのでlibsasl2-modules-gssapi-himdalもインストール。

  % sudo aptitude -V -D install libsasl2-modules-gssapi-heimdal heimdal-{kcm,kdc,clients,servers}

KDC（Key Distribution Center）とか管理サーバのホスト名を聞かれるのでlocalhostと指定する。

== 設定

LDAPサービス用のプリンシパルを作る。

  % sudo kadmin -l add ldap/`hostname -f`

LDAPサービス用の鍵を出力する。

  % sudo kadmin -l ext_keytab ldap/`hostname -f`

鍵は/etc/krb5.keytabに出力されるが、このファイルはslapdを実行しているユーザが読み取れなければいけない。とりあえず、これでお茶を濁す。

  % sudo chgrp openldap /etc/krb5.keytab
  % sudo chmod g+r /etc/krb5.keytab

ユーザ用のプリンシパルを作る。

  % sudo kadmin -l add `id -u -n`

この時点では接続できない事を確認。

  % ldapsearch -Y GSSAPI
  SASL/GSSAPI authentication started
  ldap_sasl_interactive_bind_s: Local error (-2)

チケットを初期化する。（kadmin -l addで設定したパスワードを入力）

  % kinit

初期化されていることを確認。

  % klist
  Credentials cache: FILE:/tmp/krb5cc_1000
          Principal: user@EXAMPLE.COM

    Issued           Expires          Principal
  Mar 14 15:56:35  Mar 15 01:56:35  krbtgt/EXMPLE.COM@EXAMPLE.COM

LDAPサーバに接続して認証できることを確認。

  % ldapsearch -Y GSSAPI
  SASL/GSSAPI authentication started
  SASL username: user@EXAMPLE.COM
  SASL SSF: 56
  SASL data security layer installed.
  # extended LDIF
  ...

チケットが増えていることを確認。

  % klist
  Credentials cache: FILE:/tmp/krb5cc_1000
          Principal: user@EXAMPLE.COM

    Issued           Expires          Principal
  Mar 14 15:56:35  Mar 15 01:56:35  krbtgt/EXAMPLE.COM@EXAMPLE.COM
  Mar 14 15:58:21  Mar 15 01:56:35  ldap/ldap-server.example.com@EXAMPLE.COM
