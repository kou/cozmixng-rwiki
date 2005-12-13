= GaUnit

The latest version: 0.1.2
(((<download|URL:http://www.cozmixng.org/~kou/download/gaunit-0.1.2.tar.gz>)))

# ((<BTS|URL:/~kagemai/?project=gaunit;action=top>))(Japanese only)

  * ((<README.en|GaUnit::README.en>))
  * ((<README.ja|GaUnit::README.ja>))
#  * ((<Tutorial.en|GaUnit::Tutorial.en>))
  * ((<Tutorial.ja|GaUnit::Tutorial.ja>))
#  * ((<ToDo.ja|GaUnit::ToDo.ja>))
  * ((<UsedBy|GaUnit::UsedBy>))

== Comments

== ������

* define-test-case�ʤɤǡ�setup��teardown���񤱤�ΤϤ����Ǥ��͡�
* assert-*���ʤ�4���ɬ�פʤΤ��褯�狼��ޤ��󡣸��ߤ�
  gauche.test�Τ褦�ˡ�
  (assert <expr> <expected> &optional <eq-proc>) �ǤϤޤ�����Ǥ��礦�����Ȥ����Τ�:
  * assert-*��������⤢��ȡ��������θ����ܤ�·��ʤ��ʸĿ�Ū��̣�Ǥ���)
    * ̾���򸫤�����ǲ���ƥ��Ȥ��Ƥ���Τ�ʬ����Τǻ��assert-*��Ȥ�ʬ����Τ������Ǥ��� - ((<kou>))
  * assert-false��assert-true���ưפ�assert-equal�ǽ񤱡���֤�ۤȤ���Ѥ��ʤ���
  * equal�ʳ��Ƿ�̤���Ӥ��������Ϸ��<expr>�������Ӽ�³���ޤ�
    �񤯤��Ȥˤʤäơ������ä��ɤߤˤ����ʤ롣
    * assert-*��define-assertion�ǿ�������ʬ������Ǥ���Τ����Ѥ�assert-*����Ф����Ȼפ��ޤ���

      �󡤤Ȥ������Ȥϡ�gauche.test��assert��eq-proc�������㤴���㤷���ɤߤˤ����Ȥ������ȤǤ�������ϻȤä����Ȥ��ʤ��Τ��ɤ�ʬ����ʤ��ΤǤ��������� - ((<kou>))

* ���줫�顢<expr>�ǥ��顼��ȯ���������ˤϤɤ����������ΤǤ��礦����
  * ���̤Υ��顼��Ʊ���ͤ˥����å��ե졼�बɽ������ޤ����ƥ��Ȥ�³�Ԥ���ޤ��� - ((<kou>))

* ���顼��ȯ�����٤�����ƥ��Ȥ��������Ϥɤ��񤱤��ɤ��ΤǤ��礦��
  * ����ʤ��󤸤����顥 - ((<kou>))

      (define-assertion (assert-error thunk . message)
        (assert-true (procedure? thunk) " Must be procedure")
        (with-error-handler
         (lambda (err) #t)
         (lambda ()
           (thunk)
           (assertion-failure
            (get-optional message " None expection was thrown")))))

* �ʤ�ۤɡ���ʬ���ߤ�assert-*��������ƻȤ��櫓�Ǥ��͡�
  ���Ū���ץ����Ȥ�������������gauche.test�Ϲⳬ�ؿ���
  �ѥ�᥿�饤�����뤳�Ȥ����ꤷ�Ƥ��ޤ����㤨�С�A, B, C
  �⥸�塼�뤬���äơ��ƥ��ȹ��ܤϤۤȤ��Ʊ���������
  ��̤���Ӿ��������㤦���Ȥ������ʤɤϡ���Ӵؿ���
  �ѥ�᥿�饤���Ǥ���������Ǥ�)���ޤ���assert���Ϥ�
  expr��ǥѥ�᥿�饤�����Ƥ⤤���櫓�Ǥ�����
