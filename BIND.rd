= BIND

== 再起動

  % sudo env - PATH=/sbin:/usr/sbin:$PATH /etc/rc.d/named restart

== Open DNS Serverにならないようにする

だれからも利用できるDNSサーバのことみたい．

（デスクトップPCとか）だれかのDNSサーバにならない限りは，自分のドメインだけ答えればいいので，他のドメインのことまで答える必要はない．

特定のネットワークの計算機にだけ，自分のドメインだけではなく，全てのドメインに答える設定．

  options {
    allow-recursion {
      160.29.167.0/24;
      2001:2f8:c2:201::0/64;
    };
  };
