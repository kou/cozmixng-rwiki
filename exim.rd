= exim

MTA

== ���ɥ쥹��ĥ��Ȥ�

((<Postfix>))�Ǥ���

  recipient_delimiter = +

�򤹤�ˤϡ�/etc/exim4/cond.d/router/900_exim4-config_local_user��ʲ��Τ褦���ѹ����롥

  local_user:
    ...
    local_part_suffix = +*
    local_part_suffix_optional
    check_local_user
    ...

check_local_user�����������Τ��ݥ���ȡ�

real-#{�桼��̾}+XXX@...�ˤ��б�������ʤ�/etc/exim4/cond.d/router/400_exim4-config_system_aliases��Ʊ���褦���ѹ���

  real_local:
    ...
    local_part_prefix = real-
    local_part_suffix = +*
    local_part_suffix_optional
    check_local_user
    ...
