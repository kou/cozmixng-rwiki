= INSTALL.macosx-macports.ja

$Id: INSTALL.macosx-macports.ja 892 2007-06-04 03:43:48Z kou $

Mac OS X �Υѥå��������������ƥ�ΤҤȤĤǤ��롢MacPorts �����Ѥ���
Rabbit �򥤥󥹥ȡ��롢���Ѥ�����ˤĤ����������ޤ���

== �����˽���������

�ʲ��Υ��եȥ�������ɬ�פǤ���Mac OS X �Υ����ƥ�DVD�ʤɤ��饤�󥹥ȡ���
���Ƥ���������

* Xcode Tools
* X11
* Subversion

Xcode Tools �Υ��󥹥ȡ�����ˤϡ�X11 SDK �����򤹤�Τ�˺��ʤ��Ǥ���������

Subversion �ϡ�MacPorts �Υ��󥹥ȡ�����

  ~% sudo port install subversion

�Ȥ��ƥ��󥹥ȡ��뤹�뤫��((<URL:http://metissian.com/projects/macosx/subversion/>))
�Ǹ�������Ƥ���Х��ʥ�ѥå����������Ѥ��ƥ��󥹥ȡ��뤹��Τ���ñ�Ǥ���

== MacPorts �Υ��󥹥ȡ���

MacPorts �θ��������� ((<URL:http://www.macports.org/>)) �����������ɡ�
���󥹥ȡ��뤷�ޤ����ǥ��������᡼��(.dmg)���饤�󥹥ȡ��뤹��Τ���ñ�Ǥ���

�Ȥ��˻��ꤷ�ʤ���С�/opt/local �ʲ��� MacPorts ��Ϣ�Υե����뷲�����󥹥ȡ���
����ޤ���MacPorts �Υ��ޥ�ɤ����Ѥ��뤿��ˡ��Ķ��ѿ� PATH �� /opt/local/bin
���ɲä��ޤ���

=== MacPorts ������

��ǰ�ʤ��Ȥˡ������� MacPorts �Ǥ� Rabbit �Υѥå�����(Portfile)���Ѱդ����
���ޤ����ȼ��Υѥå����������Ѥ��뤿��ˡ��ʲ��������Ԥ��ޤ���

�ޤ���Portfile �� Subversion ��ݥ��ȥ꤫��������ޤ���������Ǥϡ�
��ʬ�Υۡ���ǥ��쥯�ȥ겼�� dports/ �Ȥ����ǥ��쥯�ȥ�˥�������ɤ��ޤ���

  ~% svn co http://www.cozmixng.org/repos/dports/trunk dports
  ~% cd dports
  ~/dports% portindex

���ˡ����Υǥ��쥯�ȥ�� MacPorts �����Ȥ���褦�� 
/opt/local/etc/ports/sources.conf ���Խ����ޤ���

  # To enable your local ports repository, uncomment and customize the
  # following line to point at your local dports directory
  # Example: file:///Users/landonf/misc/darwinports/dports
  #
  file:///Users/yourname/dports # <- here
  # To get darwinports from the darwinports rsync server use:
  # rsync://rsync.darwinports.org/dpupdate/dports
  rsync://rsync.darwinports.org/dpupdate/dports

������ /Users/yourname �Ϥ��ʤ��Υۡ���ǥ��쥯�ȥ���֤������Ƥ���������

����������Ǥ��������ǧ���뤿��ˡ�Rabbit �� Portfile �ξ������Ϥ��Ƥߤޤ���

  ~% port info rb-rabbit
  rb-rabbit 0.5.1, Revision 0, ruby/rb-rabbit
  {http://www.cozmixng.org/~rwiki/?cmd=view;name=Rabbit}
  # �ʲ���ά #

����������Ǥ��Ƥ��ʤ��Ȥ��ϡ��ʲ��Τ褦�ʥ�å����������Ϥ���ޤ���

  ~% port info rb-rabbit
  No port rb-rabbit found.


== Rabbit �Υ��󥹥ȡ���

�ʲ��Υ��ޥ�ɤ� Rabbit �ȡ������ɬ�פʥ��եȥ����������󥹥ȡ��뤵��ޤ���

  ~% sudo port install rb-rabbit

glib �� Gnome �����󥹥ȡ��뤵��Ƥ��ʤ��Ȥ��ϡ������Υ��󥹥ȡ���Τ����
���ʤ�λ��֤�������ޤ���

¾�ˤ�ʲ��� port �򥤥󥹥ȡ��뤹��Ȥ褤�Ǥ��礦��

* htree (rb-htree) - �����������ɤ˿���Ĥ��뤳�Ȥ��Ǥ���褦�ˤʤ�ޤ�
* Ruby-GetText-Package (rb-gettext) - ��å������ʤɤι�ݲ���ͭ���ˤʤ�ޤ�

���󥹥ȡ�����ˡ��Ʊ�ͤǤ���

  ~% sudo port install rb-htree
  ~% sudo port install rb-gettext

��) Ruby-GetText-Package �������Ǥ� RubyGems ���饤�󥹥ȡ��뤵��Ƥ���Ȥ���
rb-gettext �Υ��󥹥ȡ�������פǤ���

== X11 �Ķ��˴ؤ��� Tips

����Ū�� PC-UNIX �Ķ��ȤϰۤʤꡢMac OS X �Ǥϥ�����ɥ������ƥ�Ȥ��� X ��
���Ѥ��Ƥ��ޤ��󡣤��Τ��ᡢ�����Ĥ�����դ�ɬ�פˤʤ�ޤ���

=== X11.app ��ư����

X11.app ����ư���Ƥ��ʤ���С�rabbit �ϼ¹ԤǤ��ޤ���X11.app �� 
/�����ƥ�/�桼�ƥ���ƥ�/X11.app �ˤ���ޤ���

=== �ե���Ȥ�����

X11 �� Mac OS X ����°����ե���Ȥ����ѤǤ���褦�ˤ��뤿��ˡ�
/opt/local/etc/fonts/local.conf �ե������ʲ������ƤǺ������ޤ���

  <?xml version="1.0"?>
  <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
  <fontconfig>
    <dir>/Library/Fonts</dir>
    <dir>/Network/Library/Fonts</dir>
    <dir>/System/Library/Fonts</dir>
    <dir>/usr/local/share/fonts</dir>
    <dir>/opt/local/share/fonts</dir>
  </fontconfig>

=== DISPLAY �Ķ��ѿ�

X11 ���ư��� Rabbit �����Ѥ��뤿��ˤϡ�DISPLAY �Ķ��ѿ������ꤵ���
���ʤ���Фʤ�ޤ���X11.app ��� xterm �Ǥ����ꤵ��Ƥ��ޤ�����ɸ���
�����ߥʥ�� iTerm��JTerminal �����Ѥ��Ƥ���Ȥ��ϼ�ʬ�����ꤹ��ɬ�פ�
���뤳�Ȥ���դ��Ƥ���������

== Rabbit ��С�����󥢥åפ���

�ǿ��� Portfile �� Subversion ��ݥ��ȥ꤫�����ꤷ�������ǡ�port upgrade 
���ޥ�ɤˤ�ꡢRabbit ��ǿ��ΥС������˹������뤳�Ȥ��Ǥ��ޤ���

  ~% cd dports
  ~/dports% svn update
  ~/dports% sudo port upgrade rb-rabbit

Rabbit ������С�����󥢥åפ������Ȥ��ϡ�-n ���ץ�������ꤷ�ޤ�������
���ץ����λ���ˤ�ꡢ��Ϣ���륽�եȥ������Ϲ��������� Rabbit �����򹹿�
���뤳�Ȥ��Ǥ��ޤ���
  
  ~/dports% sudo port -n upgrade rb-rabbit


== Ϣ����

�����Ť�������ꥯ�����Ȥʤɤϡ�Rabbit::UsersGroup.ja
((<URL:http://www.cozmixng.org/~rwiki/index.rb?cmd=view;name=Rabbit%3A%3AUsersGroup.ja>)) 
�� Rabbit MacPorts ô������¼ (kimuraw at i.nifty.jp) �ޤǤɤ�����


