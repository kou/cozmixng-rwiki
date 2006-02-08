# -*- rd -*-

= INSTALL.win32.en

$Id: INSTALL.win32.en 560 2006-02-08 01:49:43Z kou $

== Install Ruby

Install ruby 1.8.4. Use One-Click Installer for convenience.

: ruby184-16p3.exe
   ((<URL:http://rubyforge.org/frs/download.php/8338/ruby184-16p3.exe>))

== Install RDTool

Install ((<RAA:rdtool>)).

Extract the following archive and execute setup.rb to install.

: rdtool-0.6.20.tar.gz
   ((<URL:http://www.moonwolf.com/ruby/archive/rdtool-0.6.20.tar.gz>))

== Install Ruby/GTK2

Extract the following archive and execute install.rb to install.

: ruby-gtk2-0.14.1-1-i386-msvcrt-1.zip
   ((<URL:http://prdownloads.sourceforge.net/ruby-gnome2/ruby-gtk2-0.14.1-1-i386-msvcrt-1.zip>))

== Install GTK+ 2

Install GTK+ 2 package of GLADE for Windows.

: gtk-win32-2.8.8-rc2.exe
   ((<URL:http://gladewin32.sourceforge.net/modules/wfdownloads/visit.php?lid=95>))

== Install Rabbit!!

Execute install.bat.


== Support EPS format

(1) Install AFPL Ghostscript for Win32.

    : gs853w32.exe
        ((<URL:ftp://mirror.cs.wisc.edu/pub/mirrors/ghost/AFPL/gs853/gs853w32.exe>))

(2) Add <Ghostscript Install Path>/gs/gs8.53/bin to the PATH environment variable.

== Support source code highlighting

(1) Install Enscript.

    : enscript-1.6.3-9-bin.exe
        ((<URL:http://sourceforge.net/project/showfiles.php?group_id=23617&package_id=16960>))

(2) Add <Enscript Install Path>/bin to the PATH environment variable.

(3) You may need to obtain ruby.st for Ruby syntax highlighting.

      > cd <Enscript Install Path>/share/enscript/hl
      > ruby -ropen-uri -e "puts open('http://rubyforge.org/cgi-bin/viewcvs.cgi/*checkout*/support/ruby.st').read" > ruby.st

(4) Install ((<RAA:htree>)).

    Extract the following archive and execute install.rb to install.

    : htree.tar.gz
        ((<URL:http://cvs.m17n.org/viewcvs/ruby/htree.tar.gz>))

== Use rabrick

Install ((<RAA:div>)).

Extract the following archive and execute install.rb to install.

: div-1.3.2.tar.gz
   ((<URL:http://www2a.biglobe.ne.jp/~seki/ruby/div-1.3.2.tar.gz>))


Sorry for having long steps.
