= SIP Express Router

SIP Express Router (ser) is a high-performance, configurable, free SIP ( RFC3261 ) server . It can act as registrar, proxy or redirect server.

== ���󥹥ȡ���

  % sudo portupgrade -N ser

== ����

�ʲ��Τ褦��ser.sh��/usr/local/etc/rc.d���֤�

  #!/bin/sh
  PATH=/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin
  SIP_DOMAIN=sip.cozmixng.org
  
  export PATH SIP_DOMAIN
  
  /usr/local/sbin/serctl $@

/usr/local/etc/ser/ser.cfg��񤭴����롥

  if (uri==myself) {

��

  if (uri==myself || uri=~"^sip:([^@]*@)?sip.cozmixng.org$") {

�ˤ��롥

== ���饤����Ȥ�����

=== KPhone

�ǽ�ε�ư���˽Ф��Ĥ�����(File->Identity)

: Full Name
   ��ʬ��̾���򤤤��(��: Kouhei Sutou)
: User Part of SIP URL
   ���ꤵ�줿�桼��̾(��: kou)
: Host Part of SIP URL
   SIP������(�롼����)��URL(��: sip.cozmixng.org)
: Authentication Username (optional)
   ���ꤵ�줿�桼��̾(��: kou)

���ä򤫤���ˤ�File->New Call�ˤ��ä�Dial

: Remote:
   ���Υ��ɥ쥹(��: kou@sip.cozmixng.org)
