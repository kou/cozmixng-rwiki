# -*- rd -*-

= README.en

$Id: README.en 14 2004-09-14 05:23:13Z kou $

== Author

Kouhei Sutou <kou@cozmixng.org>

== License

GPL

== Mailing list

Send mail that To field is cozdev@cozmixng.quickml.com , Cc
field is kou@cozmixng.org and Subject and Body contain
somthig to
((<"cozdev@cozmixng.quickml.com"|URL:mailto:cozdev@cozmixng.quickml.com?cc=kou@cozmixng.org&subject=Join!>)).

Note that this mailing list's main language is Japanese. But
English mail is welcome too.

== What's this?

An IM engine for ((<SCIM|URL:http://www.scim-im.org/>)) to
write an IM engine for SCIM by Ruby.

== Dependency libraries

  * ((<SCIM|URL:http://www.scim-im.org/>))
  * ((<scim|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=scim>)):
    A Ruby bindings for SCIM

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
