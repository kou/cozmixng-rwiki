# -*- rd -*-

= INSTALL.win32.en

$Id: INSTALL.win32.en 1415 2010-10-05 13:02:39Z kdmsnr $

== Install Ruby

Install ruby 1.8.6. You can use the convenient One-Click Installer.

: ruby186-25.exe
   ((<URL:http://rubyforge.org/frs/download.php/18566/ruby186-25.exe>))

== Install RDTool

Install ((<RAA:rdtool>)).

Extract the following archive and execute setup.rb to install.

: rdtool-0.6.20.tar.gz
   ((<URL:http://www.moonwolf.com/ruby/archive/rdtool-0.6.20.tar.gz>))

== Install Ruby/GTK2

Install the latest Ruby/GTK2 (including GTK+). The following
URL will help you:

((<URL:http://ruby-gnome2.sourceforge.jp/hiki.cgi?Install+Guide+for+Windows>))

== Install Rabbit!!

Execute install.bat.

== EPS format support

(1) Install AFPL Ghostscript for Win32.

    : gs853w32.exe
        ((<URL:ftp://mirror.cs.wisc.edu/pub/mirrors/ghost/AFPL/gs853/gs853w32.exe>))

(2) Add <Ghostscript Install Path>/gs/gs8.53/bin to the PATH environment variable.

== Source code highlighting support

(1) Install Enscript.

    : enscript-1.6.3-9-bin.exe
        ((<URL:http://sourceforge.net/project/showfiles.php?group_id=23617&package_id=16960>))

(2) Add <Enscript Install Path>/bin to the PATH environment variable.

(3) You may need to obtain ruby.st for Ruby syntax highlighting.

      > cd <Enscript Install Path>/share/enscript/hl
      > ruby -ropen-uri -e "puts open('http://viewvc.rubyforge.mmmultiworks.com/cgi/viewvc.cgi/trunk/support/ruby.st?root=support&view=co').read" > ruby.st

(4) Install ((<RAA:htree>)).

    Extract the following archive and execute install.rb to install.

    : htree.tar.gz
        ((<URL:http://cvs.m17n.org/viewcvs/ruby/htree.tar.gz>))

== Use rabrick

Install ((<RAA:div>)).

Extract the following archive and execute install.rb to install.

: div-1.3.2.tar.gz
   ((<URL:http://www2a.biglobe.ne.jp/~seki/ruby/div-1.3.2.tar.gz>))


Sorry for having so many steps.
