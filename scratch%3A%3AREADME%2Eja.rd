# -*- rd -*-

= README.ja

$Id: README.ja 197 2004-06-24 04:36:33Z kou $

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

GPL or BSD License

== メーリングリスト

((<COZMIXNG RWiki - 連絡先|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))を御覧下さい．

== なにこれ？

Gauche用のサーバ/クライアント方式Webベースアプリケーションフ
レームワークです．現在はHTTP用/phttpdサーブレット用/メール用
モジュールしかありませんが，将来はGUIツールキット用のモジュー
ルも追加しようと思っています．

以下のような機能があります．

  * セッション管理
  * ユーザ管理
  * スコープ別データ管理
  * アクセス制御
  * セッションのタイムアウト管理
  * 取り換え可能なユーザ/セッション管理モジュール
  * CGIクライアントのサポート
  * SMTP経由のクライアントのサポート
  * ((<esm|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=esm>))
    のサポート

以下のような機能もあればいいなと思っています．

  * I18N
  * プラグイン
    * セッション管理とユーザ管理もプラグイン化したいな．
  * esm以外の(MVCの)View構築支援ライブラリのサポート
  * ログ出力
  * グループ(あるいは役割(role))によるアクセス制御
  * マルチスレッドセーフ
    * 現在，dsmはselectでクライアントからの要求を処理してい
      るのでこの機能は必須ではない．

以下のような機能はさほど興味がありません．

  * サーブレット毎の起動/終了
    * プロジェクト毎に一つサーバを立てればいいのでは？

  * オンラインパッチ
    * 特定のポートでREPLすればいいだけなので簡単だけど，アク
      セス制御とかすると面倒だから．

== 依存ライブラリ

  * ((<esm|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=esm>))
  * ((<dsm|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=dsm>))
  * ((<marshal|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=marshal>))

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/scratch.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/scratch/trunk scratch

== インストール

  # gosh install/install.scm

== 構造

  +------------+          +----------------------------------------------------+
  |            |   dsm    |                                                    |
  |            | ------>  |            ----->              ------>             |
  |            |    id    |              id                session             |
  |            |  action  |             action             others              |
  |            |  others  |             others                                 |
  |クライアント|         scratchサーバ         サーブレット        アクション  |
  |   CGI等    |   dsm    |                                                    |
  |            | <------  |            <------             <------             |
  |            |   header |             header              view-name          |
  |            |   result |             result                                 |
  |            |          |                       /\  |                        |
  |            |          |                result |   | session                |
  |            |          |                       |   | others                 |
  |            |          |                       |   \/                       |
  |            |          |                      ビュー                        |
  |            |          |                       esm等                        |
  +------------+          +----------------------------------------------------+

=== クライアント

現在，クライアント用ライブラリとしてCGI用のライブラリのみ提
供しています．このライブラリを使うことによりCGIスクリプトは
以下のように書くだけでよくなります．

  #!/usr/local/bin/gosh

  (use scratch.client.cgi)

  (define (main args)
    (scratch-cgi-main "dsmp://scratchサーバが動いているホスト名:ポート番号"
                      "サーブレットのマウントポイント"))

=== scratchサーバ

scratchサーバはURIで識別されます．よって，scratchサーバを作
成するときは以下のようになります．

  (make-scratch-server "dsmp://ホスト名:ポート番号")

ホスト名/ポート番号はともに省略することができ，省略された場
合は"localhost"/0（空いているポート番号を使うという意味）を
指定したものとみなされます．これは<dsm-server>の初期値に依存
しています．

scratchサーバには複数のサーブレットをマウントすることができ
ます．各サーブレットはマウントポイントによって識別されます．
scratchサーバにサーブレットをマウントするときは以下のように
します．

  (add-mount-point! scratchサーバ "マウントポイント" サーブレット)

マウントしただけではscratchサーバはクライアントからの接続を
受け付けません．クライアントからの接続を受け付けるために以下
のようにしてクライアントからの接続を受け付けるループに入りま
す．

  (start-scratch-server scratchサーバ)

scratchサーバを起動するスクリプトは以下のようになるでしょう．

  #!/usr/bin/env gosh

  (use scratch.server)

  (define (main args)
    (let ((server (make-scratch-server "dsmp://:5963")))
      (add-mount-point! server "/sample" (make-sample-servlet))
      (start-scratch-server server)))

=== サーブレット

サーブレットはクライアントからのリクエストから適切なアクショ
ンを呼び出します．アクションの結果により適切なビューを呼び出
し，クライアントに返します．

サーブレットにはユーザ管理機能/アクセス制御機能を組み込むこ
とができます．デフォルトでは組み込まれていません．

サーブレットはそれぞれモジュールを持っています．サーブレット
のモジュールの下にはアクションやビューが配置されます．サーブ
レット用のディレクトリ構成は以下のようになります．ここで，サー
ブレットのモジュール名はsample-servletとします．

  . --+-- sample-servlet.scm
      |
      +-- sample-servlet --+-- action.scm
                           |
                           +-- view --+-- http.scm
                                      |
                                      +-- http --+-- *.esm

sample-servlet.scmはサーブレットを作成するために使います．例
えば，以下のようになります．

  (define-module sample-servlet
    (use scratch.servlet)
    (export make-sample-servlet))
  (select-module sample-servlet)

  (define (make-number-table-servlet)
    (make <scratch-servlet>
      :servlet-module-name 'sample-servlet))

  (provide "sample-servlet")

ユーザ管理機能を組み込むには以下のようにします．

  (define-module sample-servlet
    (use scratch.servlet)
    (use scratch.db.file)
    (use scratch.user.manager.file)
    (export make-sample-servlet))
  (select-module sample-servlet)

  (define (make-number-table-servlet)
    (make <scratch-servlet>
      :servlet-module-name 'sample-servlet
      :user-manager (make <user-manager-file>)))

  (provide "sample-servlet")

アクセス制御機能を組み込むには以下のようにします．

  (define-module sample-servlet
    (use scratch.servlet)
    (use scratch.db.file)
    (use scratch.user.manager.file)
    (export make-sample-servlet))
  (select-module sample-servlet)

  (define (make-number-table-servlet)
    (make <scratch-servlet>
      :servlet-module-name 'sample-servlet
      :user-manager (make <user-manager-file>
                      :default-authority 'deny
                      :authority-map '((#t add-user)))))

  (provide "sample-servlet")

この例では，デフォルトで全てのアクションは拒否し
(:default-authoriy 'deny)，add-userというアクションだけは全
てのユーザに許可(:authority-map '((#t add-user)))します．

それでは，以下のような制御にする例を示します．

  * デフォルトで全てのアクションを許可
  * guestユーザはresetアクションを拒否
  * 全てのユーザはadminアクションを拒否
    * ただし，masterユーザには全てのアクションを許可

ここでは，:user-managerの部分だけ示します．

  (make <user-manager-file>
    :default-authority 'allow
    :authority-map '((guest reset admin)
                     (master)
                     (#t admin)))

sample-servlet.scmは必須ではありませんが，慣習的にサーブレッ
トを作成するために用いるようになるでしょう．

=== アクション

アクションは"サーブレットのモジュール名.action"という名前の
モジュールに定義します．この例ではsample-servletがサーブレッ
トのモジュール名なのでアクションのモジュール名は
sample-servlet.actionになります．

アクションを定義するスクリプトsample-servlet/action.scmは以
下のようになるでしょう．

  (define-module sample-servlet.action
    (use scratch.action)
    (use ...)
    (export ...))
  (select-module sample-servlet.action)

  アクションの定義

  (provide "sample-servlet/action")

アクションは"do-"で始まる変数に束縛された引数の無い手続きで，
クライアントに返すビューを指定するシンボルを返します．サーブ
レットはクライアントから要求されたアクションに対応する"do- 
アクション"という変数に束縛された手続きを呼び出します．もし，
"do-アクション"という変数がexportされていなければ
"do-default"に束縛されている手続きを呼び出します．

"do-xxx"に束縛された手続きはアクションを定義しているモジュー
ルと同じ環境で評価されます．

=== ビュー

ビューは"サーブレットのモジュール名.view.クライントのタイプ"
という名前のモジュールに定義します．クライアントのタイプはプ
ロトコルと同じになります．例えば，クライアントがCGIだとする
と"http"になります．よって，クライアントがCGIだと
sample-servlet.view.httpがビューのモジュール名になります．

ビューを定義するスクリプトsample-servlet/view/http.scmは以下
のようになるでしょう．

  (define-module sample-servlet.view.http
    (use esm.gauche)
    (use scratch.view.http)
    (use ...)
    (export ...)
    )
  (select-module sample-servlet.view.http)

  ビューの定義や補助手続き
  
  (provide "sample-servlet/view/http")

ビューは引数の無い手続きでクライアントへのレスポンスを返しま
す．クライアントがCGIの場合はHTTPのボディとなる文字列を返しま
す．

ビューが返すものは文字列であることが多いです．そのため，
scratchではesmをサポートしています．load-esm-filesは引数とし
て与えられたglob(7)のパターンによってマッチしたファイルをesm 
ファイルとして読み込み，S式にコンパイルされたesmファイルを実
行する手続きを定義します．定義された手続きは拡張子を除いた
esmファイル名と同じ名前のシンボルに束縛され，そのシンボルは
exportされます．

例えば，以下のようにload-esm-filesを呼び出したとします．

  (load-esm-files "sample-servlet/view/http/*.esm")
  
ここで，sample-servlet/view/http/以下に以下のようなファイル
があったとします．

  * test.txt
  * main.esm
  * login.esm

このとき，main.esmとlogin.esmがesmファイルとしてコンパイルさ
れ，それぞれを実行する手続きはmain, loginというシンボルに束
縛され，exportされます．よって，main.esmをesmファイルとして
実行するには以下のようにします．

  (main)

サーブレットはアクションが返したシンボルがビューのモジュール
でexportされていればシンボルに束縛されている手続きを呼び出し
ます．もし，exportされていなければdefault-viewという手続きを
呼び出します．サーブレットはビューの手続きをビューのモジュー
ル内で評価します．

=== scratchが管理するデータ

scratchで管理するデータには3種類のスコープがあります．

  (1) サーブレット単位
      
      scratchサーバにマウントされたサーブレット毎に持つデー
      タです．同じマウントポイントのサーブレット内でデータを
      共有できます．
      
      アクション/ビューではget-servlet-value,
      set-servlet-value!, delete-servlet-value!,
      servlet-value-exists?でアクセスできます．

  (1) セッション単位
      
      セッション毎に持つデータです．ユーザ情報等はこのスコー
      プに保存されています．
      
      アクション/ビューではget-value, set-value!,
      delete-value!, value-exists?でアクセスできます．

  (1) サイクル単位
      
      一回のリクエスト/レスポンス毎に持つデータです．
      
      アクション/ビューではget-cycle-value,
      set-cycle-value!, delete-cycle-value!,
      value-cycle-exists?でアクセスできます．
      
=== その他のデータ

  (1) レスポンスのメタ情報
      
      クライアントに返すレスポンス以外にレスポンスのメタ情報
      も渡したいことがあります．HTTPではヘッダに関する情報が
      それにあたります．scratchでは一回のリクエスト/レスポン
      ス単位のデータとしてレスポンスのメタ情報を扱います．
      
      レスポンスのメタ情報はget-response-value,
      set-response-value!, delete-response-value!,
      value-response-exists?でアクセスできます．アクションで
      もビューでもアクセスできますが，レスポンスのメタ情報は
      ビュー毎に扱い，アクションでは関知するべきではありませ
      ん．
      
      例えば，HTTPでクライアントにmainというアクションを要求
      するように移動させるには以下のようなビューを定義し，
      exportします．
      
        (define (jump-to-main)
          (set-response-value! :location (href :action 'main))
          "")

