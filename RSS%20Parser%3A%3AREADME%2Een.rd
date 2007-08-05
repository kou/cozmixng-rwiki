# -*- rd -*-

= README.en

$Id: README.en 305 2007-08-04 05:07:22Z kou $

== Name

RSS Parser

== Author

Kouhei Sutou <kou@cozmixng.org>

== Licence

Ruby's

== Note

  * RSS Parser 0.1.7 or later requires ruby 1.8.2 or later.
  * Use RSS Parser 0.1.8 or later to handle Atom and Podcast
    related elements.
  * RSS Parser works more strictly in each upgrade. You may
    get empty string by #to_s even if you got RSS
    string. You will find problems by calling #validate.

== What's this?

This library can parse ((<RSS(RDF Site Summary)
1.0|URL:http://web.resource.org/rss/1.0/>)), RSS 0.9x/2.0
excluding 0.90 and ((<Atom
1.0|URL:http://www.ietf.org/rfc/rfc4287.txt>)) with
validation (or non validation).

This library is included in ruby's distribution file.

== Dependency library

  * XML processor: (((<RAA:REXML>)) greater or equal 2.5.0,
    ((<RAA:xmlscan>))) or ((<RAA:xmlparser>))

=== Suggested library

  * Iconv binding
  * ((<RAA:Uconv>))

== Download

((<URL:http://www.cozmixng.org/~kou/download/rss.tar.gz>))

  % svn co http://www.cozmixng.org/repos/rss/trunk rss

== Install

  % ruby setup.rb config
  % ruby setup.rb setup
  # ruby setup.rb install

or

  # ruby setup.rb

== FAQ

=== I want to parse RSS 0.90

Sometimes RSS 0.90 can be treated as RSS 1.0. If you need to
parse an RSS 0.90 feed try to run the following:

  def rss090_to_rss10(feed)
    feed.sub(%r{xmlns=(['"])http://my.netscape.com/rdf/simple/0.9/\1},
             'xmlns="http://purl.org/rss/1.0/"')
  end
  rss = RSS::Parser.parse(rss090_to_rss10(feed), false)

== Thanks

  * Kazuhiko: He sent me many bug reports.
  * Tomoaki: He sent me a bug report of documents.
  * Chris Lee: He sent me a bug report.
  * Ronald Pijnacker: He sent me a bug report.
  * Kazuhiro NISHIYAMA: He sent me a bug report of documents.
  * Christian W. Zuckschwerdt: He gave me an advice for
    treating RSS 0.90.
