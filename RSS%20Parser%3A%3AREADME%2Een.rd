# -*- rd -*-

= README.en

$Id: README.en 494 2004-11-03 06:15:01Z kou $

((*The performance of this library on ruby 1.8 is 10 times
as slow as on ruby 1.6 until 0.0.6. Use 0.0.7 or later if
you use on ruby 1.8.*))

Sorry for my funny English :-(

== Name

RSS Parser (I don't use Ruby/RSS because of duplication)

== Author

Kouhei Sutou <kou@cozmixng.org>

== Licence

Ruby's

== Please

I am thinking that this library should parse RSS 0.9x/2.0
more strictly. So I am asking for test cases.

== Mailing list

Send mail that To field is cozdev@cozmixng.quickml.com , Cc
field is kou@cozmixng.org and Subject and Body contain
somthig to
((<"cozdev@cozmixng.quickml.com"|URL:mailto:cozdev@cozmixng.quickml.com?cc=kou@cozmixng.org&subject=Join!>)).

Note that this mailing list's main language is Japanese. But
English mail is welcome too.

== What's this?

This library can parse ((<RSS(RDF Site Summary)
1.0|URL:http://web.resource.org/rss/1.0/>)), RSS 0.9x/2.0 with
validation (or non validation).

This library contains a
((<tDiary|URL:http://www.tdiary.org/>))'s plugin that
fetches RSS, parses it, and displays result.

This library is included in CVS HEAD of ruby.

== Dependency library

  * XML processor: (((<RAA:REXML>)) greater or equal 2.5.0,
    ((<RAA:xmlscan>))) or ((<RAA:xmlparser>))

=== Suggested library

  * Iconv binding
  * ((<RAA:Uconv>))

== Download

((<URL:http://www.cozmixng.org/~kou/download/rss.tar.gz>))

  % svn co http://www.cozmixng.org/repos/ruby/rss/trunk rss

== Install

  % ruby setup.rb config
  % ruby setup.rb setup
  # ruby setup.rb install

or 

  # ruby setup.rb

=== Install to tDiary

Copy or make symbolic link from rss-recent.rb under
sample/tdiary_plugin to the directory for tDiary's plugin.

You can use below method if you install this plugin.

--- rss_recent(url, max=5, cache_time=3600)

This parses RSS that is ((|url|)) and display top ((|max|))
items. Result of parsing RSS is cached over ((|cache_time|))
seconds.

  * ((|url|)) : URL that specify the RSS
  * ((|max|)) : The number of the maximum display items
  * ((|cache_time|)) : Time to cash the RSS(second)
