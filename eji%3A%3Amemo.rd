= eji::memo

  * [˨] ������

    * ((<������꡼���ظ�(���Ϲ�)�ץ���ߥ�|URL:http://www.entis.jp/doc/lolita_programing/lolita1.html>))
    * ((<��꡼���ظ�(���Ϲ�)�ץ���ߥ���������|URL:http://www.entis.jp/doc/lolita_programing/lolita2.html>))

    * ((<���ͥץ���ߥ󥰥������� by Java|URL:http://www.okisoft.co.jp/esc/go/style0.html>))


  * [Rails] ((<Rails Recipes|URL:http://www.amazon.co.jp/exec/obidos/ASIN/0977616606/250-3179170-4147428>))

  * [��] �ǥХå�

    * ((<˨����ǥХå���ˡ����|URL:http://www.nomuraz.com/denpa/prog002.htm#IDPROG0012>))
    * ((<˨����ǥХå�: �ޤ��ϻ��ǡ���ˤ��ƿ��ۤ���Τ�ߤ��Scheme�򰦤���褦�ˤʤä���|URL:http://hiratch.net/blog/archives/2005/12/000058.html>))


  * [��] ((<Error handling|URL:http://www.objectarchitects.de/arcus/cookbook/exhandling/index.htm>))

  * [svn] CVS��ݥ��ȥ�

    CVS�Ǵ�������Ƥ����Ĥ�Subversion��ȤäƤ����ꤿ���Ȥ��äƤɤ��������?
    �ܲȤ����ǥС�����󥢥åפ��줿�鼫ʬ��svn��ݥ��ȥ�ˤ�ȿ�ǤǤ����餤���������...

  * [Gauche] EQL���ڥ���饤��(?)�äݤ����

    �ߤ����ä��Τ�VM�����äƺ�äƤߤ���

    ���ޤ���������ѥå��Ϻ�äƤʤ�����...

     #enscript scheme
     gosh> (define-method div (x (y := 0))
               (error "inf"))

     gosh>(define-method div (x y)
             (/ x y))

     gosh> (div 4 2)
     2
     gosh> (div 1 0)
     *** ERROR: inf
     Stack Trace:
     _____________
     gosh>

  * [����¾] �饤����

    ���������饤�֥��Υ饤���󥹤�Ĵ�٤�����ݤ�����Ĵ�٤Ƥ�����Ĥ��ߤ�����
    �饤���󥹤�ץ����ˤ��ƥ饤�֥�������Ȥ߹���Ф�����������ʤΤˤʡ�

  * [Emacs] (({-=:--})) �Ѥʥ⡼��

    �����ɤ�񤤤Ƥ��ƥ���ѥ��뤷�褦�Ȥ�����ʸ�����������ʤ��ȤˤʤäƤ�����
    �⡼�ɥ饤����ɤ��ߤƤߤ��¾�Υե�����Ȱ㤦���ʤ�����졩

     --:-- ������̾ ����¾

     -=:-- ������̾ ����¾

    �ʤ��(({=}))�ˤʤäƤ�������

  * [Gauche] '[' ']'�λȤ�ƻ

    ����ʴ����Ǥ⤤������

     #enscript scheme
      (ref (ref (ref hoge 'a) 'b) 'c)
        ��
      ([hoge] :a :b :c)

  * [Gauche] deref�äƲ�����?

    object-apply�Ȥ��Ȥä�Smalltalk�äݤ���������ˤʤ뤱�ɤ��줸��Ȥ��ʤ������ʡ�

     #enscript scheme
     (define-class <message-passing-meta> (<class>)
       ())

     (define-method make ((klass <message-passing-meta>) . initargs)
       (let* ((obj (next-method))
               (klass-name (class-name (class-of obj))))
          (eval `(define-method object-apply ((obj ,klass-name) . slots)
                    (cond ((null? slots)
                             obj)
                           ((null? (cdr slots))
                            (ref obj (string->symbol (x->string (car slots)))))
                           (else
                             (apply (ref obj (string->symbol (x->string (car slots))))
                                     (cdr slots)))))
                 (current-module))
          obj))
      
      (define-class <foo> ()
        ((a :init-value 0))
        :metaclass <message-passing-meta>)
      
      (define-class <hoge> ()
        ((b :init-keyword :b))
        :metaclass <message-passing-meta>)

      (define foo (make <foo>))

      (foo :a) ;=> 0

      (define hoge (make <hoge> :b foo))

      (hoge :b) ;=> foo
      (hoge :b :a) ;=> 0
    

  * [Gauche] �ðۥ᥽�å�

    ����ʴ������ðۥ᥽�åɤ�����Ǥ����餦�줷������

     #enscript scheme
     (define-method hoge ((a :equal? obj) b)
       ...)
     
     (define-method foo ((x :>= 0)))
        ...)
   

      

  * [Haskell] ((<hs-plugins|URL:http://www.cse.unsw.edu.au/~dons/hs-plugins/>))

    Haskell��eval����?

  * [����¾] �ƥ���

    �ƥ��Ȥ򤹤뤿��δĶ��ϥѥå�����������ʤ�����ȯ����ͤ��Ȥ��桼���ϻȤ�ʤ����顥

  * [svn] svn copy
   
    �ʲ��Τ褦�ˤ�äƤ�r-0.1�μ��֤�trunk��Ʊ����trunk�������Ƥ����̤ˤʤ롥

     svn copy http://www.hoge.org/repos/foo/trunk http://www.hoge.org/repos/foo/tags/r-0.1


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
