= kenke::メモ

=== rails-nav:goto-layoutsでエラー
エラー内容: Wrong type argument: listp, "--"

defun rails-nav:goto-layouts () で
  -  (let ((items (list (cons "--" "--")
  +  (let ((items (list
にしたらエラーが出なくなった
