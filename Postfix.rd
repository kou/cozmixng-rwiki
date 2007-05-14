= Postfix

Postfix�ط��κ�ȵ�Ͽ

������Ѥ�ƥ��Ȥ��Ƥ����ڡ���((<Mail relay testing|URL:http://www.abuse.net/relay.html>))

== ���󥹥ȡ���

SMTP AUTH�򤹤뤿���SASL v2��Ȥ���褦�ˤ��Ƥ������ʤΤ�cyrus-sasl2�򥤥󥹥ȡ��뤷�Ƥ�����

  % sudo portupgrade -N cyrus-sasl

== ����Ū������

�ե������/usr/local/etc/postfix/main.cf

=== @�ʲ��ˤϥǥե���Ȥǥɥᥤ��̾���դ���

  myorigin = $mydomain

=== ����������

  mydestination = $myhostname, localhost.$mydomain, $mydomain, mail.$mydomain

=== ���ݤ����Ȥ��Υ쥹�ݥ󥹥����ɤ����

550�ϥ᡼�����ݤ������Ȥ򼨤���

450�ϸ�����äƤͤȤ������Ȥ򼨤���

  unknown_local_recipient_reject_code = 550

=== ���Ѥ���ۥ��Ȥ����

��ʬ�ΤȤ���������Ѥ��롥

  mynetworks_style = host

=== /etc/aliases�򹹿�

  % sudo postalias /etc/aliases

== IPv6�����Ѥ���

inet_protocols�����Ѥ���IP�μ������ꤹ�롥

�ʲ��Τ褦�ˤ��Ƥ��������Ѳ�ǽ�ʤ��IPv4��IPv6�����Ѥ��롥

  inet_protocols = all

IPv4�������Ѥ��������ϰʲ��Τ褦�˽񤯡�

  inet_protocols = ipv4

IPv6�������Ѥ��������ϰʲ��Τ褦�˽񤯡�

  inet_protocols = ipv6

ξ��ͭ���ˤ��������ϰʲ��Τ褦�˽񤯡�

  inet_protocols = ipv4, ipv6

== (A)POP before SMTP������

((<Qpopper>))��ȤäƤ����Ȥ��Ϥ����ȤäƤ������ʤ��ʤ�Qpopper��((<DRAC>))��Ȥ������顥

hash�Ȥ�dbm����ʤ���btree���ä���

  smtpd_recipient_restrictions =
          permit_mynetworks
          permit_auth_destination
          check_client_access btree:/usr/local/etc/dracd
          reject_unauth_destination
          reject

mynetworks��DRAC��ǧ�ڤ����ۥ��Ȥ��ɲä��롥

  mynetworks = 127.0.0.0/8, btree:/usr/local/etc/dracd

IPv6��ͭ���ˤ������ϡ�[[::1]]���ɲä��Ƥ����Ȥ褤��

  mynetworks = 127.0.0.0/8, [[::1]], btree:/usr/local/etc/dracd

== SMTP AUTH������

((<Courier-IMAP>))��((<DRAC>))��Ȥ��ʤ��Τ�SMTP AUTH�ˤ��롥

�����Ǥ�((<Cyrus SASL>))��Ȥ���

SASL�ˤ��ǧ�ڤ�ͭ���ˤ���

  smtpd_sasl_auth_enable = yes

SASL�ѤΥɥᥤ�������

  smtpd_sasl_local_domain = $mydomain

ƿ̾�ˤ��ǧ�ڡ�ʿʸ�ˤ��ǧ�ڤ���Ĥ��ʤ�

  smtpd_sasl_security_options = noanonymous, noplaintext

����Outlook�Τ���˰ʲ��Τ褦�ˤ��Ƥ�����

  smtpd_sasl_security_options = noanonymous
  broken_sasl_auth_clients = yes

STARTTLS��Ȥ���褦�ˤ���(Mew���ȻȤ��ʤ�)����̩���Ⱦ������(((<Apache>))�λ���Ʊ���褦��)��ä���

  smtpd_tls_cert_file = /usr/local/etc/postfix/certs/smtpd.pem
  smtpd_tls_key_file = /usr/local/etc/postfix/certs/smtpd.key
  smtpd_use_tls = yes 
  smtpd_tls_session_cache_database = sdbm:/usr/local/etc/postfix/smtpd_scache

����å����ѤΥե��������

  % sudo touch /usr/local/etc/postfix/smtpd_scache.{dir,pag}

SMTP AUTH�������������饤����Ȥϵ��Ĥ���(permit_sasl_authenticated���ɲ�)��

  smtpd_recipient_restrictions =
        permit_mynetworks
        permit_sasl_authenticated
        permit_auth_destination
        check_client_access btree:/usr/local/etc/dracd
        reject_unauth_destination
        reject

==== ���饤����Ȥ�����

Mew�ʤ�

  (setq mew-config-alist
   ...
       ("smtp-user"     . "kou")
   ...)

�Ȥ��񤤤Ƥ�������SMTP AUTH����褦�ˤʤ롥

== ž��������

  (1) ž�����relay_domains�˲ä��Ƥ�����

        relay_domains = transport.$mydomain

  (2) transport_maps��ž�����륢�ɥ쥹��ž������б���񤤤��ե��������ꤹ��(.db�ϤĤ��ʤ�)��

        transport_maps = hash:/usr/local/etc/postfix/transport

  (3) transport_maps�ǻ��ꤷ���ե�������б��ط���񤯡�

        hoge@transport.example.com smtp:[transport.example.com]
        .transport.example.com smtp:transport.example.com
      
      ���ڡ����κ�¦��ž������᡼�륢�ɥ쥹�ޤ��ϥɥᥤ��Ǳ�¦��ž����ˤʤ롣

      ��������ȡ�hoge@transport.example.com���ƤΥ᡼���transport.example.com��SMTP��ž������(ž����Υۥ���̾��[]�ǰϤޤ�Ƥ����MX�쥳���ɤ�����ʤ�)���ɥᥤ��κǸ夬.transport.example.com���ƤΥ᡼���transport.example.com��MX�쥳���ɤǻ��ꤵ�줿�ۥ��Ȥ�SMTP��ž������롣

      ����Υ桼�����ƤΥ᡼���ž���򤹤�Ȥ�(��¦��hoge@transport.example.com�Ƚ񤫤�Ƥ���Ȥ�)�ϡ��ʲ��Τ��Ȥ���դ��ʤ���Ф����ʤ��褦����

        * ž���襵���Ф�mydestination�˴ޤޤ�Ƥ���ʤ�С�ž���������Ф����Υ桼���Υ᡼�������������ˤʤäƤ��ʤ���Ф����ʤ���

      �ʤΤǡ��⤷��ž���������Ф˥桼��(�����Ǥ�hoge)�����ʤ��Ȥ���/etc/aliases��ʲ��Τ褦���Խ�����ʤɤ��Ƽ�������褦�ˤ��Ƥ���ɬ�פ�����(�Ȼפ�)���Ȥ�������mydestination�ˤ��줺��relay_domain�ˤ����Ф�����

        hoge: root

  (4) ��®�˸����Ǥ���褦�ˤ��뤿��˥ǡ����١��������롣

        % sudo /usr/local/sbin/postmap /usr/local/etc/postfix/transport

  (5) �����ȿ�Ǥ�����

        % sudo /usr/local/sbin/postfix reload

== �С������ɥᥤ�������

(1) main.cf�˰ʲ����ɲ�

      virtual_maps = hash:/usr/local/etc/postfix/vmaps
      virtual_mailbox_base = /home/mailuser
      virtual_mailbox_maps = hash:/usr/local/etc/postfix/vmailbox
      virtual_mailbox_domains = hash:/usr/local/etc/postfix/vmaildomains
      virtual_minimum_uid = 10000
      virtual_uid_maps = static:10000
      virtual_gid_maps = static:10000

(2) uid, gid�Ȥ��10000��mailuser�Ȥ����桼�������

(3) /usr/local/etc/postfix/vmailbox�˥С������ʥ᡼�륢�ɥ쥹�����

      kou@example.com example.com/kou/Maildir/
      hoge@example.com example.com/hoge/Maildir/

    �Ȥ�

(4) /usr/local/etc/postfix/vmaildomains�˥С������ɥᥤ������ꡥ((*�С������ɥᥤ������ꤹ��ɥᥤ��̾��mydestination��������Ƥ�����*))

      example.com HOGE FUGA

(5) /usr/local/etc/postfix/vmaps�˥С������ɥᥤ�󰸤Υ᡼��ǥ�����桼����ž�����륢�ɥ쥹���б��򵭽�

      postmaster@example.com root
      mailuser@example.com root
      info@example.com root
      webmaster@example.com  root

    �⤷��vmaildomains�˥С������ɥᥤ���񤤤Ƥ��ʤ����vmaps����Ƭ�˰ʲ���񤤤Ƥ���

      example.com anything

    ���ʤߤˡ�anything�ΤȤ���ϲ���񤤤Ƥ⤤���餷����

(6) {vmailbox,vmaildomains,vmaps}��DB��

      % sudo /usr/local/sbin/postmap /usr/local/etc/postfix/{vmailbox,vmaildoamins,vmaps}

(6) ����ե��������ɤ߹���

      % sudo env - /usr/local/etc/rc.d/postfix.sh reload

== 8bit -> 7bit�Ѵ�����������

�ǥե���ȤǤ�Content-Transfer-Encoding: 8bit�Υ᡼���quoted-printable���Ѵ�����ߤ������������������ˤϰʲ��򵭽Ҥ���Ф褤��

  disable_mime_output_conversion = yes

8bit�äƤޤ����Ե������Τ����顥


== Rgrey

���ѥ��ۤȤ�ɵ��ݤǤ���Ȥ���((<Rgrey - S25R + greylisting|URL:http://k2net.hakuba.jp/rgrey/>))������򤹤롣�ѥ����Ѥ����ʳ���Ʊ����

�ޤ���Postfix�Ѥ�Greylist�μ����Ǥ���Postgrey�򥤥󥹥ȡ��뤹�롣

  % sudo /usr/local/sbin/portupgrade -NRr postgrey

/etc/rc.conf�˰ʲ����ɲä���Postgrey��ư����褦�ˤ��롣

  postgrey_enable="YES"

Postgrey��ư���롣

  % sudo /usr/local/etc/rc.d/postgre start

/usr/local/etc/postfix/main.cf���Խ�����Postgrey��Ȥ��褦�ˤ��롣

  smtpd_restriction_classes =
      check_greylist

  check_greylist = check_policy_service inet:10023

  smtpd_recipient_restrictions =
      permit_sasl_authenticated
      check_client_access regexp:/usr/local/etc/postfix/check_client_fqdn
      ...

  policy_time_limit = 3600

/usr/local/etc/postfix/check_client_fqdn���롣

  /^unknown$/                                  check_greylist
  /^[^\.]*[0-9][^0-9\.]+[0-9]/                 check_greylist
  /^[^\.]*[0-9]{5}/                            check_greylist
  /^([^\.]+\.)?[0-9][^\.]*\.[^\.]+\..+\.[a-z]/ check_greylist
  /^[^\.]*[0-9]\.[^\.]*[0-9]-[0-9]/            check_greylist
  /^[^\.]*[0-9]\.[^\.]*[0-9]\.[^\.]+\..+\./    check_greylist
  /^(dhcp|dialup|ppp|adsl)[^\.]*[0-9]/         check_greylist

����ϡ��ǡ����١��������ˤ��Ƥ��ʤ��Τǡ�postmap�Ϥ��ʤ��Ƥ⤤����

���Ȥϡ��������ɤ߹��ߤ��롣

  % sudo /usr/local/etc/rc.d/postfix.sh reload

== submission�ݡ����б�

/usr/local/etc/postfix/master.cf�˰ʲ��ιԤ��ɲá�

  submission   inet    n       -       n       -       -       smtpd

����ե��������ɤ߹��ߤ��롣

  % sudo /usr/local/etc/rc.d/postfix.sh reload
