# -*- rd -*-

= README.ja

$Id: README.ja 20 2004-11-05 12:05:36Z kou $

== 名前

SCIM-RubyBridge

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

GPL

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
を御覧下さい．

== なにこれ？

((<SCIM|URL:http://www.scim-im.org/>))のためのIMエンジンを
Rubyで書けるようにするための，SCIM用IMエンジンです．

== 依存ライブラリ

  * ((<SCIM|URL:http://www.scim-im.org/>))
  * ((<scim|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=scim)):
    SCIMのRubyバインディング

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/scim-ruby-bridge.tar.gz>))

  % svn co http://www.cozmixng.org/repos/c/scim-ruby-bridge/trunk scim-ruby-bridge

== インストール

  % ./configure
  % make
  # make install

== 使い方

サンプルとしてdata/scim/engine/以下にRubyでIMエンジンを書い
たものがあります．それを参考にしてください．現在は以下のもの
があります．

  * Ruby: 入力されたテキストをRubyの式として評価し，その結果
    を変換結果とするIMエンジン
