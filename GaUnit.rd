= GaUnit

The latest version: 0.1.2
(((<download|URL:http://www.cozmixng.org/~kou/download/gaunit-0.1.2.tar.gz>)))

# ((<BTS|URL:/~kagemai/?project=gaunit;action=top>))(Japanese only)

  * ((<README.en|GaUnit::README.en>))
  * ((<README.ja|GaUnit::README.ja>))
#  * ((<Tutorial.en|GaUnit::Tutorial.en>))
  * ((<Tutorial.ja|GaUnit::Tutorial.ja>))
#  * ((<ToDo.ja|GaUnit::ToDo.ja>))
  * ((<UsedBy|GaUnit::UsedBy>))

== Comments

== コメント

* define-test-caseなどで、setupとteardownが書けるのはいいですね。
* assert-*がなぜ4種も必要なのかよくわかりません。現在の
  gauche.testのように、
  (assert <expr> <expected> &optional <eq-proc>) ではまずいんでしょうか。というのは:
  * assert-*が何種類もあると、ソースの見た目が揃わない（個人的趣味ですが)
    * 名前を見るだけで何をテストしているのか分かるので私はassert-*を使い分けるのが好きです． - ((<kou>))
  * assert-falseとassert-trueは容易にassert-equalで書け、手間もほとんど変わらない。
  * equal以外で結果を比較したい場合は結局<expr>の中に比較手続きまで
    書くことになって、かえって読みにくくなる。
    * assert-*はdefine-assertionで新しく自分で定義できるので専用のassert-*を作ればいいと思います．

      ん，ということは，gauche.testのassertはeq-procがごちゃごちゃして読みにくいということですか？私は使ったことがないので良く分からないのですが．．． - ((<kou>))

* それから、<expr>でエラーが発生した場合にはどう処理されるのでしょうか。
  * 普通のエラーと同じ様にスタックフレームが表示されます．テストは続行されます． - ((<kou>))

* エラーが発生すべき条件をテストしたい場合はどう書けば良いのでしょう。
  * こんなかんじかしら． - ((<kou>))

      (define-assertion (assert-error thunk . message)
        (assert-true (procedure? thunk) " Must be procedure")
        (with-error-handler
         (lambda (err) #t)
         (lambda ()
           (thunk)
           (assertion-failure
            (get-optional message " None expection was thrown")))))

* なるほど。自分好みのassert-*を宣言して使うわけですね。
  宣言的アプローチというか。一方、gauche.testは高階関数で
  パラメタライズすることを想定しています（例えば、A, B, C
  モジュールがあって、テスト項目はほとんど同じだけれど
  結果の比較条件だけが違う、という場合などは、比較関数を
  パラメタライズできると便利です)。まあ、assertに渡す
  expr中でパラメタライズしてもいいわけですが。
