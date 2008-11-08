# -*- rd -*-

= Tutorial.ja

$Id: Tutorial.ja 202 2004-06-24 16:13:08Z kou $

== 流れ

scratchを用いたWebベースアプリケーション開発は以下のようにな
るでしょう．

  * アプリケーションの機能を提供するライブラリの作成
  * scratchサーバにマウントするサーブレットの作成
  * クライアントの要求に対応するアクションの作成
  * クライアントに返す結果を生成するビューの作成

最初のライブラリの作成はscratchに依存しないようにするべきで
す．依存しないようにするとscratchを使うことをやめても使いま
わすことができます．

ここでは，ライブラリは特に用意せずに済む簡単なアプリケーショ
ンを例に使います．ここで作成するアプリケーションはログインし
た回数を数えるlogin-countアプリケーションです．

== サーブレットの作成

login-count-servletというモジュールにlogin-countアプリケーショ
ン用のサーブレットを作成するmake-login-count-servletを定義し，
exportします．

  (define-module login-count-servlet
    (use scratch.servlet)
    (use scratch.session)
    (use scratch.user.manager.file)
    (use scratch.db.file)
    (export make-login-count-servlet))
  (select-module login-count-servlet)

  (define (make-login-count-servlet)
    (make <scratch-servlet>
      :servlet-module-name 'login-count-servlet
      :session-constructor (lambda () (make-scratch-session :count 0))
      :db (make <scratch-db-file>)
      :user-manager (make <user-manager-file>
                      :default-authority 'deny
                      :authority-map '((#t #t)
                                       (#f add-user)))))

  (provide "login-count-servlet")

まず，useしているモジュールを説明します．

  * scratch.servlet
    
    サーブレットのクラス<scratch-servlet>が定義されているモ
    ジュールです．サーブレットを作るときは必ずuseしてくださ
    い．

  * scratch.session
    
    セッションに関するモジュールです．
    make-login-count-servlet内でmake-scratch-session手続きを
    使っているので必要になります．<scratch-servlet>クラスの
    インスタンスを作成するときにキーワード引数
    :session-constructorを省略する場合はuseする必要はありま
    せん．

  * scratch.user.manager.file
    
    ユーザ管理/アクセス制御に関するモジュールです．
    <scratch-servlet>クラスのインスタンスを作成するときにキー
    ワード引数:user-managerを省略する場合はuseする必要はありま
    せん．

  * scratch.db.file
    
    データをファイルを用いて管理するモジュールです．
    <scratch-servlet>クラスのインスタンスを作成するときにキー
    ワード引数:dbを省略し，かつ，scratch.user.manager.fileを
    使用しない場合はuseする必要はありません．

それでは，(make <scratch-servlet> ...)のキーワード引数をみて
いきましょう．

  * :servlet-module-name
    
      'number-table-servlet
    
    これは必ず指定してください．このモジュール名の下(aとa.b 
    というモジュールがあったらa.bがaの下にあるという意味)に
    アクションやビューを定義することになります．

  * :session-constructor
    
      (lambda () (make-scratch-session :count 0))
    
    新しくセッションを作成するときに呼ばれる引数無しの手続き
    です．省略するとmake-scratch-sessionが呼ばれます．
    
    make-scratch-sessionへのキーワード引数は与えられたキーワー
    ドがキーとなるセッション単位のデータを与えられた値として
    初期化します．
    
    セッション単位のデータを初期化する必要がない場合は省略し
    て構いません．

  * :db
    
      (make <scratch-db-file)
    
    サーブレット単位のデータを管理するデータベースを指定しま
    す．省略された場合は(make <scratch-db-null>)が指定された
    ものとみなされます．<scratch-db-null>は何もしないデータ
    ベースです．
    
    データベースを利用しないことを#fで表さずに何もしないデー
    タベースを利用することにより，データベースを利用している
    かどうかを気にする必要がなくなります．<scratch-db-file>
    等，他のデータベースと同じインターフェイスでアクセスする
    だけです．データベースを利用しない場合はデータストアは単
    に無視されるだけです．
    
    データベースのインターフェイスはscratch.dbで定義されてい
    ます．

  * :user-manager
    
      (make <user-manager-file>
        :default-authority 'deny
        :authority-map '((#t #t)
                         (#f add-user)))
    
    ユーザ管理とアクセス制御を指定しています．ユーザ管理もア
    クセス制御藻しない場合は省略可能です．省略された場合は
    (make <user-manager-null>)が指定されたものとみなされます．
    
    ここでは，ユーザ管理オブジェクトとして
    <user-manager-file>クラスのインスタンスを指定しています．
    
    アクセス制御は:default-authorityと:authority-mapでしてい
    ます．:default-authorityにはallowかそれ以外のシンボル
    (denyを指定することを推奨)を指定してください．allowの場
    合はデフォルトで全てのユーザに対して全てのアクションは許
    可されます．allow以外の場合は拒否されます．
    
    デフォルトのアクセス制御は:authority-mapで反転できます．
    :authority-mapにはユーザ名が最初の要素の連想リストを指定
    します．連想リストは先頭から順にマッチさせていき最初にマッ
    チしたものが適用されます．
    
    例えば，:default-authorityがallowで:authority-mapが((foo
    a b c))という場合はfooというユーザはaとbとcというアクション
    は拒否され，それ以外のアクションは許可されます．barというユー
    ザには全てのアクションが許可されます．
    
    ユーザ名の部分には#tまたは#fを指定することもできます．#tは全て
    のユーザにマッチします．#fはログインしていないユーザにマッ
    チします．アクションの部分には#tを指定することができます．
    これは全てのアクションにマッチします．
    
    :default-authorityがdenyで:authority-mapが
    
      ((#t a))
    
    という場合は全てのログインしているユーザに対してaという
    アクションは許可され，他のアクションは拒否されます．
    
    :default-authorityがdenyで:authority-mapが
    
      ((guest show)
       (#t #t)
       (#f add-uesr))
    
    という場合は，ログインしているguest以外のユーザには全て
    のアクションは許可されますが，guestユーザに対してはshow
    アクションだけ，ログインしていないユーザにはadd-userアク
    ションだけしか許可されません．

== アクションの作成

まず，アクションを扱うモジュールを作成します．

  (define-module login-count-servlet.action
    (use scratch.db)
    (use scratch.user.manager)
    (use scratch.action))
  (select-module login-count-servlet.action)
  (provide "login-count-servlet.action")

useするモジュールはscratch.actionのみで構いませんが，scratch
で管理しているデータにアクセスしたりユーザ管理をする場合には
scratch.dbとscratch.user.managerもuseしておくとよいでしょう．

ここでは，以下の3つのアクションを作ります．

  * login
    
    もし入力されたユーザが存在しなければ追加してログインさせ
    る．入力されたユーザとパスワードがあっていればログインさ
    せる．このときのビューはjump-to-main
    
    そうでなければログインさせない．このときのビューはlogin．
    
      (define (do-login)
        (or (and-let* ((user (get-param *scratch-user-key*))
                       (user)
                       (password (get-param *scratch-password-key*))
                       (password))
                      (cond ((valid-user? user password) 'jump-to-main)
                            ((user-exists? user)
                             (set-cycle-value!
                              :message (if (user-exists? user)
                                           "password doesn't match"
                                           #`"user ,|user| doesn't exist"))
                             'login)
                            (else
                             (add-user! (user-manager) user password)
                             (set-cycle-value!
                              :message #`"user ,|user| added.")
                             'jump-to-main)))
            'login))

  * main
    
    トータルログイン回数をカウントアップ．ビューはmain．
    
      (define (do-main)
        (set-servlet-value! 'count (+ 1 (get-servlet-value 'count)))
        'main)

  * countup
    
    セッション単位のカウンタをカウントアップする．ビューはmain．
    
      (define (do-countup)
        (set-value! 'count (+ 1 (get-value 'count)))
        'main)

デフォルトのアクションはmainに，アクセスを拒否した場合のアク
ションはloginにします．

  (define (do-default)
    (do-main))

  (define (do-deny)
    (do-login))

最終的には以下の様になります．

  (define-module login-count-servlet.action
    (use srfi-2)
    (use scratch.db)
    (use scratch.user.manager)
    (use scratch.action)
    (export do-login do-main do-countup))
  (select-module login-count-servlet.action)

  (define (do-login)
    (or (and-let* ((user (get-param *scratch-user-key*))
                   (user)
                   (password (get-param *scratch-password-key*))
                   (password))
                  (cond ((valid-user? user password) 'jump-to-main)
                        ((user-exists? user)
                         (set-cycle-value!
                          :message (if (user-exists? user)
                                       "password doesn't match"
                                       #`"user ,|user| doesn't exist"))
                         'login)
                        (else
                         (add-user! (user-manager) user password)
                         (set-cycle-value!
                          :message #`"user ,|user| added.")
                         'jump-to-main)))
        'login))

  (define (do-main)
    (set-servlet-value! 'count (+ 1 (get-servlet-value 'count)))
    'main)

  (define (do-countup)
    (set-value! 'count (+ 1 (get-value 'count)))
    'main)

  (define (do-default)
    (do-main))

  (define (do-deny)
    (do-login))

  (provide "login-count-servlet.action")

== ビューの作成

scratchクライアントがCGIの場合(HTTPを用いている場合)，ビュー
はクライアントに返す結果を文字列のツリーで返します．最も簡単
なツリーは単なる文字列です．例えば，以下のものが文字列のツリー
です．

  "str"
  ("s" "t" "r")
  (("s") ("t" (("r"))))

scratchクライアントはツリーをtree->stringを用いて(本当の)ク
ライアントに返します．ちなみに，これらのツリーはどれも"str"
という文字列としてクライアントに返されます．

現在，scratchではHTTPしかサポートしていないので，ここでは，
クライアントがHTTPの場合として進めます．

ビューの生成には埋め込みScheme処理系である
((<esm|URL:http://www.cozmixng.org/~rwiki/index.rb?cmd=view;name=esm>))
を使う方法と，text.html-liteを使う方法が多く使われるでしょう．
文字列が多い場合にはesmが，文字列がそれほど多くなく，条件分
岐や繰り返しが多くなるところではtext.html-liteを用いる方がよ
いでしょう．ただ，これらふたつは排他的ではないので，多くの場
合は組み合わせて使うとよいでしょう．

今回はjump-to-mainビューは手続きで，他のビューはesmを使って
書くことにします．

ビューのためのモジュールは以下のようになります．

  (define-module login-count-servlet.view.http
    (use gauche.parameter)
    (use esm.gauche)
    (use scratch.view.http))
  (select-module login-count-servlet.view.http)
  (provide "login-count-servlet/view/http")

esmを使うときはscratch.view.http以外にもesm.gaucheと
gauche.parameterをuseしなければいけないことに注意してくださ
い．

まず，jump-to-mainビューを作ります．このビューはmainビューに
リダイレクトするだけのビューです．

  (define (jump-to-main)
    (set-response-value!
      :location (href :action 'main
                      *scratch-user-key* (get-param *scratch-user-key*)
                      *scratch-password-key* (get-param *scratch-password-key*)))
    "")

クライアントがHTTPの場合はset-response-value!で:locationとい
うキーにリダイレクトしたいURLを指定します．hrefという手続き
は自分自身のURLを生成するための便利な手続きです．リダイレク
トする場合はHTTPの本体には情報は必要ないので空文字列を返して
います．

特定のディレクトリにあるesmファイルをロードして手続きとして
定義するにはload-esm-filesを使います．load-esm-filesは引数の
文字列をglob(7)のパターンとして扱うので，以下のようにすれば
拡張子がesmのファイルを全て読み込むことができます．

  (load-esm-files "login-count-servlet/view/http/*.esm")

load-esm-filesは定義した手続きを束縛するシンボルをexportする
ので，開発者が明示的にexportする必要はありません．よって，
ビューのモジュールは以下のようになります．


  (define-module login-count-servlet.view.http
    (use gauche.parameter)
    (use esm.gauche)
    (use scratch.view.http)
    (export jump-to-main))
  (select-module login-count-servlet.view.http)

  (load-esm-files "login-count-servlet/view/http/*.esm")

  (define (default-view)
    (main))

  (define (jump-to-main)
    (set-response-value!
      :location (href :action 'main
                      *scratch-user-key* (get-param *scratch-user-key*)
                      *scratch-password-key* (get-param *scratch-password-key*)))
    "")

  (provide "login-count-servlet/view/http")

default-viewがデフォルトで呼び出されるビューです．ここでは，
単にmainビューを呼んでいるだけです．

それではesmファイルを見ていきましょう．

header.esm:
  <html>
  <head>
          <title>Login Count Example</title>
  </head>
  <body>

footer.esm:
  </body>
  </html>

show-message.esm:
  <% (when (get-cycle-value :message #f) %>
  <h2><%= (h (get-cycle-value :message)) %></h2>
  <% ) %>

これらは，ビューの中で用いられることを前提に作られたビューで
す．ビューといっても単なる手続きなので，他のビューからも簡単
に呼び出せます．

login.esm:
  <%= (header) %>
  <h1>Login Count: login</h1>
  <%= (show-message) %>
  <%= (form :action 'main) %>
          <p>User: <%= (user-name-input) %></p>
          <p>Password: <%= (password-input) %></p>
          <p><input type="submit" value="LOGIN!" /></p>
  </form>
  <%= (footer) %>

formという手続きはform開始タグを生成する手続きです．キーワー
ド引数:actionによって次のアクションを指定することができます．
user-name-inputとpassword-inputはユーザ名/パスワード入力フォー
ムを出力するための便利な手続きです．

main.esm:
  <%= (header) %>
  <h1>Login Count</h1>
  <%= (show-message) %>
  <p>
          <a href="<%= (href :new-session #t :action 'login) %>">LOGOUT</a>
          /
          <a href="<%= (href :action 'countup) %>">COUNTUP</a>
          (<%= (get-value 'count) %>)
          /
          Total Login:
          <%= (get-servlet-value 'count) %>
          /
          <%= (get-user) %>
          /
          <%= (get-id) %>
  </p>
  <%= (footer) %>

hrefはキーワード引数:new-sessionに#tを指定することによってク
ライアントに強制的に新しいセッションを開始させることができま
す．get-user/get-idはログインしているユーザ名/IDを取得する手
続きです．

今回は使用していませんが，esmとtext.html-liteを組み合わせて
使うときは以下のことに注意してください．

  * esm中の<%= exp %>に文字列のツリーを指定しない．
    
    <%= exp %>はtree->stringではなくx->stringを用いてexpを出
    力するので期待通りの結果にならないかもしれません．

=== scratchサーバ

それでは，scratchサーバにサーブレットをマウントしてscratchク
ライアントからの要求を受け付けるスクリプトを書きましょう．

  #!/usr/bin/env gosh

  (use scratch.server)
  (use login-count-servlet)

  (define *login-count-port* 5969)
  (define *login-count-mount-point* "/login-count")

  (define (main args)
    (let* ((server (make-scratch-server #`"dsmp://:,|*login-count-port*|")))
      (add-mount-point! server
                        *login-count-mount-point*
                        (make-login-count-servlet))
      (scratch-server-start! server)
      (scratch-server-join! server)))

make-scratch-serverにはキーワード引数:portを指定してどのポー
トでサーバを起動するかを指定します．サーバを作成したら
add-mount-point!でlogin-count用のサーブレットをマウントしま
す．マウントポイントはscratchクライアントがアクセスする際に
使用されます．scratch-server-start!でscratchクライアントから
の要求を受け付ける準備は完了です．scratch-server-join!は
scratchサーバが終了するまでプログラムを終了しないようにする
手続きです．

=== scratchクライアント

クライアントはCGIとします．

  #!/usr/bin/env gosh

  (use scratch.client.cgi)

  (define *login-count-server* "localhost")
  (define *login-count-port* 5969)
  (define *login-count-mount-point* "/login-count")

  (define (main args)
    (scratch-cgi-main #`"dsmp://,|*login-count-server*|:,|*login-count-port*|"
                      *login-count-mount-point*
                      :debug #t))

scratch-cgi-main にscratchサーバのURIと，先ほど設定したマウ
ントポイントを指定します．後は，ライブラリで面倒を見てくれま
す．

=== 実行

最初にサーバを起動します．

  % ./login-count-server.scm

クライアントをCGIが実行できる場所に移動してブラウザからアク
セスしてみてください．ログイン画面が出たら成功です．

なお，このサンプルはsample/login-count/に含まれています．
