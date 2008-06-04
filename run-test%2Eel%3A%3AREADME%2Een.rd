# -*- rd -*-

= README.en

$Id: README.en 5 2008-06-03 05:22:28Z  $

== Name

run-test.el

== Author

Kouhei Sutou <kou@cozmixng.org>

== License

GPL or BSD License

== What's this?

An Emacs-Lisp which suports running tests.

== Get

((<URL:http://www.cozmixng.org/~kou/download/run-test.tar.gz>))

  % svn co http://www.cozmixng.org/repos/elisp/run-test/trunk run-test

== Install

  % sudo ./install.sh

== Uninstall

  % sudo ./uninstall.sh

== Usage

lib/run-test.el is Emacs-Lisp for support running test in
Emacs. lib/run-test-setting.el is Emacs-Lisp for setting
run-test.el

Write following code in your .emacs.

  (setq load-path (cons directory-which-has-run-test{,-setting}.el load-path))
  (load "run-test-setting")

We assume that we want to run tests written by
((<GaUnit|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=GaUnit>)).

Write run-test.scm which run test like the below:

  #!/usr/bin/env gosh

  (add-load-path ".")

  (use test.unit)

  (define base-dir (sys-dirname *program-name*))
  (for-each load (glob #`",|base-dir|/**/test-*.scm"))


Make a directory whose name is `test' and move run-test.scm to
the directory. Don't forget add execution authority to
run-test.scm.

Make some test files whose name is started in `test-' in the
`test' directry. The organization of directory is following.

  topdir --- test --- run-test.scm
                   |
                   +- test-hoge.scm
                   |
                   .
                   .
                   .
                   |
                   +- test-fuga.scm

A test (run-test.scm) is invoked in `topdir'. That is test
is invoked following.

  % test/run-test.scm

Don't forget it when you write run-test.scm.

Setup is finished.

You can run test (topdir/test/run-test.scm) by C-cC-t
(run-test) when you are in under `topdir' and jump to error
assertion by C-x`.

You can run test by C-cT(run-test-in-new-frame), too. It
runs test in new frame. I advice you it is good when you run
test at the first.

Happy testing!!

== Key bindings

: C-cC-t
   Runs test.

: C-cT
   Runs test. A test result is showed in a new frame.

== Customize variables

: run-test-file-names
   Is is a list of base name of file that runs test.
   
   default: ("test/run-test" "test/runner" "run-test")

: run-test-suffixes
   It is a list of suffix that is added to
   ((|run-test-file|)).
   
   default: ("" ".scm" ".rb" ".py" ".sh")
