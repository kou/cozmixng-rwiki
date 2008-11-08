= exim

MTA

== アドレス拡張を使う

((<Postfix>))でいう

  recipient_delimiter = +

をするには，/etc/exim4/cond.d/router/900_exim4-config_local_userを以下のように変更する．

  local_user:
    ...
    local_part_suffix = +*
    local_part_suffix_optional
    check_local_user
    ...

check_local_userの前に入れるのがポイント．

real-#{ユーザ名}+XXX@...にも対応させるなら/etc/exim4/cond.d/router/400_exim4-config_system_aliasesも同じように変更．

  real_local:
    ...
    local_part_prefix = real-
    local_part_suffix = +*
    local_part_suffix_optional
    check_local_user
    ...

== 指定したアドレスを特定のホストに転送する

/etc/exim4/hubbed_hostsに以下のように記述する．

  example.com: mail.example.com

ワイルドカードとして「*」が使える．

ということで，XXX@example.comもXXX@YYY.example.comもすべてmail.example.comに転送したい場合は以下のようにする．

  example.com: mail.example.com
  *.example.com: mail.example.com

右側の欄（mail.example.comが書いている欄）にはホスト名ではなくて，IPアドレスを書くこともできる．

== スマートホストで接続する先のポート番号を変える

スマートホストにメールを中継する時にサブミッションポート(587)を利用するには/etc/exim4/update-exim4.conf.confのdc_smarthostが以下のようになるようにすればよい。

  dc_smarthost='mail.example.com::587'

ということで、以下のようにeximの設定をするときにそれっぽい質問にそれっぽく答えること。

  % sudo dpkg-reconfigure exim4-config
