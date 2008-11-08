= Nessus

セキュリティスキャナ

== インストール

  % sudo /usr/local/sbin/portupgrade -NRr nessus-plugins-devel

nessus-develでいいんだけど，どうせこれでnessus-devel本体もインストールされるし，いいかなと．

nessudを起動するように/etc/rc.confに以下を追加．

  nessusd_enable="YES"

nessusdにアクセスできるホストを制限したいときは以下も指定し
ておくとよいかも．

  nessusd_flags="-D -a 127.0.0.1"

== ユーザ作成

  % sudo /usr/local/sbin/nessus-adduser

聞かれたのに答えていけばユーザが追加される．

最後に，このユーザはどの計算機をチェックできるのかを指定する．

以下のようにすると192.168.1.0/24の計算機のみチェックできる．

  accept 192.168.1.0/24
  default deny

間違ってユーザを作ってしまった場合はこれ．

  % sudo /usr/local/sbin/nessus-rmuser

== 証明書を作る

ユーザ認証を暗号化するために使用する証明書を作る．

  % sudo /usr/local/sbin/nessus-mkcert

質問はopensslを使った時に聞かれるやつと大体同じ（nessus-mkcertでは勝手に指定されてる項目があるので聞かれる項目が少ない）．

== プラグインの自動アップデート

プラグインを勝手にアップデートしてくれるように
/etc/periodic/weekly/以下にでもこんなファイルを作っておく．
ファイル名は500.nessus-update-pluginsとか適当につける．

  #!/bin/sh

  PATH=/sbin:/usr/local/sbin:/usr/sbin:/bin:/usr/local/bin:/usr/bin
  export PATH

  /usr/local/sbin/nessus-update-plugins

== 定期的にレポート生成

/etc/periodic/daily/以下にこんなファイルを付くって，毎日スキャ
ン結果のレポートを生成させるようにしてもよいかもしれない．ファ
イル名は600.nessusとか適当に．

あ，ファイル中にパスワードを書かなきゃいけないのでchmod 600
にしておくことを忘れずに．

  #!/bin/sh

  PATH=/bin:/usr/local/bin:/usr/bin
  export PATH
  HOME=/usr/local/etc/nessus
  export HOME

  type=html_graph
  host=localhost
  port=1241
  user=nessus-user
  password=nessus-password
  targets=/usr/local/etc/nessus/targets
  result=/usr/local/var/www/data/nessus/index.html

  nessus -T $type -x -q $host $port $user $password $targets $result
