# -*- rd -*-

= README.ja

$Id: README.ja 343 2005-07-15 08:03:46Z kou $

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

GPL or BSD License

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
を御覧下さい．

== なにこれ？

((<msm|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=msm>))
を用いたサーバ／クライアント方式の簡易分散Schemeライブラリで
す．

以下のような機能があります．

  * リモートオブジェクトのコピーを取得する．
  * ローカルオブジェクトを引数としてリモートの手続き/マク
    ロにリモートで適用する．
  * リモートの手続き／マクロをリモートで適用した際に発生した
    エラーをローカルに転送する．

以下のような機能はありません．

  * リモートの手続き／マクロをローカルで適用する．

以下のような機能を実装したいです．

  * 参照オブジェクトの受渡し．
  * リモート手続きの呼び出しがピンポンしたときにエラーが発生
    してもきちんとエラーを転送する（test/dsm-server-conf.scm
    のerror-procedure-listの"error-proc2"にパスする）．

== 依存ライブラリ

  * ((<Gauche|URL:http://www.shiro.dreamhost.com/scheme/gauche/>)) >= 0.8.4
  * ((<msm|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=msm>))

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/dsm.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/dsm/trunk dsm

== インストール

  # gosh install/install.scm

== 構造

サーバは0個以上のオブジェクトをマウントしています．マウント
する際にはマウントポイントを文字列で指定します．クライアント
はマウントポイントを指定することによってサーバにマウントされ
たオブジェクトにアクセスすることができます．

dsmはオブジェクトを以下のように扱います．

  * (({read}))/(({write}))できるオブジェクトはそのオブジェク
    トのコピーが渡される．
  * (({read}))/(({write}))できないオブジェクトはそのオブジェ
    クトの参照が渡される．

例として，以下のようなサーバ／クライアントを考えます．

サーバ: (({"/map"}))というマウントポイントに(({map}))手続き
をマウントしている．

クライアント: (({"/map"}))にマウントされているオブジェクト
((({map}))手続き)に(({(lambda (x) (+ 10 x))}))と(({(1 2)}))
という引数を適用する．

  (let ((server-map ("/map"にマウントされたオブジェクトを取得する手続き)))
    (server-map (lambda (x) (+ 10 x))
                '(1 2)))

このとき，以下のように動作します．


  +-------------+ "/map"にマウントされた          +-------+
  |             | オブジェクトを要求              |       |
  |             | ------------------------------> |       |
  |             |                                 |       |
  |             | map手続きの参照を返す           |       |
  |             | <-----------------------------  |       |
  |             |                                 |       |
  |             | map手続きの参照と引数として     |       |
  |             | (lambda (x) (+ 10 x))の参照と   |       |
  |             | '(1 2)を渡し，                  |       |
  |             | 適用してもらうように要求        |       |
  |             | ----------------------------->  |       |
  |クライアント |                                 |サーバ |
  |             | (lambda (x) (+ 10 x))の参照と   |       |
  |             | 引数として1を渡し，             |       |
  |             | 適用してもらうように要求        |       |
  |             | <----------------------------   |       |
  |             |                                 |       |
  |             | 11を返す                        |       |
  |             | ---------------------------->   |       |
  |             |                                 |       |
  |             | (lambda (x) (+ 10 x))の参照と   |       |
  |             | 引数として2を渡し，             |       |
  |             | 適用してもらうように要求        |       |
  |             | <----------------------------   |       |
  |             |                                 |       |
  |             | 12を返す                        |       |
  |             | ---------------------------->   |       |
  |             |                                 |       |
  |             | '(11 12)を返す                  |       |
  |             | <----------------------------   +-------+
  +-------------+

=== 実行例

以下のようなサーバとクライアントを用意します．

サーバ:

  #!/usr/bin/env gosh

  (use dsm.server)

  (define (main arg)
    (let ((server (make-dsm-server "dsmp://:6789")))
      (add-mount-point! server "/plus" (lambda (x y) (+ x y)))
      (add-mount-point! server '/map map)
      (dsm-server-start! server)
      (dsm-server-join! server)
      (dsm-server-stop! server)))

クライアント:

  #!/usr/bin/env gosh

  (use dsm.client)

  (define (main arg)
    (let ((client (dsm-connect-server "dsmp://localhost:6789")))
      (print ((client "/plus") 1 2))
      (let ((x 10))
        (print ((client "/map") (lambda (elem) (+ elem x))
                                '(1 2))))))

まず，サーバを起動します．

  % ./dsm-server.scm

続いて別の端末でクライアントを起動します．

  % ./dsm-client.scm

するとクライアント側に以下のように表示されます．

  3
  (11 12)

== URI

(({make-dsm-server}))や(({connect-dsm-server}))ではサーバ／
クライアントの位置をURIで指定します．dsmは以下のスキームを認
識します．

: dsmp
   TCP/IP上でdsm独自プロトコルdsmpを用いて相手と通信します．
   
   指定例:
     dsmp://localhost:59102
   
   この例では，localhost上の59102番ポートの相手とdsmpを用い
   て通信します．

: unix
   UNIXドメインソケット上でdsm独自プロトコルdsmpを用いて相手
   と通信します．

   指定例:
     unix:///tmp/dsmp
   
   この例では，/tmp/dsmpソケットファイルを経由し，dsmpを用い
   て通信します．

: http
   HTTPを用いて相手と通信します．ただし，まだ実験的な機能で
   す．

   指定例:
     http://localhost:59102
   
   この例では，localhost上の59102番ポートで動いているプロセ
   スとHTTPを用いて通信します．これは，(({make-dsm-server}))
   手続きを用いてサーバを作成するときに使います．

   指定例:
     http://localhost/~dsmp/
   
   この例では，localhost上の80番ポートで動いているHTTPサーバ
   のパス/~dsmp/で識別される相手とHTTPを用いて通信します．こ
   れは，(({connect-dsm-server}))手続きを用いてサーバに接続
   するときに使います．
