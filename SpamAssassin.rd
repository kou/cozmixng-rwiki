= SpamAssassin

スパムフィルタ．怪しいメールのヘッダにはX-Spam-Flag: YESがつく．

== インストール

  % sudo portupgrade -NRr p5-Mail-SpamAssassin

== 設定

/usr/local/etc/mail/spamassassin/local.cf

((<AMaViS>))と一緒に使うので設定はしなくても良い．．．のかな？

== 学習

スパム:

  % sa-learn --spam スパムメールがあるディレクトリ

ハム:

  % sa-learn --ham ハムメールがあるディレクトリ

=== 個人で学習

AMaViSと一緒に使っている場合はamavisdと同じユーザ（ここではvscanユーザ）で動いているので，学習データベースは~vscan/.spamassassin/以下にある．

ということで，vscanユーザとしてsshできるように，~vscan/.ssh/authorized_keysに自分の公開鍵を登録しておく．

((<Mew>))だと以下のように設定しておくとlcでスパムメール学習，lhでハムメール学習ができる．

  # enscript elisp
  (setq mew-ham-prog "ssh")
  (setq mew-ham-prog-args '("vscan@メールサーバ" "sa-learn" "--ham"))
  (setq mew-spam-prog "ssh")
  (setq mew-spam-prog-args ("vscan@メールサーバ" "sa-learn" "--spam"))

mew-config-alistを使っている場合はこう．

  # enscript elisp
  (setq mew-config-alist
        `(("設定名"
           ("ham-prog"       . "ssh")
           ("ham-prog-args"  . ("vscan@メールサーバ" "sa-learn" "--ham"))
           ("spam-prog"      . "ssh")
           ("spam-prog-args" . ("vscan@メールサーバ" "sa-learn" "--spam"))
           ...)
          ...))

=== みんなで学習

各ユーザがIMAPで「spam」，「ham」フォルダに分類したメールをroot権限で収集して，vscanユーザでsa-learnする．

/etc/daily.localに以下を追加．新規作成するときは先頭に(('#!/bin/sh'))と書いてchmod +xするのを忘れずに．

  # enscript sh
  # For spam filter
  sa_base=/tmp/sa
  spam="$sa_base/spam"
  ham="$sa_base/ham"
  mkdir -p $spam $ham
  chmod -R 700 $sa_base

  for Maildir in /home/*/Maildir
  do
    user_spam="$Maildir/.spam/cur"
    user_ham="$Maildir/.ham/cur"
    if [ -d $user_spam ]; then
      cp $user_spam/* $spam
    fi
    if [ -d $user_ham ]; then
      cp $user_ham/* $ham
    fi
    chmod -R 700 $sa_base
  done

  /usr/sbin/chown -R vscan:vscan $sa_base
  /usr/local/bin/sudo -H -u vscan /usr/local/bin/sa-learn --spam $spam
  /usr/local/bin/sudo -H -u vscan /usr/local/bin/sa-learn --ham $ham

  rm -rf $sa_base
