# -*- rd -*-

= README.ja

$Id: README.ja 16 2006-09-05 02:55:33Z kou $

== 名前

SCIM-RubyBridge

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

Ruby'sまたはLGPL

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
を御覧下さい．

== なにこれ？

((<SCIM|URL:http://www.scim-im.org/>))のRubyバインディングと
((<SCIM|URL:http://www.scim-im.org/>))のためのIMエンジンを
Rubyで書けるようにするための，SCIM用IMエンジンです．RubyとC
のインターフェイスは((<SWIG|URL:http://www.swig.org/>))で生
成しています．

== 依存ライブラリ

  * ((<SCIM|URL:http://www.scim-im.org/>))
  * ((<SWIG|URL:http://www.swig.org/>))

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

== 感謝
