# -*- rd -*-

= README.en

$Id: README.en 460 2008-06-30 01:01:50Z kou $

((*I'm not good in English. Please fix.*))

== Author

Kouhei Sutou <kou@cozmixng.org>

== License

GPL or BSD License

== Caution

This is for Gauche 0.8.13. This will not work on older Gauche.

== What's this?

GaUnit is Unit Testing Framework for Gauche.

((<SchemeUnit|URL:http://schematics.sourceforge.net/schemeunit.html>))
is similar program.

== How to pronounce?

What about `go-ni-tto'?

== Get

((<URL:http://www.cozmixng.org/~kou/download/gaunit.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/gaunit/trunk gaunit

== Install

  % sudo gosh install/install.scm

== Usage

Make the program that define some tests.

  (define-module test-your-module
    (extend test.unit.test-case)
    (use your-module))
  (select-module test-your-module)

  (define (test-your-module-function1)
    (assert-equal "Good!" (your-module-function1))
    ...
    #f)

  (define (test-your-module-function2)
    (assert-equal 29 (your-module-function2))
    ...
    #f)

  (provide "test-your-module")

Function start with 'test-' will be ran as a test.

Execute the program with '-u test.unit' option. GaUnit
exports (({main})) procedure that run test in test.unit
module. So you don't need to define (({main})) procedure if
you use test.unit.

  % gosh -u test.unit test-your-module.scm

It's better that you create a test runner script,
run-test.scm:
  #!/usr/bin/env gosh

  (add-load-path ".")

  (use test.unit)

  (define base-dir (sys-dirname *program-name*))
  (for-each load (glob #`",|base-dir|/**/test-*.scm"))

You can run the script like the following:

  % gosh run-test.scm

=== Options

(({main})) procedure exported by GaUnit accepts some options.

: -uUI, --ui=UI
   It specifies user interface that show test
   results. ((|UI|)) is following.

   : t[ext]
      GaUnit uses text version user interface. It is default.

   : g[tk]
      ((*NOT WORK FOR NOW*))

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

==== Assertions and so on

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

--- assert-not-equal(expected actual [message])
    
    It succeeds when (({(not (equal? expected actual))})) is #t.

--- assert-null(actual [message])
    
    It succeeds when (({(null? actual)})) is #t.

--- assert-not-null(actual [message])
    
    It succeeds when (({(not (null? actual))})) is #t.

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
    
--- assert-in-delta(expected delta actual [message])
    
    It succeeds when (({(<= (- expected delta) actual (+
    expected delta))})) is #t.
    
--- assert-output(expected thunk [message])
    
    It succeeds when (({(equal? expected
    (with-output-to-string thunk))})) is #t. In other words,
    it succeeds when ((|expected|)) equals the output of
    (({(thunk)})).
    
    If ((|expected|)) is regular expression, it succeeds
    when (({(rxmatch expected (with-output-to-string
    thunk))})) is not #f. In other words, it succeeds when
    the output of (({(tunk)})) is matched with
    ((|expected|)).

--- assert-match(expected actual [message])

    It succeeds when (({(rxmatch expected actual)})) is not
    #f.

--- assert-not-match(expected actual [message])

    It succeeds when (({(not (rxmatch expected actual))}))
    is not #f.

--- pend(message [thunk])

    It pends the test. ((|message|)) is the reason of
    pending. If non-argument procedure ((|thunk|)) is
    specified and evaluation of the ((|thunk|)) doesn't
    cause an error or a failure, the test fails. Because it
    assumes that you pend the test because a content of the
    ((|thunk|)) has a problem. If a content of the
    ((|thunk|)) doesn't have a problem, it's a problem. It
    means a failure.
