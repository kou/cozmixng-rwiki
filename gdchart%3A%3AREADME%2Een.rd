# -*- rd -*-

= README.en

$Id: README.en 567 2005-04-18 14:31:11Z kou $

== Name

gdchart

== Author

Kouhei Sutou <kou@cozmixng.org>

== Licence

Ruby's

== Mailing list

Send mail that To field is cozdev@cozmixng.quickml.com , Cc
field is kou@cozmixng.org and Subject and Body contain
somthig to
((<"cozdev@cozmixng.quickml.com"|URL:mailto:cozdev@cozmixng.quickml.com?cc=kou@cozmixng.org&subject=Join!>)).

Note that this mailing list's main language is Japanese. But
English mail is welcome too.

== What's this?

This is a binding of
((<GDChart|URL:http://www.fred.net/brv/chart/>)). An
interface between Ruby and C is generated by
((<SWIG|URL:http://www.swig.org/>)).

A similar library is ((<RAA:ruby-gdchart>)).

== Dependency

  * ((<GD|URL:www.boutell.com/gd/>))
  * ((<GDChart|URL:http://www.fred.net/brv/chart/>))
  * ((<SWIG|URL:http://www.swig.org/>))

=== Suggested

GDChart is compiled with following, too.

  * ((<libfreetype|URL:http://sourceforge.net/projects/freetype/>))
  * ((<libjpeg|URL:http://www.ijg.org/>))

== Download

((<URL:http://www.cozmixng.org/~kou/download/gdchart.tar.gz>))

  % svn co http://www.cozmixng.org/repos/ruby/gdchart/trunk gdchart

== Install

  % ruby setup.rb config

If you want to add include path, type like the following.

  % ruby setup.rb config -- -Ipath1 -Ipath2 ...

And rest is same as alway.

  % ruby setup.rb setup
  # ruby setup.rb install

== Usage

See under sample/ directory. Sorry, I'll write more details
later, perhaps.


Currently, use irb with the following setting in which is
written ~/.irbrc.

  require 'irb/completion'

This setting make irb enable method completion with [TAB].

For example, you can use like the following if you want to
make pie chart.

  % irb -r gdchart/pie
  irb(main):001:0> pie = GDChart::Pie.new
  irb(main):002:0> pie.[TAB]


Or, see part of lib/gdchart/base.rb, lib/gdchart/graph.rb
and lib/gdchart/pie.rb followed by the following comment.

  # _
  ### method generation

=== Note for use TrueType

Note the following things if you use TrueType font.

  * Set character encoding to UTF-8.

  * Set font and ptsize (not size).
    
    The following is code which sets graph title.
    
      graph = GDChart::Graph.new
      graph.title = "Title"
      graph.title_font = ".../XXX.ttf"
      graph.title_ptsize = 20.0

== Thanks

  * Markus: He sent me a bug report.
  * Frank: He sent me a bug report.
