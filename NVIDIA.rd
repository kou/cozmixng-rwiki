= NVIDIA

Debian GNU/LinuxでNVIDIAのnon-freeなドライバーを使ってデュアルディスプレイにするための設定。

設定が少し面倒だし、non-freeだし、次からはNVIDIAじゃなくてIntelのビデオカードを使おう。

== インストール

自由なNouveauドライバーを削除してnon-freeなNVIDIAのドライバーをインストールする。

  % sudo aptitude -V purge -y xserver-xorg-video-nouveau
  % sudo aptitude -V -r -D -y install xserver-xorg-video-nvidia

== 設定

以下の内容の/usr/share/X11/xorg.conf.d/99-nvidia.confを作成して再起動する。

  Section "Device"
          Identifier  "NVIDIA"
          Driver      "nvidia"
  EndSection
  
  Section "Screen"
          Identifier      "DualDisplay"
          Device  "NVIDIA"
          Option  "TwinView"      "True"
  EndSection
