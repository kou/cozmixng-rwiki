# -*- rd -*-

= README.ja

$Id: README.ja 190 2004-06-23 13:58:57Z kou $

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

GPL or BSD License

== メーリングリスト

((<COZMIXNG RWiki - 連絡先|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))を御覧下さい．

== なにこれ？

簡易marshal/unmarshalライブラリです．

文字列や数値などread/writeできるオブジェクトはそのまま
read/writeを使ってmarshal/unmarshalしますが，手続きなど
read/writeできないオブジェクトはIDをつけてメモリ上で管理しま
す．つまり，同じプロセス内ではmarshal/unmarshalできますが，
プロセスを越えてmarshal/unmarshalはできません．

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/marshal.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/marshal/trunk marshal

== インストール

  # gosh install/install.scm
