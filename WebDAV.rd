= WebDAV

WebDAV�ط��κ�ȵ�Ͽ�Ǥ���

== ����

WebDAV�⥸�塼��(mod_dav.so, mod_dav_fs.so)��Apache���Ȥ߹��ޤ�Ƥ����ΤȤ��ޤ���

�ޤ���WebDAV�ѤΥ�å��ե��������ꤷ�ޤ�����å��ե�����ˤϳ�ĥ�Ҥ��դ��ƤϤ����ޤ���

  DAVLockDB /var/lock/httpd/DAVLock

��å��ե�������������ǥ��쥯�ȥ�ϡ�Apache��¹Ԥ��Ƥ���桼�����񤭹����褦�ˤ��Ƥ����ޤ����Ȥ����Τ⡤��ˤϤɤ��̾���Υ�å��ե��������Τ�ʬ����ʤ�����Ǥ���Debian��Apache�Ǥ�DAVLockDB�ǻ��ꤷ��̾���Υ�å��ե�����(�Х��ʥꡤ���֤�SDBM)����������ޤ�����FreeBSD��Apache�Ǥ�DAVLockDB�ǻ��ꤷ��̾����.dir, .pag���դ�����å��ե����뤬��������ޤ�����

  % sudo mkdir -p /var/lock/httpd
  % sudo /usr/sbin/chown www:www /var/lock/httpd

WebDAV�Ѥ˸�������ǥ��쥯�ȥ�ؤ�alias�����ꤷ�ޤ���

  Alias /webdav /usr/local/webdav

���Υǥ��쥯�ȥ��Apache�μ¹ԥ桼���˽񤭹��߸���̵����Ф����ޤ���

  % sudo mkdir -p /usr/local/var/webdav
  % sudo /usr/sbin/chown www:www /usr/local/var/webdav

���Ȥ�alias�����ꤷ���ѥ���DAV����Ѳ�ǽ�ˤ�������Ǥ���

  <Location /webdav>
    DAV on
  </Location>

.htaccess�Ȥ��֤��������񤭴�����줿��Ȥ���CGI�Ȥ�SSI�Ȥ��¹Ԥ����ʤ��褦�˰ʲ��Τ褦���������������⤷��ޤ���

  <Location /webdav>
    AllowOverride None
    Options None
    DAV on
  </Location>

�ե�����������餤�ϸ����Ƥ⤤���ʤ餳�Τ��餤����

  <Location /webdav>
    AllowOverride None
    Options Indexes
    DAV on
  </Location>

���꤬��������ꡤ���饤����Ȥ�������������ȥ�å��ե����뤬����ޤ���

== ����������ˡ

=== Windows��ȤäƤ����

"Web�ե����"��ȤäƤ������������ɥ쥹��http://www.cozmixng.org/webdav/�Ǥ���

����: ((<URL:http://support.jca.apc.org/software/webfolder.html>))

=== MacOS X��ȤäƤ����

�Ȥ��뤽���Ǥ������ɥ쥹��http://www.cozmixng.org/webdav/�Ǥ���

����: ((<URL:http://homepage1.nifty.com/glass/tom_neko/web/web_webdav.html#client>))

=== UNIX��OS��ȤäƤ����

Konqueror��ȤäƤ���ʤ饹�������webdav�Ȥ��ƥ����������Ƥ�����������: webdav://www.cozmixng.org/webdav/

Nautilus��ȤäƤ���ʤ饹�������http�Ȥ��ƥ����������Ƥ�����������: http://www.cozmixng.org/webdav/

Emacs��ȤäƤ���ʤ�eldav�򥤥󥹥ȡ��뤷��URI������:���դ��ƥ����������Ƥ�����������: :http://www.cozmixng.org/webdav/

�������ȤäƤ���ͤ�cadaver�򥤥󥹥ȡ��뤷�ƥ����������Ƥ�����������: cadaver http://www.cozmixng.org/webdav/
