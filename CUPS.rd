= CUPS

Common Unix Printing System。

== プリンタを一元管理

ネットワーク内にプリンタを登録するCUPSサーバを一台用意し、他の計算機はそのサーバに印刷要求を出すことにより、印刷を行う。

=== 構成

以下のような構成にする。印刷要求はすべてサーバを経由することがポイントである。

  プリンタ1 -+          +- クライアント1
  プリンタ2 -+- サーバ -+- クライアント2
  ...       -+          +- ...

各プリンタの設定情報（どのPPDを利用するかなど）はクライアント側では持たず、サーバにのみ登録する。各クライアントは単にサーバへ印刷要求を送るだけである。

=== 設定

これを実現するためには、クライアントがサーバにあるプリンタの設定情報を知る必要がある。それにはいくつかの方法がある。

  * /etc/cups/client.confにサーバのアドレスを記述し、クライアント上の各アプリケーションが直接サーバを見にいくようにする。

  * サーバがプリンタ情報をブロードキャストし、各クライアントではそれぞれCUPSサーバを立ち上げ、サーバがブロードキャストしているプリンタ情報を受け取る。各アプリケーションはローカルのCUPSサーバを経由してサーバのCUPSサーバに印刷要求を送る。

多くの場合は前者で十分で、CUPSのクライアントライブラリを使用していないアプリケーションをサポートする場合や、プリンタサーバが複数台いるときは後者でないと対応できない。

==== サーバ

/etc/cups/cupsd.confを以下のように変更。

  # 外部からの接続を受け付ける。
  Listen *:631

  # 同じネットワーク内にプリンタ情報をブロードキャスト。
  # プリンタ情報を送りたい計算機のIPアドレスを指定したり、
  # 「@IF(インターフェイス)」でブロードキャストする
  # ネットワークインターフェイスを指定することもできる。
  BrowseAddress @LOCAL

  <Location />
    ...
    # クライアントからの印刷要求を受け付ける。
    # これは同じネットワークからの要求を受け付ける設定。
    # 他にも設定方法はある。
    Allow @LOCAL
  </Location>

  <Location /admin>
    ...
    # クライアントからプリンタ情報を管理したい場合。
    # Allow @LOCAL
  </Location>

==== クライアント

直接サーバを参照する場合は、/etc/cups/client.confを以下のように変更。

  ServerName サーバのアドレス

ローカルのCUPSサーバを経由する場合は/etc/cups/cupsd.confを以下のように変更。

  Browsing Yes
  BrowseOrder deny,allow
  BrowseDeny all
  BrowseAllow @LOCAL # あるいはサーバのアドレスを指定。

サーバ上のプリンタ名が「プリンタ名@サーバ名」となるのが嫌なら以下も追加。

  BrowseShortNames Yes


== プリンタサーバを冗長構成

プリンタサーバを複数用意し、いくつかのプリンタサーバが停止しても印刷要求を処理できるようにする場合。

=== 構成

以下のような構成にする。クライアントはどのサーバを経由しても印刷できることがポイントである。

  プリンタ1 -+           +- クライアント1
  プリンタ2 -+- サーバ1 -+- クライアント2
  プリンタ3 -+- サーバ2 -+- クライアント3
  ...       -+           +- ...

=== 設定

サーバが複数台あるため、client.confにサーバ名を指定する方法ではそのサーバが停止したときに印刷できなくなってしまう。各クライアントにローカルCUPSサーバを設置し、そのローカルCUPSサーバにどのサーバを利用するかを選ぶようにしてもらう。

==== サーバ

プリンタを一元管理する場合と同様に/etc/cups/cupsd.confを以下のように変更し、クライアントにプリンタ情報を送信し、印刷要求を受け付けるようにする。

  Listen *:631

  BrowseAddress @LOCAL

  <Location />
    ...
    Allow @LOCAL
  </Location>

どのサーバにも同じようにプリンタ情報を登録しておくこと。つまり、サーバ1にもサーバ2にもプリンタ1の情報（名前、PPDなど）が同じように登録する。

==== クライアント

サーバが複数台あるため、同じプリンタ情報が複数のサーバから送られてくる。これらの情報をクライアント側で擬似的に一つのプリンタ情報に見せることによって、いくつかのサーバが停止しても((*クライアント側の設定を変更せずに*))生きているサーバを経由して印刷することが出来る。

クライアント側の設定を変更、というのはこういうことである。普段はサーバ1を経由してプリンタ1から印刷していたが、サーバ1が停止したためサーバ2を経由してプリンタ1から印刷しなければいけない。そのとき、普段は「サーバ1のプリンタ1」と指定していたのに、今は「サーバ2のプリンタ1」と指定しなければいけなくなった。これがクライアント側の設定を変更するということである。ここでは、サーバ1が停止していても生きていても、「プリンタ1」と指定するだけでサーバ1あるいはサーバ2を経由してプリンタ1から印刷できるようにする。

これを実現するために、/etc/cups/cupsd.confを以下のように変更する。

  Browsing Yes
  BrowseOrder deny,allow
  BrowseDeny all
  BrowseAllow @LOCAL

  BrowseShortNames Yes
  HideImplicitMembers Yes
  ImplicitClasses Yes
  ImplicitAnyClasses Yes

ローカルに一切プリンタを登録しない場合はImplicitAnyClassesは指定しなくてもよい。
