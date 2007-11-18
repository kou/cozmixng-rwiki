= kenke::メモ

=== rails-nav:goto-layoutsでエラー
エラー内容: Wrong type argument: listp, "--"

rails_navigation.el の defun rails-nav:goto-layouts () で
  -  (let ((items (list (cons "--" "--")
  +  (let ((items (list
にしたらエラーが出なくなった

=== MySQLで文字化け

/etc/mysql/my.cnfの[mysqld]の部分に下記を追加

  default-character-set=utf8
  skip-character-set-client-handshake

* /etc/init.d/mysql restart

* データベース、テーブルを作り直す。
