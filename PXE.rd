= PXE

Preboot eXecution Environmentの略。

ネットワークブートの規格。

== サーバの設定

((<DHCP>))サーバからネットワークの設定をもらってきて、((<TFTP>))を使って起動イメージをダウンロードし、それを使って起動する。

Linuxの場合は起動イメージとしてsyslinuxに含まれているpxelinuxというブートローダを使い、pxelinuxがカーネルイメージとかinitrdを読み込んで起動するみたい。

== クライアントの設定

BIOSがPXEをサポートしていればそれを使う。サポートしていなかったらGRUBとかで頑張る。

