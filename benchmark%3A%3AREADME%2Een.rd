# -*- rd -*-

= README.en

$Id: README.en 175 2004-06-13 10:18:28Z kou $

== Author

Kouhei Sutou <kou@cozmixng.org>

== License

GPL or BSD License

== Mailing list

Send mail that To field is cozdev@cozmixng.quickml.com , Cc
field is kou@cozmixng.org and Subject and Body contain
somthig to
((<"cozdev@cozmixng.quickml.com"|URL:mailto:cozdev@cozmixng.quickml.com?cc=kou@cozmixng.org&subject=Join!>)).

Note that this mailing list's main language is Japanese. But
English mail is welcome too.

== What's this?

It is benchmark library for Gauche. It references
benchmark.rb in ruby's distribution.

== Get

((<URL:http://www.cozmixng.org/~kou/download/benchmark.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/benchmark/trunk benchmark

== Install

  # gosh install/install.scm

== Usage

The following is a simple usage.

  (use benchmark)

  (bm (lambda (r)
        (report r (lambda () Do something what you want to benchmark here))
        ...))

Files under sample/ directory have concrete usage.
