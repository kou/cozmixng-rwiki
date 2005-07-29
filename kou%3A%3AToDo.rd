= kou::ToDo

* svn: ����ʤ��Τ⤢��������ɡ��Ȥꤢ�����ꥹ�ȥ��åפ��Ƥ�����
  * \/: svn_auth.h: Subversion's authentication system
    * svn_auth_open
    * svn_auth_set_parameter
    * svn_auth_get_parameter
    * x: svn_auth_first_credentials
    * x: svn_auth_next_credentials
    * x: svn_auth_save_credentials
  * -: svn_base64.h: Base64 encoding and decoding functions
  * svn_client.h: Public interface for libsvn_client
  * -: svn_cmdline.h: Support functions for command line programs
  * svn_config.h: Accessing SVN configuration files
  * -: svn_ctype.h: Character classification routines
  * -: svn_dav.h: Code related to WebDAV/DeltaV usage in Subversion
  * svn_delta.h: Delta-parsing
  * svn_diff.h: Contextual diffing
  * o: svn_error.h: Common exception handling for Subversion
  * o: svn_error_codes.h: Subversion error codes
  * svn_fs.h: Interface to the Subversion filesystem
  * -: svn_hash.h: Dumping and reading hash tables to/from files
  * svn_io.h: General file I/O for Subversion
  * -: svn_md5.h: Converting and comparing MD5 checksums
  * o: svn_nls.h: Support functions for NLS programs
  * svn_opt.h: Option and argument parsing for Subversion command lines
  * -: svn_path.h: A path manipulation library
  * o: svn_pools.h: APR pool management for Subversion
  * svn_props.h: Subversion properties
  * -: svn_quoprint.h: Quoted-printable encoding and decoding functions
  * svn_ra.h: Repository Access
  * -: svn_ra_svn.h: Libsvn_ra_svn functions used by the server
  * svn_repos.h: Tools built on top of the filesystem
  * -: svn_sorts.h: All sorts of sorts
  * svn_string.h: Counted-length strings for Subversion, plus some C string goodies
  * -: svn_subst.h: Data substitution (keywords and EOL style)
  * svn_time.h: Time/date utilities
  * svn_types.h: Subversion's data types
  * svn_utf.h: UTF-8 conversion routines
  * \/: svn_version.h: Version information
    * svn_ver_compatible
    * svn_ver_equal
    * svn_subr_version
    * \/: svn_ver_check_list
  * svn_wc.h: The Subversion Working Copy Library
  * -: svn_xml.h: XML code shared by various Subversion libraries

* ((<Gauche>))��((<SWIG>))�б���
  * -> �����äƤ��ꤷ�ޤ����� qt binding���ߤ����Τ�swig��Ȥ������ʤȻפäƤ����򸫤Ĥ��ޤ�����((<�ͤ�|URL:http://www.soraneko.com/~nel/>))
  * �����ʤ������Ƕ�Ϥ�ä������դ��Ƥ��ޤ��󡥡֤���������Gauche�γ�ĥ�饤�֥��äƽ񤤤����ʤ��ʤ�����������Ĵ�٤ʤ���פȤ��פäƤ��뤦���˻��֤��᤮�Ƥ��ޤ���
  * ������λ��Ǥ����Ǥϡ�������Ǥ�äƤߤޤ��͡�
* RWiki��rt2rwiki-lib��InlineParser��ɤ��ˤ����롥
* ((<Ruby>))�Ǽ������줿Relax NG�Х�ǡ�������/õ��
* RWiki��RD2RWikiVisitor#default_ext_*��rwiki/rd/ext/�ʲ��Υ��饹�˰�ư���ƤϤɤ�������Ƥ��롥
* ���ߤΥͥ���ͤ��롥
  * �ؿ���make
  * ((<Self Tutorial|URL:http://research.sun.com/research/self/release_4.0/Self-4.0/Tutorial/>))
  * �����ڥ��Ȼظ�
* Dia��rotate��������롥
* Gauche��GTK+ �Υץ��쥹�С��ȥ����ॢ���ȤȤ��ˤĤ��ƤޤȤ�롥
* Metacity��gconftool-2�ˤĤ��ƤޤȤ�롥���ץ����: -R, --set, --type
* WiLiKi:kou����������
* ((<benchmark>)) -> ((<bsm>))
* ((<GalleryAdministrator>))�ʤȤ�������RubyPhoto�ˤι�®����
* RWiki��navi��border��ɴʬΨ�Ǥ����Ǥ���褦�ˤ��롥�㤨�С����30%�ʤĤޤꡤborder�ϡʲ������70%�ˤϥإå���ɽ���Ȥ���
* Rabbit: Thread -> Gtk��timeout
* Rabbit: SOAP���󥿡��ե�����

== pending
* ((<wsm>))��gosh��SEGV��Τ��ɤ���
  * -> ����åɤ������ΤǤ�����᤿��
* ((<wsm>))�����������Τ��Ӥˤɤ�ɤ����äƤ����Τ�ɤ��ˤ����롥
  * --enable-threads=no�ˤ���gosh�򥳥�ѥ��뤷����ľ�ä��Τǡ�FreeBSD����Boehm GC��pthreads������������������Ȥ������Ȥ����֡�
* ((<WikiLink>))����Ͽ�Ǥ��ʤ��ʤäƤ���Τ�ľ����
  * �ʤˤ⤷�Ƥ��ʤ�����ľ�äƤ��롩����
