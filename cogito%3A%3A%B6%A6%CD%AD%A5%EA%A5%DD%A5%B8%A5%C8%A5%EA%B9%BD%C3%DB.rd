= cogito::��ͭ��ݥ��ȥ깽��

ʣ���ͤǥ��ߥåȤǤ��붦ͭ��ݥ��ȥ�ι��ۡ���ͭ��ݥ��ȥ�ˤ�ssh��ͳ�ǥ����������롥

XXX��ݥ��ȥ�Ȥ�����̾�Τ�Ŭ����

Debian���á�

== ��ݥ��ȥ�桼���κ���

��ͭ��ݥ��ȥ���֤������о�˥桼���������

  % sudo useradd git

��ݥ��ȥ��ѤΥǥ��쥯�ȥ���ꡤ���Υǥ��쥯�ȥ��git�Ѥ˽�������롥

�ץ�������project0�ѤΥ�ݥ��ȥ�ϰʲ��Τ褦�ˤʤ롥((*--shared*))���ݥ���ȡ�

  % sudo -u git mkdir -p ~git/repos/project0
  % cd ~git/repos/project0
  % sudo -u git git-init-db --shared

��ݥ��ȥ�˥��ߥåȤ������桼����git��Ʊ���桼���ˤ��롥

�桼��kou��user�����ߥåȤ��������ϰʲ��Τ褦�ˤʤ롥

  % sudo useradd kou git
  % sudo useradd user git

��ͭ��ݥ��ȥ꤬���륵���ФǤκ�ȤϤ���ǽ�λ��

== ������ߥå�

��������ϡ���ͭ��ݥ��ȥ�򤪤��Ƥ��륵���Ф���ʤ��ơ��긵�δĶ��Ǥκ�ȡ�

�ޤ����Ķ��ѿ������ꡥ

  export EMAIL="kou@cozmixng.org"
  export GIT_AUTHOR_EMAIL="$EMAIL"
  export GIT_COMMITTER_EMAIL="$EMAIL"

�긵�˥������ݥ��ȥ���äơ���ͭ��ݥ��ȥ��cg-push���롥

�ޤ�������ǡ���������ǥ��쥯�ȥ�ǡ��������ݥ��ȥ���������롥

  % cd work/project0
  % cg-init

��ͭ��ݥ��ȥ��origin�֥����Ȥ�����Ͽ���롥

  % cg-branch-add origin git+ssh://192.168.0.123/home/git/repos/project0

���Ȥϡ�origin�֥�����cg-push�����OK��

  % cg-push

���Τ��Ȥϡ����̤�cg-clone������ݥ��ȥ��Ʊ���褦�˰ʲ��Τ褦��ή��ˤʤ롥

  % cg-update
  �Խ�
  % cg-commit
  �Խ�
  % cg-commit
  ...
  % cg-push
  ...
  % cg-update
  �Խ�
  % cg-commit
  ...
  % cg-push
  ...
