# -*- rd -*-

= NEWS.ja

$Id: NEWS.ja 492 2008-10-22 12:15:00Z kou $

== 0.1.5から0.1.6の変更点: 2008-10-22

  * diff表示の改良
  * assert-valid-moduleの追加
  * 折り返しプログレス表示のサポート
  * userモジュールでのテストをサポート
  * gauche.test互換レイヤーの追加
  * (extend test.unit.test-case)ではなく
    (use test.unit.test-case)でも動作するように変更

== 0.1.4から0.1.5の変更点: 2008-06-30

  * assert-not-matchの追加
  * setup/teardown内でのassert-*サポート
  * 結果表示を改良
  * diffの結果が横長の時、折りたたんだdiffを表示する機能の追加

== 0.1.3から0.1.4の変更点: 2008-06-04

  * Gauche 0.8.8に対応
  * 色付け可能かどうかの推測処理を改良
  * run-test.elを別パッケージに分離

== 0.1.2から0.1.3の変更点: 2008-06-02

  * APIの変更: define-test-case -> テストモジュール定義
  * pending対応
  * 結果出力改良
  * GTK+ UIの未サポート
