# -*- rd -*-

= README.ja

$Id: README.ja 764 2006-06-06 15:23:54Z tkdats $

== rabbit-mode.el

Rabbit�Υ������ե������Ѥ�Emacs�᥸�㡼�⡼�ɤǤ���

== ���󥹥ȡ���

.emacs�˰ʲ��򵭽Ҥ��Ƥ���������

  (autoload 'rabbit-mode "rabbit-mode" "major mode for Rabbit" t)
  (add-to-list 'auto-mode-alist '("\\.\\(rbt\\|rab\\)$" . rabbit-mode))

== �ؿ�

�ؿ�̾(�ǥե���ȤΥ����Х����)��ɽ�����ޤ���

=== rabbit-run-rabbit(C-c C-r)

���߳����Ƥ���Хåե��Υե����������Ȥ���Emacs�夫��
Rabbit��ư���ޤ���

Rabbit�Υ�å������ϥХåե�*Rabbit<�ե�����̾>*�Ȥ���
�Хåե��˽��Ϥ���ޤ���

=== rabbit-insert-title-template(C-c C-t)

�����ȥ�Υƥ�ץ졼�Ȥ��������ޤ���

�ץ쥼��ơ������Υ����ȥ�����Ϥ��ޤ���

��Ϣ�����ѿ�

* rabbit-author
* rabbit-institution
* rabbit-theme

=== rabbit-insert-image-template(C-c i)

�����Υƥ�ץ졼�Ȥ��������ޤ���

�����Υե�����̾������ץ���󡤥������������ˡ����������
���Ϥ��ޤ���

����ץ����˲������Ϥ��ʤ��ä����ʶ�ʸ����ξ��)��
�ƥ�ץ졼�ȤΥ���ץ����ιԤϥ����ȥ����Ȥ���ޤ���

�������������ˡ��

* relative
* normalized
* pixel(���ȹ⤵�����)

�������������ˡ�˲������Ϥ��ʤ��ä����ʶ�ʸ����ξ��)��
�ǥե����(relative)��Ȥ��ޤ���

=== rabbit-insert-image-template-default(C-c C-i)

�ǥե����(relative)�Υ������������ˡ�ǲ����Υƥ�ץ졼�Ȥ�
�������ޤ���

�����Υե�����̾������ץ���󡤥����������Ϥ��ޤ���

=== rabbit-insert-slide(C-c C-s)

���饤�ɤ��������������ޤ���

���饤��̾�����Ϥ��ޤ���

=== rabbit-next-slide(M-n)

���Υ��饤�ɤذ�ư���ޤ���

=== rabbit-previous-slide(M-p)

���Υ��饤�ɤذ�ư���ޤ���

== �ѿ�

�ѿ�̾(�ǥե������)�ȵ��Ҥ��ޤ���

=== rabbit-command(rabbit)

rabbit�ε�ư���ޥ�ɤǤ���

��Ϣ����ؿ�
* rabbit-run-rabbit

=== rabbit-author(Author)

�����ȥ��ɽ���������̾�Ǥ���

��Ϣ����ؿ�
* rabbit-insert-title-template

=== rabbit-institution(Institution)

�����ȥ��ɽ��������°�Ǥ�

��Ϣ����ؿ�
* rabbit-insert-title-template

=== rabbit-theme(rabbit)

���ޥ�ɤǥơ��ޤ����ꤵ��ʤ��ä��Ȥ��˻Ȥ���ơ��ޤǤ���

=== Faces

rabbit-mode��face�Ǥ���

* rabbit-heading-face
* rabbit-emphasis-face
* rabbit-verbatim-face
* rabbit-term-face
* rabbit-footnote-face
* rabbit-link-face
* rabbit-code-face
* rabbit-description-face
* rabbit-keyboard-face
* rabbit-variable-face
* rabbit-comment-face
