= kou::���::-2004


  * ���ӡ���phttpd����ȯ��λ���äơ�����

  * [Fit] �ʤ������((<FitNesse|URL:http://fitnesse.org/>))

  * [PostScript] BoundingBox��ñ�̤�inch����ʤ���point����ʤ�����

  * [Rabbit] ������/~kou/�ʲ��Υȥ�ե��å���Ⱦʬ��rabbit-0.0.6.tar.gz�ʤ�����ɡ��ޤ���������¿������ͤ�������80�勞�餤��

  * [Rabbit] rabbit-0.0.6.tar.gz�����ޤǤˤʤ����餤������������ɤ���Ƥ��롥lftp��¿����((<��|URL:http://developer.momonga-linux.org/wiki/?StatusReport-20041218>))((<��|URL:http://developer.momonga-linux.org/viewcvs/trunk/pkgs/rabbit/>))�αƶ�����

  * [Rabbit] õˬRuby�˺ܤäƤ���Ȥ������Ȥ�Linux Magazine 2005ǯ1������äƤ��ޤä���

  * [�����] ��������󥨥�ȥ�ǲ������Ϥ���URI��ư���䴰����ˤ�~/.kazehakase/kzrc��Global���������˰ʲ��򵭽ҡ�

      use_auto_completion=true

  * [ID3] ID3��ʸ�����󥳡��ǥ��󥰤��Ѵ������ĤäƤʤ����ʤ���

  * [GTK+] GTK+��ȤäƲ����٤�����ˤϤɤ�����Ф褤�Τ�����

    ��������

      require "gtk2"
      Gtk.init
      width = Gdk::Screen.default.width
      width_mm = Gdk::Screen.default.width_mm
      resolution = (width * 25.4) / width_mm
      p resolution

  * [URI] ((<Codes for the Representation of Names of Languages|URL:http://www.loc.gov/standards/iso639-2/englangn.html>))

  * [�����] �ƥ����ȥ��ꥢ�ˤ���Ȥ��ϥ�����å��ʤ����ߤ����ʤ���

  * [RSS Parser] ((<Tea for Miki. - Ruby��Ȥä�RSS����������|URL:http://www.tea4miki.org/articles/2004/11/15>))�ˤĤ��Ƥ��ˤ礴�ˤ硥

    maker�����ꤹ��ʸ����Υ��󥳡��ǥ��󥰤�Shift_JIS�ʤ餳��ʤ��Ȥ�񤤤Ƥ����Ȥ褤�Ǥ���

      maker.encoding = "Shift_JIS"

    ���Ϥ���RSS�Υ��󥳡��ǥ��󥰤��Ѥ������ʤ顤rss.to_s����ޤ��ˤ���ʤ��Ȥ�񤤤Ƥ����Ȥ褤�Ǥ���

      rss.output_encoding = "UTF-8"

  * [IME][IMM] Windows��uim��Ȥ������ʡ��ط�����Τ�((<Active Input Method Manager|URL:http://msdn.microsoft.com/library/default.asp?url=/workshop/misc/AIMM/AIMM.asp>))
�Ȥ�((<Input Method Editor|URL:http://msdn.microsoft.com/library/default.asp?url=/library/en-us/intl/ime_5tiq.asp>))�����꤫������

  * [�����] Ctrl+�ۥ�����ǰ�ڡ������İ�ư����褦�ˤ���ˤϡ�((<URL:about:config>))�򳫤��ơ�mousewheel.withcontrolkey.action��1�����ꤹ�롥

  * [h2g2] ((<����|URL:http://hobbes.nmsu.edu/cgi-bin/h-browse?dir=/pub/.arch-download/hhgttg>))��ʹ���ƱѸ���ٶ�����

  * [Ruby/RSVG] ��ä�����Ȼ��֤�4,5���֤��ʤ���

  * [���줤�� PC-UNIX] Ŭ���ʥ����󥿤����鿮�����������Τ����ɡ����ڡ����Υȡ�����ҥåȿ���100,000��ۤ��Ƥ����������2004-11-12��

    ���ޤˡ��֤��줤�� Linux�פǸ�������ͤ⤤��Τ͡��ʤ󤫡�Google�Ǽºݤ˸������Ƥߤ�ȥȥåפ˽ФƤ��뤷��

    �פ��֤�˥ȥåפ򸫤����ɡ��ʹ�������˽񤤤Ƥʤ���Ĥ⤢�뤷��15�����餤���եȥ�������������Ƥ��Τ͡���������˽񤤤Ƥ���ǽ�Τ�Ĥ�2003/2/9�����顤21�����15�����餤���äƤ��Ȥ�ʿ�Ѥ����1����Ⱦ��1����äƤ��뤳�Ȥˤʤ�Τ͡������󡤤���2ǯ�Ǥ�������Ĺ�����ʤ����ȡ���ʬ�Ǹ��äƤߤ롥 :-P

  * [LibRSVG] Ruby�Х���ǥ��󥰤Ϥޤ��ʤ��Τ�����뵤�����ʤ����ˤǤ��äƤߤ뤫�������Rabbit�ǻȤ�����������SVG�ϥ٥��ȥ�١����ʡ��ˤ�����EPS���Ѥ��˻Ȥ��뤫�⤷��ʤ���

  * [RSS Parser] ���ϼ긵�Ǥ�ľ������parse����to_s����parse���Ƥ�Ʊ�����ƤˤʤäƤ��뤳�Ȥ��ǧ����ƥ��Ȥ�񤫤ʤ���ʤ����ʤ⤦�����λ����ǥƥ��ȥե������ȤǤϤʤ������ʡ�

  * [RSS Parser] RSS::RDF#to_s�����Ȥ��ˡ�������ƤϤ����ʤ����ԡ�/rdf/channel/description/text()����ζ��ԤȤ��ˤ������Ƥ��뵤�����롥

  * [Linux][DAT] st��SCSI�ơ��ס˥⥸�塼�����ɤ���ɬ�פ����롥

      % sudo modprobe st

    ǧ������Ƥ��뤫�ɤ�����dmesg�򸫤��ꡤ�ʲ��Υ��ޥ�ɤ�¹Ԥ����ꤹ��Ф狼�롥

      % sudo mt -f /dev/nst0

  * [Ruby/GnomePrintUI] �¤ϼ긵�ˤ��ä��ꤷ�ޤ�����λ����Segmentation fault�򵯤����ΤǸ������Ƥ��ޤ��󤬡����֤�g_object_unref�������ʤ�����ɡ������ɤ��ǡ�����

  * [CDR] ����������ʤ��ƥ����ǥ��������롥���ܸ��Ȥ��Ȥ���UTF-8�ʤΤ���SJIS�ǽ񤭹������Windows��ʸ���������Ƥ���

  * [DIG2004] ������ޤϳ������ޤǤäơ�����

  * [Gtk] Ʃ��Υҥ�Ȥ�testgtk/shape�ʤ�Ȥ�.rb�ˤ��ꤽ����

  * [Rabbit] ���ࡥrabbit-0.0.3.tar.gz���۾�˥�������ɤ���Ƥ��뤾��������lftp/3.0.9���顥����������.jp���顥

    �����Υѥå������ˤǤ�ʤä��Τ�������libfetch���ä���FreeBSD�ʤ�������ɡ�lftp�äƤʤ������

  * [Gtk] �ݥåץ��åץ�˥塼��Gtk::Menu#popup

  * [XVL] 

      # blockquote
      # cite = http://www.xvl3d.com/ja/support/xvl-etc/specification/
      # title = XVL���ͽ�
      == �������ʬ�ˤĤ���

      XVL�λ��ͤˤϡ����٤ƤΥ桼���˸������Ƥ�����ʬ�ȡ�����桼���Τߤ˸������Ƥ�����ʬ�����롣�äˡ��ե�����ե����ޥåȤ˴ؤ�����ʬ�ϡ���§�Ȥ���������Ǥ��롣

      ���äơ��桼���ˤ�äƤϡ��ܻ��ͽ�Τʤ��ǥ�󥯤����äƤ⡢�ºݤˤϱ����Ǥ��ʤ��ڡ��������롣 

    �äƤ��Ȥ�*.xv?��ѡ���������ʬ����ΤϤ��������ѡʤȤ��������ݽ����ˤʤ󤸤�ʤ��Ρ�XVL�򰷤������������ʤ��㤨�äƻ�����������XVL�ϼ�ͳ����ʤ��Τ������ä���X3D�����������ʤ����Ȥ��äƤ�ޤ�����Ĵ�٤Ƥ��ʤ����顤�¤�X3D�⼫ͳ����ʤ��äƤ��Ȥ����뤫�⤷��ʤ�������ɡ�

  * [Debian] �����ͥ�2.6��USB�ޥ�����Ȥ��Ȥ���usbmouse��modprobe���ʤ��Ȥ����ʤ����Ǥ⡤�ǥ����ȥåפ���modprobe���ʤ��Ƥ�Ȥ��Ƥ�������ʤ���SD�����ɥ꡼���դ������顩����

  * ����������٤����Ȥ���뵤���ʤ���

  * [((<SPA|URL:http://spa.jssst.or.jp/>))] ����˶����Ƥ��ä���ġ�

  * [Mozilla] tabextensions�������ȥ��֤��Фʤ��ʤ�Ȥ��ϡ�~/.mozilla/default/XXXXX/pref.js�Ȥ�~/.mozilla/default/XXXXX/tabextensions.js��ʲ��Τ褦���ѹ�����Ф褤�����ä��������ȥ����ȤȤ����������äƤ�褤���⡥

      -pref("browser.tabs.extensions.use_another_binding", true);
      +pref("browser.tabs.extensions.use_another_binding", false);

  * [Rabbit] �ʤ�ǡ�Ruby de GUI��Ruby-GNOME2�Υ�󥯤ˡ�Rabbit���������������䡤�򤷤���Ǥ����ɡ�

  * [WikiLink] �����typo�����ä��������Ƥ桼�����ʤ�ǡ�typo��̵�¥롼�פˤʤ�����

  * [WikiLink] ���롼�פ��Х��äƤ��롥�ȤäƤ��ʤ��ä�����ʤ���

  * [��Ȭ] ��������Ǥ��Τ���

  * [��Ȭ(jiMPachi)] ���������������Ρ�Ruby�ǽ񤫤�Ƥ����ġˤ��ߤ����ä��Ρ�

  * [GaUnit] �Ѹ�Υɥ�����Ȥ��������ä�((<�����Ƥ��롥����|URL:http://tunes.org/~nef/logs/scheme/04.07.04>))

  * [�Ρ���PC] �Ÿ�������Ƥⵯư���ʤ��Ȥ��ϡ������Ϥ�ʤ����ȵ�ư���뤳�Ȥ⤢�롥

  * [������] �ҤȤ�����ñ���ä���zsh�Ǥ�C-w��tcsh���Ȥ��֤�backward-delete-word�ˤǤ�̵���ƤҤȤ����Υѥ���ä��Τ��ߤ������㤨�С�

      % cd /a/b/c |�ʢ��Ρ�|�פϥ��������

    �Ȥ����Τ����ä��Ȥ��ˡ�C-w�Ȥ��򲡤����餳������ˤʤä��ߤ�����

      % cd /a/b|

    �Ǥ�äơ��⤦���C-w�Ȥ�����Ȥ����ʤ롥

      % cd /a|

  * [Debian] ���֤������ʤ���mozilla-tabextensions�����������ߤ�����remove����ȳ�����褦�ˤʤä���

  * [Debian] ((<Bug#232282|URL:http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=232282>))�Ϥ��ĥ����������������

  * [The RWiki] ��������1���֤����˥����������Ƥ���61.210.244.59�äƲ��Ԥ���User Agent��"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)"���Ȥ��äƤ��뤱�ɡ��ʹ֤��Ȥϻפ��ʤ���

  * [bot] "Bloglines", "RssBandit", "Sage"


  * [bot] "Ask Jeeves/Teoma"

  * [WikiLink] HOME��Link::IndexPage�ˤ����@format��NaviFormat�ˤʤä���äƤ��ޤ��ʤ��ʤ����ɤ����褦��

  * [�ɥ������] �������˽񤫤줿�ɥ�����Ȥ���ޥ˥奢�����������󤸤�ʤ��ơ��ƥ��ȡʤȤ����˽񤫤줿�ɥ�����ȡˤ���ޥ˥奢��������Ǥ���д򤷤�������ɤʤ����ƥ��Ȥ����ɥ�����ȤǤ���Ȥ����ͤ�������

  * [RSS] �ɤ�����Ruby�Ǽ������줿������ɥ�����GUI���Ź��Ǽ���������ʤ�RSS�꡼�����ʤ�������ҤȤĤ��餤���äƤ�褵�����ʤΤˡ��ޤ����Ŀ�Ū�ˤ�WikiLink�����뤫���̤�ɬ�פϤʤ�������ɡ�

  * [LLW2004] Gauche�������ˤ��ä��������((<Rabbit>))�������ˤ��ä������������

  * [LLW2004] �����񡦽������ĺ�����Τ����˽�����ޤ�����

  * [LLW2004] ((<���饤��|URL:http://pub.cozmixng.org/~gallery/kou/screenshot/rabbit/n-queens/>))��((<���ۻ���|URL:http://pub.cozmixng.org/~kou/llw2004.pdf>))����������((<������ؤ�|URL:http://www.cozmixng.org/repos/gauche/tsm/trunk/sample/nqueens/>))

  * [LLW2004] Python�ط��οͤ�Python�Ϥ�����Python�Ϥ����äƸ��äƤ����������롥���Τۤ��οرĤϤ��ޤ굤�ˤʤ�ʤ��ä��ʤ���Ruby�ط��ΡʤȤ���˿ͤ�Ruby��ʸ�����äƤ����餤������

  * [Rabbit][FreeBSD] Tempfile��Ȥ���ruby��SEGV��Τ�Ruby/GTK2����������ߤ�����ruby.coreĴ�١�

  * [DIG2004] ((<DIG2004|URL:http://www-cg.cis.iwate-u.ac.jp/DIG04/index2.html>)) �����դ����Ϥ�2004/10/1�ǡ����ڤ�2004/10/31����ǯ��((<Rabbit>))�Ǽ��ޤǤ����餤���ʡ�

  * [��] ((<Blog Hacks - �ץ�������ƥ��˥å� & �ġ���100��|URL:http://www.oreilly.co.jp/BOOK/bloghks/>))

  * [128.104.8.231] 212.65.244.2��Ʊ��

  * [Rabbit] ���Ϥ᤿�Τ�2004-07-02����ߤ�����SubversionĴ�١ˡ�

  * [Anthy][uim] .uim�����ꤷ����generic-off-key?��̵�뤵���Τ��褹��ˤ�anthy.scm��ʲ��Τ褦�ˤ���Ф褤�����ʤߤˡ�trunk�ǤϽ�������Ƥ���褦��

      - (define-key anthy-latin-key? generic-on-key?)
      + (define-key anthy-latin-key? 'generic-off-key?)

  * [212.65.244.2] �ʤ�������ġ�test�Ȥ�guest�Ȥ�admin�Ȥ�user�Ȥ�root�Ȥ���ssh�ǥ����󤷤褦�Ȥ��Ƥ��䤬�롥�ѥ��åȥե��륿��󥰤����ۤ����褤���ʤ���

  * [Rabbit] �������塪�����ָ����ܤ��褯�ʤ�ޤ����ʤ�����äѤ골��������ʤ���

  * [Rabbit] ���٤Τ��Ȥʤ���פä���ꤦ���ʤ��ä��ʤ���

  * [The RWiki] �ʤ�������ġ����̥����������Ƥ��䤬�äơ��֥�å�����210.159.193.17 "Bitgear Image loader"

  * [dsm] ��������HTTP�б��Ȥ�UNIX�ɥᥤ�󥽥��å��б��Ȥ��񤯤Τ�˺�줿�����������������ʡ�

  * [RWiki] �󡩤ޤ�CVS�ˤϥ��ߥåȤǤ��ʤ��Τ��ʡ�

  * [RSS] ((<¿����RSS�꡼���ǤϤޤȤ�˽����Ǥ��ʤ��褦��|URL:http://web.sfc.keio.ac.jp/~s01397ms/d/?date=20040614#p02>))�ä�RSS����ʤ���Τ�RSS�꡼���������Ǥ��ʤ��äƤ����Ƥ⡤����Ϲ���ä��㡥����((<RSS Parser>))�ǥѡ������Ƥߤƾ��󤬼��Ф��ʤ��ä��Τǡ�((<RSS Parser>))�äƤ��󤼤���ᤸ���Ȥ��פäƤ��ޤä���

  * [Hiki] ((<�Խ�����Υڡ���������Υ�ӥ����Ȥ�diff�ؤΥ�󥯤�ɽ������ѥå�|URL:http://pub.cozmixng.org/~kou/diff/hiki-history.diff>))

  * [URL] ���򤤡�((<URL:http://homepage3.nifty.com/oatu/misc/ht.html>))

  * [Swig] �褦�䤯���ѥå������ߥåȤ��줽����

  * [��] normalize��Ȥ��С����̤򤢤��뤳�Ȥ������ߤ�����

      % for x in *; do; normalize -gain 4 $x; done

  * [Ruby] REXML���Ѥ����ʤ�ǡ�text��unnormalize���줿�ƥ����Ȥ�����Τˡ�attribute��unnormalize����Ƥ��ʤ��ƥ����Ȥ��������� 

    �����ѥå���������Ǥ�館����

  * [((<GaUnit>))] ports���Τ�����򤦤��ơ�((<RSS Parser>))���⺣���Υ�������ɿ���¿���ʤäƤ��ޤ���

  * [��] ((<�ɣԥ��󥸥˥��Τ����ž������|URL:http://homepage2.nifty.com/KUMANO/>))

  * [GTK] ((<GUIS|URL:http://starynkevitch.net/Basile/guisdoc.html>))�ä�Gauche-gtk��gtk-listner(���ä���)��Ʊ���褦�ʤ�Ĥ��ʡ�

  * [P2P] ((<P2P�θ��|URL:http://japan.internet.com/column/webtech/20040331/6.html>))

  * [Libcroco] GNOME��CSS�ѡ������äơ�CSS2���б����Ƥ���ߤ�����C�ǽ񤫤�Ƥ��롥

  * [VB] AddressOf�黻�Ҥ�ȤäƤ�ⳬ�ؿ��ϻȤ��ʤ���AddressOf�黻�Ҥ�DLL��Υ�����Хå��ؿ��Τ���ˤ����������ǡ�

  * [Ruby] ˿���Ҥ�URL��ܤ��Ƥ������Ȥ����᡼�뤬��������������������ɤǤ���

  * [Ruby] "a9".succ -> "b0"

  * [Access] DAO���ADO������������

  * [����] GRAPEVINE��̾���򤹤�˺��Ƥ��ޤ���

  * [Gallery] ((<�ʤ�餫����Х�|URL:http://sappari.org/hiki/hiki.cgi?%A4%CA%A4%E1%A4%E9%A4%AB%A5%A2%A5%EB%A5%D0%A5%E0>))��Ȥ���褦�ˤ��褦�����顣

  * [Haskell] ((<URL:http://www.teu.ac.jp/kougi/koshida/Prog6/>))

  * [���եȥ�����] gDesklets��gkrellm��꤫�ä�������

  * [Debian] discover�äƤΤ����ä�������������ڡ�

  * ���֤��ʤ��Τǡ����Ȥ��ɤࡥ((<firefox���饨�ǥ��������Ѥ�����ˡ|URL:http://www.mew.org/~kazu/toy/firefox-editor.html>))

  * [zphoto] --html-suffix���ɲä���ѥå��������ޤ줿��

  * [FreeBSD] �����Ĥ餷����

    /boot/loader.conf��

      snd_driver_load="YES"

    �Ƚ񤤤Ƥ�����

      device          pcm

    �Ȥ��ƥ����ͥ��ƹ��ۤ��ʤ��Ƥ⤹����⤢�롥

  * [Scheme] ((<SICP�Υӥǥ�|URL:http://swiss.csail.mit.edu/classes/6.001/abelson-sussman-lectures/>))

  * [((<RSS Parser::Tutorial.en>))] ï���Ϥ狼��ʤ�����ź�路�Ƥ��ä����������ʱѸ��ľ���Ƥ���ƴ��դ��Ƥޤ��������ܸ�ǽ񤤤Ƥߤ롥

  * [Dia] Control��Alt���դ���������IM���Ϥ��ʤ��������줬���ϤǤ��ʤ��ͤ������ΤǤ��ä��ȥѥå���񤤤Ƥ����롥

    case�ν����������ե饰�򤤤���Ȥ��Τ������Ĥ��Ǥ˱Ѹ줬����

  * [((<WikiLink>))] �ե�����ˤϽ񤭹��ޤ�Ƥ��뤱�ɡ��ڡ����ˤ�ȿ�Ǥ���Ƥ��ʤ���������

  * [((<WikiLink>))] �����鵤�Ť��Ƥ���������ɡ��ʤ󤫡�������Ͽ�Ǥ��ʤ������ϡ����Ϣ³����¸�������Ͽ�Ǥ���������ɤʤ���

  * [RWiki] �Ӥ餷��Wed Mar 03 06:09:28 JST 2004��210.156.40.65�ˤ�ä�((<Subversion>))���Subversion�Ȥ���ʸ����<B style="color:black;background-color:#ffff66">Subversion</b>���ִ�����Ƥ�����

    Google�ǥϥ��饤�Ȥ��줿�ƥ����Ȥ򤽤Τޤ���¸�����Τ��ʡ���

  * [Dia] CVS HEAD��preedit string��ɽ��������/���Ϥ����ޥ���Х���ʸ���������������ѥå����褦�䤯((<�����ä�|URL:http://bugzilla.gnome.org/show_bug.cgi?id=135930>))��

    �ѥå���ź�դ���ե�������դ����ʤ��ä����顤���ԥڤ������ܤ�줿����������ʤȤ��˥ե�����ؤΥ�󥯤�����ʤ�Ƥ狼��ʤ��补����

  * [��] ����鷺((<��¼������|URL:http://tkj.jp/bessatsu/4796638857/>))����äƤ��ޤä����Ϥ䤯���ޡ������λ��ɤߤ����ʡ�

  * [((<RSS Parser>))] ((<����Ū�ˤ�utf-8�ǽ������Ƥ���|URL:http://jarp.jin.gr.jp/diary/200402c.html#200402241>))�Τ�XML�ѡ����Ȥ���REXML��ȤäƤ��뤫��Ǥ��礦�����ʤߤˡ�RSS::RDF#encoding���������󥳡��ǥ��󥰤��狼��ޤ���

  * [Gauche][Parameter][Thread] ����å����load�����ե���������make-parameter������Ȥ��Υ���åɥ������parameter�ˤʤäƤ��ޤ����������������줿����åɤ���ϸ����ʤ��ʤ롥�����⡤�̥���åɤ�load���Ƥ�parameter�ϸ����ʤ�(�ߤ���)��parameter������ե������root����åɤǥ��ɤ��뤳�ȡ�

  * [RWiki] aggressive development (idea)

    * RWiki���ѥ��饤�����
    * ���������դȤ����ǹͤ����Τ�ۤȤ��˺��Ƥ롥����

  * [Music] Norah Jones��İ���Ƥߤ褦��

  * [EmacsLisp] ���顼(�����ʥ롩)�ϥ�ɥ�󥰤���ˤ�condition-case��Ȥ���

  * [Emacs][VC] C-x v a��ChangeLog�˽����Ƥ�׻����Ƥ����Τ������ä���������ȻפäƤ�������ɡ��פ��Ф��ʤ��ä�����C-x 4 a���Ƥ�����

    ���դ�������ʤ��ƻ���������Ǥ���Ȥʤ����줷��������ɤʤ���

  * [̾��] ��������RecentChanges��Wiki��¿���ʤ���WiLiKi�ߤ������Խ�����ˤ��褦���ʤ���

    �Ǥ⡤�Ŀ�Ū�ˤϹ�������Ȥ�����Wiki���ΤǤι������򤸤�ʤ��Ƥ��Υڡ������ɤΤ褦�˹�������Ƥ������Ȥ����ڡ�����ι�������Ȥ�����������������ʤ��������顤Hiki�Ǥ�ڡ����Τɤ����ѹ����줿���򸫤褦�Ȥ��ƹ�������ˤ��ä���äƤ����RecentChanges����󡥤Ȥ��פ�������ɡ�

    �ޤ�����������Ǥ��Խ�����Ǥ⤽�Υڡ���������Ȥ�����������ΤǤ��Ф餯�����鹹�����򤸤�ʤ����Խ�����ˤ��Ȥ���������Ͼ��ʤ�����������������͡�

  * [�ե����][����������ꥢ��][Debian] �褦�䤯����������ꥢ���������褦�ˤʤä���

    /etc/fonts/fonts.conf�ΰʲ�����ʬ�򥳥��ȥ����ȡ�

      <edit name="embeddedbitmap" mode="assign">
              <bool>t</bool>
      </edit>

    FreeBSD�ˤ�fonts.conf�����Τ�ΤϤʤ��Τ��ʤ���Debian��/etc/fonts/fonts.conf.debian�����Τ�Τʤ�/usr/X11R6/etc/fonts/fonts.conf�ˤ��뤱�ɡ�

  * [�ե����] �ե���Ȥγ�ǧ�ϰʲ��Τɤ���Ǥ�Ǥ��롥

      % fc-list | lv

      % nautilus fonts:///

  * [�ե����] �վ��μ�ư���֥ԥ����������󥰤�ͭ����������å�

      % xdpyinfo -ext RENDER | grep sub-pixel

    �ǰʲ��Τ褦��ɽ�����줿��OK

      Screen 0 (sub-pixel order Horizontal RGB)

  * [Dia][Debian] IM��������Υƥ����Ȥ�ɽ������ѥå� for 2004/2/8��CVS��HEAD

    �ܲȤ˼����ޤ줿�ΤǺ����

  * [Mozilla] F7�򲡤��ȥ����åȥ⡼�ɤˤʤ롥

  * [zsh] �ǽ�Υ��֤��䴰���롥

      setopt menu_complete

    ����䴰�����ߤ����ʤ��Τǡ�����ʤ��ȤϤ��ʤ���

  * [��³] ((<"Martin Gasbichler and Michael Sperber, Final Shift for call/cc: Direct implementation of Shift and Reset, ICFP '02, 2002."|URL:http://citeseer.ist.psu.edu/gasbichler02final.html>))

  * [((<RSS Parser>))] TrackBack�⥸�塼���API��ɤ����褦��

    Ǻ��Ǥ���Τ�trackback:ping��trackback:about���ͤ����������ˡ��RSS 1.0�ξ���

      item.trackback_ping.resource
      item.trackback_about.resource

    �ˤʤ�Τϳ���ʤ�����ɡ�RSS 2.0�ξ�礬�ͤ������ߤ�

      item.trackback_ping.content
      item.trackback_about.content

    �ʤ�����ɡ��긵�Ǥ�

      item.trackback_ping
      item.trackback_about

    �Ǽ����Ǥ���褦�ˤ��Ƥߤ������ξ����ȡ��ƥ����Ȥ�����ȤΤʤ����Ǥ��ͤ�����̾��Ʊ������������ľ�ܻ��ȤǤ��롤�Ȥ����ݥꥷ�����������Ƥ��롥�������Ȥ�¦��RSS 1.0��RSS 2.0���ǽ����򿶤�ʬ���ʤ��㤤���ʤ��ʤ�����ʡ��Ȥ������Ȥǡ�RSS 1.0�Ǥ�RSS 2.0�Ǥ�

      item.trackback_ping.resource
      item.trackback_about.resource

    �Ǽ����Ǥ���褦�ˤ������������Τ��ʤ�����������������ȥݥꥷ�����ʤ���

  * [Ruby] ((<R.U.B.Y|URL:http://www.clio.ne.jp/home/web-i31s/Flotuard/Ruby/R.U.B.Y.txt>))���⤷��������blade�Ǥ�����

  * [Ruby] ((<RSS Parser>))((<ɸ��|ruby-dev:22691>))((<ź��|ruby-dev:22720>))((<�ʤ�|ruby-dev:22732>))((<����|ruby-dev:22735>))

  * [Gallery] ���������������ȤäƤ���ͤ�((<�Ϥ���Ƥߤ�|URL:http://mordenpaint.com/IMAGES/136/theme.html.en>))���Ǥ⡤�ѥ��Ȥ��ѹ����Ƥ��ʤ�����CSS�Ȥ�JavaScript���Ȥ��Ƥ��ʤ�������mod_ruby��ư���Ƥ���Τ��ʤ���

    �Ȥ��פä����ɤ���ʤ��Ȥʤ������ñ��GA��°�Υƥ�ץ졼�Ȥ�RubyPhoto�ǻȤä���������

  * [Wiki] �����󤸤�ʤ��ƥ�󥯤�ĥ����ˤ��桼���äݤ��ǥ桼�����������Ѥ��ƤϤɤ�����

  * [Dia] ((<�ѥå������ä�|URL:http://mail.gnome.org/archives/dia-list/2004-January/msg00019.html>))�Τˤʤˤ�ꥢ������󤬤ʤ��ΤϤĤ餤�ʤ���˻��������ߤƤ��ʤ��Ȥ�������ʤ󤸤������Ȥ����äƤ����Ф����Τˡ��Ѹ�ν����������Τ��ʤ�����뵤�ʤ��ʤ�ʤ����Ȥ������Ȥǡ���ʬ�������Ƥ����ѥå������᤯�������褦�Ȼפ��ΤǤ������Ȥ��äƤ⡤���ʤ�������ɡ�

  * [YaTeX][prosper] prosper����dvi���㤭����ȥץ�ӥ塼�Ǥ��ʤ�����ץ�ӥ塼���ˤ�dvips����gv��Ȥ����Ȥˤ��롥

      (setq dvi2-command "dvigv")

    dvigv

       #!/bin/sh
       dvips $1
       gv $1

  * [TeX][Debian] dvips: ! virtual recursion stack overflow���褹��ˤ�

      % sudo apt-get remove --purge dvi2ps-fontdata-{n2a,a2n}

    �Ĥ��Ǥˡ�gs-ja��ǥե���Ȥ�gs�ˤ��Ƥ�����

      % sudo update-alternatives --config gs

  * [tgif] ���դ��γ����

    (1) [�Խ�] -> [���˱Ƥ��դ���]��3,3�Ȥ�����ꡥ

        .Xresources��

          Tgif.ShapeShadowSpec: 3,3

        �Ƚ񤤤Ƥ��ɤ���

    (2) �طʤ���Ȥ������ꤹ�롥
    (3) [�Խ�] -> [��]�ǳ���񤯡�

  * [LAML] ((<The LAML Home Page|URL:http://www.cs.auc.dk/~normark/laml/>))

  * [Flash] ((<Flash for Linux|URL:http://f4l.sourceforge.net/>))�����֤��Ǥ�����Ruby�Ǻ���ȻפäƤ���������ɤʤ�����ĥ����Ȥ���Ruby��Scheme���Ȥ����ġ�

  * [Emacs] [Quack] quack-fontify-style��plt�λ��Ǥ�:keyword�Ȥ�<class-name>�ο����Ѥ�ä��ߤ����ʤ����Ȥ������Ȥ�ad-hoc���б���

      (require 'quack)
      (defconst quack-pltish-fls-base
        `(("\\<<\\sw+>\\>" . font-lock-type-face)
          ("\\<:\\sw+\\>" . font-lock-builtin-face)
          ,@quack-pltish-fls-base))

  * [Emacs] list-mode.elͳ��Υ⡼��(Scheme�⡼�ɤȤ�Emacs-Lisp�⡼�ɤȤ�)�Ǥ�"(def..."�Ȥ����ե����������ե��������Ƚ�ꤵ��롥�����lisp-indent-function���

      (string-match "\\`def" 

    �Ȥ���Ƥ��뤿��ǡ�

       '(default 1
                 2)

    �Ȥ������Ƥ�

       '(default 1
          2)

    �ȤʤäƤ��ޤ�(lisp-body-indent��2�ΤȤ�)�������󡤤ɤ����褦��

  * [WikiLink] RSS��ѡ���������̤�HTML��񤭽Ф�JavaScript����ϤǤ���褦�ˤ��褦���ʡ������󥫥ƥ���/���롼��/�����ˡ�

    �ͥ��ʤΤǻ��֤��Ǥ��Ƥ���͡�

  * [��ʸ] ((<IPSJ PRO|URL:http://www.ipsj.or.jp/sig/pro/>))

  * [Apache] ���ꤷ��IP���ɥ쥹����ޤ���ǧ�ڤ������������饤����Ȥ������³������դ�������

      Order deny,allow
      Deny from all
      Allow from 192.168.0.0/255.255.0.0

      AuthUserFile /path/to/.htpasswd
      AuthGroupFile /path/to/.htgroup
      AuthName "Auth Realm"
      AuthType Basic
      require valid-user

      Satisfy Any

    ����ʤΤ�Satisfy Any��Any�ˤ��Ƥ����Ȥ��Ť줫��ǧ����ˡ(Order�ˤ��ǧ�ڤ�Auth�ˤ��ǧ�ڤʤ�)��ѥ��������³�����Ĥ���롥All�������Ƥ�ǧ����ˡ��ѥ����ʤ������³����Ĥ��ʤ���

  * [Game] ((<Insaniquarium Game|URL:http://www.popcap.com/gamepopup.php?theGame=insaniquarium>))

  * [RSS] Ruby/RSS�����(?)���Ƥ���Austion����᡼�뤬������"I wanted to point you to the CVS for �������RSS�ץ�������"�����������ɤ�������̣������դ�������ߤ����äƤ��ȡ�

    �ġ������������API��((*�ȤƤ�*))�����ǻȤ��פ����ޤ������󤿤Υ饤�֥���API�Ȥ������API�Ȥ���������褯�狼��󤱤ɡ��äƤʤ�����ϼ��ˤ��Ƥ�Τ���

    �饤�֥��Υ桼�����ä�RSS����Τ���ñ�����������ä�����������ñ�˥ѡ����Ǥ��ơ��ѡ������줿���Ƥ򤤤��ꤿ���󤸤�ʤ��Τ���

    �Ȥ������Ȥǡ��ʤ���ֻ��񤱤Ф����������ɡ�������Υ饤�֥��������ɤ����餪�ޤ��⤪����Τ�Ĥ�������äƽ񤤤Ƥ���褦�ˤ����ɤ��Τ����������Х�ǡ�������ɤ�����㤤���Τ��狼���Ȥ�񤤤Ƥ���ʡ�

  * [�ӥǥ�] ((<�����ѡ��ޥꥪ�֥饶����|URL:http://home.megapass.co.kr/%7Ekys706700/moSMB3.wmv>))

  * [CSS] ((<�����ѥ������륷���ȤΥ�����|URL:http://alt.s31.xrea.com/tips/print_css.html>))

  * [�ػ�] ((<���ȡ������ѥ������б�������|URL:http://www.rakuten.co.jp/moreliving/534112/534121/534703/536642/#484714>)) 

  * [���Ż�] ��ɤ��������Ǥ����ޤ���˻�����ʤꤽ����������礦�ɤ褫�ä����ʡ�

  * [RSS] Sam Ruby�Υץ쥼�����: ((<ETCon:  Tutorial|URL:http://www.intertwingly.net/slides/2003/etcon/>)) ((<Seybold: Seybold 2003|URL:http://www.intertwingly.net/slides/2003/seybold/>))

  * [����] ((<���û�Ĺ�˻л���|URL:http://www.tbs.co.jp/suekko/>))��7�äˤǤƤ��Τ˸�ƨ���������ФƤ�ä��Τä��Τ��ޤ������Ƚ�λ�����ʤ�ơ�����

  * [CSS] ((<�֥�å���٥����Ǥ򥻥󥿥�󥰤�����ˡ - Webɸ����ڥץ�������|URL:http://www.mozilla.gr.jp/standards/webtips0004.html>))

  * [UI] ((<Eclipse User Interface Guidelines|URL:http://www.eclipse.org/articles/Article-UI-Guidelines/Index.html>))�򤢤Ȥ��ɤ�Ǥ�������

  * [((<Audacity|URL:http://audacity.sourceforge.net/>))] free��audio���ǥ������ȷ��򸫤ʤ����Խ��Ǥ��뤷��¿��Ͽ��(?)��Ǥ��롥�Ǥ⡤�����Υޥ�������Ͽ���Ǥ��ʤ����ʤ�ǡ���alsa�����꤬�����Τ��ʤ���Windows����Ͽ���Ǥ��뤫����³�Ϥ��ޤ����äƤ���Ϥ��ʤ�����ɤʤ���

    alsa��kernel�ΥС������򤢤�����Ͽ�������褦�ˤʤä���

      % cat /proc/asound/version 
      Advanced Linux Sound Architecture Driver Version 0.9.6.
      Compiled on Sep 19 2003 for kernel 2.4.22-1-k7 with versioned symbols.

  * [((<Julius|URL:http://julius.sourceforge.jp/>))] Julius�ϥե꡼�ι���ǽ����ǧ�����եȥ������Ǥ���������θ��ä��оݤȤ���ʸ��ȯ����ǧ�����Ԥ��ޤ����������Ǥ���

  * [((<Borges|URL:http://segment7.net/ruby-code/borges/>))] Ruby�Ǽ������줿Continuation�١�����Web Application Framework���Ȥ��äƤ�Smalltalk����ΰܿ��餷����

  * [((<opossum|URL:http://opossum.sourceforge.jp/>))] Ruby/GTK �١����� POS ü���Ǥ����С������ɥ�����ʤ�ʻ�Ѥ��ơ�����ڤ˾��ʲ�פ�Ԥ����Ȥ���Ū�Ȥ��Ƥ��ޤ������äơ����򤤤ʤ���

  * [GIMP] �ԥ�ܤ������̿�����������ˡ�򶵤��Ƥ����������㤨�С�((<����|URL:http://pub.cozmixng.org/~gallery/momi/La%20vie%20quotidienne/kilt%20014.jpg.html.ja>))�Ȥ�����������ˡ�ʤ󤫡�

  * [�ɤ���] CRLF�ϡ�((<�������>))�פ��ɤ�

  * [RSS] ((<Re: [tDiary-devel] Re: Reference to RSS version from <link> element|URL:http://www.tdiary.org/archive/devel/msg01108.html>))���ǹͤ��褦��

  * [HNS] �褯�狼��󤱤�rss.cgi��������ߤ����ʤ� > ((<���|URL:http://kuzuno.jp/diary/>))���Ȥ����˽񤤤Ƥߤ��ꤹ�롥�ʤ󤫡������˽񤤤Ƥ������Ƥȴط��ʤ����Ȥϥĥå��ߤŤ餤��

  * [WebApp] ((<Lisp in Web-Based Applications|URL:http://lib1.store.vip.sc5.yahoo.com/lib/paulgraham/bbnexcerpts.txt>))

  * [Scheme] ((<Lightweight Languages 2003 (LL3)|URL:http://ll3.ai.mit.edu/>))��Functional Reactive Programming in Scheme�����򤽤����ӥǥ��Ǥ�����Session 2��2���֤��餤���ä��Ȥ����ؤ󤫤�2����30ʬ�̤ޤǤ���ʬ��((<���ä����ͤΥ�ݡ���|URL:http://tabesugi.net/memo/2003/b1.html>))

  * [TeX] ((<Prosper|URL:http://www.cc.kyushu-u.ac.jp/RD/watanabe/RESERCH/PROSPER/>))�äƤ����Τ���������´���λ����Ϥ���Ǻ����

  * [FreeBSD] IRQ��Ĵ�٤�ˤ�devinfo(5.x�ʹ�)�Ȥ�pciconf��Ȥ���

  * [Scheme] define-syntax�Ǥ���ʤ��ȤϤǤ��ʤ��Τ��������ʡ�

      (define-syntax foo
        (syntax-rules ()
          ((_ (name arg ...) body ...)
           (define (name arg ...)
             body ...))))
      
      (foo (bar baz . options)
        hoge)

  * [�����꡼] ruby 1.8.1 (2003-10-31) [i386-freebsd4]����°��cgi.rb���ȥե����뤬���åפǤ��ʤ�(multipart�Υǡ�����ѡ����Ǥ��Ƥ��ʤ��ߤ���)���Ȥ������Ȥǡ��긵��ruby 1.8.1 (2003-11-08) [i386-linux]����°��cgi.rb�򥳥ԡ����Ƥ�����

  * [���ܸ�����] sodipodi + uim����segv�롥sodipodi + im-ja���ȤǤ��롥�Ȥ������Ȥǡ����ΤȤ���ʲ��Τ褦�ʴ�����

      % alias sodipodi="GTK_IM_MODULE=im-ja \sodipodi"

    sources.list�ˤϤ���

      deb http://im-ja.sourceforge.net/ ./
      deb-src http://im-ja.sourceforge.net/ ./ 

  * [ruby-gnome2] for sid

      deb http://ruby.yi.org/debian/ sid ruby-gnome2

  * [uim] ~/.uim�����ꡣ

      ;;; -*- mode: scheme -*-

      (define _generic-on-key generic-on-key)
      ; (define generic-on-key
      ;   (lambda (key key-state)
      ;     (or (_generic-on-key key key-state)
      ;         (and (control-key-mask key-state)
      ;              (char=? (char-downcase key) #\o))))) ; C-o
      (define generic-on-key
        (lambda (key key-state)
          (or (_generic-on-key key key-state)
              (and (control-key-mask key-state)
                   (= (to-lower-char key) 111))))) ; C-o

      (define _generic-off-key generic-off-key)
      ; (define generic-off-key
      ;   (lambda (key key-state)
      ;     (or (_generic-off-key key key-state)
      ;         (and (control-key-mask key-state)
      ;              (char=? (char-downcase key) #\o))))) ; C-o
      (define generic-off-key
        (lambda (key key-state)
          (or (_generic-off-key key key-state)
              (and (control-key-mask key-state)
                   (= (to-lower-char key) 111))))) ; C-o

      (define ja-direct-rule
        (append '(
                  (" " " ")
                  )
                ja-direct-rule))

      (define ja-rk-rule
        (append '(
                  (((",") . ()) ("��" . "��"))
                  (((".") . ()) ("��" . "��"))
                  )
                  ja-rk-rule))

  * [���ܸ�����] PRIME�Ϥʤ��ʤ����äƹ��ʤ��ʡ����ˤ˳��ꤷ�ʤ��Ȥ����ʤ���Ϣʸ���Ѵ����¸����줿�顢�ޤ��ȤäƤߤ褦���Ȥ������Ȥ�Anthy��Ȥ����Ȥˤ��롣

    uim��Ȥ��Ϥ��᤿������ɡ�mozilla�����Ѵ����䤬����Τۤ��ˤ��ä���äƽ񤯤Τ˽������ʤ��ʤ���

  * [PRIME] PRIME���Ƥߤ롥sources.list�ˤϰʲ����ɲá�

      deb http://prime.sourceforge.jp/debian ./
      deb http://taiyaki.org/debian ./

    �����󡥤���⤤���ͤ���PRIME���ͻҤ򸫤褦��

  * [Anthy] Anthy�򤤤�Ƥߤ롥canna��Ʊ���Ȥ����ϡ���괹���褦���ʤ���.emacs�ˤϤ��졥

       (setq default-input-method 'japanese-anthy)
       (anthy-load-hiragana-map anthy-alt-char-map)

  * [WikiLink] OPML���б����褦���ʤ���

  * [�ز��] �褯�狼��ʤ����ɡ��Ȥꤢ������⡥((<URL:http://www.ipsj.or.jp/members//Magazine/Jpn/3804/index.html>))

  * [���Ż�] Wiki�Ȥ������꡼�Ȥ���Х�����ǻȤ�����������������ʬ������ʸ��ǥ������ͤ�����äơ�������˥ǥ�����äơ�����

  * [WikiLink] ���롼�ץڡ������ɲá��쥤�����Ȥ��ѹ��������˻Ȥ��ͤ���Τ��ʤ����ޤ�������������ʬ�ϻȤäƤ���������

  * [Gauche] Debian��gauche 0.7.2-1���� make-server-socket ��ư���ʤ�

  * [PWM] ư���Ƥ��ʤ����Ȥꤢ��������2��
    * devel/logger�Τ������ä���progName��progname�ˤʤäƤ������顥

  * [WikiLink] channel�ˤ��������������(dc:date or pubDate)���ʤ�RSS�ξ�硤RSS::Maneger#recent_changes���ƤӽФ���뤿�Ӥ�item��dc_date���Ĥ��Ƥ��äƤ��ޤ�����Ƭ��item�ˤ����Ĥ���褦�ˤ����������ޤ����Ȥꤢ�������֡�

  * [Subversion] ���åץǡ��Ȥ˴ؤ���How to ((<URL:http://svn.collab.net/repos/svn/trunk/notes/repos_upgrade_HOWTO>))

  * [���Ż�] Wiki�Ȥ������꡼�Ȥ���Х�����ǻȤ��ʤ�����

  * [Subversion] �ե����ޥåȤ��Ѥ��餷�������ݤ������ʡ��ɤ����褦��

  * [NetHack] WikiLink��NetHack�Υ�󥯤��ɲä���Ƥ����Τǻפ鷺��äƤ��ޤ���������ʬ����Ť餤��

  * [���Ż�] Wiki�Ȥ������꡼�Ȥ���Х�����ǻȤ�������

  * [Lisp,XML] ((<URL:http://www.graco.c.u-tokyo.ac.jp/~kamina/>)) ����ɤ�Ǥ�������

  * [((<tluc|URL:http://www.tluc.org/>))] �ƥ�������桼�������ɤऽ����Ruby���ٶ��������Ǥ��ä��ΤǤ����⤷�Ƥ��ޤ��������������ΤϽ��ƤʤΤǤ����������ʤΤ����Ȼפäƶ�̣�������ä�����ĺ���ޤ������������ڤ����ä��Ǥ��补����������ǻ���Ȥϻפ��ޤ������ɡ�����

  * [((<�ǥ����롦�����ϥȡ����������ץ�2003|URL:http://www-cg.cis.iwate-u.ac.jp/DIG03/index2.html>))] ���졢����˽��प���äƤ�������ɤ褫�ä��Τ��ʤ����ޤ����⤦�����ڤꤹ���Ƥ뤫��ɤ����褦��ʤ����ɤ���

  * [Wiki] ���ˤθ���((<group-2003: �Ƕ�ι���|URL:http://pub.cozmixng.org/~wiliki/group-2003.cgi?c=r&l=jp>))���٤����ɤ���Τ������Ǥ�����Τ����������ǽ񤭴������Ƥ������򤤤Ǥ���

  * [UI] ��äѤ�((<�����Ȥ����԰٤ϺǸ�μ���|URL:http://www.laplace-lab.org/diary/archives/000048.html>))����ʡ�

  * [test] ���Ȥ�((<dW : Java technology : Java�����ɤο���: �ƥ��Ȳ�ǽ�� ���ץꥱ���������߷�|URL:http://www-6.ibm.com/jp/developerworks/java/020125/j_j-diag0911.html>))���ɤ���

  * [JavaScript][XML] ((<Hawk'sW3L: XML�ǡ����򰷤�|URL:http://www.hawk.34sp.com/smpview.php?src=tips_xml>))

  * [Wiki] ((<VisulTour|URL:http://todo.is.os-omicron.org/tiki.cgi?c=v&p=VisualTour>)) WikiLink�ˤ⤳��ʤΤĤ������ʤ���

  * [Scheme] SICP�˽ФƤ���Painter��ImageMagick��Ȥä�����((<URL:http://www.scheme.dk/imagemagick-for-mzscheme/examples/painters/>))

  * [����] ((<������ƥ�� 1��27������������|URL:http://www.asahi.co.jp/toku/html/bn_20020127.html>)) ((<���ϲ���|URL:http://www.age.ne.jp/x/ichiki/WP/WP.html>))

  * [ssh] ((<FreeBSD QandA 2255|URL:http://www.jp.freebsd.org/QandA/HTML/2255.html>))���ޥ�ɤ����¤���ˤϤ�������Τ���

  * [((<WIkiLink|URL:http://pub.cozmixng.org/~rwiki/index.rb?cmd=view;name=WikiLink>))] Link�Υڡ����򹹿����Ƥ�Category�Υڡ�������������ʤ���storycard�ǤϤɤ���ä�index�ڡ����򹹿����Ƥ���Τ���ʬ����󡥤Ȥꤢ������Ʊ���ڡ����������¸����ȹ�������롥

  * [((<�ǥ����롦�����ϥȡ����������ץ�2003|URL:http://www-cg.cis.iwate-u.ac.jp/DIG03/index2.html>))] �Ȥꤢ�����������ѻ��񤤤Ƥߤ���

  * [uptime] ʿ�Ѥ����120days����������Ť���ߤˤʤ�Τ��ʡ�

  * [NPO] ((<����ƣΣУϥ��ݡ��ȥ롼��|URL:http://www.iwate-npo.org/>))���Ȥ��ɤ�Ǥ�������

  * [CSS] ((<CSS  Laboratory|URL:http://is.vis.ne.jp/>))

  * [RD] �Ȥꤢ�������äƤ�����((<RD��ˡ|URL:http://yebisu.ics.es.osaka-u.ac.jp/~kawaji/rd_howto.html>))

  * [gFTP] SFTP��Ȥ��ˤϡ���˥塼��FTP->���ץ����->SSH->Use SSH2SFTP subsys�˥����å����롣

  * [((<����ѥ���齬�쥸���|URL:http://www.is.s.u-tokyo.ac.jp/~vu/01/jugyo/processor/process/soft/compilerresume/index.html>))]�����Ȥ��ɤ�Ǥ�������

  * [Konqueror] IE����(CSS��)�Ȥ��ʤ����⡥

  * [MUSIC] ���Τ������²Ȥ˵��ä��Ȥ��ˡ�((<�ϥ��ݥ�>))����ä��Ф���((-���䡤��Ťʤ������-))�ʤΤˤ⤦��((<�˥��ѥ�|URL:http://www.jvcmusic.co.jp/maaya/newrelease/>))�פ��ǤƤ롥����DVD�դ����äơ������ʤ����Ǥ�DVD�ץ졼��̵�����ʡ�

  * [MUSIC] ���ܸ����Τ���CDDB������->����¾->�ե�����̾�����ܸ�(EUC-JP)����Ѥ��롤�˥����å���������Grip�Ǥ�Ȥ��롥

    * http://ns.w7r.net/~cddb/cddbeuc.cgi

    ���ä��Ϥɤ��ʤ������

    * http://ns.w7r.net/~cddb/cddb.cgi

      EUC���Ѵ����ʤ���Ĥ��ʡ�

  * [MUSIC] �²Ȥ˵��ä��Ȥ�(2003/8/9-2003/8/17)��((<PUNK CHIPS|URL:http://www.lastrum.co.jp/Music/punkchips/>))�Ȥ���CD������Ʋ�Υ쥸�ΤȤ������äƤ��ä�������˥Х�CD+T������դ���1500�ߤȤ������㤤������+�ե��󥭡��ʥѥå������ʤΤǻפ鷺���åȡ����Ƥ�褯�����ư��֤��㤤ʪ���ä��ΤǤϤʤ����Ȼפ��������κ�(2003-08-29)��

  * [VB] ʸ�������"�򥨥������פ���ˤϡ�

      * """ => "
      * """" => "
      * """"" => ""
      * """a"" => "a"

    �櫓�狼���

  * [Windows] �롼���ˤ���ˤ�((<�����֥�ƥ�ӤΥ��󥿡��ͥå���³����|URL:http://www.watch.impress.co.jp/pc/docs/article/20000616/catv13.htm>))������򻲹ͤˡ��Ȥꤢ�����������ͥåȥ���Ѥ�NIC�Υץ�ѥƥ��ζ�ͭ���֤ǡ֤�����³�ǥ��󥿡��ͥå���³�ζ�ͭ����Ѳ�ǽ�ˤ���(E)�פ˥����å��������Ф�����

  * [CSS] ((<URL:http://www.fromdfj.net/>))�Ǥ⸫���ٶ����褦

  * [((<�Ƚ� Scheme ������ Teach Yourself Scheme in Fixnum Days|URL:http://www.sampou.org/scheme/t-y-scheme/t-y-scheme-Z-H-1.html>))]  

  * [((<�ǥ����롦�����ϥȡ����������ץ�2003|URL:http://www-cg.cis.iwate-u.ac.jp/DIG03/index2.html>))] ((<GalleryAdministrator>))�ǥǥ����뵻������˱��礷�褦��

    * �޶�  ������((<ͥ����>))�פȡ�((<�������>))�פˤϡ�ɽ������ɽ���ץ졼�ȡ�����Ӿ޶⤬�Ѱդ���Ƥ��ޤ�������ˡ���((<���̾�>))�פˤϡ�ɽ�����Ⱦ��ʡ��޶⤬�̤��Ѱդ���ޤ���
    * �罸���ϡ�2003ǯ 9�� 2���ʲСˡ� �ʥޥ����ǥ����������Ω��ǰ����
    * ���ڡ�2003ǯ10��15���ʿ��  �ʾð�ͭ����
    * ȯɽ���٥�ȡ�2003ǯ11��29�����ڡ� 

  * [((<ActiveSquare|URL:http://www.namo.com/jp/activesquare/>))] ���������ʵ������롥�Ǥ⡤���Υڡ�����AcriveSquare�ǤϺ�äƤ��ʤ��ߤ�����

  * [((<KartOO|URL:http://www.kartoo.com/>))] �������补

  * ((<JavaScript>))

  * Windows���SFTP���饤�����((<FileZilla|URL:http://sourceforge.net/projects/filezilla/>))(((<���ܸ첽�ѥå�|URL:http://www.exa5.jp/>)))

  * [Access]((<��ݡ��Ȥ�Ϣ�֤�Ĥ���|URL:http://yokohama.cool.ne.jp/machida/access2.htm#77>))

  * ((<WikiRoom|URL:http://www.wikiroom.com/>))�ߤ����ˤ��ä���((<���ѵ���|URL:http://www.wikiroom.com/?%CD%F8%CD%D1%B5%AC%CC%F3>))����ʤ��Ȥ�����ʡ����֤����ݽ�����

  * A Cookbook for Using the Model-View-Controller User Interface Paradigm in Smalltalk-80


  * ImageMagick��display�ǥ���ͥ���ɽ��

      % display "vid:*.png"

  * Windows��ICON�ե�����κ������

      % ppmtowinicon -o favicon.ico favicon16.ppm favicon32.ppm

    : favicon.ico
        ���ϥե�����̾
    : favicon16.ppm
        16x16��PPM�ե�����
    : favicon32.ppm
        32x32��PPM�ե�����

    favicon??.ppm��1��n�Ļ����ǽ

  * REXML��IO���֥������ȤǤ���UTF-8�ʳ��Υ��󥳡��ǥ��󥰤�XMLʸ���ѡ����Ǥ��ʤ���String���֥������Ȥ��Ѵ�����ɬ�פ����롥

  * TeX: alltt�Ķ���Ǥξ��դ�ʸ����\sp�����դ�ʸ����\sb

  * TeX: ��Ĺ��<��\langle��>��\rangle��YaTeX�Ǥ�\C-cm���䴰�Ǥ��롥

  * ���Ȥǡ������äȤ���[2003-05-19 17:58:15(JST)] ((<URL:http://www.atmarkit.co.jp/flinux/rensai/root08/root08c.html>))

  * sodipodi�����ܸ��ʸ����ɽ������

    �٥��ȥ�١����Τ����񤭥��եȡ����饹�ȥ졼�������Ѥ��ˤʤ뤫��

    ������å���Dialogs -> Text Editing�ǥե���Ȥ����꤬����롥�������ȡ�kinput2�����ܸ����Ϥ����롥

  * JDK��APT�ξ��

      deb ftp://sunsite.auc.dk/packages/java/java-linux/debian unstable main non-free

  * Debian�Ǥ�PPPoE������(FLET'S ADSL)

    pppoeconf��Ȥ��ȳڡ�

    �Ȥ�ʤ�����/etc/ppp/{chap,pap}-secrets�κǸ��

      "��³ID" * "�ѥ����"

    ��񤯡�chap-secrets�ξ���"�ѥ����"�θ��*��ɬ�פ��⤷��ʤ���

    ppp0��up�����Ȥ���default route������򤹤�褦��/etc/ppp/if-up.d/�ʲ��˼��Τ褦�ʥ�����ץȤ�¹Ը����դ����֤��Ƥ������⤷��/etc/init.d/ppp start���������default route�����ꤵ��Ƥ��ʤ���Ф����ɬ�פʤ���

      #!/bin/sh
      /sbin/route add default dev $PPP_IFACE

    if-up.d�ʲ��Υ�����ץȤϥե�����̾��˼¹Ԥ����Τǡ��ե�����̾��0����Ϥ���Ƥ����ꤹ��ȡ����Ū�᤯�¹Ԥ��Ƥ���롥


  * NIS���饤����Ȥ�����

    /etc/passwd��

      +:::::::::

    /etc/group��

      +:*::

    ���

  * GTK2���Ѥ������ץꥱ��������Emacs�������Х���ɤ��Ѥ���

    ~/.gtkrc-2.0�˰ʲ��򵭽�

      gtk-key-theme-name = "Emacs"

  * winegcc

      /* winegcc -o msgbox msgbox.c */
      #include <windows.h>
      
      int
      main(int argc, char **argv, char **env)
      {
        MessageBox(NULL, "����ˤ��ϡ�������", "build by winegcc", MB_OK);
        return 0;
      }

  * mingw32msvc-gcc

      % i586-mingw32msvc-gcc -o msgbox.exe msgbox.c
      % wine msgbox.exe

  * ((<Emacs>))

  * ��������((<w3m-0.4 ��꡼���Ρ���|URL:http://w3m.sourceforge.net/RELNOTE-0.4>))

  * ((<daemontools|URL:http://tools.qmail.jp/daemontools/>))�äƤ����󤸤�ʤ���

  * FreeBSD��Mozilla�����ܸ��˥塼��ʸ�������������~/.mozilla/hoge/fuga/prefs.js��
      user_pref("fonts.xft.enabled", false);
    �Ƚ񤤤Ƥ����Ȥ褤��

  * FreeBSD��irq��Ĵ�٤�ˤ�dmesg�򸫤뤷���ʤ��Τ���/proc/�ʲ��ˤʤ��Τ���lspci�Ȥ��ʤ��Τ����Ȥ��Ť餯�ʤ��Τ���
    ����(2003/03/05)�Τ����pccard��NIC��Ȥ���褦�ˤ��褦�Ȥ���/etc/pccard.conf�˰ʲ��Τ褦�˽񤤤Ƥ�����������(?)��Laneed��LD-CDS��IRQ��8�֤ϻȤ��ʤ��ȸ���줿��
      irq 9 13

    * devinfo�Ȥ�pciconf�Ȥ��Ǥ��礦���� - f

    * �ʤ�ۤɡ�((<FreeBSD QandA 1408|URL:http://www.jp.freebsd.org/QandA/HTML/1408.html>))�򸫤�Ф褫�ä���Ǥ��͡�devinfo��5.x�ʹߤ������󤢤꤬�Ȥ��������ޤ��� - kou

  * �����Ĥϳڤ��ʤ���((<��IT���ѥ��åȤ򥭥�ץ��㤹��ˤ�|URL:http://www.atmarkit.co.jp/flinux/rensai/linuxtips/424cappkt.html>))

  * Apache��"/~�桼��̾"����ʤ���"/�桼��̾"������"/home/*/public_html"��ɽ������ˤϰʲ��Τ褦�ˤ���Ȥ褤����������"/manual/"�Ȥ������褦�˥桼���ʳ��Υѥ����Ȥ��ʤ��ʤ롣

      AliasMatch ^/([^~/][^/]+)/(.*) /home/$1/public_html/$2

  * proxy��ۤ���Subversion��Ȥ���((<URL:http://subversion.tigris.org/project_faq.html#proxy>))

  * ssh port forwarding��proxy��ۤ���Subversion��Ȥ���

      % ssh -L 10000:www.cozmixng.org:80 -f www.cozmixng.org ping -i 60 localhost > /dev/null
      % svn co http://localhost:10000/repos/...
