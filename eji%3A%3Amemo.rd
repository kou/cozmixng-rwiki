= eji::memo

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
