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

== ���ꤷ�����ɥ쥹������Υۥ��Ȥ�ž������

/etc/exim4/hubbed_hosts�˰ʲ��Τ褦�˵��Ҥ��롥

  example.com: mail.example.com

�磻��ɥ����ɤȤ��ơ�*�פ��Ȥ��롥

�Ȥ������Ȥǡ�XXX@example.com��XXX@YYY.example.com�⤹�٤�mail.example.com��ž�����������ϰʲ��Τ褦�ˤ��롥

  example.com: mail.example.com
  *.example.com: mail.example.com

��¦�����mail.example.com���񤤤Ƥ�����ˤˤϥۥ���̾�ǤϤʤ��ơ�IP���ɥ쥹��񤯤��Ȥ�Ǥ��롥

== ���ޡ��ȥۥ��Ȥ���³������Υݡ����ֹ���Ѥ���

���ޡ��ȥۥ��Ȥ˥᡼�����Ѥ�����˥��֥ߥå����ݡ���(587)�����Ѥ���ˤ�/etc/exim4/update-exim4.conf.conf��dc_smarthost���ʲ��Τ褦�ˤʤ�褦�ˤ���Ф褤��

  dc_smarthost='mail.example.com::587'

�Ȥ������Ȥǡ��ʲ��Τ褦��exim������򤹤�Ȥ��ˤ���äݤ�����ˤ���äݤ������뤳�ȡ�

  % sudo dpkg-reconfigure exim4-config
