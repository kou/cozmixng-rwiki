# -*- rd -*-

= README.ja

$Id: README.ja 868 2007-04-02 03:15:56Z tkdats $

== rabbit-mode.el

Rabbit�Υ������ե������Ѥ�Emacs�᥸�㡼�⡼�ɤǤ���

== ���󥹥ȡ���

.emacs�˰ʲ��򵭽Ҥ��Ƥ���������

  (autoload 'rabbit-mode "rabbit-mode" "major mode for Rabbit" t)
  (add-to-list 'auto-mode-alist '("\\.\\(rbt\\|rab\\)$" . rabbit-mode))

== �ܼ�

=== Rabbit�����
  * ((<rabbit-mode.el::Emacs����Rabbit��ư����>))

=== ��ư
  * ((<rabbit-mode.el::���Υ��饤�ɤذ�ư����>))
  * ((<rabbit-mode.el::���Υ��饤�ɤذ�ư����>))

=== ����
  * ((<rabbit-mode.el::�����ȥ����������>))
  * ((<rabbit-mode.el::�����Υƥ�ץ졼�Ȥ���������>))
  * ((<rabbit-mode.el::���饤�ɤ���������>))
  * ((<rabbit-mode.el::�վ�񤭤���������>))

=== ���饤�����
  * ((<rabbit-mode.el::���饤�ɤ�������>))
  * ((<rabbit-mode.el::���饤�ɤ򥳥ԡ�����>))
  * ((<rabbit-mode.el::���饤�ɤ�ʣ�̤���>))

=== ����
  * ((<rabbit-mode.el::�����ƥ�ץ졼�ȤΥǥե���ȤΥ�����������ˡ���Ѥ���>))
  * ((<rabbit-mode.el::rabbit-mode���ѿ�>))

== Rabbit�����
=== Emacs����Rabbit��ư����

rabbit-run-rabbit��¹Ԥ��ޤ����ǥե���ȤΥ����Х���ɤ�C-c C-r�Ǥ���

(('*'))Rabbit<�ե�����̾>*�Ȥ����Хåե������졤Rabbit�Υ�å��������񤭹�
�ޤ�ޤ���

== ��ư
=== ���Υ��饤�ɤذ�ư����

rabbit-next-slide��¹Ԥ��ޤ����ǥե���ȤΥ����Х���ɤ�M-n�Ǥ���

=== ���Υ��饤�ɤذ�ư����

rabbit-previous-slide��¹Ԥ��ޤ����ǥե���ȤΥ����Х���ɤ�M-p�Ǥ���

== ����
=== �����ȥ����������

rabbit-insert-title-template��¹Ԥ��ޤ����ǥե���ȤΥ����Х���ɤ�
C-c C-t�Ǥ���

�ץ쥼��ơ������Υ����ȥ�ȥ᥿�ǡ��������Ϥ��ޤ����ǥե���ȤΥ᥿
�ǡ������ѿ��������ǽ�Ǥ�������Ǥ���᥿�ǡ�����

  * rabbit-author(����)
  * rabbit-institution(��°)
  * rabbit-theme(�ơ���)

�Ǥ���

=== �����Υƥ�ץ졼�Ȥ���������

�����������ϳ��ǻ��ꤹ��Τ��������Ȼפ��ޤ��Τǡ������꤬�ǥե���
�ȤˤʤäƤ��ޤ���

==== ��������������ǻ��ꤹ����

rabbit-insert-image-template-default��ƤӤޤ����ǥե���ȤΥ����Х���
�ɤ�C-c C-i�Ǥ���

�����ե�����Υѥ�������ץ���󡤲����������γ������Ϥ��ޤ����ե���
��ѥ��ʳ��Ͼ�ά��ǽ�Ǥ���

==== �����������λ�����ˡ�������

rabbit-insert-image-template��ƤӤޤ����ǥե���ȤΥ����Х���ɤ�C-c i�Ǥ���

�����ե�����Υѥ�������ץ���󡤥������������ˡ�������������Ϥ��ޤ���
�ե�����ѥ��ʳ��Ͼ�ά��ǽ�Ǥ���

�������������ˡ��

* relative
* normalized
* pixel(���ȹ⤵�����)

�������Ӥޤ���

=== ���饤�ɤ���������

rabbit-insert-slide��ƤӤޤ����ǥե���ȤΥ����Х���ɤ�C-c C-s�Ǥ���

=== �վ�񤭤���������

rabbit-insert-items��ƤӤޤ��������Х���ɤϳ�����Ƥ��Ƥ��ޤ���

���ܤ����Ϥ��Ƥ�������ʸ�������Ϥ���Ƚ�λ���ޤ���

== ���饤�����
=== ���饤�ɤ�������

rabbit-delete-slide��¹Ԥ��ޤ����ǥե���ȤΥ����Х���ɤ�C-c C-d�Ǥ���

=== ���饤�ɤ򥳥ԡ�����

rabbit-copy-slide��¹Ԥ��ޤ��������Х���ɤϳ�����Ƥ��Ƥ��ޤ���

���ߤΥ��饤�ɤ������󥰤���¸����ޤ���

=== ���饤�ɤ�ʣ�̤���

rabbit-duplicate-slide��¹Ԥ��ޤ��������Х���ɤϳ�����Ƥ��Ƥ��ޤ���

���ߤΥ��饤�ɤΥ��ԡ��򡤼��Υ��饤�ɤȤ����������ޤ������ߤΥ��饤��
�����Ƥ򾯤������Ѥ��������������Ǥ���

=== �����ƥ�ץ졼�ȤΥǥե���ȤΥ�����������ˡ���Ѥ���

�ѿ�rabbit-default-image-size-unit�˥�����������ˡ�򥻥åȤ��ޤ����ǥե�
��Ȥ�"relative"�Ǥ���

ͭ������
  * "relative"
  * "normalized"
  * "pixel"

== �ѿ�

: rabbit-command

   Rabbit�ε�ư���ޥ�ɤǤ�(�ǥե���Ȥ�"rabbit")��

: rabbit-author

   ����̾�Ǥ��������ȥ�ڡ����Υƥ�ץ졼�ȤǻȤ��ޤ�(�ǥե���Ȥ�nil)��

: rabbit-institution

   ���Ԥν�°�Ǥ��������ȥ�ڡ����Υƥ�ץ졼�ȤǻȤ��ޤ�(�ǥե���Ȥ�nil)��

: rabbit-theme

   �ץ쥼��ơ������Υơ��ޤǤ�(�ǥե���Ȥ�"rabbit")��

: rabbit-default-image-size-unit

   �����ե�����Υƥ�ץ졼�������ǻȤ���ǥե���ȤΥ�����
   ������ˡ�Ǥ�(�ǥե���Ȥ�"relative")��

: Faces

   rabbit-mode�γ�face�Ǥ���

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
