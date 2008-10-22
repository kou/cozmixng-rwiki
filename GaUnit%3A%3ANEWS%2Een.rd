# -*- rd -*-

= NEWS.en

$Id: NEWS.en 492 2008-10-22 12:15:00Z kou $

== Changes 0.1.6 from 0.1.5: 2008-10-22

  * improve diff output
  * add assert-valid-module
  * support folded progress display
  * support tests in user module
  * add gauche.test compatible layer
  * accept (use test.unit.test-case) too
    note: before: (extend test.unit.test-case)

== Changes 0.1.5 from 0.1.4: 2008-06-30

  * add assert-not-match
  * support assert-* in setup/teardown
  * improve result output
  * support folded diff for horizontally long diff

== Changes 0.1.4 from 0.1.3: 2008-06-02

  * support Gauche 0.8.8
  * improve color availability guess process
  * separate run-test.el as other package

== Changes 0.1.3 from 0.1.2: 2008-06-02

  * change API: define-test-case -> define test module
  * support pending
  * improve test result report
  * unsupport GTK+ UI
