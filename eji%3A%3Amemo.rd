= eji::memo

  * [ぷ] ((<FLOPS 2006|URL:http://nicosia.is.s.u-tokyo.ac.jp/FLOPS2006/>))

  * [その他] ((<URL:http://www.plusminus.ru/>))

  * [検索] ((<Windows Live|URL:http://www.live.com/>))

    これでサーベイが楽になればいいけど。

  * [Rails] with svn

    * ((<subversionでRailsアプリを管理|URL:http://wiki.rails2u.com/subversion%E3%81%A7Rails%E3%82%A2%E3%83%97%E3%83%AA%E3%82%92%E7%AE%A1%E7%90%86>))

    * ((<HowtoUseRailsWithSubversion|URL:http://wiki.rubyonrails.com/rails/pages/HowtoUseRailsWithSubversion>))



  * [ぷ] ((<Logowiki|URL:http://www.logowiki.net/>))

  * [萌] いろいろ

    * ((<初等ロリータ指向(×嗜好)プログラミング|URL:http://www.entis.jp/doc/lolita_programing/lolita1.html>))
    * ((<ロリータ指向(×嗜好)プログラミング中級基本編|URL:http://www.entis.jp/doc/lolita_programing/lolita2.html>))

    * ((<美人プログラミングスタイル by Java|URL:http://www.okisoft.co.jp/esc/go/style0.html>))


  * [Rails] ((<Rails Recipes|asin:0977616606>))

  * [ぷ] デバッグ

    * ((<萌えるデバッグ手法な話|URL:http://www.nomuraz.com/denpa/prog002.htm#IDPROG0012>))
    * ((<萌えるデバッグ: または私は如何にして心配するのを止めてSchemeを愛するようになったか|URL:http://hiratch.net/blog/archives/2005/12/000058.html>))


  * [ぷ] ((<Error handling|URL:http://www.objectarchitects.de/arcus/cookbook/exhandling/index.htm>))

  * [svn] CVSレポジトリ

    CVSで管理されているやつをSubversionを使っていじりたいときってどうすんだろ?
    本家の方でバージョンアップされたら自分のsvnレポジトリにも反映できたらいいんだけど...

  * [Gauche] EQLスペシャライザ(?)っぽいもの

    欲しかったのでVMいじって作ってみた。

    ♯まだ汚いからパッチは作ってないけど...

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

  * [その他] ライセンス

    いちいちライブラリのライセンスを調べるの面倒だから調べてくれるやつが欲しい。
    ライセンスをプログラムにしてライブラリの中に組み込めばいろいろと便利なのにな．

  * [Emacs] (({-=:--})) 変なモード

    コードを書いていてコンパイルしようとしたら文字がおかしなことになっていた。
    モードラインを良くみてみると他のファイルと違う。なんだろこれ？

     --:-- ソース名 その他

     -=:-- ソース名 その他

    なんで(({=}))になっているんだろ？

  * [Gauche] '[' ']'の使い道

    こんな感じでもいいかも

     #enscript scheme
      (ref (ref (ref hoge 'a) 'b) 'c)
        ↓
      ([hoge] :a :b :c)

  * [Gauche] derefって何だろ?

    object-applyとか使ってSmalltalkっぽいスタイルになるけどこれじゃ使えないだろうな．

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
    

  * [Gauche] 特異メソッド

    こんな感じの特異メソッドが定義できたらうれしいかも

     #enscript scheme
     (define-method hoge ((a :equal? obj) b)
       ...)
     
     (define-method foo ((x :>= 0)))
        ...)
   

      

  * [Haskell] ((<hs-plugins|URL:http://www.cse.unsw.edu.au/~dons/hs-plugins/>))

    Haskell版evalかな?

  * [その他] テスト

    テストをするための環境はパッケージに入れない．開発する人が使いユーザは使わないから．

  * [svn] svn copy
   
    以下のようにやってもr-0.1の実態はtrunkと同じ．trunkを修正してから別になる．

     svn copy http://www.hoge.org/repos/foo/trunk http://www.hoge.org/repos/foo/tags/r-0.1


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
