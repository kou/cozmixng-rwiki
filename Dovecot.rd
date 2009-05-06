= Dovecot

PostfixのSASL認証サーバにもなれるPOP3/IMAP4サーバ。

((<Courier-IMAP>))から乗り換え。

== インストール

  % sudo /usr/local/sbin/portupgrade -NRr dovecot dovecot-sieve dovecot-managesieve

== 設定

設定ファイルは/usr/local/etc/dovecot.conf。

以下、変更点。

=== SSL/TLS

Courier-IMAP用に作った証明書を使う。Courier-IMAPでは鍵と証明書は同じファイルにいれなきゃいけないけど、Dovecotでは別々にできる。

  ssl_cert_file = /usr/local/etc/dovecot/dovecot.crt
  ssl_key_file = /usr/local/etc/dovecot/dovecot.key

SSL/TLSまたはローカルからの接続以外の時は平文で認証できないようにする。

  disable_plaintext_auth = yes

=== Maildir

メールボックスはMaildirにする。

  mail_location = maildir:~/Maildir

=== LDA

postmasterのアドレスを指定する。

  protocol lda {
    postmaster_address = postmaster@cozmixng.org
    ...
  }

=== UNIXアカウントがない人用の設定

UNIXアカウントがある人はPAMを使って、ない人は/etc/passwdと同じパスワードデータベースを使う。PAMの設定は最初から書いてあるので、ない人用の設定だけ追加。

  auth default {
    ...
    passdb passwd-file {
      args = /usr/local/etc/dovecot/dovecot.password
    }

    userdb passwd-file {
      args = /usr/local/etc/dovecot/dovecot.password
    }
    ...
  }

パスワードデータベースはこんな感じになる。

  user1:{CRAM-MD5}11111...:10000:10000::/home/mailuser/cozmixng.org/user1::
  user2:{CRAM-MD5}22222...:10000:10000::/home/mailuser/cozmixng.org/user2::

この例ではパスワードはCRAM-MD5形式だけど、MD5とかSHAとかも使える。そのときはhtpasswdを使って作成することもできる。

=== PostfixにSASL認証機能を提供

  auth default {
    ...
    socket listen {
      path = /var/spool/postfix/private/auth
      mode = 0660
      user = postfix
      group = postfix
    }
    ...
  }

((<Postfix>))側にも設定が必要。

=== INBOX.

Courier-IMAPと同じく、プライベートメールボックスのネームスペースをINBOX.とする。（この説明が正しいかどうかはわからない。）

  namespace private {
    prefix = INBOX.
    inbox = yes
  }
