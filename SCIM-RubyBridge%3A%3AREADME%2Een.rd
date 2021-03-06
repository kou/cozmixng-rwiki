# -*- rd -*-

= README.en

$Id: README 16 2006-09-05 02:55:33Z kou $

== Author

Kouhei Sutou <kou@cozmixng.org>

== License

Ruby's or LGPL

== Mailing list

Send mail that To field is cozdev@cozmixng.quickml.com , Cc
field is kou@cozmixng.org and Subject and Body contain
somthig to
((<"cozdev@cozmixng.quickml.com"|URL:mailto:cozdev@cozmixng.quickml.com?cc=kou@cozmixng.org&subject=Join!>)).

Note that this mailing list's main language is Japanese. But
English mail is welcome too.

== What's this?

This is a binding of ((<SCIM|URL:http://www.scim-im.org/>))
and an IM engine for ((<SCIM|URL:http://www.scim-im.org/>))
to write an IM engine for SCIM by Ruby. An interface between
Ruby and C is generated by
((<SWIG|URL:http://www.swig.org/>)).

== Dependency libraries

  * ((<SCIM|URL:http://www.scim-im.org/>))
  * ((<SWIG|URL:http://www.swig.org/>))

== Get

((<URL:http://www.cozmixng.org/~kou/download/scim-ruby-bridge.tar.gz>))

  % svn co http://www.cozmixng.org/repos/c/scim-ruby-bridge/trunk scim-ruby-bridge

== Install

  % ./configure
  % make
  # make install

== Usage

There are examples (is example, for now) under
data/scim/engine/ directory. Those examples are IM engines
written by Ruby. See those examples. Now, there are the
following examples:

  * Ruby: An IM engine which evaluates inputted text as Ruby
    expression and the evaluated result is converted result
    of this IM engine.

== Thanks
