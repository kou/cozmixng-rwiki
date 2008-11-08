= VNC

xinetd経由でVNCを起動してXサーバもどきにする．

今回はDebian GNU/Linuxを使用．

== 必要なもの

  * VNC 4.X: VNC 3.Xだと微妙に設定が異なります．
  * xinetd
  * gdm: 他のディスプレイマネージャでもよい

== 設定

800x600, 1024x768, 1152x864, 1280x1024の解像度でVNCサーバを起動することにする．ついでに，それぞれについて色数16bit版と24bit版を用意する．

=== サービスの追加

/etc/servicesに以下を追加

  vnc-800x600x16         5950/tcp
  vnc-800x600x24         5951/tcp
  vnc-1024x768x16        5952/tcp
  vnc-1024x768x24        5953/tcp
  vnc-1152x864x16        5954/tcp
  vnc-1152x864x24        5955/tcp
  vnc-1280x1024x16       5956/tcp
  vnc-1280x1024x24       5957/tcp

=== xinetdの設定

/etc/xinetd.d/vncとして以下の様な内容のファイルを作成する．

192.168.0.3の部分はVNCサーバをバインドするインターフェイスのIPアドレスかホスト名に変更する．

VNC 3.Xを使用している場合は

  -SecurityTypes None

オプションはいらない．

  service vnc-800x600x16
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 800x600 -depth 16 -SecurityTypes None
  }

  service vnc-800x600x24
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 800x600 -depth 24 -SecurityTypes None
  }

  service vnc-1024x768x16
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1024x768 -depth 16 -SecurityTypes None
  }

  service vnc-1024x768x24
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1024x768 -depth 24 -SecurityTypes None
  }
  service vnc-1152x864x16
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1152x864 -depth 16 -SecurityTypes None
  }

  service vnc-1152x864x24
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1152x864 -depth 24 -SecurityTypes None
  }

  service vnc-1280x1024x16
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1280x1024 -depth 16 -SecurityTypes None
  }

  service vnc-1280x1024x24
  {
          socket_type     = stream
          protocol        = tcp
          wait            = no
          user            = nobody
          server          = /usr/bin/Xvnc
          server_args     = -inetd -query 192.168.0.3 -once -geometry 1280x1024 -depth 24 -SecurityTypes None
  }

=== xinetdを再起動

  % sudo env - /etc/init.d/xinetd restart

=== gdmでxdmcpを有効にする

/etc/gdm/gdm.confの中の

  [xdmcp]

セクション中の

  Enable=false

を

  Enable=true

に変更する．

=== gdmを再起動

  % sudo env - /etc/init.d/gdm restart

== 接続

=== xvncviewer

  % xvncviewer 192.168.0.3:5953
