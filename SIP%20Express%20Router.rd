= SIP Express Router

SIP Express Router (ser) is a high-performance, configurable, free SIP ( RFC3261 ) server . It can act as registrar, proxy or redirect server.

== インストール

  % sudo portupgrade -N ser

== 設定

以下のようなser.shを/usr/local/etc/rc.dに置く

  #!/bin/sh
  PATH=/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin
  SIP_DOMAIN=sip.cozmixng.org
  
  export PATH SIP_DOMAIN
  
  /usr/local/sbin/serctl $@

/usr/local/etc/ser/ser.cfgを書き換える．

  if (uri==myself) {

を

  if (uri==myself || uri=~"^sip:([^@]*@)?sip.cozmixng.org$") {

にする．

== クライアントの設定

=== KPhone

最初の起動時に出るやつの設定(File->Identity)

: Full Name
   自分の名前をいれる(例: Kouhei Sutou)
: User Part of SIP URL
   指定されたユーザ名(例: kou)
: Host Part of SIP URL
   SIPサーバ(ルータ？)のURL(例: sip.cozmixng.org)
: Authentication Username (optional)
   指定されたユーザ名(例: kou)

電話をかけるにはFile->New CallにいってDial

: Remote:
   相手のアドレス(例: kou@sip.cozmixng.org)
