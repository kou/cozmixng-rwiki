# -*- rd -*-

= README.en

$Id: README.en 299 2004-09-28 14:53:41Z kou $

((*I'm not good in English. Please fix.*))

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

GaUnit is Unit Testing Framework for Gauche. This includes
Emacs-Lisp which suports running tests.

((<SchemeUnit|URL:http://schematics.sourceforge.net/schemeunit.html>))
is similar program.

== How to pronounce?

What about `go-ni-tto'?

== Get

((<URL:http://www.cozmixng.org/~kou/download/gaunit.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/gaunit/trunk gaunit

== Install

  # gosh install/install.scm

== Usage

Make the program that define some tests.

  (use test.unit)

  (define-test-suite ...)
  or
  (define-test-case ...)

Execute the program. GaUnit exports (({main})) procedure
that run test. So, you don't need define (({main}))
procedure.

  % gosh test-program.scm

=== Options

(({main})) procedure exported by GaUnit accepts some options.

: -uUI, --ui=UI
   It specifies user interface that show test
   results. ((|UI|)) is following.

   : t[ext]
      GaUnit uses text version user interface. It is default.

   : g[tk]
      GaUnit users GTK+ version user interface. It has
      following key bindings. Those bindings ignore prefix
      like Ctrl, Alt and so on. So you can use l, Ctrl + l
      or Alt + l.
      
      : l
         Push Load button.
      
      : r
         Push Run button.
      
      : q, ESC
         Quit.


: -vLEVEL, --vervose=LEVEL
   Is specifies output level. It have its place in text
   version user interface, now. ((|LEVEL|)) is follwing.

   : s[ilent]
      GaUnit shows the result only when a test is failure or
      a error occur. GaUnit show nothing if a test is success.

   : p[rogress]
      GaUnit shows "." when a test is success. Otherwise, it
      is same as silent.

   : n[ormal]
      GaUnit shows test suite name when it is
      executed, and test number, assertion number, success
      assertion number, failure asertion number, error
      number and processing time when test is
      finished. Otherwise, it is same as progress. It is
      default.

   : v[erbose]
      GaUnit shows test case name when it is
      executed. Otherwise, it is same as normal.

: -sREGEXP, --test-suite=REGEXP

   Run only test suites that those name are matched by REGEXP.

: -cREGEXP, --test-case=REGEXP

   Run only test cases that those name are matched by REGEXP.

: -tREGEXP, --test=REGEXP

   Run only tests that those name are matched by REGEXP.

: -h, --help
   GaUnit shows usage and exit.

For example, you can use GTK+ version user interface if you
type following.

  % gosh test-program.scm -ug

You can get verbose log if you type following.

  % gosh test-program.scm -vv

=== Reference

==== Assertions

GaUnit has some procedures to test.

((|[message]|)) is optional. It is string which is message
on failure or a procedure which is accept an argument. If it
is a procedure test result is passed to the procedure.

--- fail([message])
    
    It always fail.

--- assert(pred expected actual [message])
    
    It succeeds when (({(pred expected actual)})) is not #f.

--- assert-equal(expected actual [message])
    
    It succeeds when (({(equal? expected actual)})) is #t.

--- assert-true(actual [message])
    
    It succeeds when ((|actual|)) is #t.

--- assert-false(actual [message])
    
    It succeeds when ((|actual|)) is #f.

--- assert-instance-of(expected-class object [message])
    
    It succeeds when ((|object|)) is an instance of ((|expected-class|)).

--- assert-raise(expected-class thunk [message])
    
    It succeeds when exception which is raised in
    ((|thunk|)) (which is a non arity procedure) is an instance of
    ((|expected-class|)).

--- assert-error(tunk [message])
    
    Is succeeds when ((|exception|)) is raised in
    ((|thunk|)) (which is a non arity procedure).

--- assert-each(assert-proc lst &keyword :apply-if-can :run-assert :prepare)
    
    It applies each element of ((|lst|)) to ((|assert-proc|)).
    
    It works like below.
    
      (define (run-assert assert-proc args)
        (if (and (list? args) apply-if-can)
            (apply assert-proc args)
            (assert-proc args)))
      (for-each (lambda (item)
                  (run-assert assert-proc (prepare item)))
                lst)

--- assert-macro(expanded form [message])
    
    It succeeds when (({(equal? expanded (macroexpand
    form))})) is #t.
    
--- assert-macro1(expanded form [message])
    
    It succeeds when (({(equal? expanded (macroexpand-1
    form))})) is #t.
    
--- assert-lset-equal(expected actual [message])
    
    It succeeds when (({(lset= equal? expected actual)})) is
    #t.
    
--- assert-values-equal(expected productor [message])
    
    It succeeds when (({(receive actual (productor) (equal?
    expected actual))})) is #t.
    
====  Requisite minimum

GaUnit has following procedure.

--- run-all-test(&keyword :ui)

    It runs test which is defiend by (({define-test-case}))
    or (({define-test-suite})).
    
GaUnit has following syntaxes.

--- define-test-case
    
    It defines test case.
    
      (define-test-case "name of test case"
        (setup a-non-arity-procedure-which-is-evaled-before-each-test) ; if you need
        (teardown a-non-arity-procedure-which-is-evaled-after-each-test) ; if you need
        ("name of test"
          (assert-foo ...))
        ...)

--- define-test-suite
    
    It makes test suite.
    
      (define-test-suite "name of test suite"
        ("name of test case"
          (setup a-non-arity-procedure-which-is-evaled-before-each-test) ; if you need
          (teardown a-non-arity-procedure-which-is-evaled-after-each-test) ; if you need
          ("name-of-set"
            (assert-foo ...)
            ...)
          ...)
        ...)

==== If you need

GaUnit has following procedure.

--- run(<test-suite> or <test-case> or <test> &keyword :ui)

    It runs test.
    
    You can change user interface by specifing keyword argument :ui.

GaUnit has following syntaxes.

--- define-assertion
    
    It defines assertion.
    
      (define-assertion (name-of-assertion argument ...)
        body:last expression show success or failure)
    
    If ((|body|)) returns an object of <assertion-failure>
    class the test is failure otherwise success. See
    lib/test/assertions.scm.

--- make-test
    
    It makes test.

--- make-test-case
    
    It makes test case.

--- make-test-suite
    
    It makes test suite.

GaUnit has some procedures that add/delete a procedure that
is invoked at before/after each test. A procedure that is
added/deleted is used when
(({define-test-case}))/(({make-test-case})) is invoked.

--- gaunit-add-default-setup-proc!(proc)
    
    It adds non-arity procedure ((|proc|)) as set up
    procedure.

--- gaunit-delete-default-setup-proc!(proc)
    
    It deletes ((|proc|)) added by
    (({gaunit-add-default-setup-proc!})).

--- gaunit-clear-default-setup-procs!
    
    It deletes all ((|proc|)) added by
    (({gaunit-add-default-setup-proc!})).

--- gaunit-add-default-teardown-proc!(proc)
    
    It adds non-arity procedure ((|proc|)) as tear down
    procedure.

--- gaunit-delete-default-teardown-proc!(proc)
    
    It deletes ((|proc|)) added by
    (({gaunit-add-default-teardown-proc!})).

--- gaunit-clear-default-teardown-procs!
    
    It deletes all ((|proc|)) added by
    (({gaunit-add-default-teardown-proc!})).

You can added set up/tear down procedures by using
(({gaunit-*-default-{setup,teardown}-*})) without specifing
(({setup}))/(({teardown})) in (({define-test-case})) etc.
For example, following (({define-test-case}))s work similar.

  (define-test-case "test case"
    (setup (lambda () (print "setup")))
    (teardown (lambda () (print "teardown")))
    ("test1" ...)
    ("test2" ...)
    ...)

  (gaunit-add-default-setup-proc! (lambda () (print "setup")))
  (gaunit-add-default-teardown-proc! (lambda () (print "teardown")))
  (define-test-case "test case"
    ("test1" ...)
    ("test2" ...)
    ...)
  (gaunit-clear-default-setup-procs!)
  (gaunit-clear-default-teardown-procs!)

When some procedures added by
(({gaunit-*-default-{setup,teardown}-*})) are not necessary,
delete those procedures by
(({gaunit-clear-default-{setup,teardown}-procs!})) etc. You
can define new syntax that define test case like following.

  (define (*setup-proc*) ...)
  (define (*teardown-proc*) ...)
  (define-syntax define-my-test-case
    (syntax-rules ()
      ((_ arg ...)
       (begin
         (gaunit-add-default-setup-proc! *setup-proc*)
         (gaunit-add-default-teardown-proc! *teardown-proc*)
         (define-test-case arg ...)
         (gaunit-delete-default-setup-proc! *setup-proc)
         (gaunit-delete-default-teardown-proc! *teardown-proc*)))))

== Accessory

It is included in the package.

=== run-test.el

sample/site-lisp/run-test.el is Emacs-Lisp for support
running test in Emacs. sample/site-lisp/run-test-setting.el
is Emacs-Lisp for setting run-test.el

Write following code in your .emacs.

  (setq load-path (cons directory-which-has-run-test{,-setting}.el load-path))
  (load "run-test-setting")

Write run-test.scm which run test like below. 

  #!/usr/bin/env gosh

  (use file.util)
  (use test.unit)

  (if (symbol-bound? 'main)
      (define _main main))

  (define (main args)
    (let ((dir (sys-dirname (car args))))
      (for-each (lambda (test-script)
                  (load (string-join (list dir test-script) "/")))
                (directory-list dir
                                :filter (lambda (x)
                                          (rxmatch #/^test-.+\.scm/ x))))
      (if (symbol-bound? '_main)
          (_main args)
          (run-all-test))))


Make a directory whose name is `test' and move run-test.scm to
the directory. Don't forget add execution authority to
run-test.scm.

Make some test files whose name is started in `test-' in the
`test' directry. The organization of directory is following.

  topdir --- test --- run-test.sh or run-test.scm
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

==== Customize variables

: run-test-file
   Is is base name of file that runs test.
   
   default: "test/run-test"

: run-test-suffixes
   It is a list of suffix that is added to
   ((|run-test-file|)). 
   
   default: (".scm" ".rb" ".sh")
