# -*- rd -*-

= INSTALL.win32.ja

$Id: INSTALL.win32.ja 929 2007-06-18 10:47:31Z kou $

Windows���Rabbit��¹Ԥ���Τ����ѤǤ����ʲ��򻲹ͤˤ��ƴ�
ĥ�äƤ���������

== Ruby ���ΤΥ��󥹥ȡ���

ruby 1.8.6 �Υ��󥹥ȡ��롣One-Click Installer��Ȥ��Τ��ڡ�

: ruby186-25.exe
   ((<URL:http://rubyforge.org/frs/download.php/18566/ruby186-25.exe>))

== RDTool �Υ��󥹥ȡ���

((<RAA:rdtool>)) �򥤥󥹥ȡ��뤹�롣

���������֤�Ÿ�����ơ�setup.rb ��¹Ԥ��ƥ��󥹥ȡ��뤹�롥

: rdtool-0.6.20.tar.gz
   ((<URL:http://www.moonwolf.com/ruby/archive/rdtool-0.6.20.tar.gz>))

== Ruby/GTK2�Υ��󥹥ȡ���

�ʲ���URL�򻲹ͤˤ���Ruby/GTK2(GTK2����)�κǿ��Ǥ򥤥󥹥ȡ�
�뤹�롣

((<URL:http://ruby-gnome2.sourceforge.jp/ja/hiki.cgi?%A5%A4%A5%F3%A5%B9%A5%C8%A1%BC%A5%EB%A5%AC%A5%A4%A5%C9+Windows%CA%D4>))

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
      > ruby -ropen-uri -e "puts open('http://viewvc.rubyforge.mmmultiworks.com/cgi/viewvc.cgi/trunk/support/ruby.st?root=support&view=co').read" > ruby.st

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
