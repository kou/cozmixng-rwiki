# -*- rd -*-

= Pseudo Web Mail::README.ja

== ���

Kouhei Sutou <kou@cozmixng.org>

== �饤����

Ruby's

== �᡼��󥰥ꥹ��

((<COZMIXNG RWiki - Ϣ����
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))�������������

== �ʤˤ��졩

ά����PWM����̾��((*�������WebMail*))�ޤ���((*��WebMail*))��
����ɤ�̾���罸��Ǥ���

�����������Τߤ�Web�᡼�륷���ƥ�Ǥ���SMTP��POP3��IMAP��
���Ѥ���Web Mail�����ƥ�Ǥ�((*����ޤ���*))����äơ�Yahoo! 
��HotMail���Τ褦��̵���᡼��Ȥ������Ѥ��뤳�ȤϽ���ޤ���

�������ꡤSMTP�����Ф�POP3��IMAP�����������Ѱդ���ɬ�פϤ�
��ޤ��󡥤���ˡ�((<RAA:webrick>))�����󥹥ȡ��뤵��Ƥ���
��Apache����HTTP�����Ф����Ѱդ���ɬ�פ⤢��ޤ���

== ����

  * ̵��
  * �����(�桼��̾���ѥ���ɤ�����Ͽ����Ф����Ȥ���)
  * �桼��̾�����ܸ줬�Ȥ���
    * => �鿴�Ԥˤ䤵������
  * �����˥᡼������뤳�ȤϽ���ʤ�(�����Ǵ���)
    * => ���Ԥ��Ƥ⳰��(���󥿡��ͥåȤʤ�)�ؤαƶ������ʤ�
      * => �鿴�Ԥˤ䤵������
  * ������ֻ��Ѥ���ʤ���������Ȥϼ�ư���
    * ˰������ۤä��餫���Ƥ����Ф���
  * Ruby��dRuby���Ѥ��Ƥ���

== ��¸�饤�֥��

  * ((<RAA:drb>))
  * ((<RAA:erb>))
  * ((<RAA:div>))
  * ((<RAA:devel-logger>))

=== ����Ф����饤�֥��

  * ((<RAA:webrick>))

== ������ˡ

((<URL:http://www.cozmixng.org/~kou/download/pwm.tar.gz>))

  % svn co http://www.cozmixng.org/repos/ruby/pwm/trunk pwm

== ���󥹥ȡ���

  % ruby install.rb config
  % ruby install.rb setup
  # ruby install.rb install

== ����

=== CGI��

  (1) site/pwm-config.rb��Ķ��ˤ��碌�����ꤹ�롣
  (2) site/pwmd.rb��ư���롣

        % ruby -Ke pwmd.rb

      daemontools��Ȥ��ȹ����ˤʤ�ޤ���

  (3) interface/index.rb��sample/{pwm.css,pwm.js}��HTTP�ǥ�
      �������Ǥ���ǥ��쥯�ȥ�˰�ư���롣

  (4) �֥饦����index.rb�˥����������롣

=== Webrick��

  (1) site/pwm-config.rb��Ķ��ˤ��碌�����ꤹ�롣

  (2) site/standalone-pwmd.rb��ư���롣

        % ruby -Ke standalone-pwmd.rb

      daemontools��Ȥ��ȹ����ˤʤ�ޤ���

  (3) sample/{pwm.css,pwm.js}��PWM::MOUNT_DIRECTORY�˰�ư���롥

  (4) �֥饦����http://yourhost:#{PWM::PORT}/pwm�˥����������롥

== ������(���)

  * ��������ʤɤΥ�����ͥåȤ�
    * => ��((<����������>))�ס���((<���롼�פ�����>))�פε�ǽ��Ȥ��д�
      �ץ᡼��󥰥ꥹ�Ȥ�����롣��Ͱ�ͤ˥᡼�륢�ɥ쥹����
      �ۤ���ɬ�פ�ʤ���

  * ���󥿡��ͥåȾ�����֤���
    * => ���Υ����о�Ǥη��֡�
      * �̾�Υ᡼��Τ褦�˥��ߥ�˥��������ġ���Ȥ���
        * => �᡼�륢�ɥ쥹��̵���Ƥ�Ȥ���(̵����Ͽ)
      * ��������
        * => ��ʬ�����äƤ������������֤⵭Ͽ�����Τ�����!?
