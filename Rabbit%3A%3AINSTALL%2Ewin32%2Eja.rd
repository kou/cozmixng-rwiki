# -*- rd -*-

= INSTALL.win32.ja

$Id: INSTALL.win32.ja 560 2006-02-08 01:49:43Z kou $

Windows���Rabbit��¹Ԥ���Τ����ѤǤ����ʲ��򻲹ͤˤ��ƴ�
ĥ�äƤ���������

== Ruby ���ΤΥ��󥹥ȡ���

ruby 1.8.4 �Υ��󥹥ȡ��롣One-Click Installer��Ȥ��Τ���
((-�ޤ�preview3�����ɡ�����פǤ��礦��-))��

: ruby184-16p3.exe
   ((<URL:http://rubyforge.org/frs/download.php/8338/ruby184-16p3.exe>))

== RDTool �Υ��󥹥ȡ���

((<RAA:rdtool>)) �򥤥󥹥ȡ��뤹�롣

���������֤�Ÿ�����ơ�setup.rb ��¹Ԥ��ƥ��󥹥ȡ��뤹�롥

: rdtool-0.6.20.tar.gz
   ((<URL:http://www.moonwolf.com/ruby/archive/rdtool-0.6.20.tar.gz>))

== Ruby/GTK2�Υ��󥹥ȡ���

���������֤�Ÿ�����ơ�install.rb ��¹Ԥ��ƥ��󥹥ȡ��뤹�롣

: ruby-gtk2-0.14.1-1-i386-msvcrt-1.zip
   ((<URL:http://prdownloads.sourceforge.net/ruby-gnome2/ruby-gtk2-0.14.1-1-i386-msvcrt-1.zip>))

== GTK+ 2�Υ��󥹥ȡ���

GLADE for Windows �� GTK+ 2 �ѥå������򥤥󥹥ȡ��뤹�롣

: gtk-win32-2.8.8-rc2.exe
   ((<URL:http://gladewin32.sourceforge.net/modules/wfdownloads/visit.php?lid=95>))

== Rabbit �Υ��󥹥ȡ���

install.bat ��¹Ԥ��Ƥ���������


== EPS ��ɽ������

(1) AFPL Ghostscript 8.53 for Win32 �򥤥󥹥ȡ��뤹�롣

    : gs853w32.exe
        ((<URL:http://www.cs.wisc.edu/~ghost/>))

(2) ���󥹥ȡ���� <���󥹥ȡ�����>/gs/gs8.53/bin �� PATH ���̤���

== �����������ɤο��Ť���Ԥ�

(1) Enscript �򥤥󥹥ȡ��뤹�롣

    : enscript-1.6.3-9-bin.exe
        ((<URL:http://sourceforge.net/project/showfiles.php?group_id=23617&package_id=16960>))

(2) <Enscript �Υ��󥹥ȡ�����>/bin �� PATH ���̤���

(3) ruby �����ɤ򿧤Ť�������ϡ��ʲ��Υ��ޥ�ɤ� ruby.st �⥤�󥹥ȡ��뤹�롣

      > cd <Enscript �Υ��󥹥ȡ�����>\share\enscript\hl
      > ruby -ropen-uri -e "puts open('http://rubyforge.org/cgi-bin/viewcvs.cgi/*checkout*/support/ruby.st').read" > ruby.st

(4) ((<RAA:htree>)) �򥤥󥹥ȡ��뤹�롣

    ���������֤�Ÿ�����ơ�install.rb ��¹Ԥ��ƥ��󥹥ȡ��뤹�롣

    : htree.tar.gz
        ((<URL:http://cvs.m17n.org/viewcvs/ruby/htree.tar.gz>))

== rabrick ��Ȥ�

((<RAA:div>)) �򥤥󥹥ȡ��뤹�롣

���������֤�Ÿ�����ơ�install.rb ��¹Ԥ��ƥ��󥹥ȡ��뤹�롣

: div-1.3.2.tar.gz
   ((<URL:http://www2a.biglobe.ne.jp/~seki/ruby/div-1.3.2.tar.gz>))


���ݤǤ����ޤ���
