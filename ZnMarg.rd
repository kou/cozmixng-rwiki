= ZnMarg

== Margarine
* ((<Margarine Project �� �ͤ��ʤ��ѥ�ȥХ������ä���ˡ ��|URL:http://plantl.org/l/munou/margarine/>))�����������ɤ��롣
* �ǿ��ǤǤ��Ѥ�äƤ뤫�⤷��ޤ��󤬡�
  1.0.5�Ǥϥ����ȥǥ��쥯�ȥ�˥ե������Ÿ������Τ�
  ¾�Υե�����Ⱥ�����Ȥޤ����Ȥ����Ÿ�����ʤ��褦�ˡ�
* ((<RAA:mysql-ruby>))��((<RAA:ruby-chasen>))��ɬ�פʤΤ�
  ���ӥ��󥹥ȡ��뤷�Ƥ�����

* marg.rb��1���ܤ�(({#!/usr/bin/env ruby -Ke}))���ѹ���
  FreeBSD�ǤϤ���Ǥ�������Linux����/usr/bin/env��
  (({'ruby -Ke'}))��¹Ԥ��褦�Ȥ��Ƽ��Ԥ��롣
* marg.rb��(({$DEFAULT_MARG}))��(({require 'margarine.rb'}))�δ֤�
  ����ե�������ɤ߹��ޤ�����������줿��
    $DEFAULT_MARG = 'defaultmarg'

    if File.symlink?(__FILE__)
      Dir.chdir(File.dirname(File.readlink(__FILE__)))
    else
      Dir.chdir(File.dirname(__FILE__))
    end
    load 'znz-config.rb'
    # --

    require 'margarine.rb'
  ((<HackingMarg|URL:http://plantl.org/l/munou/margarine/hiki/hiki.cgi?HackingMarg>))
  �ˤ��ȡ��ܲȤǤ�$HOME/.margrc���ɤ�褦�ˤʤꤽ����

* znz-config.rb�κ�����
    $DB_USER = 'znz'
    $DB_NAME = 'znz'
    $DB_PASSWORD = '�����˥ѥ����'
    $DEFAULT_MARG = 'znmarg'

== plum
* ((<URL:http://plum.sourceforge.jp/>))�˺ǿ��Ǥ����롣
* �ǿ��Ǥ��������ɤ���Ÿ�������ǥ��쥯�ȥ�plum-2.33.2�����롣
* ��ۤɤ�marg.rb�˥���ܥ�å���󥯤�ĥ�롣
    ln -s ~/margarine/znmarg/marg.rb .
* margarine.plm��module/munou�˥��ԡ���
    mkdir module/munou
    cp -p ~/margarine/znmarg/margarine.plm module/munou/margarine.plm
* plum-znmarg.conf�������
    cp plum-default.conf plum-znmarg.conf
    vi plum-znmarg.conf
* plum-znmarg.conf�Ǥ�
  * plum.nick
  * plum.user
  * plum.name
  * plum.server
  * channel.join.connect.channel
  * ctcp.userinfo.info
  * log.client.file (margarine�ε�ư�����å���)
  * log.daily.file (���̤Υ������)
  �����ꤷ�ơ�������
    + munou/margarine.plm
    munou.margarine.marg: znmarg
    munou.margarine.reply: default
    munou.margarine.register: true
  ���ɲä�����
