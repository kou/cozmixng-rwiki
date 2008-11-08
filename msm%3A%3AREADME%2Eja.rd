# -*- rd -*-

= README.ja

$Id: README.ja 277 2004-08-12 09:17:25Z kou $

== 作者

Kouhei Sutou <kou@cozmixng.org>

mlambdaはひらっちさん
<http://www.shiro.dreamhost.com/scheme/wiliki/wiliki.cgi?%a4%d2%a4%e9%a4%c3%a4%c1>
によるものです．

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

((<URL:http://www.cozmixng.org/~kou/download/msm.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/msm/trunk msm

== インストール

  # gosh install/install.scm
