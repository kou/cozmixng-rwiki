= Ruby�Ǵؿ��ץ���ߥ�

((<Ruby�Ǵؿ��ץ���ߥ�(Functional Programming in Ruby)|URL:http://sky.zero.ad.jp/~zaa54437/programming/ruby/>))���

== �����˴ؿ�����ꤹ��Ȥ��ˤ�&��Ĥ��ʤ���Ф����ʤ�����

((<�ե������ȥ��饹�δؿ�(Part 6)|URL:http://sky.zero.ad.jp/~zaa54437/programming/ruby/part6.htm>))���

  �ؿ��ΰ����˴ؿ�����ꤹ�뤳�ȤϤǤ��ޤ�����
  ����ϡ��̾�δؿ�����ǤϤʤ��ؿ����֥������Ȥ��������ơ�
  &�����Ĥ��ơ�����������κǸ�˻��ꤷ�ʤ���Фʤ�ޤ���

����Ǥϥ���ʤΤ�������

  def a(b, c, d)
    p b[1]
    p c[1]
    p d[1]
  end

  a(lambda {|x| x + 1},
    lambda {|x| x + 2},
    lambda {|x| x + 3})

== #lambda�˴ؿ����֥������Ȥ��Ϥ��ʤ�����

((<����Ʃ�����γ���(2) - ��³�Ϥ�(continuation passing)|URL:http://sky.zero.ad.jp/~zaa54437/programming/ruby/appendix-b1.htm>))������

�ؿ����֥������Ȥ�Proc���֥������ȤΤ��Ȥʤ���Ϥ���ΤǤϤʤ����������㤨�Ф���ʴ�����

  # ��³�Ϥ���
  # ���
  cont_func4 = lambda {|a| print a, "\n" }

  def cont_func3(a, continuation)
    a=4*a;
    continuation[a]
  end

  cont_func2 = lambda {|a, continuation|
    print a, "\n";
    continuation[a, cont_func4]
  }

  def cont_func1(a, continuation)
    a=a+a+a;
    # Method���֥������ȤǤ⤤���Τʤ�to_proc�Ϥ���ʤ�����
    continuation[a, method(:cont_func3).to_proc]
  end

  # �¹ԥץ����
  cont_func1(2, cont_func2);
