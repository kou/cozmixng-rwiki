= cogito

git�Ǵ�������Ƥ���cairo�Υ�ݥ��ȥ��cogit�ǥ�����������ʬ�Υ�ݥ��ȥ�������������

== ���ˤʤ��ݥ��ȥ����äƤ���

  % cg-clone git://git.cairographics.org/git/cairo

== �ѹ�����

�ե�������ɲä�����硣

  % cg-add XXX.c

���̤��ѹ������饳�ߥåȤ��롣���Υ��ߥåȤϥ�����Υ�ݥ��ȥ�ؤΥ��ߥåȤˤʤ�Τǡ��ӥӤ�ɬ�פ�̵����

�����������ߥåȤ������˴Ķ��ѿ�GIT_AUTHOR_EMAIL��GIT_COMMITTER_EMAIL�����ꤷ�Ƥ������ۤ����褤��

�ʲ��Τ褦�ʤ�Ĥ�~/.zshenv�ˤǤ�񤤤Ƥ�����

  export EMAIL="kou@cozmixng.org"
  export GIT_AUTHOR_EMAIL="$EMAIL"
  export GIT_COMMITTER_EMAIL="$EMAIL"

ɬ�פʤ�EDITOR�����ꤷ�Ƥ����Ȥ褤��

���ߥåȤ�ñ��cg-commit��Ƥ֤�����

  % cg-commit

== ���������Ѱդ���

�������餬���������Ѱա�

HTTP��cg-clone�Ǥ���褦�ˡ�~/public_html/�ʲ��˺�롣

�����

  % cg-clone http://pub.cozmixng.org/~kou/git/cairo/.git

�Ǥ���褦�ˤ��롣

  % ssh pub.cozmixng.org
  pub% mkdir -p ~/public_html/git/cairo
  pub% cd ~/public_html/git/cairo
  pub% git-init-db

== ����������Ͽ����

cg-push�Ǹ������˼�ʬ�Υ�ݥ��ȥ������Ǥ���褦�ˤ��롣

�ޤ����֥�����������롣�֥����ˤϼ�ʬ��̾�����դ���Τ����̤ߤ�����

  % cd cg-clone�ǤȤäƤ�����ݥ��ȥ꤬����ǥ��쥯�ȥ�
  % cg-branch-add kou git+ssh://pub.cozmixng.org/home/kou/public_html/git/cairo

���ʤߤˡ��֥�����URI���ѹ�����ˤ�cg-branch-chg��Ȥ���

  % cg-branch-chk kou git+ssh://XXX/....

��������ˤ�cg-push�ǡ�cg-branch-add���դ���̾���Υ֥�������ꤹ�롣

  % cg-push kou
