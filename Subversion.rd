= Subversion

Subversion�ط��κ�ȵ�Ͽ

== ���

  * ((<URL:http://ukai.jp/Slides/2003/0521-lw2003/html/index.html>))

== ���󥹥ȡ���

/usr/local/etc/pkgtools.conf��MAKE_ARGS�˰ʲ����ɲá�

  'devel/subversion' => 'WITH_MOD_DAV_SVN=yes',

devel/subversion�򥤥󥹥ȡ���

  % sudo /usr/local/sbin/portupgrade -NRr subversion

== ����

/usr/local/etc/apache2/httpd.conf��Ϯ��ޤ���

�Ȥꤢ�����ʲ��Υ⥸�塼�����ɤ��ޤ���

  LoadModule dav_module libexec/apache2/mod_dav.so
  LoadModule dav_fs_module libexec/apache2/mod_dav_fs.so
  LoadModule dav_svn_module     libexec/apache2/mod_dav_svn.so

��ݥ��ȥ�ξ�����ꤷ�ޤ�������ϥ��ߥåȤ�����Υ桼����������ʤ��褦�ˤ��ޤ�����������������ï�Ǥ�����褦�ˤ��ޤ���

  <Location /repos>
          AuthName "Subversion Repository"
          AuthType Basic
          AuthUserFile "/usr/local/svn/.htpasswd"
          <LimitExcept GET PROPFIND OPTIONS REPORT>
                  Require valid-user
          </LimitExcept>
          DAV svn
          SVNPath /usr/local/svn/repos
  </Location>

Apache��Ƶ�ư��

  % sudo /usr/local/sbin/apachectl restart

== ��ݥ��ȥ�ν����

  % cd /usr/local
  % sudo mkdir svn
  % sudo svnadmin create svn/repos
  % sudo /usr/sbin/chown -R www:www svn/repos

�����((<URL:/repos/>))�ǥ�ݥ��ȥ�����Ƥ򸫤뤳�Ȥ�����ޤ���

=== �ѥ���ɤ���Ͽ

���ߥåȤ������ͤϰʲ����ͤ˥桼����Ͽ���Ʋ�������

  % sudo /usr/local/sbin/htpasswd /usr/local/svn/.htpasswd hoge

== ��ݥ��ȥ����Ͽ

����Ū�˰�Ĥ�SVNPath�ˤ�Ʊ��Revision��������Ƥ��ޤ���

CVS�Ǥ�hoge/fuga�Ȥ����ͤ˥���ݡ��Ȥ���г���Ū�˥⥸�塼�뤬��������ޤ�����Subversion�ǤϤ��Τ褦�ˤϽ���ޤ��󡣤����ǡ�����Ū�˥⥸�塼������������ˡ��ʲ��˽񤤤Ƥ����ޤ���

�㤨�С�((<URL:/repos/ruby/pwm>))��((<Pseudo Web Mail>))�Υ⥸�塼��˥��������������Ȥ��ޤ������ΤȤ����ޤ�((<URL:/repos/ruby/>))�Ͻ���Ƥ��ʤ��Ȥ��ޤ���

���λ��Ϥޤ�����ݥ��ȥ�((<URL:/repos/>))��ruby�Ȥ����⥸�塼��򥤥�ݡ��Ȥ��ޤ���

  % cd /usr/tmp
  % rm -rf tmp
  % mkdir -p tmp/ruby
  % svn import tmp http://www.cozmixng.org/repos/

�Ť�svn����

  % svn imoprt http://www.cozmixng.org/repos/ tmp

���⤷��ޤ���

���ΤȤ�������񤯤���˴Ķ��ѿ�SVN_EDITOR�˻��ꤵ�줿���ǥ�������ư���ޤ���SVN_EDITOR�����ꤵ��Ƥ��ʤ���VISUAL��VISUAL����ꤵ��Ƥ��ʤ���EDITOR�˻��ꤵ��Ƥ��륨�ǥ�����ư���ޤ���EDITOR����ꤵ��Ƥ��ʤ��ȥ��顼�ǽ�λ���ޤ���

���ץ����򤤤��Ĥ��Ҳ𤷤Ƥ����ޤ���

: -m
  ���򥳥ޥ�ɥ饤�󤫤���ꤹ�뤳�Ȥ����ޤ���

: --username
  ��ݥ��ȥ�˥����������뤿��Υ桼��̾����ꤹ�뤳�Ȥ�����ޤ���

: --encoding
  ���󥳡��ǥ��󥰤���ꤹ�뤳�Ȥ������Τ����ܸ��ޤ�ե�����򥤥�ݡ��Ȥ���Ȥ��ϻ��ꤷ�Ʋ�������

���ץ�����¾�ˤ⤢��Τ�svn help import���ƤߤƲ�������

�����((<URL:/repos/ruby/>))�����褿�ΤǤ��β���pwm�⥸�塼�����Ͽ���ޤ���

  % cd /usr/tmp
  % rm -rf tmp
  % mkdir tmp
  % cp -R /path/to/pwm tmp
  % svn import http://www.cozmixng.org/repos/ruby/ tmp --encoding EUC-JP -m "	* Start Pseudo Web Mail"

�����((<URL:/repos/ruby/pwm/>))������ޤ���

���ʤߤ˺���ξ��ϰʲ��Τ褦�ˤ��Ƥ�����פǤ���

  % cd /usr/tmp
  % rm -rf tmp
  % mkdir -p tmp/ruby
  % cp -R /path/to/pwm tmp/ruby
  % svn import http://www.cozmixng.org/repos/ tmp --encoding EUC-JP

�Ǥ⡢������Ȥ��Ĥ�֥饦���ǥ������������HEAD���������ʤ��Τ����̤�/repos/ruby/pwm/{trunk,tags/0.0.1,tags/0.0.2}/�ʤɤȤ��������ˤ��ޤ���

  % cd /usr/tmp
  % rm -rf tmp
  % mkdir -p tmp/ruby/pwm/trunk
  % cp -R /path/to/pwm tmp/ruby/trunk
  % svn import http://www.cozmixng.org/repos/ tmp --encoding EUC-JP

������trunk����tags/0.0.1�ʤɤˤ�copy��Ȥ����ɤ��Ǥ�������ϥ���ܥ�å���󥯤ߤ����ʤ�Τ餷���Τ�̵�̤˥ǥ��������̤������뤳�Ȥ�̵�������Ǥ����ޤ��������TAG���Ĥ����Ȥ������ȤǤ���

  % svn copy http://www.cozmixng.org/repos/pwm/trunk http://www.cozmixng.org/repos/pwm/tags/0.0.1

�⤷��tags���Ǥ��Ƥ��ʤ��Ȥ���svn mkdir�Ǥ⤷�Ƥ����Ф����Ǥ��礦��

  % svn mkdir http://www.cozmixng.org/repos/pwm/tags

== �����å�������

����Ͽ����PWM������å������Ȥ���ˤϰʲ��Τ褦�ˤ��ޤ���

  % svn co http://www.cozmixng.org/repos/ruby/pwm/trunk hoge

��������ȥ����ȥǥ��쥯�ȥ��hoge�Ȥ����ǥ��쥯�ȥ꤬�����((<URL:/repos/ruby/pwm/trunk>))�Υե����뤬�����å������Ȥ���ޤ���hoge���ά����Ȥ����Ǥ�trunk�����ꤵ�줿��Τȸ��ʤ���ޤ���

����Ū��CVS�Ȱ��ʤΤǸ�ϼ��ϤǴ�ĥ�äƲ����������ʤߤ˻䤬��ʬ�η׻�����Subversion�򥤥󥹥ȡ��뤷��Ϯ�äƤ������Υ�⤬((<URL:/~kou/linux/svn>))�ˤ���ޤ���

== TIPS

=== Subversion��Web�����Ȥ����

Subversion�ǥ����ȴ�������ˤϥץ�ѥƥ���Ȥ��Ȥ����Ǥ��礦��

�㤨�аʲ��Τ褦�ˤ���ȡ��֥饦���ǥ�ݥ��ȥ�򸫤Ƥ�Subversion�Ǵ�������Ƥ���Ȥϵ��դ��ʤ��Ǥ��礦��

  % find . -regex ".*\.html\(\...\)?" -exec svn propset \
    svn:mime-type "text/html; charset=UTF-8" {} \;
  % find . -name "*.css" -exec svn propset svn:mime-type text/css {} \;
  % find . -name "*.png" -exec svn propset svn:mime-type image/png {} \;
  % find . -name "*.gif" -exec svn propset svn:mime-type image/gif {} \;
  % find . -regex ".*\.\(jpg\|jpeg\|jpe\)" \
    -exec svn propset svn:mime-type image/jpeg {} \;

=== �����ɤ��狼��󤬥��顼���Ф�

�Ȥꤢ�����ʲ���¹Ԥ��ƤߤƤ������ĩ�路�ƤߤƲ�������

  % svn cleanup
