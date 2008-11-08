= Yasushi Ichikawa


== memo
 *JAVAで公開鍵暗号の署名はできるらしいが、暗号化、復号させるには別途プラグインのインストールが必要
 *ISPでIPv6のサービスがけっこう始まってるみたい
 * 安比高原でGrayの試乗会　3/15（土）〜16（日）

== やること
 * VoIP調べる

== 読むべきもの
 * OverCast: Reliable Multicasting with an Overlay Network
   * multicast パケットが必ず届くということ？それは再送のメカニズムがなければ、無理な気がするのですが。。。overlay networkっていうのがみそ？　- ((<szk>))
   * streaming を reliable にしたいんですか？ - ((<szk>))

   * 信頼性IPマルチキャストなら再送のためにAckをどこかでまとめて集約したり、Nack使ったりしてるんですが、OverCastはOverlayネットワークで、各ホストがパケットを中継するので、各ホストでReliableにする処理ができるのです。　IPマルチキャストは、インターネットで使えるように普及させるのは難しいので、最近はアプリケーションレベルマルチキャストの研究がここ2年ぐらいでかなり活発になりました。　- ((<yasushi>))
