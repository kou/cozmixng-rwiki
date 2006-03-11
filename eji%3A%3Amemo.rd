= eji::memo

  * [その他] ((<偉人ブログ|URL:http://erai.jugem.jp/>))

  * [Scheme] 継続での注意

    hoge.scmに

     #enscript scheme
     (define cont #f)
     (call/cc (lambda (k) (set! cont k)))

    とやって他のところから読み込むと

     gosh> (load "hoge.scm")
     #t
     gosh> (cont '*)
     *** IO-CLOSED-ERROR: I/O attempted on closed port: #<iport(closed) /home/koji/work/hoge.scm   0x8129c38>
     Stack Trace:

    となりエラーになる．継続にloadの後処理が含まれているため．

    トップレベルで継続使ったことなかったからこれは知らなかった．

  * [Gauche] ((<c-wrapper|URL:http://homepage.mac.com/naoki.koguro/prog/c-wrapper/index-j.html>))

    これ凄いなぁ

  * [DI] ((<Inversion of Control コンテナと Dependency Injection パターン|URL:http://kakutani.com/trans/fowler/injection.html>))

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
