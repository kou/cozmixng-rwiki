= Emacs

== TRAMP

��⡼�ȤΥե�������Խ��Ǥ��롣

((<�ޥ˥奢��|URL:http://www.nongnu.org/tramp/>))

=== ����

  (require 'tramp)
  (setq tramp-default-method "scp") ; "ssh" ??

=== ����ˡ

C-x C-f��/hostname:path��hostname�Ȥ����ۥ��Ȥ�path�Ȥ����ѥ��򳫤��롣�������⡣

/ssh:hostname:path����ssh��Ȥä����ۥ��Ȥ���³��

== shimbun

w3m-el�˴ޤޤ��Web��ξ���(�˥塼�������ȤȤ��᡼��󥰥ꥹ�ȤΥ��������֤Ȥ������Ȥ�)��᡼��Ȥ��ư�����褦�ˤ���饤�֥�ꡥ

����ǥ᡼��󥰥ꥹ�ȤΥ��������֤��ɤ�褦�����ꤹ��Х᡼��󥰥ꥹ�Ȥ�����ʤ��Ƥ�褯�ʤ�?!

Mew�Υ��󥿥ե������⤢�롥

=== ������

�Ȥ������Ȥǡ�.mew.el�������㡥

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


=== ����ˡ

�ܤ�����README.shimbun.ja�򻲾ȡ�

  * Gi�Ǹ��ߤ���ե�����ε������������(GI�������Ƥε��������)
  * Gg�ǰ�ư(GG����̤�ɤε���������Ȥ���ˤ�����ư��ǽ)
  * Gr�Ǹ����ɤ�Ǥ��뵭���򹹿�(GR�������Ƥε����򹹿�)
  * Ge�Ǹ��ߤ���ե�����δ����ڤ�ε�������(GE�������Ƥδ����ڤ�ε�������)
