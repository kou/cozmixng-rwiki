= kou::���

  * USB NIC����äƤ������������ޤ�������ǧ�����롪��������

  * CVS����Subversion�ˤ����鵯ư���֤���ѥ������������ä���

  * radvd��Ω���夲�ʤ��ȥ���餷����

  * ���ޤä�����PC�����ɤ�NIC��������ä�����ä�������
    * �̤�!���ä��⺣��̵����NIC��������ޤ��󡣥ץ饤�١��ȥ��ɥ쥹���Ĥ������äƤΤǤɤ��Ǥ��礦��ǰ�Τ���NIC�����ޤ���PC��FreeBSD�Ǥ����Ѱդ���DTCP�򤷤�٤�롼���ˤʤ��褦�ˤ��Ȥ��ޤ��͡��� - osaru
    * ����ä�õ���Ƥ����ޤ���
    * ���꤬�Ȥ��� - osaru

  * [JXTA] ����ML�����äƤ��ޤ�������
    * ��С���餫�����ΤФ���㤤�ޤ������� - osaru
    * ��������������󤹤衼�� - osaru

  * [Debian] ���åץǡ��Ȥ����饢�åץǡ��Ȥ����Ԥ��Ƥ���Emacs�ν���������ޤ�ư���ʤ��褦�ˤʤäƤ��ޤä����������줸�㲿��Ǥ��ʤ��褥��

  * [Ruby][FreeBSD] RWiki��Ƶ�ư�����褦�Ȥ��Ƥ�core���Ǥ��ƻ��Ǥ��ޤ���

    ���á�RUBY_ENABLE_PTHREAD�Ȥ������ץ���������Ƥ뤸��󡥤����Ĥ���Ф��ޤ����������������顥

    ���䡤�ǥե���Ȥ�ͭ���ˤʤäƤ���ʡ��Ȥ������Ȥϡ��դ��ʤ��ȡ�no�ˤ���ȡˤ�����Τ���

    �ӥ󥴡�FreeBSD��pthread�äƷ�����

  * [Ruby][Subversion]

      # enscript ruby
      def diff(options, path1, rev1, path2, rev2,
               out_file, err_file, recurse=true,
               ignore_ancestry=false,
               no_diff_deleted=false, force=false)
        Client.diff2(options, path1, rev1, path2, rev2,
                     recurse, ignore_ancestry,
                     no_diff_deleted, force, out_file,
                     err_file, self, @pool)
      end

  * [�ɥᥤ��] 1ǯ������

  * [���ȥ꡼�ߥ�] �ե���������������椫��Ǥ�NegativeX��ʹ����褦�ˡ�exp��80�֤ˤĤʤ���streaming��8000�֤ˤĤʤ����褦��ư����褦�Ȼפä����ɽ���ʤ��ä��ʻ��֤��ʤ��Τǿ����ɤäƤ��ʤ��ˡ�Squid�äƥ���å���ʤ���С����ץ����äƽ����Τ����顥�褦�ϡ�ñ�ʤ�ǡ��������̤���Ruby�ǽ񤤤������ᤤ�����顥
    * ��С����ץ����Ϻ�ä����Ȥ��ʤ����Ū���줫�⤷��ޤ��󤬡�acl �� no_cache ������Ȥä� URL �˴ޤޤ��ʸ����� dst ���ɥ쥹�ʤɤǥ���å����̵ͭ�����ꤷ���Ф�������ޤ���(�����������ȤǤʤ�?) - osaru
    * �����������Ȥʤ�Ǥ��������ޤ������ʤ���Ǥ����Ȥ������Ȥǡ�����ˡ�Squid�������ǡ����������äƤ���Ǥʤ��ȥ��饤����Ȥ˥ǡ���������ʤ��󤸤�ʤ����פȼٿ䤷�Ƥ���櫓�Ǥ���

  * [DTCP] ((<�Ȥꤢ����ư�����|URL:http://www.cozmixng.org/repos/ruby/dtcpc/trunk/>))��

  * [IPv6] �����٤ä���

    Debian�ʤ�6in4tunnel�򥤥󥹥ȡ��뤷�ưʲ��Υ��ޥ�ɤǤ����롥

      % sudo /usr/sbin/6in4tunnel add device �ǥХ���̾ �롼����IPv4�Υ��ɥ쥹 ��ʬ��IPv6�Υ��ɥ쥹 2000::/3

    : �ǥХ���̾
        ������̾��
    : �롼����IPv4�Υ��ɥ쥹
        �����Ƥ��ä����
    : ��ʬ��IPv6�Υ��ɥ쥹
        �ͥåȥ��ñ�̤ǥ��ɥ쥹����äƤ����顤����κǸ��::1�Ȥ��դ���Ф褤��

    * ����ǤȤ���Ǥ���v�踦��Hiki�ǷҤ�����������äȽ񤤤Ƥ����Ƥ�館��Ȥ��줷���ä��� - osaru
      * DTCHC���ä��餽�����褦�ȻפäƤ��ޤ����⤦����ä��ԤäƤ��������͡�

  * [Ruby] ((<Year planner PDF generation in Python|URL:http://www.mechanicalcat.net/richard/log/Python/Year_planner_PDF_generation_in_Python>))��Ruby/GnomePrint�ǽ񤤤Ƥߤ褦��

  * [�����] ~/.kazehakase/mozilla/kazehakase/prefs.js��

      user_pref("mozilla.widget.raise-on-setfocus", false);

    �Ƚ񤱤й����ˤʤ��餷����

  * [e-morioka���ߥ�˥ƥ�] �����Ͽ���ʤ���ML�˻��äǤ��ʤ��Τ������ä���ˤϳ����Τδ����Ԥ˥᡼����äƤ����Ĥ��Ƥ�ʤ��Ȥ��������Τ��餤��ư�����褦��Ȥ�������

  * [Ruby][Subversion] Ruby Subversion binding��⤦����((<ͷ�ӽФ���|URL:http://pub.cozmixng.org/~kou/diff/>))��

  * ((<kou::���::-2004>))
