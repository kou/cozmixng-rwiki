= AMaViS

ウィルス/スパムチェッカ(のフロントエンド？)

== インストール

  % sudo portupgrade -NRr amavisd-new

== 設定

/usr/local/etc/amvisd.conf-distを/usr/local/etc/amavisd.confにコピーして編集

  $mydomain = 'cozmixng.org'

禁止するファイルは無い．

  $final_banned_destiny     = D_PASS;

スパムを勝手に拒否しない

  $final_spam_destiny       = D_PASS;

ウィルスチェック用の設定は((<ClamAV>))にある．

/etc/aliasesに必要そうなアドレスを追加

  virus-quarantine: root
  spam-quarantine: root
  virusalert: root
  spam.police: root

ただし，危険なメールが届くことがあるかもしれない．

変更を反映

  % sudo postalias /etc/aliases

/etc/rc.dに以下を追加

  amavisd_enable="YES"

/usr/local/etc/postfix/main.cfに以下を追加

  ## for amavisd-new
  content_filter = smtp-amavis:[127.0.0.1]:10024

/usr/local/etc/postfix/master.cfに以下を追加

  ## for amavisd-new
  smtp-amavis unix -      -       n       -       2  lmtp
     -o smtp_data_done_timeout=1200
     -o disable_dns_lookups=yes

  127.0.0.1:10025 inet n  -       n       -       -  smtpd
     -o content_filter=
     -o local_recipient_maps=
     -o smtpd_helo_restrictions=
     -o smtpd_client_restrictions=
     -o smtpd_sender_restrictions=
     -o smtpd_recipient_restrictions=permit_mynetworks,reject
     -o mynetworks=127.0.0.0/8

設定を再読み込み

  % sudo env - /usr/local/etc/rc.conf/postfix.sh reload

== クライアントの設定

((<Mew>))は4 > でSPAM対応だってさ． ;-<
