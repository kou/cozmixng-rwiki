= svn-utils

Subversion�Τ���ξ�ʪ����(Powered by Ruby)

== �ޤޤ�Ƥ�����

  * commit�᡼������������ꡤcommit RSS����Ϥ��륹����ץ�

== ������ˡ

���������֤Ϥ���ޤ���

  % svn co http://www.cozmixng.org/repos/ruby/svn-utils/trunk/ svn-utils

== bin/commit-email.rb

commit�᡼������������ꡤcommit RSS����Ϥ��륹����ץ�

=== ����

��ݥ��ȥ�/hooks/post-commit��ʲ��Τ褦�ˤ��롥�¹Ը����դ���Τ�˺�줺�ˡ�

  #!/bin/sh
  REPOS="$1"
  REV="$2"
  
  PATH=/usr/local/bin:/usr/bin:/bin
  # �� svnlook�Ȥ�ruby�Ȥ�commit-email.rb������ѥ���ޤ�뤳�ȡ�
  export PATH
  
  commit-email.rb \
    "$REPOS" "$REV" �᡼������륢�ɥ쥹 \
    -I svn-utils/lib�ؤΥѥ� \
    -r ��ݥ��ȥ��URI�ʺǸ��/���դ��ʤ��� \
    --rss-path ���Ϥ���RSS�ؤΥѥ���URI����ʤ����� \
    --rss-uri RSS��URI \
    --name �ץ�������̾ \
    --error-to ���顼�������ä����������襢�ɥ쥹 \
    --from �᡼���From�ˤ��륢�ɥ쥹

���ʤߤˡ�RSS����Ϥ��ʤ��Ƥ�褤�ʤ餳��Ǥ褤�Ǥ���

  commit-email.rb \
    "$REPOS" "$REV" �᡼������륢�ɥ쥹 \
    -I svn-utils/lib�ؤΥѥ� \
    -r ��ݥ��ȥ��URI�ʺǸ��/���դ��ʤ��� \
    --name �ץ�������̾ \
    --error-to ���顼�������ä����������襢�ɥ쥹 \
    --from �᡼���From�ˤ��륢�ɥ쥹

�Ȥˤ���ư���������ʤ餳��Ǥ�褤�Ǥ���

  commit-email.rb \
    "$REPOS" "$REV" �᡼������륢�ɥ쥹 \
    -I svn-utils/lib�ؤΥѥ�

=== ������

RWiki��((<��ݥ��ȥ�|URL:http://www.cozmixng.org/repos/rwiki/>))�Ǥϰʲ��Τ褦�ˤ��Ƥ��ޤ���

����:

  * svn-utils��~kou/work/ruby/svn-utils/�ʲ��˥����å������Ȥ��Ƥ��롥
  * svnlook��ruby��/usr/local/bin/�ʲ��ˤ��롥
  * ���ߥåȥ᡼���rwiki-commit@ml.cozmixng.org�Ȥ���ML�����롥
  * ��ݥ��ȥ��URI��http://www.cozmixng.org/repos/rwiki
  * RSS��/usr/local/var/svn/rss/rwiki.rdf�˽��Ϥ��롥
  * RSS��URI��http://www.cozmixng.org/rss/rwiki.rdf
  * �ץ�������̾��RWiki
  * ���顼��ȯ��������kou@cozmixng.org�����Ρ�
  * ���ߥåȥ᡼���null@cozmixng.org���������Ƥ���ʥ��ߥåȥ᡼�������ML�ϻ��üԤ�����ƤǤ��ʤ��Τǡ�����Ͻ��סˡ�

�����դޤ��ơ������ʤ�ޤ���

  #!/bin/sh
  REPOS="$1"
  REV="$2"
  
  PATH=/usr/local/bin:/usr/bin:/bin
  export PATH
  
  ~kou/work/ruby/svn-utils/bin/commit-email.rb \
    "$REPOS" "$REV" rwiki-commit@ml.cozmixng.org \
    -I ~kou/work/ruby/svn-utils/lib \
    -r http://www.cozmixng.org/repos/rwiki \
    --rss-path /usr/local/var/svn/rss/rwiki.rdf \
    --rss-uri http://www.cozmixng.org/rss/rwiki.rdf \
    --name RWiki \
    --error-to kou@cozmixng.org \
    --from null@cozmixng.org
