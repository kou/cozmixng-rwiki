# -*- rd -*-

= README.ja

$Id: README.ja 221 2004-07-10 01:35:34Z kou $

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

GPL or BSD License

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
を御覧下さい．

== なにこれ？

tsm（Tuple Space in Scheme）は
((<dsm|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=dsm>)) 
を用いたタプルスペースライブラリです．インターフェイスは
((<Rinda|URL:http://www2a.biglobe.ne.jp/~seki/ruby/rinda.html>)) 
を参考にしています．

以下のような機能があります．

  * タプルに有効期限を設定する．
  * タプルのマッチにはutil.match互換のパターンを使う．

以下のような機能はありません（実装する気はあります）．

  * イベント（takeとかwrite）発生時にコールバックを起動する．
  * （数値やリストや文字列など）基本的な型以外のオブジェクト
    をタプルを通じて共有する．
  * move（クライアントにタプルを返すのが成功したらタプルスペー
    スからタプルを削除する安全なtake）

== 依存ライブラリ

  * ((<dsm|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=dsm>))
  * ((<marshal|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=marshal>))

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/tsm.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/tsm/trunk tsm

== インストール

  # gosh install/install.scm

== 構造

tsmでは2つ以上のタスク（処理の単位．スレッドを用いていなけれ
ば1プロセスは1タスクになります（いいよね？）が，スレッドを用
いていれば1プロセスにつき複数のタスクを持つことができます）
を用いてタプルスペースを利用します．ひとつはタプルスペースを
提供するタスクで，それ以外はタプルスペースを利用するタスク
（クライアント）です（もちろん，タプルスペースを利用するタス
クが複数のタプルスペースを利用することもできますが，ここでは
割愛します）．


  +--------------+     +----------------+     +--------------+
  | クライアント | <-> | タプルスペース | <-> | クライアント |
  +--------------+     +----------------+     +--------------+
                         ^            ^
      +--------------+   |            |   +--------------+
      | クライアント | <-+    ...     +-> | クライアント |
      +--------------+                    +--------------+



タプルスペースはタプルを保管する空間を提供します．この空間は
タプルスペースを提供するタスクが終了すると消滅します．空間が
消滅すると空間内のタプルは破棄されます．

== 利用法

クライアントはタプルスペースに対して，タプルを書く／取ってく
るという操作を行います．tsmでは，それぞれ
(({tuple-space-write}))／(({tuple-space-take}))という手続き
になります．

例えば，クライアント1（Aとします）がクライアント2（Bとします）
に(({(1 2 3)}))というリストを渡すという問題を考えます．タプ
ルスペースを用いると，この問題は以下のように解決できます．

  (1) タプルスペースを起動する．
  (1) Aがタプルスペースに(({(1 2 3)}))というタプルを書き込む．
  (1) Bがタプルスペースから(({(1 2 3)}))というタプルを取り出
      す．

タプルスペースにはA，B以外が扱うタプルも存在するので，タプル
には，タプルを識別するためのタグを付ける事が多いでしょう．例
えば，今回は，Aが書き込むタプルには(({to-B}))というタグを付
けることにします．

今回の解決法では3つのタスクが存在します．それぞれ，タプルス
ペース，A，Bです．それぞれのコードを以下に示します．

=== タプルスペース 

タプルスペースのコードは以下のようになります．

  (use tsm.tuple-space)

  (define (main args)
    (let ((tuple-space (make-tuple-space "dsmp://:2929")))
      (tuple-space-start! tuple-space)
      (tuple-space-join! tuple-space)))

(({make-tuple-space}))でタプルスペースを作成し，
(({tuple-space-start!}))で起動しているだけです．
(({tuple-space-join!}))はタプルスペースが終了するのを待ちま
す．

タプルスペース自体は「場」を提供するだけで，ロジックを組み込
むことはないので，多くのタプルスペースのコードは以上のように
なるでしょう．

=== A

Aのコードは以下のようになります．

  (use tsm.proxy)

  (define (main args)
    (let ((tuple-space (tuple-space-connect "dsmp://localhost:2929")))
      (tuple-space-write tuple-space '(to-B (1 2 3)))))

(({tuple-space-connect}))でタプルスペースに接続し，
(({tuple-space-write}))でタプルスペースに(({(to-B (1 2
3))}))というタプルを書き込んでいます．リストの最初の要素であ
る(({to-B}))がタグになります．

=== B

Bのコードは以下のようになります．

  (use tsm.proxy)

  (define (main args)
    (let ((tuple-space (tuple-space-connect "dsmp://localhost:2929")))
      (print (cdr (tuple-space-take tuple-space
                                    '(('to-B ((? number?) ...))))))))

(({tuple-space-take}))はタプルスペースから指定したパターンに
マッチするタプルをひとつ取り出し，そのタプルをタプルスペース
から削除します．もし複数のタプルがマッチした場合，どのタプル
が取り出されるかはわかりません．

(({tuple-space-take}))に指定するパターンの書き方はGauche 0.8
から標準添付されているutil.matchモジュールのパターンと同じで
す．

=== 起動

まず，タプルスペースを起動します．

  % gosh space.scm

AとBの起動順序は任意で構いません．ここでは，B，Aの順序で起動
することにします．

タプルスペースとは別のターミナルを開き，Bを起動します．

  % gosh client-b.scm

Bは指定したパターンにマッチするタプルが見付かるまでブロック
します．

続いて，また，別のターミナルを開きAを起動します．

  % gosh client-a.scm

Aが起動するとBが（タグを除いた）タプルの内容を出力して終了し
ます．

順序を変えてA，Bの順序で起動します．

  % gosh client-a.scm

Aはタプルを書き込んですぐに終了します．

続いてBを起動します．

  % gosh client-b.scm

Bが指定したパターンのタプルがすでにタプルスペース上に存在する
のですぐにタプルの内容を出力して終了します．

A，Bをたくさん起動してみるのも面白いかもしれません．


== 例1

あるタスク（writerとします）はタプルを書き込みまくり，別のタ
スク（readerとします）はタプルを取り出しまくってみましょう．

以下の3つのファイルを作成します．

  * tuple-space.scm
  * writer.scm
  * reader.scm

=== tuple-space.scm

  #!/usr/bin/env gosh

  (use tsm.tuple-space)

  (define *port* 2929)

  (define (main args)
    (let ((tuple-space (make-tuple-space #`"dsmp://:,|*port*|")))
      (tuple-space-start! tuple-space)
      (tuple-space-join! tuple-space)))

=== writer.scm

  #!/usr/bin/env gosh

  (use srfi-1)
  (use tsm.proxy)

  (define *server* "localhost")
  (define *port* 2929)

  (define (main args)
    (let ((tuple-space (tuple-space-connect #`"dsmp://,|*server*|:,|*port*|")))
      (for-each (lambda (i)
                  (tuple-space-write tuple-space i '(1 0))
                  (tuple-space-write tuple-space (list i)))
                (iota 10))))

=== reader.scm

  #!/usr/bin/env gosh

  (use tsm.proxy)

  (define *server* "localhost")
  (define *port* 2929)

  (define (main args)
    (let ((tuple-space (tuple-space-connect #`"dsmp://,|*server*|:,|*port*|")))
      (do ()
          (#f)
        (print (tuple-space-take tuple-space '(_))))))

=== 起動する．

最初にtuple-space.scmを起動しておけば，writer.scmと
reader.scmはどのような順序で起動しても構いません．writer.scm
とreader.scmを複数起動しても構いません．

すべて起動すると，writer.scmが書き込んだタプルをreader.scmが
ひたすら吐き出します．

== リファレンス

=== タプルスペース

(use tsm.tuple-space)をするタスクのことです．

#--- make-tuple-space(URI &optional minimum-update-ranosecond)
--- make-tuple-space(URI)
     ((|URI|))にバインドされたタプルスペースを作成します．

--- tuple-space-start!(tuple-space)
     ((|tuple-space|))を起動します．

--- tuple-space-join!(tuple-space)
     ((|tuple-space|))が終了するのを待ちます．

--- tuple-space-stop!(tuple-space)
     ((|tuple-space|))を終了します．


=== クライアント

(use tsm.proxy)をするタスクのことです．

--- tuple-space-connect(URI)
     ((|URI|))で指定されたタプルスペースに接続し，タプルスペー
     スへ接続をするプロキシオブジェクトを返します．

--- tuple-space-shutdown!(proxy)
     ((|proxy|))が接続しているタプルスペースとの接続を切断し
     ます．

--- tuple-space-write(proxy value &optional (timeout #f))
     ((|proxy|))が接続しているタプルスペースにタプルとして
     ((|value|))を書き込みます．書き込んだタプルは長くても
     ((|timeout|))で指定された期間だけタプルスペースに存在し
     ません．もし，((|timeout|))で指定した期間を過ぎたらタプル
     スペースに削除されます．もし，((|timeout|))が省略された
     り，(({#f}))が指定された場合は(({tuple-space-take}))で
     取り出されるるまでタプルはタプルスペースに存在し続けま
     す．((|timeout|))には，マイクロ秒を表す実数か，秒とマイ
     クロ秒を表すふたつの整数のリストを指定します．

--- tuple-space-take(proxy patterns &optional (timeout #f) fallback)
     ((|proxy|))が接続しているタプルスペース中の
     ((|patterns|))にマッチするパターンをひとつ取り出します．
     取り出されたタプルはタプルスペースから削除されます．
     ((|patterns|))はutil.matchと同じ書式です．
     
     ((|timeout|))を省略したり(({#f}))を指定すると，指定した
     パターンにマッチするタプルが見付かるまでブロックします．
     もし，((|timeout|))を指定した場合は，指定した期間内にタ
     プルが見付からなければエラーが発生します．もし，
     ((|fallback|))を指定していればエラーが発生せずに
     ((|fallback|))が返ります．
     
     ((|timeout|))には，マイクロ秒を表す実数か，秒とマイ
     クロ秒を表すふたつの整数のリストを指定します．

--- tuple-space-read(proxy patterns &optional (timeout #f) fallback)
     見つかったタプルをタプルスペースから削除しない点だけが
     (({tuple-space-read}))と異なります．

--- tuple-space-read-all(proxy patterns)
     ((|proxy|))が接続しているタプルスペース中で
     ((|patterns|))にマッチするタプルのリストを返します．
     ((|patterns|))はutil.matchと同じ書式です．

     (({tuple-space-take}))，(({tuple-space-read}))と異なり，こ
     の手続きはブロックしません．
