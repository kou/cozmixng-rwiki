# -*- rd -*-

= README.ja

$Id: README.ja 239 2004-07-27 17:08:28Z kou $

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

GPL or BSD License

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
を御覧下さい．

== なにこれ？

GaucheのためのXML-RPCクライアントライブラリです．

以下のような機能はありません．

  * multiCallとかいろいろ

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/xsm.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/xsm/trunk xsm

== インストール

  # gosh install/install.scm

== 使い方

sample/calc_client.scmを見てください．

== マッピング

XML-RPCでの型と，Scheme上での型（クラス）を以下のようにマッ
ピングします．

: int
   ((|<integer>|))

: boolean
   ((|<boolean>|))

: string
   ((|<string>|))

: double
   ((|<double>|))

: dateTime.iso8601
   ((|<date>|))

: base64
   ((|<string>|))
   
   SchemeのオブジェクトをXML-RPCのbase64型とする場合は，
   (({make-base64-encoded-string}))手続きを使って，文字列を
   ((|<base64>|))型に変換してください．

: struct
   ((|<hash-table>|))

: array
   ((|<vector>|))
