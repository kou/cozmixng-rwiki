= Qpopper

Qpopper関係の作業記録

== インストール

((<DRAC>))もついでにインストール．WITH_POSTFIX=yesはDRACのため．

  % sudo /usr/local/sbin/portupgrade -m "WITH_DRAC=yes WITH_POSTFIX=yes" -N qpopper

== 基本的な設定

=== xinetdで起動するようにする．

インストールは

  % sudo /usr/local/sbin/portupgrade -N xinetd


inetdを止めるので，/etc/rc.confに以下を追加

  inetd_enable="NO"

設定ファイルは/usr/local/etc/xinetd.conf

  service pop3
  {
          disable         = no
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = root
          server          = /usr/local/libexec/qpopper
          server_args     = -s -p 1
  }

  service pop3s
  {
          disable         = no
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = root
          server          = /usr/local/libexec/qpopper
          server_args     = -s -f /usr/local/etc/qpopper/config
  }

/usr/local/etc/qpopper/configは以下のような感じ

  set clear-text-password = tls
  set tls-support = alternate-port
  set tls-server-cert-file = /usr/local/etc/qpopper/certs/cert.pem

証明署の作り方は以下のような感じ

  (1) まず，リクエスト用を作る．もし，/usr/local/openssl/openssl.cnfが無かったら，/usr/local/openssl/openssl.cnf.sampleをコピーしておく．

	 % sudo mkdir -p -m660 /usr/local/etc/qpopper/certs
	 % sudo chown root:mail /usr/local/etc/qpopper/certs
	 % sudo openssl req -new -nodes -out req.pem -keyout /usr/local/etc/qpopper/certs/cert.pem
	 % sudo chmod 600 /usr/local/etc/qpopper/certs/cert.pem
	 % sudo chown root:0 /usr/local/etc/qpopper/certs/cert.pem

  (1)  自家製認証局を作る

	 % sudo openssl genrsa -des3 -out ca.key 1024
	 % sudo openssl req -new -x509 -days 365 -key ca.key -out ca.crt
	 % sudo openssl x509 -req -CA ca.crt -CAkey ca.key -days 365 -in req.pem -out signed-req.pem -CAcreateserial

  (1) 自分で認証する

	 # cat signed-req.pem >> /usr/local/etc/qpopper/certs/cert.pem

  (1) /usr/local/etc/qpopper/certs/ca.crtは公開した方がいいのかな？

この設定だと，生のパスワードは一切受理しません．APOPまたはPOP over SSL/TLSを使ってください。

==== メモ

Mewだと，APOPはうまくいくけど，SSLはうまくいかない．とりあえず，

  (setq mew-prog-ssl "/usr/sbin/stunnel")

とか，

  (setq mew-config-alist
     ...
         ("pop-ssl"       . 't)
     ...)

とか書いておくと，SSLを使おうとするけど，うまくいっていないみたい．．．2003-04-19

あとで，((<URL:http://acorn.zive.net/~oyaji/>))を見ておこう．2003-04-19
  
=== 認証用データベースを初期化

  % sudo -u pop qpopauth -init

== ユーザ追加

  % sudo -u pop qpopauth -user kou

