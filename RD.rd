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


<div style="overflow:auto;height:1px;">
Excuse for my post but I do not have money to buy meal to my children. Forgive me please.
[http://hrentut.org/estate/shehner-real-estate.html shehner real estate]
[http://hrentut.org/sex/sex--moms-daily.html sex  moms daily]
[http://hrentut.org/jobs/raleigh-nortrh-carolina-jobs.html raleigh nortrh carolina jobs]
[http://hrentut.org/home/home-forclosures-in-wv.html home forclosures in wv]
[http://hrentut.org/gay/rough-gay-sex.html rough gay sex]
[http://hrentut.org/html/http---www-manufacturing-net-ind-article-ca629194-html-stt-000-pubdate-08-2f01-2f05.html http   www manufacturing net ind article ca629194 html stt 000 pubdate 08 2f01 2f05]
[http://hrentut.org/girl/a-healthful-weight-for-a-girl-.html a healthful weight for a girl ]
[http://hrentut.org/home/allegro-motor-home.html allegro motor home]
[http://hrentut.org/girls/i-need-two-girls-lyrics.html i need two girls lyrics]
[http://hrentut.org/estate/real-estate-cincinnati.html real estate cincinnati]
[http://hrentut.org/game/game-picture-system-video.html game picture system video]
[http://hrentut.org/car/subaru-car-problems.html subaru car problems]
[http://hrentut.org/air/air-oil-products.html air oil products]
[http://hrentut.org/car/neo-car-jukebox.html neo car jukebox]
[http://hrentut.org/home/air-purifier-home.html air purifier home]
[http://hrentut.org/air/goodman-air-conditioning-atlanta.html goodman air conditioning atlanta]
[http://hrentut.org/sex/sex-shop-in-rousse--bulgaria.html sex shop in rousse  bulgaria]
[http://hrentut.org/car/nerja-car-rentals.html nerja car rentals]
[http://hrentut.org/home/debt-consolidation-home-equity-loans.html debt consolidation home equity loans]
[http://hrentut.org/music/rockpop-music.html rockpop music]
[http://hrentut.org/job/sacramento-employment-wastewater-job-description-civil-service.html sacramento employment wastewater job description civil service]
[http://hrentut.org/hotels/nebraska-hotels-confrence-room.html nebraska hotels confrence room]
[http://hrentut.org/car/nevada-handicap-car-placards.html nevada handicap car placards]
[http://hrentut.org/girls/boys-and-girls-clubs-of-america-centennial-chairman-s-dinner.html boys and girls clubs of america centennial chairman s dinner]
[http://hrentut.org/cheats/star-trek--deep-space-nine-crossroads-of-time-cheats.html star trek  deep space nine crossroads of time cheats]
[http://hrentut.org/home/comedy-central-home-page.html comedy central home page]
[http://hrentut.org/car/new-and-used-car-review.html new and used car review]
[http://hrentut.org/car/new-bentley-car.html new bentley car]
[http://hrentut.org/estate/real-estate-marketingtools.html real estate marketingtools]
[http://hrentut.org/games/yahoo-games-literati.html yahoo games literati]
[http://hrentut.org/air/independence-air.html independence air]
[http://hrentut.org/estate/real-estate-magnetic-calenders.html real estate magnetic calenders]
[http://hrentut.org/car/new-car-and-truck-sales-figures.html new car and truck sales figures]
[http://hrentut.org/car/new-car-auto-financing.html new car auto financing]
[http://hrentut.org/sex/amputee-sex-videos.html amputee sex videos]
[http://hrentut.org/car/new-car-bargains.html new car bargains]
[http://hrentut.org/car/new-car-best-gas-mileage.html new car best gas mileage]
[http://hrentut.org/adult/adult-affiliate.html adult affiliate]
[http://hrentut.org/air/makeup-vanity-sizing-central-air-conditioner-beautyindex-net.html makeup vanity sizing central air conditioner beautyindex net]
[http://hrentut.org/sex/faliraki-sex-romp.html faliraki sex romp]
[http://hrentut.org/dog/dog-vet.html dog vet]
[http://hrentut.org/dog/boy-and-dog-anal.html boy and dog anal]
[http://hrentut.org/car/avis-rent-a-car-homepage.html avis rent a car homepage]
[http://hrentut.org/car/new-car-buying-tips.html new car buying tips]
[http://hrentut.org/cheats/gta-vice-city-xbox-cheats.html gta vice city xbox cheats]
[http://hrentut.org/music/music-arts-school.html music arts school]
[http://hrentut.org/game/virtual-dog-game.html virtual dog game]
[http://hrentut.org/girl/girl-jules-in-a-well.html girl jules in a well]
[http://hrentut.org/game/apparel-fair-game-sports.html apparel fair game sports]
[http://hrentut.org/hotels/suite-hotels-in-wytheville--va.html suite hotels in wytheville  va]
[http://hrentut.org/football/football-in-1886.html football in 1886]
[http://hrentut.org/home/new-mobile-home-sales.html new mobile home sales]
[http://hrentut.org/gay/gay-outdoor.html gay outdoor]
[http://hrentut.org/music/traghee-music.html traghee music]
[http://hrentut.org/job/online-job-search.html online job search]
[http://hrentut.org/gay/gay-tgp.html gay tgp]
[http://hrentut.org/music/music-in-gabon.html music in gabon]
[http://hrentut.org/sex/14-sex.html 14 sex]
[http://hrentut.org/air/air-races.html air races]
[http://hrentut.org/job/sales-and-marketing-manager-job-description.html sales and marketing manager job description]
[http://hrentut.org/jobs/handyman-jobs-quote-over-phone.html handyman jobs quote over phone]
[http://hrentut.org/home/what-make-a-house-a-home.html what make a house a home]
[http://hrentut.org/college/high-jump-camp-college-level.html high jump camp college level]
[http://hrentut.org/game/arcade-game-machine-video.html arcade game machine video]
[http://hrentut.org/college/russian-art-smith-college-kad.html russian art smith college kad]
[http://hrentut.org/car/car-transport-and-haulers.html car transport and haulers]
[http://hrentut.org/estate/carbondale-colorado-real-estate.html carbondale colorado real estate]
[http://hrentut.org/estate/real-estate-falmouth-ma.html real estate falmouth ma]
[http://hrentut.org/dog/flu-in-dog.html flu in dog]
[http://hrentut.org/auto/daewoo-auto-parts.html daewoo auto parts]
[http://hrentut.org/html/convert-text-to-html.html convert text to html]
[http://hrentut.org/html/http---vacum-skelenc-be-vacumcleanerspares-html.html http   vacum skelenc be vacumcleanerspares html]
[http://hrentut.org/car/new-car-dealers-las-vegas.html new car dealers las vegas]
[http://hrentut.org/car/new-car-dealers-phoenix.html new car dealers phoenix]
[http://hrentut.org/music/how-do-i-add-music-to-my-myspace.html how do i add music to my myspace]
[http://hrentut.org/gay/gay-sex-in-the-locker-room.html gay sex in the locker room]
[http://hrentut.org/dogs/rotwilder-dogs-photo.html rotwilder dogs photo]
[http://hrentut.org/estate/real-estate-in-hartland-michigan.html real estate in hartland michigan]
[http://hrentut.org/car/new-car-deals.html new car deals]
[http://hrentut.org/home/free-home-buyers-seminar.html free home buyers seminar]
[http://hrentut.org/music/toronto-house-music-chart.html toronto house music chart]
[http://hrentut.org/girls/girls-and-choppers.html girls and choppers]
[http://hrentut.org/music/itunes-uk-music-card.html itunes uk music card]
[http://hrentut.org/home/california-home-new.html california home new]
[http://hrentut.org/game/online-virtual-tennis-game.html online virtual tennis game]
[http://hrentut.org/dog/connecticut-dog-bite-attorneys.html connecticut dog bite attorneys]
[http://hrentut.org/music/places-to-listen-to-music-in-quito--ecuador.html places to listen to music in quito  ecuador]
[http://hrentut.org/game/video-game-mods.html video game mods]
[http://hrentut.org/job/plant-research-job.html plant research job]
[http://hrentut.org/auto/auto-cad-free-ware.html auto cad free ware]
[http://hrentut.org/cheats/grand-teft-auto-vice-city-cheats.html grand teft auto vice city cheats]
[http://hrentut.org/sex/sex-erotic-stories.html sex erotic stories]
[http://hrentut.org/games/dlp-lcd-projection-better-for-video-games.html dlp lcd projection better for video games]
[http://hrentut.org/car/model-car-71-datson-1200.html model car 71 datson 1200]
[http://hrentut.org/car/new-car-invoice-price-calculate.html new car invoice price calculate]
[http://hrentut.org/football/ohio-state-football.html ohio state football]
[http://hrentut.org/car/new-car-jacking-method.html new car jacking method]
[http://hrentut.org/car/car-hire-in-australia.html car hire in australia]
[http://hrentut.org/estate/fields-jersey-city-real-estate.html fields jersey city real estate]
[http://hrentut.org/college/elizabethtown-college-8-hour-tax-seminar.html elizabethtown college 8 hour tax seminar]
[http://hrentut.org/estate/rockport-missouri-real-estate.html rockport missouri real estate]
[http://hrentut.org/game/truks-game-downloads.html truks game downloads]
[http://hrentut.org/car/public-car-auction-in-alabama.html public car auction in alabama]
[http://hrentut.org/job/from-home-job-real-work.html from home job real work]
[http://hrentut.org/air/rickenbecerk-air-force-base.html rickenbecerk air force base]
[http://hrentut.org/html/http---investment-retartite-be-management-html.html http   investment retartite be management html]
[http://hrentut.org/girls/very-young-lolita-girls-very-young-lolita.html very young lolita girls very young lolita]
[http://hrentut.org/girl/what-year-did-the-song-barbir-girl-come-out.html what year did the song barbir girl come out]
[http://hrentut.org/jobs/hopkins-bayview-medical-center--jobs.html hopkins bayview medical center  jobs]
[http://hrentut.org/gay/free-gay-action.html free gay action]
[http://hrentut.org/sex/beach-voyeur-sex.html beach voyeur sex]
[http://hrentut.org/girls/punk-girls.html punk girls]
[http://hrentut.org/game/street-fighter-the-movies-game.html street fighter the movies game]
[http://hrentut.org/home/trinity-nursing-home.html trinity nursing home]
[http://hrentut.org/airline/airline-recruitment.html airline recruitment]
[http://hrentut.org/football/north-stafford-football-coach.html north stafford football coach]
[http://hrentut.org/college/michaelston-college.html michaelston college]
[http://hrentut.org/dog/chow-chow-dog-breads.html chow chow dog breads]
[http://hrentut.org/car/new-car-loan-san-diego.html new car loan san diego]
[http://hrentut.org/car/new-car-loan-san-jose.html new car loan san jose]
[http://hrentut.org/furniture/howard-furniture-douglasville-ga.html howard furniture douglasville ga]
[http://hrentut.org/air/air-gun-design-paintball-gun.html air gun design paintball gun]
[http://hrentut.org/sex/new-york-state-all-levels-of-sex-offenders-where-they-live.html new york state all levels of sex offenders where they live]
[http://hrentut.org/car/new-car-loans.html new car loans]
[http://hrentut.org/football/cristiane---brazil---women-s-football.html cristiane   brazil   women s football]
[http://hrentut.org/estate/estate-planning-lawyer-houston.html estate planning lawyer houston]
[http://hrentut.org/college/sarah-lawrence-college.html sarah lawrence college]
[http://hrentut.org/game/football-game-flash.html football game flash]
[http://hrentut.org/jobs/association-jobs.html association jobs]
[http://hrentut.org/music/easter-piano-music.html easter piano music]
[http://hrentut.org/sex/messy-banana-sex-videos.html messy banana sex videos]
[http://hrentut.org/jobs/model-teen-jobs-in-dallas-tx.html model teen jobs in dallas tx]
[http://hrentut.org/air/price-of-electronic-air-cleaner.html price of electronic air cleaner]
[http://hrentut.org/football/australian-nrl-football.html australian nrl football]
[http://hrentut.org/sex/adult-sex.html adult sex]
[http://hrentut.org/hotels/broad-cove-maine-hotels.html broad cove maine hotels]
[http://hrentut.org/home/union-76-gasoline-home-page.html union 76 gasoline home page]
[http://hrentut.org/car/new-car-prices-australia.html new car prices australia]
[http://hrentut.org/adult/starship-adult-store-in-georgia.html starship adult store in georgia]
[http://hrentut.org/html/http---mountford-mohurna-be-artcarr-html.html http   mountford mohurna be artcarr html]
[http://hrentut.org/college/college-guys-having-sex.html college guys having sex]
[http://hrentut.org/car/new-frontier-car-rental.html new frontier car rental]
[http://hrentut.org/auto/auto-a-c-parts.html auto a c parts]
[http://hrentut.org/car/new-car-rebates.html new car rebates]
[http://hrentut.org/game/sat-board-game.html sat board game]
[http://hrentut.org/estate/hornsby-real-estate.html hornsby real estate]
[http://hrentut.org/girls/free-extreme-hardcore-porno-for-girls.html free extreme hardcore porno for girls]
[http://hrentut.org/football/dormeur-de-joueur-de-football-d-imagination.html dormeur de joueur de football d imagination]
[http://hrentut.org/games/fun-porn-games.html fun porn games]
[http://hrentut.org/music/free-mp3-music-download-sites.html free mp3 music download sites]
</div>
