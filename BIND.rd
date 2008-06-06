= BIND

== 再起動

  % sudo env - PATH=/sbin:/usr/sbin:$PATH /etc/rc.d/named restart

== Open DNS Serverにならないようにする

だれからも利用できるDNSサーバのことみたい．

（デスクトップPCとか）だれかのDNSサーバにならない限りは，自分のドメインだけ答えればいいので，他のドメインのことまで答える必要はない．

特定のネットワークの計算機にだけ，自分のドメインだけではなく，全てのドメインに答える設定．

  options {
    allow-recursion {
      127.0.0.1;
      ::1;
      160.29.167.0/24;
      2001:2f8:c2:201::0/64;
    };
  };

== SPF

Sender Policy Framework。

スパム対策の一つの方法。送信ドメインを認証することによりスパムかどうかを判断する。

  * ドメイン管理者はSMTPの正当な送信ホストをDNSを使って宣言する。
  * SMTPサーバは送信者のドメイン（など）をDNSから引き、正当なホストから送られたメールであるかどうかを確認する。

ゾーンファイルに以下のような設定を追加することにより、前者の正当な送信ホストを宣言できる。

  @ IN  TXT "v=spf1 a mx ~all"
  mail IN TXT "v=spf1 a ~all"

こういう前提:

  * ドメイン名はexample.com。（つまりメールアドレスはuser@example.com）
  * メールサーバ（HELOで言うホスト名）はmail.example.com
  * example.comでIPアドレスが引ける（example.comのAレコードがある。なければ@のところからaをとって↓のやつみたいにすればよい。）

でも、これだけで十分っぽい。（HELOのアドレスはチェックされない？）

  @ IN  TXT "v=spf1 mx ~all"

((<URL:mailto:check-auth@verifier.port25.com>))にチェックしたいドメインからメールを送るとチェック結果が返ってくる。
