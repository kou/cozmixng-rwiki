# -*- rd -*-

= Pseudo Web Mail::README.ja

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

Ruby's

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))を御覧下さい．

== なにこれ？

略してPWM．和名は((*いんちきWebMail*))または((*偽WebMail*))．
より良い名前募集中です．

ローカル配送のみのWebメールシステムです．SMTPやPOP3，IMAP等
を用いたWeb Mailシステムでは((*ありません*))．よって、Yahoo! 
やHotMail等のように無料メールとして利用することは出来ません．

その代わり，SMTPサーバやPOP3，IMAPサーバ等を用意する必要はあ
りません．さらに，((<RAA:webrick>))がインストールされてあれ
ばApache等のHTTPサーバさえ用意する必要もありません．

== 概要

  * 無料
  * お手軽(ユーザ名、パスワードだけ登録すればすぐ使える)
  * ユーザ名に日本語が使える
    * => 初心者にやさしい？
  * 外部にメールを送ることは出来ない(内部で完結)
    * => 失敗しても外部(インターネットなど)への影響が少ない
      * => 初心者にやさしい？
  * 一定期間使用されないアカウントは自動削除
    * 飽きたらほったらかしておけばいい
  * Ruby、dRubyを用いている

== 依存ライブラリ

  * ((<RAA:drb>))
  * ((<RAA:erb>))
  * ((<RAA:div>))
  * ((<RAA:devel-logger>))

=== あればいいライブラリ

  * ((<RAA:webrick>))

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/pwm.tar.gz>))

  % svn co http://www.cozmixng.org/repos/ruby/pwm/trunk pwm

== インストール

  % ruby install.rb config
  % ruby install.rb setup
  # ruby install.rb install

== 設定

=== CGI用

  (1) site/pwm-config.rbを環境にあわせて設定する。
  (2) site/pwmd.rbを起動する。

        % ruby -Ke pwmd.rb

      daemontoolsを使うと幸せになれます．

  (3) interface/index.rbとsample/{pwm.css,pwm.js}をHTTPでア
      クセスできるディレクトリに移動する。

  (4) ブラウザでindex.rbにアクセスする。

=== Webrick用

  (1) site/pwm-config.rbを環境にあわせて設定する。

  (2) site/standalone-pwmd.rbを起動する。

        % ruby -Ke standalone-pwmd.rb

      daemontoolsを使うと幸せになれます．

  (3) sample/{pwm.css,pwm.js}をPWM::MOUNT_DIRECTORYに移動する．

  (4) ブラウザでhttp://yourhost:#{PWM::PORT}/pwmにアクセスする．

== 使用例(提案)

  * 社内や学内などのローカルネットで
    * => 「((<全員に送信>))」、「((<グループに送信>))」の機能を使えば簡
      易メーリングリストが出来る。一人一人にメールアドレスを配
      布する必要もない。

  * インターネット上に設置して
    * => このサーバ上での形態。
      * 通常のメールのようにコミュニケーションツールとして
        * => メールアドレスが無くても使える(無料登録)
      * メモ代わりに
        * => 自分に送っておく。送信時間も記録されるので便利!?
