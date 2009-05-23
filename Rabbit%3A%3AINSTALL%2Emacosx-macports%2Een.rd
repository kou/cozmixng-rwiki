= INSTALL.macosx-macports.en

$Id: INSTALL.macosx-macports.en 1226 2009-03-12 11:13:56Z kou $

This document describes how to install Rabbit with MacPorts and how to use
Rabbit on Mac OS X.

== Requirements

The following programs are needed.

* Xcode Tools (from Xcode Tools DVD or ADC)
* X11 (from Mac OS X System DVD)
* Subversion
  * from MacPorts (sudo port install subversion)
  * from ((<URL:http://metissian.com/projects/macosx/subversion/>))

Remember to select "X11 SDK" when installing the Xcode Tools.

== Install MacPorts

see ((<URL:http://www.macports.org/>)).

=== Configuration of MacPorts

First, get the Rabbit portfiles from the subversion repository,

  ~% svn co http://www.cozmixng.org/repos/dports/trunk dports
  ~% cd dports
  ~/dports% portindex

Then, edit /opt/local/etc/macports/sources.conf like this,

  # To enable your local ports repository, uncomment and customize the
  # following line to point at your local dports directory
  # Example: file:///Users/landonf/misc/darwinports/dports
  #
  file:///Users/yourname/dports # <- here
  # To get darwinports from the darwinports rsync server use:
  # rsync://rsync.darwinports.org/dpupdate/dports
  rsync://rsync.darwinports.org/dpupdate/dports

(/Users/yourname is your home directory)

"port info" command tells you if the installation succeeded or not.

  ### OK ###
  ~% port info rb-rabbit
  rb-rabbit 0.5.1, Revision 0, ruby/rb-rabbit
  {http://www.cozmixng.org/~rwiki/?cmd=view;name=Rabbit}
  # snip #

  ### NG ###
  ~% port info rb-rabbit
  No port rb-rabbit found.


== installing Rabbit

You might want to do the following to update information for
required ports.

  ~% sudo port sync

The following command will install rabbit and its dependencies.

  ~% sudo port install rb-rabbit


You can install these ports to make rabbit even better.

* htree (rb-htree) - enable syntax coloring
* Ruby-GetText-Package (rb-gettext) - enable I18N message catalogs

    ~% sudo port install rb-htree
    ~% sudo port install rb-gettext

== tips for X11 environment

=== launch X11.app

Rabbit requires X11.app, which is under /Applications/Utilities/.

=== DISPLAY environment variable

Mac OS X 10.4 or earlier, DISPLAY environment was not declared.
Remember to set this variable.

== upgrade Rabbit

the following operation upgrades your Rabbit.

  ~% sudo port sync
  ~% sudo port upgrade rb-rabbit

If you want to upgrade Rabbit only (rb-rabbit), you can upgrade with the "-n"
option.

  ~% sudo port -n upgrade rb-rabbit

== Contact

* Rabbit::UsersGroup.ja ((<URL:http://www.cozmixng.org/~rwiki/index.rb?cmd=view;name=Rabbit%3A%3AUsersGroup.ja>))
* Kimura Wataru (kimuraw at i nifty.jp) - maintainer of Rabbit MacPorts
