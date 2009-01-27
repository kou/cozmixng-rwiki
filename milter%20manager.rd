= milter manager

((<URL:http://sourceforge.net/projects/milter-manager/>))

((<milter>))を管理するmilter。

MTAに依存せずにmilterの設定ができるため、よりMTAに依存せずにmilterを使うことができる。また、MTAのmilter管理機能よりも柔軟にmilterを管理できるため、milter管理コストを下げることができる。

例:
  * 動的にmilterを適用するかどうかを判断する機能があるため、((<S25R|URL:http://gabacho.reto.jp/anti-spam/>))方式に該当した場合のみmilterを適用することができる。（Sendmailや((<Postfix>))のmilter設定機能ではできない）
  * ...

== 付属ツール

=== milter-test-server

milterプロトコルを話すmilterテスト用プログラム。

=== milter-performance-check

SMTPを話すmilterのパフォーマンスチェック用プログラム。
