# -*- rd -*-

= README.ja

$Id: README.ja 169 2004-06-12 14:52:24Z kou $

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

GPL or BSD License

== メーリングリスト

((<COZMIXNG RWiki - 連絡先|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))を御覧下さい．

== なにこれ？

rubyに標準添付されているbenchmark.rbを参考に作られた，ベンチ
マークライブラリです．

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/benchmark.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/benchmark/trunk benchmark

== インストール

  # gosh install/install.scm

== 使用法

簡単な使い方は以下の通りです．

  (use benchmark)

  (bm (lambda (r)
        (report r (lambda () ベンチマークをとりたいことをここでする))
        ...))

具体的な使い方は，sample/以下を見てください．
