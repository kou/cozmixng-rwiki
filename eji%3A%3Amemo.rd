= eji::memo

  * [����¾] ((<�ο֥ͥ�|URL:http://erai.jugem.jp/>))

  * [Scheme] ��³�Ǥ����

    hoge.scm��

     #enscript scheme
     (define cont #f)
     (call/cc (lambda (k) (set! cont k)))

    �Ȥ�ä�¾�ΤȤ������ɤ߹����

     gosh> (load "hoge.scm")
     #t
     gosh> (cont '*)
     *** IO-CLOSED-ERROR: I/O attempted on closed port: #<iport(closed) /home/koji/work/hoge.scm   0x8129c38>
     Stack Trace:

    �Ȥʤꥨ�顼�ˤʤ롥��³��load�θ�������ޤޤ�Ƥ��뤿�ᡥ

    �ȥåץ�٥�Ƿ�³�Ȥä����Ȥʤ��ä����餳����Τ�ʤ��ä���

  * [Gauche] ((<c-wrapper|URL:http://homepage.mac.com/naoki.koguro/prog/c-wrapper/index-j.html>))

    ���������ʤ�

  * [DI] ((<Inversion of Control ����ƥʤ� Dependency Injection �ѥ�����|URL:http://kakutani.com/trans/fowler/injection.html>))

  * [����¾] Dependency Injection

    Gauche�Ǽ�������Ȥ���ʴ�����?

     #enscript scheme
     (define-class <container> ()
       ((fields :init-form (make-hash-table))))
     
     (define-method register ((c <container>) field-name setter)
       (let ((acc-name (string->symbol #`",|field-name|-of")))
         (hash-table-put! (ref c 'fields) field-name setter)
         (eval `(define-method ,acc-name ((c <container>))
                   ((hash-table-get (ref c 'fields) ,field-name) c))))
            (current-module)))

    * ����

      * ((<TestDepInjRb|URL:http://onestepback.org/cgi-bin/osbwiki.pl?DependencyInjectionCode/DepInjRb>))

  * [Gauche] gc-stat

  * [svn] svn switch

  * [svn] ��ȯ����

    trunk���ɲý������Ƥ�������꡼���Ǥ������Ȼפä���branches��trunk�����Ƥ򥳥ԡ���
    branches�ǥƥ��Ȥ��Ƥ⤦�ƥ��Ȥ�����ʬ��̵�����ʤȻפä���tags�˥��ԡ���

    * ����

      ((<Subversion�ˤ��С���������|URL:http://subversion.bluegate.org/doc/book.html#svn.branchmerge.switchwc>))
