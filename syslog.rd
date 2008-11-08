= syslog

== pub.cozmixng.org のreboot by ((<szk>)) 2003/10/31 9:00 頃 
* 前日夜より，www.cozmixng.org へアクセスできなくなる
* www の pub:/usr/local マウントに pub NFS not responding メッセージ
* pub の /var/log/messages に
  * mountd への kill -HUP 
  * nfsd のsocket create error, nfsd nfssvc エラー

    * streaming.cozmixng.orgがNFS not repondingとなっていたのでいろいろいじってたんです．なんで，wwwはマウントできているのにstreamingはマウントできないんだろうと． - ((<kou>))

* 多分, mountd と nfsd が通信不能になったと推測
* pub を reboot しました．
  * てっきりapacheが動いていないからだと思いました． - ((<kou>))
