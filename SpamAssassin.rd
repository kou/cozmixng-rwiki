= SpamAssassin

���ѥ�ե��륿���������᡼��Υإå��ˤ�X-Spam-Flag: YES���Ĥ���

== ���󥹥ȡ���

  % sudo portupgrade -NRr p5-Mail-SpamAssassin

== ����

/usr/local/etc/mail/spamassassin/local.cf

((<AMaViS>))�Ȱ��˻Ȥ��Τ�����Ϥ��ʤ��Ƥ��ɤ��������Τ��ʡ�

== �ؽ�

���ѥ�:

  % sa-learn --spam ���ѥ�᡼�뤬����ǥ��쥯�ȥ�

�ϥ�:

  % sa-learn --ham �ϥ�᡼�뤬����ǥ��쥯�ȥ�

=== �Ŀͤǳؽ�

AMaViS�Ȱ��˻ȤäƤ������amavisd��Ʊ���桼���ʤ����Ǥ�vscan�桼���ˤ�ư���Ƥ���Τǡ��ؽ��ǡ����١�����~vscan/.spamassassin/�ʲ��ˤ��롥

�Ȥ������Ȥǡ�vscan�桼���Ȥ���ssh�Ǥ���褦�ˡ�~vscan/.ssh/authorized_keys�˼�ʬ�θ���������Ͽ���Ƥ�����

((<Mew>))���Ȱʲ��Τ褦�����ꤷ�Ƥ�����lc�ǥ��ѥ�᡼��ؽ���lh�ǥϥ�᡼��ؽ����Ǥ��롥

  # enscript elisp
  (setq mew-ham-prog "ssh")
  (setq mew-ham-prog-args '("vscan@�᡼�륵����" "sa-learn" "--ham"))
  (setq mew-spam-prog "ssh")
  (setq mew-spam-prog-args ("vscan@�᡼�륵����" "sa-learn" "--spam"))

mew-config-alist��ȤäƤ�����Ϥ�����

  # enscript elisp
  (setq mew-config-alist
        `(("����̾"
           ("ham-prog"       . "ssh")
           ("ham-prog-args"  . ("vscan@�᡼�륵����" "sa-learn" "--ham"))
           ("spam-prog"      . "ssh")
           ("spam-prog-args" . ("vscan@�᡼�륵����" "sa-learn" "--spam"))
           ...)
          ...))

=== �ߤ�ʤǳؽ�

�ƥ桼����IMAP�ǡ�spam�ס���ham�ץե������ʬ�ष���᡼���root���¤Ǽ������ơ�vscan�桼����sa-learn���롥

/etc/daily.local�˰ʲ����ɲá�������������Ȥ�����Ƭ��(('#!/bin/sh'))�Ƚ񤤤�chmod +x����Τ�˺�줺�ˡ�

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
