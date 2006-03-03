= eji::memo

  * [その他] Dependency Injection

    Gaucheで実装するとこんな感じか?

     #enscript scheme
     (define-class <container> ()
       ((fields :init-form (make-hash-table))))
     
     (define-method register ((c <container>) field-name setter)
       (let ((acc-name (string->symbol #`",|field-name|-of")))
         (hash-table-put! (ref c 'fields) field-name setter)
         (eval `(define-method ,acc-name ((c <container>))
                   ((hash-table-get (ref c 'fields) ,field-name) c))))
            (current-module)))

    * 参考

      * ((<TestDepInjRb|URL:http://onestepback.org/cgi-bin/osbwiki.pl?DependencyInjectionCode/DepInjRb>))

  * [Gauche] gc-stat

  * [svn] svn switch

  * [svn] 開発方針

    trunkで追加修正していき，リリースできそうと思ったらbranchesにtrunkの内容をコピー．
    branchesでテストしてもうテストする部分が無いかなと思ったらtagsにコピー．

    * 参考

      ((<Subversionによるバージョン管理|URL:http://subversion.bluegate.org/doc/book.html#svn.branchmerge.switchwc>))
