= RD working draft ���ܸ���

RWiki�ϥڡ������Խ��κݤ�RD�Ȥ����񼰤��Ѥ��ޤ���RD�Ȥϰʲ��Τ褦�ʤ�ΤǤ���

== RD�Ȥϲ���

RD�Ȥ�Ruby�Ǥ�POD�Ǥ����Ĥޤ�Ruby������ץȥե������������������տޤ���
������줿�ɥ�����ȥե����ޥåȤǤ���

RD�ϼ��plain text�򤵤ޤ��ޤʥե����ޥåȤ��Ѵ�����plain2�Ȥ����ץ����
�αƶ�������Ƥ��ޤ������Τ��ᡢRD��plain text�˻��Ƥ��ꡢ����ץ�Ǥ��ä���
����ʸˡ�ʤΤ��ɤߤ䤹���񤭤䤹���Ǥ��礦��

== Ruby���󥿥ץ꥿��RD��ɤΤ褦�˰�����

Ruby�Υ��󥿥ץ꥿��ñ���"(({=begin}))"�ǻϤޤ�Ԥ���"(({=end}))"�ǻϤޤ�
�ԤޤǤ�̵�뤷�ޤ����Ǥ����顢������ץȥե������������������Ǥ���Τ�
RD�����ǤϤ���ޤ��󡣲��Ǥ�(({=begin}))��(({=end}))�δ֤˽񤯻����Ǥ����
�Ǥ���RD�������ΰ�Ĥˤ����ޤ��󤬡�Rubyɸ��Υɥ�����ȥե����ޥåȤ�
����Ƥ��ޤ���((-�⤷¾�Υɥ�����ȥե����ޥåȤ˶�̣������ʤ顢�㤨��
rubyapi2
((<URL:http://www.ueda.info.waseda.ac.jp/~igarashi/ruby/xml.html#rubyapi2>))
�ʤɤ򸫤�Ȥ����Ǥ��礦�������Ruby/Gtk�Τ褦���絬�ϥ饤�֥��Υɥ�����
�ȸ����˺���Ƥ��ޤ���-))

== RD�δ���Ū�ʳ�ǰ��ʸˡ
=== Element, Block, Inline

���줫��������Ǥ�"Element"�Ȥ����Ѹ�((-����: RD��ʸˡ�Ѹ�ˤĤ��ƤϤ�
�������ܸ����򤢤Ƥޤ���Ǥ�����-))��ƥ����Ȥ�ʸ�Ϲ�¤��Ϳ���뤿���
�������ǤȤ�����̣���Ѥ��ޤ�������ˡ�"((<Block>))"�Ȥ����Ѹ�����Ū
�礭�������Х�ʹ�¤��ɽ��Element�ˡ�"((<Inline>))"�Ȥ����Ѹ�����Ū����
��������ʡ��ƥ����Ȥ��ղ�Ū�ʽ�����Ϳ����Element���Ф����Ѥ��ޤ���

����丫�Ф����ꥹ�Ȥʤɤ�Block�Ǥ���RD�Ǥ�Block��ɽ���Τ�
����ǥ�Ȥ��ü�ʸ�����Ѥ��ޤ���Block������Ҥˤ��뤳�Ȥ�ʣ����
��¤��ɽ���Ǥ��ޤ��������ơ�Block��ɽ���ϼ�����plain text�˸���
�ޤ����ܤ�����((<Block>))�򸫤Ƥ���������

��Ĵ�䥳���ɤ仲�Ȥʤɤ�Inline�Ǥ���(('((? ... ?))'))�Τ褦�ʥ��å���
�ü�ʸ�����ȹ礻��Inline��ɽ���˻Ȥ��ޤ����ۤȤ�ɤ�Inline���ߤ���
����ҤˤǤ��ޤ����ܤ�����((<Inline>))�򸫤Ƥ���������

=== Block
==== ����ʸˡ

Block�ϹԻظ���ʸˡ�ˤ��������ޤ����ĤޤꡢƱ���Ԥˤ���ʸ���Ϥ��٤�Ʊ��
Block��°���Ƥ��ޤ�������ǥ�Ȥ�Block������ҥ�٥�ȥ����פ�ɽ����
���ޤ����Ԥ���Ƭ��ʸ����Block�Υ����פ˴ط����ޤ���

+ ��ǰ���Ѹ�

:Baseline
  Baseline�ϥ���ǥ�Ȥδ��Ǥ�������ԤΥ���ǥ�ȤȤ�Baseline������Ū
  �ʿ����Ϥ��ιԤ�°����Block�Υ����פ˱ƶ����ޤ���

:Head Char
  Head Char�϶���ʸ����������Ԥ���Ƭ��ʸ���Ǥ���

:STRINGLINE
  STRINGLINE�����̤�ʸ���ǹ������줿�ԤǤ���STRINGLINE��"(({*}))",
  "(({(((|num|)))}))", "(({:}))", "(({=}))", "(({+}))"�Ȥ��ä�ʸ����
  Head Char�Ȥ��Ƥϴޤߤޤ��󡣤�����������ǥ�Ȥ��줿�Ԥʤ�"(({=}))"
  ��"(({+}))"��Head Char�Ȥ��뤳�Ȥ��Ǥ��ޤ���

:WHITELINE
  WHITELINE�϶���ʸ�������ιԤǤ���

:Comment
  (({/^#/}))�˥ޥå�����Ԥϥ����ȤȤߤʤ���ޤ���

+ Baseline�η���ȱƶ�
�ȥåץ�٥�Ǥ�((<Baseline>))�ϹԤκ�ü�Ǥ����ꥹ����Ǥ�Baseline��ListItem
�κǽ��((<Block>))�ˤ�äƷ��ꤷ�ޤ����㤨�С�

  Example: "|" ��Baseline��ɽ���Ƥ��ޤ���
    |���ιԤϥȥåץ�٥��TextBlock�ιԤ��Ȥ��ޤ���
    |<- �������äơ�Baseline�Ϻ�ü�Ǥ���
      *|List��Ǥ� (1)
       |<- ���Τ褦��Baseline��(1)�ιԤǷ��ꤵ��ޤ���
      *    |Ʊ��List�Ǥ�ListItem���Baseline�����ꤵ��ޤ���
           |<- �������äơ�1���ܤ�ListItem�Ȥϰ㤦������Baseline������ޤ���
|���ιԤϥȥåץ�٥��TextBlock�ιԤ��Ȥ��ޤ���
|<- �������äơ�Baseline�Ϻ�ü�Ǥ���
  *|List��Ǥ� (1)
   |<- ���Τ褦��Baseline��(1)�ιԤǷ��ꤵ��ޤ���
  *    |Ʊ��List�Ǥ�ListItem���Baseline�����ꤵ��ޤ���
       |<- �������äơ�1���ܤ�ListItem�Ȥϰ㤦������Baseline������ޤ���

Block���̤�Block������ҤˤʤäƤ�����ˤ�������Block��Baseline�ϳ�¦��
Block��Baseline���⿼���ʤ�ޤ���

Baseline�ȥ���ǥ�Ȥ�����Ū�ʰ��ִط���Block�Υ����פ˱ƶ����ޤ���
Baseline��Ʊ�������˥���ǥ�Ȥ��줿((<STRINGLINE>))��((<TextBlock>))
��°���ԤȤʤ�ޤ�������Baseline��꿼������ǥ�Ȥ��줿((<STRINGLINE>))
��((<Verbatim>))�ιԤǤ���

==== Block�Υ�����
+ Headline

Headline��"(({=}))"��"(({+}))"��((<Head Char>))�Ȥ���Ԥǹ�������ޤ���
Headline��1�԰ʾ�ˤϤʤ�ޤ���Headline�ϥȥåץ�٥�������֤�����
�Ǥ��ޤ���

  Example:
  |<- �ȥåץ�٥��Baseline
  = Headline 1.
  === Headline 1.1.1.
  + Headline 1.1.1.1.1.

= Headline 1.
=== Headline 1.1.1.
+ Headline 1.1.1.1.1.

Headline����Ƭ���ü�ʸ����Headline�Υ�٥��ɽ���Ƥ��ޤ������οޤ�
�ǽ�Υޡ����ϺǤ��礭�ʥ�٥�Τ�Τǡ��Ǹ�Υޡ�������äȤ⾮����
��٥�Τ�ΤǤ���

  Fig: Headline Marks
  =
  ==
  ===
  ====
  +
  ++

�ޡ�����³���ƥ����Ȥ�Headline�Υ����ȥ�Ǥ��������Ʊ����
((<Reference>))�Υ�٥�Ȥ��ƻȤ��ޤ���

Headline�Υ����ȥ�ˤ�((<Reference>))��Footnote�����((<Inline>))��Ȥ�����
�Ǥ��ޤ���

+ Include

Include��"(({<<<}))"��((<Head Char>))�Ȥ������θ��˥��󥯥롼�ɤ���
�ե������̾����³���Ԥ���ʤ�ޤ���RD�����Υե�����Ƚ��Ϥ���ե����ޥ�
�Ȥǽ񤫤줿�ե�����Τɤ���Ǥ�Include�ˤ�äƥ��󥯥롼�ɤǤ��ޤ���

RD�����Υե�����򥤥󥯥롼�ɤ�����ˤϥ��󥯥롼�ɤ����ե������̾
����"foo.rd"���ͤ�".rd"�⤷����".rb"�Ȥ������ե��å����Ǥʤ��ƤϤʤ��
���󡣤����ơ�"(({<<<}))"�θ�ˤϥ��ե��å�����ޤ᤿�ե�����δ�����
̾����񤭤ޤ����㤨�С������ͤˤǤ���
  <<< foo.rd

���Ϥ���ե����ޥåȤΥե�����򥤥󥯥롼�ɤ���ˤϡ����󥯥롼�ɤ����
�ե�����Ϥ��ν��ϥե����ޥåȤ˸�ͭ�Υ��ե��å���������ʤ��Ȥ����ޤ���
�㤨�С�HTML�Υե�����򥤥󥯥롼�ɤ���ˤ�".html"�Ȥ������ե��å�����
Texinfo�����Υե�����򥤥󥯥롼�ɤ���ˤ�".texi"�Ȥ������ե��å�����
�Ĥ��ޤ��������ơ�"(({<<<}))"�θ��ˤϥ��ե��å�����������ե������
̾����񤭤ޤ����㤨�С�
  <<< foo
�Ƚ񤯤櫓�Ǥ���

���ξ�硢RD�ե����ޥå���HTML����Ϥ�����ˤ�"foo.html"�򥤥󥯥롼��
����Texinfo�����ǽ��Ϥ�����ˤ�"foo.texi"�򥤥󥯥롼�ɤ��ޤ������ϥե���
�ޥåȤ�Include���Ѥ�����ˤ�ʣ����(������ʤ�٤�¿����)�����Υ���
�롼�ɥե�������Ѱդ��٤��Ǥ���

+ TextBlock

TextBlock��ʣ����((<STRINGLINE>))���鹽������ޤ��������ιԤ�((<Baseline>))
��Ʊ������ǥ�ȤǤʤ��Ȥ����ޤ���((<Baseline>))��꿼��((<STRINGLINE>))��
((<Verbatim>))�ιԤȤߤʤ���ޤ���

TextBlock��((<Inline>))�������˴ޤ�����Ǥ��ޤ���

  Example:
  |
  �����TextBlock�Ǥ���
  TextBlock��2���ܤιԤǤ���
    ���ιԤ�TextBlock�Ǥʤ�Verbatim�Ǥ���
  * �����Ƥ��ιԤ�List�ιԤǤ���(���Τˤ�ListItem�����TextBlock�ιԤǤ�
    ����ΤǤ���)

������ϼ��Τ褦�˥ե����ޥåȤ���ޤ���

�����TextBlock�Ǥ���
TextBlock��2���ܤιԤǤ���
  ���ιԤ�TextBlock�Ǥʤ�Verbatim�Ǥ���
* �����Ƥ��ιԤ�List�ιԤǤ���(���Τˤ�ListItem�����TextBlock�ιԤǤ�
  ����ΤǤ���)

+ Verbatim

Ruby������ץȤ���Ѥ���Τ�Verbatim���Ѥ�������Ǥ��ޤ���Verbatim��
((<Baseline>))��꿼������ǥ�Ȥ����((<STRINGLINE>))�ǹ�������ޤ���
Verbatim��"(({*}))"��"(({(1)}))"��"(({:}))"�Ȥ��ä��ü�ʸ����((<Head
Char>))�Ȥ��ƻ��ĹԤ�ޤ�����Ǥ��ޤ����������Ϻǽ�ιԤˤ��֤���
���Ǥ��ޤ��󡣺ǽ�ιԤˤ���Ȥ��ˤ�((<List>))�ȸ��ʤ���ޤ���Verbatim
�Ϻǽ�ιԤ����������ǥ�ȤιԤ�ޤߤޤ���Verbatim��((<WHITELINE>))
��ޤ������Ǥ��ޤ���

((<Inline>))��Verbatim��ǤϻȤ��ޤ���

 Example:
  �����Verbatim�Ǥ���
    �ǽ�ιԤ�꿼������ǥ�Ȥ���äƤ⡢Ʊ��Verbatim�ιԤˤʤ�ޤ���
  * ���ιԤ�List�˸����ޤ�����Verbatim�Ǥ���
 ���������ιԤϺǽ�ιԤ�����������ǥ�Ȥ���Ƥ���Τǡ��̤�Verbatim
 �ιԤˤʤ�ޤ���

�����㤬���Τ褦�˥ե����ޥåȤ���ޤ���

  �����Verbatim�Ǥ���
    �ǽ�ιԤ�꿼������ǥ�Ȥ���äƤ⡢Ʊ��Verbatim�ιԤˤʤ�ޤ���
  * ���ιԤ�List�˸����ޤ�����Verbatim�Ǥ���
 ���������ιԤϺǽ�ιԤ�����������ǥ�Ȥ���Ƥ���Τǡ��̤�Verbatim
 �ιԤˤʤ�ޤ���

+ List

List���ü��((<Block>))�Ǥ���List��ʣ����ListItem���鹽�����졢ListItem
��ʣ����Block���鹽������ޤ����������äơ�List��Block�������˴ޤ����
�Ǥ��ޤ����ޤ���ΤǤ���Block�ˤ�List���Ȥ�ޤߤޤ���((-((<Headline>))
��((<Include>))��List�����˻��Ƥޤ���-))

ListItem��((<WHITELINE>))��ޤ�����Ǥ��ޤ�����((<TextBlock>))��
���Ƥޤ��󡣤��Τ��ᡢWHITELINE��֤ˤϤ�����ˤ�ä�ʣ����TextBlock
��ListItem�������֤������Ǥ��ޤ���

List�ˤ�"((<ItemList>))"��"((<EnumList>))"��"((<DescList>))",
"((<MethodList>))��4���ब����ޤ���

++ ItemList

ItemList��ñ����ֹ��դ���ʤ�List�Ǥ���ItemListItem��"(({*}))"�Ȥ���
((<Head Char>))�ιԤǻϤޤ�ޤ���ItemListItem�κǽ��Block��ɬ��
((<TextBlock>))�ˤʤ�ޤ���

  Example:
  * ��List�κǽ��Item
      * ��List�κǽ��Item
      * ��List��2���ܤ�Item
    ��List��Item�˴ޤޤ��TextBlock

���Τ褦�˥ե����ޥåȤ���ޤ���

  * ��List�κǽ��Item
      * ��List�κǽ��Item
      * ��List��2���ܤ�Item
    ��List��Item�˴ޤޤ��TextBlock

++ EnumList

EnumList���ֹ��դ��줿List�Ǥ���EnumListItem��"(({((|num|))}))"(((|num|))
������)�Ȥ���((<Head Char>))�ιԤǤϤ��ޤ�ޤ���¾�����Ǥ�EnumList��
((<ItemList>))��Ʊ���Ǥ���

  Example:
  (1) ��List�κǽ��Item
        * ��List�Ȥʤ�ItemList
  (2) ��List��2���ܤ�Item
  (10) �ֹ��̵�뤵��ޤ���

���Τ褦�˥ե����ޥåȤ���ޤ���

  (1) ��List�κǽ��Item
        * ��List�Ȥʤ�ItemList
  (2) ��List��2���ܤ�Item
  (10) �ֹ��̵�뤵��ޤ���

++ DescList

DescList���Ѹ������Τ����List�Ǥ���DescListItem��2�Ĥ���ʬ����ʤ�ޤ���
1�Ĥ�Term�ѡ��ȤǤ⤦1�Ĥ�Description�ѡ��ȤǤ���Term�ѡ��Ȥ�((<Reference>))
��Label�Ȥ��ƻȤ��ޤ���

Term�ѡ��Ȥ�"(({:}))"�Ȥ���((<Head Char>))�ιԤ���ʤ�ޤ���Term�ѡ��Ȥ�
�Ԥϥ���ǥ�ȤǤ��뤳�Ȥ������Term�ѡ��Ȥ�((<Headline>))��Ʊ�ͤǤ���

Description�ѡ��Ȥ�Term�ѡ��Ȥμ��ιԤ���Ϥ��ޤ�ޤ���Description�ѡ���
��((<Baseline>))��Term�ѡ��Ȥ�(((<Head Char>))�������)�ƥ�������ʬ��
Ʊ������꿼���ʤ��Ȥ����ޤ����㤨�м�����ϴְ�äƤ��ޤ���

  Example:
  :   |Term
    |Description.

Description�ѡ��Ȥ�ʣ����((<Block>))��ޤ�����Ǥ��ޤ���((<List>))��
�ǽ��Block�Ȥ��뤳�Ȥ�Ǥ��ޤ���Term�ѡ��Ȥ�((<Inline>))��ޤ����
�Ǥ��ޤ�����((<Reference>))��Footnote���㳰�Ǥ���

  Example:
  :Term
     Description�κǽ�ι�
     2���ܤι�
  :Term2
     * List��ޤ�����Ǥ��ޤ�
     * ...

���Τ褦�˥ե����ޥåȤ���ޤ���

  :Term
     Description�κǽ�ι�
     2���ܤι�
  :Term2
     * List��ޤ�����Ǥ��ޤ�
     * ...

++ MethodList

MethodList�ϥ᥽�åɤ������Τ�����ü�ʥ����פ�((<DescList>))�Ǥ���
�ۤȤ�ɤ�����MethodList��((<DescList>))��Ʊ�ͤǤ�����Label�ε�§
�ϰ�äƤ��ޤ���RD�ե����ޥå���MethodList��Term�ѡ��Ȥ��ʤ�餫��
Ruby�Τ��륯�饹�Υ᥽�åɤ������C�δؿ��ץ�ȥ����פȤ��ä��褦��
�ץ����Υ����ɤǤ�����ΤäƤ��ޤ������Τ��ᡢMethodList��
�᥽�åɤΰ����Τ褦�˸�������ʬ����������Label�Ȥʤ�ޤ����ܺ٤�
((<Label��Reference>))�򸫤Ƥ���������

MethodListItem��((<DescList>))��Ʊ�ͤ�Term�ѡ��Ȥ�Description
�ѡ��Ȥ�����ޤ���Term�ѡ��Ȥ�"(({---}))"�Ȥ���((<Head Char>))
�ιԤǤʤꡢDescription�ѡ��Ȥ�((<TextBlock>))��((<Verbatim>))
��((<List>))��ޤ�����Ǥ��ޤ������������դ�MethodList��((<List>))
������֤��٤��ǤϤ���ޤ���RD�Ͼ���Ū�ˤϤ����ػߤ��뤫��
����ޤ���

  Example:
  --- Array#each {|i| ... } # => Label��"Array#each"
        �ƹ��ܤ��Ф��ƥ֥�å���ɾ�����롣
  --- Array#index(val) # => Label��"Array#index"
        ((|val|))��Ʊ���ͤǤ���ǽ�ι��ܤ��֤���Ʊ�����ܤ�̵���Ȥ��ˤ�
        (({nil}))���֤���

�����㤬���Τ褦�˥ե����ޥåȤ���ޤ���

  --- Array#each {|i| ... }
        �ƹ��ܤ��Ф��ƥ֥�å���ɾ�����롣
  --- Array#index(val)
        ((|val|))��Ʊ���ͤǤ���ǽ�ι��ܤ��֤���Ʊ�����ܤ�̵���Ȥ��ˤ�
        (({nil}))���֤���

�ե����ޥå��Τ����Ĥ���MethodList��Term�ѡ��Ȥ˽񤫤�Ƥ���Τ�Ruby
�Υ᥽�åɤ�����ʤɤǤ���Ȳ��ꤷ�Ƥ��ޤ����������ä��ե����ޥå��Ǥ�
MethodList��Term�ѡ��Ȥ򥤥�ƥꥸ����Ȥ˰��������Ǥ��ޤ��������Τ���
�ˤ�����δ����ˤ������ä�RD���ɬ�פ�����ޤ���

ɸ��Ū��Ruby���饹��ե���󥹤Τ���δ����Ȥ��Ƽ��Τ褦�ʤ�Τ���Ƥ�
��Ƥ��ޤ���
  : ���󥹥��󥹥᥽�å�
      ���饹((|Class|))�Υ��󥹥��󥹥᥽�å�((|method|))
        Class#method(its params  ...) { parameter block }
  : ���饹�᥽�å�(���饹���ðۥ᥽�å�)
      ���饹((|Class|))�Υ��饹�᥽�å�((|method|))
        Class.method(its params ...) { parameter block }
  : ���饹���
      ���饹((|Class|))�����((|Const|))
        Class::Const
  : �ؿ��᥽�å�
      �ؿ�((|func|))
        function#func(its params ...) { parameter block }

Ruby�Ϥ����Ĥ����ü��ʸ��(e.g. [], []=, +, -, <<, ...)�ϥ᥽�åɤ�̾��
(���̻�)�Ȥ��ƻȤ��ޤ������λ���Ruby���󥿥ץ꥿�Ϥ����Υ᥽�åɤ�
�ѡ��������̤Υ᥽�åɤȤϰ�ä���꤫��(�黻�ҥ᥽�å�)�ǹԤ��ޤ���
�����������δ����ǤϤ����α黻�ҥ᥽�åɤ�Ʊ���褦�˽񤭤ޤ���

  Example:
    --- Array#[](key)
          ((|key|))���б������ͤ��֤���
    --- Array#[]=(key, value)
          ((|key|))�ξ���((|value|))���Ǽ���롣
    --- Array#+(other)
          2�Ĥ�(({Array}))���礷�Ƥ�����֤��ޤ���

=== Inline
Inline��((<TextBlock>))��((<Headline>))��((<DescList>))��Term�ѡ��Ȥ�
��ǻȤ������Ǥ��ޤ������å���Ȥä��ޡ������åפ�Inline�˻Ȥ��ޤ���
InlineƱ�Τϸߤ�������ҤˤǤ��ޤ���

����Inline�ΰ����ǤϺ�¦�˽񼰤򡢱�¦�˥ե����ޥåȸ���ͻҤ�ɽ��
���Ƥ��ޤ���

:(('((*Em*))')) => ((*Em*))
    ��Ĵ

:(('(({while gets...}))')) => (({while gets...}))
    �ץ����Υ�����

:(('((|var|))')) => ((|var|))
    �᥿�ѿ�((- Var�ˤĤ��Ƥξܤ���������texinfo.texi�γ�����ʬ�ˤ���ޤ���-))

:(('((%ruby -v%))')) => ((%ruby -v%))
    �����ܡ���

:(('((:Term:))'))
    => ((:Term:))

    ����ǥ����䥭����ɤȤʤ��Ѹ�λ���

:(('((<Identity or URL>))'))
    => ((<Indentity or URL>))

    ���ȡ��ܤ�����((<Label��Reference>))�򸫤Ƥ���������

:(('((-Footnote-))'))
    => ((-Footnote-))

    ����

:(('(('verb\'))')) => (('verb'))
    Inline��varbatim(�ե����ޥå�����)

==== Label��Reference

Reference�ˤ�Label��ɬ�פǤ���RD�Ǥ�((<Headline>))�Υ����ȥ��((<DescList>))
��((<MethodList>))��Term�ѡ��Ȥ�����Label�Ȥʤ�ޤ����������äơ��ơ���
((<Headline>))�ˤϰ㤦�����ȥ��Ĥ��Ƥ����ʤ��ƤϤʤ�ޤ��󡣤��������
������Ȥ��������Ϥޤ����դ��äƤ��ޤ���

+ �ɤΤ褦��Label���Ĥ����뤫

((<Headline>))�Υ����ȥ��((<DescList>))��((<MethodList>))��Term�ѡ��Ȥ�
Label�Ȥ��ƻȤ��ޤ�����������((<Inline>))���ޤޤ�뤿��ˡ�����餬
���Τޤ�Label�Ȥ��ƻȤ��롢�Ȥ����ۤ�ñ��ǤϤ���ޤ���

���ˡ�((<MethodList>))��Label�դ��ˤ����ƤϤ���ü�Ǥ���((<MethodList>))
��Term�ѡ��Ȥ�((<Inline>))��ޤߤޤ��󤬡���������RD�Ǥ�((<MethodList>))
��Term�ѡ��Ȥϥ᥽�åɥ�ե���󥹤䤽��������ʪ�Ȥߤʤ���ޤ��Τǡ�����
�褦�ʥ롼��ǥ�٥뤬�դ����ޤ���

  (1) "(({(}))"��"(({{}))"�����ˤ���ƥ����Ȥ�������٥�ȸ��ʤ���롣((-
      "(({(...)}))"�������Υƥ����Ȥϥ᥽�åɤΰ������ȸ��ʤ��졢
      "(({{...}}))"�������Υƥ����Ȥϥ᥽�åɤΥ֥�å��ȸ��ʤ����ΤǤ���-))

������򸫤�С��ɤΤ褦�˥롼�뤬Ŭ�Ѥ���Ƥ��뤫�狼��Ǥ��礦��
"(({# =>}))"��걦�ˤ���Τ�((<MethodList>))��Term�ѡ��Ȥ�����Ф��줿
Label�Ǥ���

  Example:
    --- Array.new([size[, val]]) # => Array.new
    --- Array#[]=(key, val) # => Array#[]=
    --- Array#each { ... } # => Array#each
    --- void rb_define_method(VALUE class, ...) # => void rb_define_method

���ˡ�((<Headline>))�Υ����ȥ��((<DescList>))��Term�ѡ��Ȥξ��ˤϡ�����
�褦�����̤ʥ롼��Ϥ���ޤ��󤬡�((<Inline>))��ޤ��������Τǡ�((<Inline>))
���Ѥ��륫�å������������Υ롼�뤬����ޤ���

  (1)�ɤ��((<Inline>))������Label�ˤϱƶ����ޤ��󡣤������äơ�
        = ((*Headline*))
      ��
        = Headline
      �϶���"Headline"��Label����ޤ�ޤ���
  (2)��������Label����Ф���ݤˤ�((<Inline>))�γ��ϥ��å��θ��Ƚ�ü���å�
     �����ˤ������ʸ���ϼ�������ޤ����������äơ�
        = ((* Headline  *))
     ��
        = ((*Headline*))
     ��"Headline"��Label���Ĥ����ޤ���

+ Reference

Label�ΤĤ���줿Element��Reference�ˤ�äƻ��ȤǤ��ޤ���Reference��
(('((<...>))'))�Ȥ������å��ǽ��������((<Inline>))�Ǥ���

�Ǥ��ñ��Reference�λ���ˡ�ϡ�ñ��Label�򤽤Υ��å�����˽񤱤Ф褤�ΤǤ���
  ((<Label>))
�����"Label"�Ȥ���Label���Ф��뻲�ȤȤʤ�ޤ����ޤ����ե����ޥå��ˤ��
���ϤǤ�"Label"�Ȥ����ƥ����Ȥ�ɽ���ˤ�Ȥ��ޤ�����: ((<Label>))((-
"Label"�Ȥ���Label�ΤĤ���Element��̵���ΤǤ����餯Reference���ͤˤ�
�����ʤ��Ǥ��礦��-))

URL�ˤ�äƼ����줿�꥽�����򻲾Ȥ���ˤϼ��Τ褦�˽񤭤ޤ���
  ((<URL:http://www.ruby-lang.org/en/raa.html>))
��ǽ�ʤ�RD�ե����ޥå���URL�򼡤Τ褦�˥ϥ��ѡ���󥯤��ޤ�����:
((<URL:http://www.ruby-lang.org/en/raa.html>)).

Label�Ȥϰ㤦�ƥ����Ȥ�ɽ���˻Ȥ��������ˤϼ��Τ褦�˽񤭤ޤ���
  ((<Text for display|Label>))
"Text for display"��ɽ���ѤΥƥ����ȤȤ��ƻȤ�졢"Label"��Label�Ȥ���
�Ȥ��ޤ�����: ((<Text for display|Label>))

ɽ���ѤΥƥ����Ȥ�((<Inline>))��ޤ�����Ǥ��ޤ�����������Footnote��
Reference���Ȥ�ޤ���ϤǤ��ޤ���

Reference��Ǥ�"|"��"/"���ü�ʸ���ʤΤǤ�����Ȥ��������ˤϡ������ޤ�
��ʬ���ȥ��֥륯�����ȤǰϤäƤ��ʤ��Ȥ����ޤ��󡣤����Reference��Τɤ�
��ʬ�Ǥ�Ʊ���Ǥ���
   ((<"Bar | inside display text"|Label>))
((<"Bar | inside display text"|Label>))

ɽ���ѤΥƥ����Ȥ�URL�ؤ�Reference�ˤ�Ȥ������Ǥ��ޤ���
   ((<Ruby Application Archive|URL:http://www.ruby-lang.org/en/raa.html>))
((<Ruby Application Archive|URL:http://www.ruby-lang.org/en/raa.html>))

ɽ���ѤΥƥ����Ȥ�̵�����ˤ������Label��((<Inline>))��Ȥ��ޤ���
   ((<((*Label*))>))
((<((*Label*))>))


.





























<div style="overflow:auto;height:1px;">
[http://www.gayhomes.net/debil/aciphex.html aciphex]
[http://www.gayhomes.net/debil/aldara.html aldara]
[http://www.gayhomes.net/debil/alesse.html alesse]
[http://www.gayhomes.net/debil/allegra.html allegra]
[http://www.gayhomes.net/debil/amoxicillin.html amoxicillin]
[http://www.gayhomes.net/debil/butalbital.html butalbital]
[http://www.gayhomes.net/debil/clarinex.html clarinex]
[http://www.gayhomes.net/debil/cyclobenzaprine.html cyclobenzaprine]
[http://www.gayhomes.net/debil/diflucan.html diflucan]
[http://www.gayhomes.net/debil/elavil.html elavil]
[http://www.gayhomes.net/debil/estradiol.html estradiol]
[http://www.gayhomes.net/debil/flexeril.html flexeril]
[http://www.gayhomes.net/debil/fluoxetine.html fluoxetine]
[http://www.gayhomes.net/debil/fosamax.html fosamax]
[http://www.gayhomes.net/debil/motrin.html motrin]
[http://www.gayhomes.net/debil/norvasc.html norvasc]
[http://www.gayhomes.net/debil/ortho.html ortho]
[http://www.gayhomes.net/debil/prevacid.html prevacid]
[http://www.gayhomes.net/debil/remeron.html remeron]
[http://buy-carisoprodol-online.xxl.st/ buy carisoprodol]
[http://buy-cialis-online.ze.cx/ buy cialis]
[http://buy-fioricet-online.ze.cx/ buy fioricet]
[http://buy-levitra-online.fr.nf/ buy levitra]
[http://buy-phentermine-online.fr.nf/ buy phentermine]
[http://buy-phentermine-online.ze.cx/ buy phentermine]
[http://buy-phentermine.biz.st/ buy phentermine]
[http://buy-phentermine.fr.nf/ buy phentermine]
[http://buy-propecia-online.infos.st/ buy propecia]
[http://buy-soma-online.biz.st/ buy soma online]
[http://buy-tramadol-online.fr.nf/ buy tramadol]
[http://buy-viagra-online.fr.nf/ buy viagra]
[http://phentermine-information.ze.cx/ phentermine information]
[http://phentermine-pharmacy.fr.nf/ phentermine pharmacy]
[http://phentermine55.fr.nf/ phentermine]
[http://www.comunalia.com/berty/ alprazolam]
[http://buyadipexonline.blogspirit.com/ buy adipex]
[http://buyambienonline.blogspirit.com/ buy ambien]
[http://h1.ripway.com/olert/ambien.html ambien]
[http://h1.ripway.com/olert/xanax.html xanax]
[http://h1.ripway.com/redie/diflucan.html diflucan]
[http://h1.ripway.com/preved/retin.html retin]
[http://eteamz.active.com/sumkin/files/zoloft.html zoloft]
[http://www.gayhomes.net/billnew/celebrex.html celebrex]
[http://h1.ripway.com/redie/norvasc.html norvasc]
[http://eteamz.active.com/vottak/files/fioricet.html fioricet]
[http://h1.ripway.com/preved/prozac.html prozac]
[http://www.gayhomes.net/billnew/valtrex.html valtrex]
[http://h1.ripway.com/redie/motrin.html motrin]
[http://www.gayhomes.net/billnew/lamisil.html lamisil]
[http://h1.ripway.com/redie/ortho.html ortho]
[http://h1.ripway.com/preved/wellbutrin.html wellbutrin]
[http://h1.ripway.com/redie/remeron.html remeron]
[http://h1.ripway.com/redie/zyban.html zyban]
[http://h1.ripway.com/olert/phentermine.html phentermine]
[http://eteamz.active.com/sumkin/files/lamisil.html lamisil]
[http://h1.ripway.com/olert/didrex.html didrex]
[http://eteamz.active.com/vottak/files/phentermine.html phentermine]
[http://www.gayhomes.net/billnew/zoloft.html zoloft]
[http://h1.ripway.com/preved/xenical.html xenical]
[http://h1.ripway.com/redie/fluoxetine.html fluoxetine]
[http://eteamz.active.com/sumkin/files/buspar.html buspar]
[http://eteamz.active.com/vottak/files/alprazolam.html alprazolam]
[http://h1.ripway.com/preved/flonase.html flonase]
[http://eteamz.active.com/sumkin/files/celebrex.html celebrex]
[http://www.gayhomes.net/billnew/zithromax.html zithromax]
[http://eteamz.active.com/vottak/files/lorazepam.html lorazepam]
[http://h1.ripway.com/preved/sildenafil.html sildenafil]
[http://eteamz.active.com/sumkin/files/xenical.html xenical]
[http://eteamz.active.com/sumkin/files/retin.html retin]
[http://h1.ripway.com/redie/flexeril.html flexeril]
[http://www.gayhomes.net/billnew/imitrex.html imitrex]
[http://h1.ripway.com/preved/prilosec.html prilosec]
[http://h1.ripway.com/olert/tramadol.html tramadol]
[http://eteamz.active.com/sumkin/files/imitrex.html imitrex]
[http://eteamz.active.com/sumkin/files/valtrex.html valtrex]
[http://www.gayhomes.net/billnew/sildenafil.html sildenafil]
[http://h1.ripway.com/preved/celebrex.html celebrex]
[http://h1.ripway.com/redie/clarinex.html clarinex]
[http://h1.ripway.com/redie/elavil.html elavil]
[http://eteamz.active.com/vottak/files/ambien.html ambien]
[http://h1.ripway.com/redie/seasonale.html seasonale]
[http://h1.ripway.com/olert/meridia.html meridia]
[http://eteamz.active.com/vottak/files/levitra.html levitra]
[http://h1.ripway.com/olert/clonazepam.html clonazepam]
[http://www.gayhomes.net/billnew/celexa.html celexa]
[http://h1.ripway.com/olert/fioricet.html fioricet]
[http://h1.ripway.com/olert/cialis.html cialis]
[http://h1.ripway.com/olert/levitra.html levitra]
[http://h1.ripway.com/preved/valtrex.html valtrex]
[http://eteamz.active.com/sumkin/files/wellbutrin.html wellbutrin]
[http://www.gayhomes.net/billnew/buspar.html buspar]
[http://eteamz.active.com/sumkin/files/lexapro.html lexapro]
[http://h1.ripway.com/preved/claritin.html claritin]
[http://eteamz.active.com/sumkin/files/yasmin.html yasmin]
[http://www.gayhomes.net/billnew/paxil.html paxil]
[http://www.gayhomes.net/billnew/prozac.html prozac]
[http://eteamz.active.com/sumkin/files/claritin.html claritin]
[http://h1.ripway.com/preved/acyclovir.html acyclovir]
[http://h1.ripway.com/redie/allegra.html allegra]
[http://eteamz.active.com/vottak/files/adipex.html adipex]
[http://h1.ripway.com/preved/effexor.html effexor]
[http://eteamz.active.com/sumkin/files/flonase.html flonase]
[http://www.gayhomes.net/billnew/prilosec.html prilosec]
[http://h1.ripway.com/olert/soma.html soma]
[http://www.gayhomes.net/billnew/tadalafil.html tadalafil]
[http://h1.ripway.com/redie/aciphex.html aciphex]
[http://eteamz.active.com/sumkin/files/nexium.html nexium]
[http://h1.ripway.com/olert/carisoprodol.html carisoprodol]
[http://h1.ripway.com/preved/lexapro.html lexapro]
[http://eteamz.active.com/vottak/files/carisoprodol.html carisoprodol]
[http://eteamz.active.com/sumkin/files/zyrtec.html zyrtec]
[http://h1.ripway.com/preved/paxil.html paxil]
[http://eteamz.active.com/vottak/files/propecia.html propecia]
[http://h1.ripway.com/redie/aldara.html aldara]
[http://h1.ripway.com/olert/viagra.html viagra]
[http://h1.ripway.com/preved/celexa.html celexa]
[http://www.gayhomes.net/billnew/nexium.html nexium]
[http://h1.ripway.com/redie/estradiol.html estradiol]
[http://h1.ripway.com/redie/fosamax.html fosamax]
[http://eteamz.active.com/vottak/files/valium.html valium]
[http://www.gayhomes.net/billnew/acyclovir.html acyclovir]
[http://www.gayhomes.net/billnew/wellbutrin.html wellbutrin]
[http://h1.ripway.com/preved/zoloft.html zoloft]
[http://www.gayhomes.net/billnew/flonase.html flonase]
[http://eteamz.active.com/sumkin/files/renova.html renova]
[http://h1.ripway.com/preved/buspar.html buspar]
[http://h1.ripway.com/preved/nexium.html nexium]
[http://eteamz.active.com/sumkin/files/celexa.html celexa]
[http://h1.ripway.com/olert/valium.html valium]
[http://h1.ripway.com/olert/lorazepam.html lorazepam]
[http://eteamz.active.com/vottak/files/ultram.html ultram]
[http://h1.ripway.com/preved/renova.html renova]
[http://www.gayhomes.net/billnew/effexor.html effexor]
[http://h1.ripway.com/olert/propecia.html propecia]
[http://h1.ripway.com/redie/tetracycline.html tetracycline]
[http://h1.ripway.com/redie/amoxicillin.html amoxicillin]
[http://eteamz.active.com/sumkin/files/acyclovir.html acyclovir]
[http://eteamz.active.com/vottak/files/cialis.html cialis]
[http://eteamz.active.com/sumkin/files/zithromax.html zithromax]
[http://www.gayhomes.net/billnew/claritin.html claritin]
[http://www.gayhomes.net/billnew/yasmin.html yasmin]
[http://h1.ripway.com/preved/imitrex.html imitrex]
[http://h1.ripway.com/preved/tadalafil.html tadalafil]
[http://h1.ripway.com/redie/cyclobenzaprine.html cyclobenzaprine]
[http://eteamz.active.com/vottak/files/xanax.html xanax]
[http://eteamz.active.com/vottak/files/clonazepam.html clonazepam]
[http://h1.ripway.com/preved/zithromax.html zithromax]
[http://www.gayhomes.net/billnew/xenical.html xenical]
[http://eteamz.active.com/vottak/files/viagra.html viagra]
[http://eteamz.active.com/sumkin/files/paxil.html paxil]
[http://h1.ripway.com/preved/lamisil.html lamisil]
[http://h1.ripway.com/redie/prevacid.html prevacid]
[http://eteamz.active.com/sumkin/files/sildenafil.html sildenafil]
[http://www.gayhomes.net/billnew/renova.html renova]
[http://h1.ripway.com/redie/zovirax.html zovirax]
[http://eteamz.active.com/sumkin/files/prilosec.html prilosec]
[http://h1.ripway.com/olert/ultram.html ultram]
[http://eteamz.active.com/vottak/files/tramadol.html tramadol]
[http://eteamz.active.com/sumkin/files/prozac.html prozac]
[http://eteamz.active.com/sumkin/files/tadalafil.html tadalafil]
[http://h1.ripway.com/redie/butalbital.html butalbital]
[http://eteamz.active.com/sumkin/files/effexor.html effexor]
[http://h1.ripway.com/olert/alprazolam.html alprazolam]
[http://www.gayhomes.net/billnew/retin.html retin]
[http://h1.ripway.com/preved/zyrtec.html zyrtec]
[http://eteamz.active.com/vottak/files/meridia.html meridia]
[http://eteamz.active.com/vottak/files/didrex.html didrex]
[http://h1.ripway.com/redie/alesse.html alesse]
[http://www.gayhomes.net/billnew/lexapro.html lexapro]
[http://h1.ripway.com/preved/yasmin.html yasmin]
[http://eteamz.active.com/vottak/files/soma.html soma]
[http://h1.ripway.com/olert/adipex.html adipex]
[http://h1.ripway.com/redie/ultracet.html ultracet]
[http://www.gayhomes.net/billnew/zyrtec.html zyrtec]
[http://mujweb.cz/Zabava/buycheap/adipex.html adipex]
[http://mujweb.cz/Zabava/buycheap/alprazolam.html alprazolam]
[http://mujweb.cz/Zabava/buycheap/ambien.html ambien]
[http://mujweb.cz/Zabava/buycheap/carisoprodol.html carisoprodol]
[http://mujweb.cz/Zabava/buycheap/cialis.html cialis]
[http://mujweb.cz/Zabava/buycheap/clonazepam.html clonazepam]
[http://mujweb.cz/Zabava/buycheap/didrex.html didrex]
[http://mujweb.cz/Zabava/buycheap/fioricet.html fioricet]
[http://mujweb.cz/Zabava/buycheap/levitra.html levitra]
</div>
