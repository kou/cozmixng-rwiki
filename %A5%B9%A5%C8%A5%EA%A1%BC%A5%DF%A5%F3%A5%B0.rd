= ストリーミング

ストリーミング関係の作業記録です。

((<アップル - QuickTime Streaming Server - FAQ|URL:http://www.apple.co.jp/quicktime/products/qtss/qtssfaq.html>))

== Darwin Streaming Server

=== インストール

  (1) ((<URL:http://developer.apple.com/darwin/projects/streaming/>))よりDSS-4_1_3.src.tar.gzをダウンロード。

      * ダウンロードする前にユーザ登録が必要。
      * ユーザ登録をすればCVSでもソースが取得可能。
      * 今回はとりあえずtar ballで。

  (2) 展開したディレクトリで以下を実行。

  % ./Buildit
  % ./DSS_MakeRoot -f ../DSS-4_1_3.bin
  % cd ../DSS-4_1_3.bin
  # ./Install

==== 起動

  # DarwinStreamingServer
  # streamingadminserver.pl

=== portsでインストール

  % sudo /usr/local/sbin/portupgrade -N DarwinStreamingServer

==== 設定

/etc/rc.confに以下を記述

  darwin_streaming_server_enable="YES"
  darwin_streaming_server_flags=""

  streamingadminserver_enable="YES"
  streamingadminserver_flags=""

管理者のパスワードを設定

  # qtpasswd -c $Username$
  # echo admin: $Username$ > /usr/local/etc/streaming/qtgroups

SSLの鍵を生成

  % cd /usr/local/etc/streaming
  % sudo openssl genrsa -rand streamingadminserver.key -des3 -out streamingadminserver.key 1024
  % sudo openssl rsa -in streamingadminserver.key -out streamingadminserver.key
  % sudo /usr/local/openssl/misc/CA.sh -newca
  % sudo openssl req -new -days 365 -key streamingadminserver.key -out csr.pem
  % sudo openssl ca -in csr.pem -keyfile demoCA/private/cakey.pem -cert demoCA/cacert.pem -out streamingadminserver.pem
  % sudo chmod 600 streamingadminserver.key

=== streamingadminserver.pl

これで((<URL:https://streaming.cozmixng.org:1240/>))で管理画面に行くことができる。デフォルトではどこからの接続でもログインできる？

==== プレイリスト

管理画面からプレイリストを作ったら各プレイリストの右側にある三角の絵(再生ボタン)を押して再生させないとダメ。

=== 接続

MP3にアクセスするときはHTTPで80番か8000番ポート、MPEG4、QuickTimeにアクセスするときはRTSPを使うみたい。手元ではmplayerでMP3が聞けたが、MPEG4、QuickTimeは無理。ちなみにローカルのMPEG4、QuickTimeは見れる。

MP3を聞きたいときは
  % mplayer http://streaming.cozmixng.org/sample_mp3
or
  % mpg123 http://streaming.cozmixng.org/sample_mp3

以下未確認。QuickTime Player on Macでの確認を求む。

MPEG4を見たいときは
  % mplayer rtsp://streaming.cozmixng.org/sample_300kbit.mp4
QuickTimeを見たいときは
  % mplayer rtsp://streaming.cozmixng.org/sample_300kbit.mov
SDPで見たいときは
  % mplayer -sdp rtsp://streaming.cozmixng.org/sample_movie.sdp

=== how to use? - ((<szk>))

  * MPEG4, QuickTime, SDP 全部見て聞けました。by MacOSX Quicktime Player6.02 - ((<szk>))

  * RealOne Player のトライアル版 for Mac OS X ((<URL:http://www.real.com/realone/mac/index.html>))をためしました。トライアルでは mp3 だけしかだめなようです。 - ((<szk>))

  * Windows Media Player7 on Windows 2000でMP3が聞けることを確認 - ((<kou>))

  * QuickTime Player 6 on Windows 2000でMPEG4、QuickTimeは画像も見れて音も聞けることを確認。ただし、SDPだと音しか聞けない。画像は見れない。 - ((<kou>))
