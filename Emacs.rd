= Emacs

== TRAMP

リモートのファイルを編集できる。

((<マニュアル|URL:http://www.nongnu.org/tramp/>))

=== 設定

  (require 'tramp)
  (setq tramp-default-method "scp") ; "ssh" ??

=== 使用法

C-x C-fで/hostname:pathでhostnameというホストのpathというパスを開ける。便利かも。

/ssh:hostname:pathだとsshを使って相手ホストに接続。

== shimbun

w3m-elに含まれるWeb上の情報(ニュースサイトとかメーリングリストのアーカイブとか日記とか)をメールとして扱えるようにするライブラリ．

これでメーリングリストのアーカイブを読むように設定すればメーリングリストに入らなくてもよくなる?!

Mewのインタフェイスもある．

=== 設定例

ということで，.mew.elの設定例．

  ;;; SHIMBUN
  (setq mew-shimbun-use-unseen t)
  (setq mew-shimbun-use-unseen-cache-save t)

  (require 'mew-shimbun)

  (setq mew-touch-folder-p t)

  (setq mew-shimbun-folder-groups
        '(("slashdot-jp"
           ("slashdot-jp.story" . 3))
          ("news"
           ("cnet.comp" . 3))
          ("quickml"
           ("quickml.quickml-users" . 7))
          ("ruby"
           ("ruby.ruby-dev" . 7)
           ("ruby.ruby-math" . 7)
           ("ruby.ruby-ext" . 7))
          ("debian"
           ("debian-jp.debian-users" . 7))))

  (setq mew-shimbun-expires
        '(("slashdot-jp" . 7)
          ("news" . 7)
          ("quickml" . 7)
          ("ruby" . 7)
          ("debian" . 7)))

  (define-key mew-summary-mode-map "G"  (make-sparse-keymap))
  (define-key mew-summary-mode-map "Gg" 'mew-shimbun-goto-folder)
  (define-key mew-summary-mode-map "GG" 'mew-shimbun-goto-unseen-folder)
  (define-key mew-summary-mode-map "Gi" 'mew-shimbun-retrieve)
  (define-key mew-summary-mode-map "GI" 'mew-shimbun-retrieve-all)
  (define-key mew-summary-mode-map "Gr" 'mew-shimbun-re-retrieve)
  (define-key mew-summary-mode-map "GR" 'mew-shimbun-re-retrieve-all)
  (define-key mew-summary-mode-map "Ge" 'mew-shimbun-expire)
  (define-key mew-summary-mode-map "GE" 'mew-shimbun-expire-all)
  (when mew-shimbun-use-unseen
    (define-key mew-summary-mode-map "Gu" 'mew-shimbun-unseen-check)
    (define-key mew-summary-mode-map "GU" 'mew-shimbun-unseen-remove-all))


=== 使用法

詳しくはREADME.shimbun.jaを参照．

  * Giで現在いるフォルダの記事を取得記事(GIだと全ての記事を取得)
  * Ggで移動(GGだと未読の記事があるところにだけ移動可能)
  * Grで現在読んでいる記事を更新(GRだと全ての記事を更新)
  * Geで現在いるフォルダの期限切れの記事を削除(GEだと全ての期限切れの記事を削除)
