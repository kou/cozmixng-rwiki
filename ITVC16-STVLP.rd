= ITVC16-STVLP

玄人指向のTVチューナカード
((<ITVC16-STVLP|URL:http://www.kuroutoshikou.com/products/tvcuner/itvc16.html>))
をDebianで動かす設定。

lspciで言うとこんなやつ。

  % lspci | grep iTVC16
  00:07.0 Multimedia video controller: Internext Compression Inc iTVC16 (CX23416) MPEG-2 Encoder (rev 01)

== インストール

最近のカーネル（少なくとも2.6.22）だとカーネルにivtvモジュールが組み込まれている。

ただし、別途ファームウェアをインストールする必要がある。そのために、以下を/etc/apt/sources.listに追加する。

  deb http://www.hellion.org.uk/debian sid main
  deb-src http://www.hellion.org.uk/debian sid main

そして、インストール。

  % sudo aptitude -V -r install ivtv-firmware

== 設定

用意ができたので、カーネルモジュールを読み込む。

以下のような内容の/etc/modprobe.d/ivtvを作成。

  options ivtv cardtype=5 tuner=17

cardtype=5は自動検出を無効にしてITVC16-STVLPを明示的に指定するということ。

tuner=17は自動検出を無効にしてPhilipsのチューナを明示的に指定するということ（だと思う）。
チューナの種類は以下を見ればよい。

  /usr/src/linux-headers-`uname -r`/include/media/tuner.h

読み込む。

  % sudo modprobe -v ivtv

カードが正常に認識されたかはdmesgで確認する。

正常に認識された場合は以下のようにしてチューナからMPEG2を生成できる。

  % cat /dev/video0 > /tmp/XXX.mpg

内容は以下のようにして確認できる。

  % xine /tmp/xxx.mpg

ただし、砂嵐。

== MythTVのインストール

テレビを観るためにMythTVを使う。

MythTVをインストールするために、以下を/etc/apt/sources.listに追加する。

  deb http://www.debian-multimedia.org sid main
  deb-src http://www.debian-multimedia.org sid main

そして、インストール。

  % sudo aptitude -V -r install mythtv

自分をmythtvグループに追加。

  % sudo adduser kou mythtv

変更を反映するために再ログイン。

== MythTVの設定

MythTVはMySQLを使うので、MythTV用のユーザを作成する。

  % mysql -u root
  mysql> grant all on *.* to mythtv@localhost identified by 'mythtv';
  mysql> exit

MythTVの設定プログラムを起動する。

  % mythtv-setup --geometry 600x480

以下、設定内容。書いていないところはいじらないこと。例えば、TVフォーマットをNTSCから、よかれと思ってNTSC-JPにするとはまる。

前の画面に戻るにはEsc。

  * Select your prefered language

    Nihongo

  * 1. 一般: バックエンドの設定: チャンネル周波数テーブル

    japan-bcast

  * 2. キャプチャーカード: キャプチャーカード

    新規キャプチャーカード

    * キャプチャーカード設定: カードタイプ

      MPEG-2エンコーダーカード(CX23416GYC-STVLP, GV-MVP/RX)

  * 3. ビデオソース: ビデオソース

    新規ビデオソース

    * ビデオソース設定: ビデオソース名

      TV-Japan（任意）

    * ビデオソース設定: Listings grabber

      Japan (xmltv)

      地域などをターミナルで設定。

  * 4. 入力とソースの接続: 入力接続

    [MPEG: /dev/video0] (Tuner 1) -> (無し)

    * ソースを入力に接続: 表示名(任意）

      TV

    * ソースを入力に接続: ビデオソース

      TV-Japan（3.で設定したテレビのビデオソースを指定）


一度終了。チャンネルを更新していないので終了時に問題を修正しますか？とか聞かれるが、修正しないで終了する。

一通り設定が終わったので、サーバmythtv-backendを起動する。

  % sudo /etc/init.d/mythtv-backend start

手動で番組表を更新。

  % mythfilldatabase

以上で設定終了。（もしかしたら↑に--manualオプションをつけて明示的にチャンネルを指定しないといけないかもしれない。）

== TVを観る

  % mythfrontend

== 番組表を定期的に更新

  % crontab -e
  @daily nice -20 /usr/bin/mythfilldatabase
  %
