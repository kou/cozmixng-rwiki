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
