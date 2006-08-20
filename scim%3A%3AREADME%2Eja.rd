# -*- rd -*-

= README.ja

$Id: README.ja 667 2006-08-20 02:59:15Z kou $

== 名前

scim

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

Ruby's

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
を御覧下さい．

== なにこれ？

((<SCIM|URL:http://www.scim-im.org/>))のRubyバインディングで
す．RubyとCのインターフェイスは
((<SWIG|URL:http://www.swig.org/>))で生成しています．

== 依存しているもの

  * ((<SCIM|URL:http://www.scim-im.org/>))
  * ((<SWIG|URL:http://www.swig.org/>))

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/scim.tar.gz>))

  % svn co http://www.cozmixng.org/repos/ruby/scim/trunk scim

== インストール

  % ruby setup.rb config

もし，インクルードパスを追加したければ以下のようにしてくださ
い．

  % ruby setup.rb config -- --with-opt-include=パス1:パス2:...

もし，ライブラリパスを追加したければ以下のようにしてください．

  % ruby setup.rb config -- --with-opt-lib=path1:path2:...

--with-opt-includeと--with-opt-libオプションは同時に指定する
ことができます．

あとはいつも通りです．

  % ruby setup.rb setup
  # ruby setup.rb install

== 使い方

((<SCIM-RubyBridge|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=SCIM-RubyBridge>))
を参考にしてください．ごめんなさい，

== 感謝
