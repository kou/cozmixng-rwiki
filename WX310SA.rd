= WX310SA

Debian GNU/Linuxから，WILLCOMのPHP，WX310SAを使ってインターネットに接続する設定．
接続先はWILLCOMが提供しているPRIN(PRovider INcluded)を使う．

== ドライバ

カーネルに入っているcdc_acmでいける．

WX310SAが認識されていれば，dmesgにメッセージがでて，どのデバイスに割り当てたかがわかる．

  % dmesg | grep cdc_acm
  cdc_acm 2-1:1.0: ttyACM0: USB ACM device
  ...

この場合は/dev/ttyACM0経由でPPPを行う．

== 設定

pppconfigを使うのが楽．

ウィザード形式で進む．こんな感じでいけるはず．

: プロバイダ名
   prin（任意）

: DNSの設定
   Dynamic

: 認証方法
   PAP

: ユーザ名
   prin

: パスワード
   prin

: 速度
   115200（デフォルト）

: パルスまたはトーン
   Tone（トーン）

: 電話番号
   0570570711##64（4パケット方式の場合）

: モデムポート
   Manualで/dev/ttyACM0を指定（dmesgで確認したやつ）

後はFinishedでファイルに書き出して，終了．((*ファイルに書き出すのを忘れずに*))


== 接続

  % sudo pon prin

prinはpppconfigで設定したプロバイダ名．

切断するときはpoff．

  % sudo poff prin
