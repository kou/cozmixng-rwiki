= clamav-milter

((<ClamAV>))の((<milter>))インターフェイス。

== インストール

((<ClamAV>))を参照。

== 設定

milterとの通信はUNIXドメインソケットを用いることにする。そのため、milterを使用するMTA（ここでは((<Postfix>))）の実行ユーザが書き込めるようにしなければいけない。そのため、MTAの実行ユーザが所属しているmailグループで動かすことにする。

/etc/rc.confに以下を追加。

  clamav_milter_enable="YES"
  clamav_milter_socket_mode="660"
  clamav_milter_socket_group="mail"
  clamav_milter_flags="--postmaster-only --local --outgoing --timeout=0 --max-children=50 --no-check-cf --noxheader --quarantine=virusalert@cozmixng.org --quarantine-dir=/var/db/clamav/virus/"

clamav_milter_flagsの--no-check-cfより前まではデフォルトの設定。残念ながら「追加」という選択肢がなく、「上書き」しかできないのでコピペ。

: --no-check-cf
   Sendmailの設定ファイルをチェックしない。チェックをすると、ソケットのアドレスが指定されていなかったり、違ったりした場合はその旨を報告して終了する。このチェックは、Sendmailと一緒に使っているときは便利かもしれないけど、Postfixと使うときは邪魔になってしまう。

: --noxheader
   X-Virus-ScannedやX-Virus-Statusというようなヘッダを追加しない。

: --quarantine=virusalert@cozmixng.org
   ウィルスが見つかったときに、本来の宛先には配送せず、virusalert@cozmixng.orgに配送する。

: --quarantine-dir=/var/db/clamav/virus/
   ウィルスが見つかったときに、そのメールを/var/db/clamav/virus/以下に保存する。このディレクトリのパーミッションは700でなければいけない。

     % sudo mkdir -p /var/db/clamav/virus/
     % sudo chown -R clamav:clamav /var/db/clamav/
     % sudo chmod 700 /var/db/clamav/virus/

起動。

  % sudo env - /usr/local/etc/rc.conf/clamav-milter start

=== Postfixの設定

milterの基本的な設定をすんでいるものとする。

/usr/local/etc/postfix/main.cfに以下を追加。

  smtpd_milters =
            unix:/var/run/clamav/clmilter.sock

再読み込み。

  % sudo env - /usr/local/etc/rc.conf/postfix reload
