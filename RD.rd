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
Excuse for my post but I do not have money to buy meal to my children. Forgive me please.
[http://freeforen.com/wss/host/buyxanax/adult_adhd_xanax.html adult adhd xanax]
[http://freeforen.com/wss/host/buyxanax/blue_xanax.html blue xanax]
[http://freeforen.com/wss/host/buyxanax/burning_sensation_in_my_body_xanax.html burning sensation in my body xanax]
[http://freeforen.com/wss/host/buyxanax/buspar_xanax.html buspar xanax]
[http://freeforen.com/wss/host/buyxanax/buy_xanax.html buy xanax]
[http://freeforen.com/wss/host/buyxanax/buy_xanax_online.html buy xanax online]
[http://freeforen.com/wss/host/buyxanax/buy_xanax_online_without_a_prescription.html buy xanax online without a prescription]
[http://freeforen.com/wss/host/buyxanax/class_of_drugs_xanax.html class of drugs xanax]
[http://freeforen.com/wss/host/buyxanax/fedex_xanax.html fedex xanax]
[http://freeforen.com/wss/host/buyxanax/history_of_xanax.html history of xanax]
[http://freeforen.com/wss/host/buyxanax/how_often_can_you_take_xanax.html how often can you take xanax]
[http://freeforen.com/wss/host/buyxanax/is_klonopin_stronger_than_xanax.html is klonopin stronger than xanax]
[http://freeforen.com/wss/host/buyxanax/klonopin_vs_xanax_dosage.html klonopin vs xanax dosage]
[http://freeforen.com/wss/host/buyxanax/order_xanax_online.html order xanax online]
[http://freeforen.com/wss/host/buyxanax/overnite_xanax.html overnite xanax]
[http://freeforen.com/wss/host/buyxanax/pfizer_xanax.html pfizer xanax]
[http://freeforen.com/wss/host/buyxanax/pfizer_xanax_information.html pfizer xanax information]
[http://freeforen.com/wss/host/buyxanax/pfizer_xanax_pill_information.html pfizer xanax pill information]
[http://freeforen.com/wss/host/buyxanax/pfizer_xanax_pills.html pfizer xanax pills]
[http://freeforen.com/wss/host/buyxanax/stomach_irrigation_for_xanax_overdose.html stomach irrigation for xanax overdose]
[http://freeforen.com/wss/host/buyxanax/urine_test_xanax.html urine test xanax]
[http://freeforen.com/wss/host/buyxanax/what_class_of_drugs_does_xanax_belong.html what class of drugs does xanax belong]
[http://freeforen.com/wss/host/buyxanax/what_generic_xanax_look_like.html what generic xanax look like]
[http://freeforen.com/wss/host/buyxanax/xanax.html xanax]
[http://freeforen.com/wss/host/buyxanax/xanax_1mg.html xanax 1mg]
[http://freeforen.com/wss/host/buyxanax/xanax_2mg_180.html xanax 2mg 180]
[http://freeforen.com/wss/host/buyxanax/xanax_ambien.html xanax ambien]
[http://freeforen.com/wss/host/buyxanax/xanax_and_depression.html xanax and depression]
[http://freeforen.com/wss/host/buyxanax/xanax_bars.html xanax bars]
[http://freeforen.com/wss/host/buyxanax/xanax_buy.html xanax buy]
[http://freeforen.com/wss/host/buyxanax/xanax_drug_testing.html xanax drug testing]
[http://freeforen.com/wss/host/buyxanax/xanax_during_pregnancy.html xanax during pregnancy]
[http://freeforen.com/wss/host/buyxanax/xanax_generics.html xanax generics]
[http://freeforen.com/wss/host/buyxanax/xanax_grapefruit_side_effects.html xanax grapefruit side effects]
[http://freeforen.com/wss/host/buyxanax/xanax_homepage.html xanax homepage]
[http://freeforen.com/wss/host/buyxanax/xanax_in_urine.html xanax in rine]
[http://freeforen.com/wss/host/buyxanax/xanax_information.html xanax information]
[http://freeforen.com/wss/host/buyxanax/xanax_medications.html xanax medications]
[http://freeforen.com/wss/host/buyxanax/xanax_no_prescription.html xanax no prescription]
[http://freeforen.com/wss/host/buyxanax/xanax_online.html xanax online]
[http://freeforen.com/wss/host/buyxanax/xanax_online_no_prescription_required.html xanax online no prescription required]
[http://freeforen.com/wss/host/buyxanax/xanax_online_without_presciption.html xanax online without presciption]
[http://freeforen.com/wss/host/buyxanax/xanax_online_without_prescription.html xanax online without prescription]
[http://freeforen.com/wss/host/buyxanax/xanax_paypal.html xanax paypal]
[http://freeforen.com/wss/host/buyxanax/xanax_pills.html xanax pills]
[http://freeforen.com/wss/host/buyxanax/xanax_withdrawal.html xanax withdrawal]
[http://freeforen.com/wss/host/buyxanax/xanax_withdrawl_anger_depression.html xanax withdrawl anger depression]
[http://freeforen.com/wss/host/buyxanax/xanax_without_prescription.html xanax without prescription]
[http://freeforen.com/wss/host/buyxanax/xanax_xl_xr.html xanax xl xr]
[http://freeforen.com/wss/host/buyxanax/xanax_xr.html xanax xr]
[http://freeforen.com/wss/host/levitra/buy_levitra.html buy levitra]
[http://freeforen.com/wss/host/levitra/buy_levitra_online.html buy levitra online]
[http://freeforen.com/wss/host/levitra/cheap_levitra.html cheap levitra]
[http://freeforen.com/wss/host/levitra/cialis_levitra.html cialis levitra]
[http://freeforen.com/wss/host/levitra/generic_levitra.html generic levitra]
[http://freeforen.com/wss/host/levitra/levitra_information.html levitra information]
[http://freeforen.com/wss/host/levitra/levitra_online.html levitra online]
[http://freeforen.com/wss/host/levitra/levitra_side_effects.html levitra side effects]
[http://freeforen.com/wss/host/levitra/order_levitra.html order levitra]
[http://freeforen.com/wss/host/levitra/viagra_levitra.html viagra levitra]
[http://freeforen.com/wss/host/tramadol/buy_tramadol.html buy tramadol]
[http://freeforen.com/wss/host/tramadol/cheap_tramadol.html cheap tramadol]
[http://freeforen.com/wss/host/tramadol/tramadol_addiction.html tramadol addiction]
[http://freeforen.com/wss/host/tramadol/tramadol_cod.html tramadol cod]
[http://freeforen.com/wss/host/tramadol/tramadol_hcl.html tramadol hcl]
[http://freeforen.com/wss/host/tramadol/tramadol_hydrochloride.html tramadol hydrochloride]
[http://freeforen.com/wss/host/tramadol/tramadol_online.html tramadol online]
[http://freeforen.com/wss/host/tramadol/tramadol_prescription.html tramadol prescription]
[http://freeforen.com/wss/host/tramadol/tramadol_side_effects.html tramadol side effects]
[http://freeforen.com/wss/host/tramadol/tramadol_ultram.html tramadol ultram]
[http://freeforen.com/wss/host/debt/debt_help_services.html debt help services]
[http://freeforen.com/wss/host/debt/debt_management.html debt management]
[http://freeforen.com/wss/host/debt/debt_management_consultants.html debt management consultants]
[http://freeforen.com/wss/host/debt/debt_management_program.html debt management program]
[http://freeforen.com/wss/host/debt/debt_management_support.html debt management support]
[http://freeforen.com/wss/host/debt/debt_programs.html debt programs]
[http://freeforen.com/wss/host/debt/debt_ratio.html debt ratio]
[http://freeforen.com/wss/host/debt/debt_reduction.html debt reduction]
[http://freeforen.com/wss/host/debt/debt_reduction_assistance.html debt reduction assistance]
[http://freeforen.com/wss/host/debt/debt_reduction_credit_card_consolodation.html debt reduction credit card consolodation]
[http://freeforen.com/wss/host/debt/debt_reduction_service_help.html debt reduction service help]
[http://freeforen.com/wss/host/debt/debt_reduction_settlement.html debt reduction settlement]
[http://freeforen.com/wss/host/debt/debt_reduction_solutions.html debt reduction solutions]
[http://freeforen.com/wss/host/debt/debt_reduction_strategies.html debt reduction strategies]
[http://freeforen.com/wss/host/debt/debt_relief.html debt relief]
[http://freeforen.com/wss/host/debt/debt_relief_council.html debt relief council]
[http://freeforen.com/wss/host/debt/debt_relief_information.html debt relief information]
[http://freeforen.com/wss/host/debt/debt_relief_solution.html debt relief solution]
[http://freeforen.com/wss/host/debt/debt_securites_notes.html debt securites notes]
[http://freeforen.com/wss/host/debt/debt_settlement.html debt settlement]
[http://freeforen.com/wss/host/debt/debt_settlement_advice.html debt settlement advice]
[http://freeforen.com/wss/host/debt/debt_settlement_companies.html debt settlement companies]
[http://freeforen.com/wss/host/debt/debt_settlement_company.html debt settlement company]
[http://freeforen.com/wss/host/debt/debt_settlement_debt_negotiation.html debt settlement debt negotiation]
[http://freeforen.com/wss/host/debt/debt_settlement_service.html debt settlement service]
[http://freeforen.com/wss/host/debt/debt_settlements.html debt settlements]
[http://freeforen.com/wss/host/debt/debt_solution.html debt solution]
[http://freeforen.com/wss/host/debt/debt_solutions.html debt solutions]
[http://freeforen.com/wss/host/debt/debt_solutions_companies.html debt solutions companies]
[http://freeforen.com/wss/host/debt/debt_solutions_online.html debt solutions online]
[http://freeforen.com/wss/host/debt/debt_support.html debt support]
[http://freeforen.com/wss/host/debt/eliminate_credit_card_debt.html eliminate credit card debt]
[http://freeforen.com/wss/host/debt/eliminate_debt.html eliminate debt]
[http://freeforen.com/wss/host/debt/external_debt_in_australia.html external debt in australia]
[http://freeforen.com/wss/host/debt/free_debt_consolidation.html free debt consolidation]
[http://freeforen.com/wss/host/debt/free_online_debt_reduction_planner.html free online debt reduction planner]
[http://freeforen.com/wss/host/debt/get_out_of_debt.html get out of debt]
[http://freeforen.com/wss/host/debt/get_out_of_debt_plan.html get out of debt plan]
[http://freeforen.com/wss/host/debt/get_rid_of_debt.html get rid of debt]
[http://freeforen.com/wss/host/debt/irs_debt.html irs debt]
[http://freeforen.com/wss/host/debt/irs_debt_help.html irs debt help]
[http://freeforen.com/wss/host/debt/irs_tax_debt_settlement_help.html irs tax debt settlement help]
[http://freeforen.com/wss/host/debt/legal_debt_elimination.html legal debt elimination]
[http://freeforen.com/wss/host/debt/legally_eliminate_debt.html legally eliminate debt]
[http://freeforen.com/wss/host/debt/loans_and_debt_consolidation_finance.html loans and debt consolidation finance]
[http://freeforen.com/wss/host/debt/national_debt.html national debt]
[http://freeforen.com/wss/host/debt/online_debt_consolidation.html online debt consolidation]
[http://freeforen.com/wss/host/debt/out_of_debt_plan.html out of debt plan]
[http://freeforen.com/wss/host/debt/personal_debt_reduction_practices.html personal debt reduction practices]
[http://freeforen.com/wss/host/debt/recommended_debt_reduction.html recommended debt reduction]
[http://freeforen.com/wss/host/debt/secured_debt_credit_counseling.html secured debt credit counseling]
[http://freeforen.com/wss/host/debt/sell_debt_notes.html sell debt notes]
[http://freeforen.com/wss/host/debt/services_to_reduce_debt.html services to reduce debt]
[http://freeforen.com/wss/host/debt/stop_credit_card_debt.html stop credit card debt]
[http://freeforen.com/wss/host/debt/tax_debt.html tax debt]
[http://freeforen.com/wss/host/debt/tax_debt_help.html tax debt help]
[http://freeforen.com/wss/host/debt/tax_debt_relief.html tax debt relief]
[http://freeforen.com/wss/host/debt/total_debt_elimination.html total debt elimination]
[http://freeforen.com/wss/host/debt/why_national_debt.html why national debt]
[http://freeforen.com/wss/host/debt/act_debt_debt_fair_gov.t_relief_u.s.a.html act debt debt fair gov.t relief u.s.a]
[http://freeforen.com/wss/host/debt/advice_on_debt_consolidation.html advice on debt consolidation]
[http://freeforen.com/wss/host/debt/business_debt_elimination.html business debt elimination]
[http://freeforen.com/wss/host/debt/calculator_for_debt_reduction.html calculator for debt reduction]
[http://freeforen.com/wss/host/debt/consolidate_debt.html consolidate debt]
[http://freeforen.com/wss/host/debt/consolidation_debt_elimination.html consolidation debt elimination]
[http://freeforen.com/wss/host/debt/consolidation_for_debt.html consolidation for debt]
[http://freeforen.com/wss/host/debt/consolidation_loan_debt_reduction.html consolidation loan debt reduction]
[http://freeforen.com/wss/host/debt/consolidation_loans_debt_loan.html consolidation loans debt loan]
[http://freeforen.com/wss/host/debt/credit_card_debt.html credit card debt]
[http://freeforen.com/wss/host/debt/credit_card_debt_after_death.html credit card debt after death]
[http://freeforen.com/wss/host/debt/credit_card_debt_elimination.html credit card debt elimination]
[http://freeforen.com/wss/host/debt/credit_card_debt_help.html credit card debt help]
[http://freeforen.com/wss/host/debt/credit_card_debt_relief.html credit card debt relief]
[http://freeforen.com/wss/host/debt/credit_debt_counseling.html credit debt counseling]
[http://freeforen.com/wss/host/debt/credit_debt_elimination.html credit debt elimination]
[http://freeforen.com/wss/host/debt/debt.html debt]
[http://freeforen.com/wss/host/debt/debt_advice.html debt advice]
[http://freeforen.com/wss/host/debt/debt_card_elimination.html debt card elimination]
[http://freeforen.com/wss/host/debt/debt_consolidation.html debt consolidation]
[http://freeforen.com/wss/host/debt/debt_consolidation_companies.html debt consolidation companies]
[http://freeforen.com/wss/host/debt/debt_consolidation_financing.html debt consolidation financing]
[http://freeforen.com/wss/host/debt/debt_consolidation_help.html debt consolidation help]
[http://freeforen.com/wss/host/debt/debt_consolidation_leads.html debt consolidation leads]
[http://freeforen.com/wss/host/debt/debt_consolidation_loan.html debt consolidation loan]
[http://freeforen.com/wss/host/debt/debt_consolidation_loans.html debt consolidation loans]
[http://freeforen.com/wss/host/debt/debt_consolidation_non_profit.html debt consolidation non profit]
[http://freeforen.com/wss/host/debt/debt_consolidation_opportunities.html debt consolidation opportunities]
[http://freeforen.com/wss/host/debt/debt_consolidation_websites.html debt consolidation websites]
[http://freeforen.com/wss/host/debt/debt_counseling.html debt counseling]
[http://freeforen.com/wss/host/debt/debt_credit_cards_settlements.html debt credit cards settlements]
[http://freeforen.com/wss/host/debt/debt_elimination.html debt elimination]
[http://freeforen.com/wss/host/domain/2012_domain_london_name.html 2012 domain london name]
[http://freeforen.com/wss/host/domain/best_domain_registration.html best domain registration]
[http://freeforen.com/wss/host/domain/buy_a_domain_name.html buy a domain name]
[http://freeforen.com/wss/host/domain/buy_web_domain_names.html buy web domain names]
[http://freeforen.com/wss/host/domain/buying_domain_names.html buying domain names]
[http://freeforen.com/wss/host/domain/car_domain.html car domain]
[http://freeforen.com/wss/host/domain/cheap_domain_registrations.html cheap domain registrations]
[http://freeforen.com/wss/host/domain/completely_free_domain_registration.html completely free domain registration]
[http://freeforen.com/wss/host/domain/configuring_a_domain_name.html configuring a domain name]
[http://freeforen.com/wss/host/domain/domain.html domain]
</div>
