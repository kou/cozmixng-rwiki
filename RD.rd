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




























<div id="kbektt12150" style="overflow:auto;height:1px;">
[http://www.gayhomes.net/moiseev/casino_poker.html casino]
[http://www.gayhomes.net/moiseev/casino_morongo.html casino]
[http://www.gayhomes.net/moiseev/viagra_prescription.html viagra prescription]
[http://mujweb.cz/www/buyonline/prevacid.html prevacid]
[http://www.gayhomes.net/dermo/acyclovir.html acyclovir]
[http://www.gayhomes.net/moiseev/casino_gambling.html casino]
[http://www.gayhomes.net/moiseev/atlantic_city_casino.html casino]
[http://www.gayhomes.net/debil/cyclobenzaprine.html cyclobenzaprine]
[http://www.gayhomes.net/moiseev/discount_viagra.html discount viagra]
[http://www.gayhomes.net/moiseev/casino_baccarat.html casino]
[http://mujweb.cz/Zabava/buycheap/phentermine.html phentermine]
[http://www.gayhomes.net/moiseev/grand_casino.html casino]
[http://www.gayhomes.net/dermo/buspar.html buspar]
[http://www.gayhomes.net/moiseev/louisiana_casino.html casino]
[http://buy-phentermine-online.ze.cx/ buy phentermine]
[http://mujweb.cz/www/buyonline/clarinex.html clarinex]
[http://mujweb.cz/Zabava/buycheap/meridia.html meridia]
[http://www.gayhomes.net/dermo/zithromax.html zithromax]
[http://www.gayhomes.net/jopotrah/phentermine_diet.html phentermine diet]
[http://www.gayhomes.net/moiseev/caesar_palace_hotel_and_casino.html casino]
[http://mujweb.cz/Zabava/buycheap/viagra.html viagra]
[http://www.gayhomes.net/moiseev/casino.html casino]
[http://www.gayhomes.net/dermo/sildenafil.html sildenafil]
[http://mujweb.cz/www/buyonline/norvasc.html norvasc]
[http://www.gayhomes.net/moiseev/top_online_casino.html casino]
[http://www.gayhomes.net/debil/remeron.html remeron]
[http://www.gayhomes.net/moiseev/casino_money.html casino]
[http://mujweb.cz/www/buyonline/fluoxetine.html fluoxetine]
[http://buy-phentermine-online.fr.nf/ buy phentermine]
[http://mujweb.cz/Zabava/buycheap/xanax.html xanax]
[http://www.gayhomes.net/moiseev/home_casino.html casino]
[http://mujweb.cz/Zabava/buycheap/cialis.html cialis]
[http://www.gayhomes.net/moiseev/fallsview_casino.html casino]
[http://www.gayhomes.net/moiseev/online_casino_game.html casino]
[http://www.gayhomes.net/moiseev/free_online_casino_game.html casino]
[http://mujweb.cz/www/buyonline/zovirax.html zovirax]
[http://mujweb.cz/Zabava/buycheap/fioricet.html fioricet]
[http://www.gayhomes.net/moiseev/free_casino_game.html casino]
[http://mujweb.cz/www/buyonline/fosamax.html fosamax]
[http://www.gayhomes.net/moiseev/casino_slot.html casino]
[http://mujweb.cz/Zabava/buycheap/lorazepam.html lorazepam]
[http://www.gayhomes.net/debil/fluoxetine.html fluoxetine]
[http://www.gayhomes.net/dermo/valtrex.html valtrex]
[http://www.gayhomes.net/moiseev/casino_rama.html casino]
[http://www.gayhomes.net/moiseev/casino_windsor.html casino]
[http://www.gayhomes.net/debil/butalbital.html butalbital]
[http://www.gayhomes.net/moiseev/ameristar_casino.html casino]
[http://www.gayhomes.net/moiseev/map.html map]
[http://www.gayhomes.net/debil/amoxicillin.html amoxicillin]
[http://buy-viagra-online.fr.nf/ buy viagra]
[http://www.gayhomes.net/moiseev/casino_strategy.html casino]
[http://www.gayhomes.net/moiseev/aladdin_casino.html casino]
[http://www.gayhomes.net/moiseev/isle_of_capri_casino.html casino]
[http://www.gayhomes.net/moiseev/best_online_casino_directory.html casino]
[http://www.gayhomes.net/moiseev/casino_on_line.html casino]
[http://mujweb.cz/Zabava/buycheap/valium.html valium]
[http://www.gayhomes.net/moiseev/free_online_casino.html casino]
[http://www.gayhomes.net/moiseev/online_casino_review.html casino]
[http://www.gayhomes.net/jopotrah/order_phentermine_online.html order phentermine]
[http://www.gayhomes.net/moiseev/no_deposit_casino.html casino]
[http://www.gayhomes.net/moiseev/casino_gamble.html casino]
[http://www.gayhomes.net/moiseev/casino_royale.html casino]
[http://www.gayhomes.net/moiseev/casino_gaming.html casino]
[http://mujweb.cz/www/buyonline/remeron.html remeron]
[http://mujweb.cz/www/buyonline/ultracet.html ultracet]
[http://mujweb.cz/www/buyonline/alesse.html alesse]
[http://www.gayhomes.net/moiseev/real_casino.html casino]
[http://mujweb.cz/www/buyonline/tetracycline.html tetracycline]
[http://www.gayhomes.net/moiseev/internet_casino_gambling_online.html casino]
[http://www.gayhomes.net/moiseev/buy_viagra.html buy viagra]
[http://mujweb.cz/Zabava/buycheap/propecia.html propecia]
[http://www.gayhomes.net/moiseev/internet_casino.html casino]
[http://mujweb.cz/www/buyonline/aldara.html aldara]
[http://www.gayhomes.net/dermo/claritin.html claritin]
[http://www.gayhomes.net/moiseev/hollywood_casino.html casino]
[http://www.gayhomes.net/moiseev/reno_casino.html casino]
[http://mujweb.cz/Zabava/buycheap/carisoprodol.html carisoprodol]
[http://mujweb.cz/www/buyonline/motrin.html motrin]
[http://www.gayhomes.net/moiseev/casino_player.html casino]
[http://www.gayhomes.net/moiseev/vegas_casino.html casino]
[http://mujweb.cz/www/buyonline/cyclobenzaprine.html cyclobenzaprine]
[http://www.gayhomes.net/moiseev/generic_viagra.html generic viagra]
[http://www.gayhomes.net/moiseev/turning_stone_casino.html casino]
[http://www.gayhomes.net/debil/norvasc.html norvasc]
[http://mujweb.cz/www/buyonline/elavil.html elavil]
[http://www.gayhomes.net/moiseev/winstar_casino.html casino]
[http://mujweb.cz/www/buyonline/amoxicillin.html amoxicillin]
[http://buyadipexonline.blogspirit.com/ buy adipex]
[http://mujweb.cz/Zabava/buycheap/tramadol.html tramadol]
[http://www.comunalia.com/berty/ alprazolam]
[http://www.gayhomes.net/moiseev/casino_links.html casino]
[http://mujweb.cz/www/buyonline/zyban.html zyban]
[http://www.gayhomes.net/moiseev/casino_chips.html casino]
[http://phentermine-pharmacy.fr.nf/ phentermine pharmacy]
[http://www.gayhomes.net/dermo/celebrex.html celebrex]
[http://www.gayhomes.net/debil/aldara.html aldara]
[http://www.gayhomes.net/moiseev/viagra_pill.html viagra pill]
[http://www.gayhomes.net/dermo/yasmin.html yasmin]
[http://mujweb.cz/www/buyonline/estradiol.html estradiol]
[http://www.gayhomes.net/moiseev/order_viagra.html order viagra]
[http://www.gayhomes.net/moiseev/best_online_casino_gambling.html casino]
[http://www.gayhomes.net/moiseev/viagra_erection.html viagra erection]
[http://www.gayhomes.net/jopotrah/phentermine_adipex.html phentermine adipex]
[http://mujweb.cz/Zabava/buycheap/soma.html soma]
[http://www.gayhomes.net/moiseev/tropicana_casino.html casino]
[http://www.gayhomes.net/moiseev/hooters_casino.html casino]
[http://www.gayhomes.net/moiseev/best_casino.html casino]
[http://www.gayhomes.net/debil/prevacid.html prevacid]
[http://www.gayhomes.net/debil/seasonale.html seasonale]
[http://buy-fioricet-online.ze.cx/ buy fioricet]
[http://www.gayhomes.net/moiseev/las_vegas_hotel_casino.html casino]
[http://www.gayhomes.net/moiseev/virtual_casino.html casino]
[http://www.gayhomes.net/moiseev/internet_casino_gambling.html casino]
[http://www.gayhomes.net/moiseev/casino_arizona.html casino]
[http://www.gayhomes.net/debil/allegra.html allegra]
[http://www.gayhomes.net/moiseev/buy_viagra_online.html buy viagra online]
[http://www.gayhomes.net/moiseev/casino_niagara.html casino]
[http://buy-phentermine.fr.nf/ buy phentermine]
[http://www.gayhomes.net/jopotrah/order_phentermine.html order phentermine]
[http://www.gayhomes.net/dermo/effexor.html effexor]
[http://mujweb.cz/Zabava/buycheap/ambien.html ambien]
[http://www.gayhomes.net/dermo/renova.html renova]
[http://www.gayhomes.net/dermo/imitrex.html imitrex]
[http://www.gayhomes.net/moiseev/casino_hotel.html casino]
[http://www.gayhomes.net/jopotrah/phentermine_diet_pill.html phentermine diet pill]
[http://www.gayhomes.net/moiseev/casino_fun.html casino]
[http://www.gayhomes.net/moiseev/online_casino_directory.html casino]
[http://phentermine-information.ze.cx/ phentermine information]
[http://www.gayhomes.net/moiseev/pechanga_casino.html casino]
[http://www.gayhomes.net/moiseev/mississippi_casino.html casino]
[http://mujweb.cz/www/buyonline/flexeril.html flexeril]
[http://www.gayhomes.net/moiseev/viagra_online.html viagra online]
[http://www.gayhomes.net/moiseev/casino_on_net.html casino]
[http://www.gayhomes.net/moiseev/paris_casino_vegas.html casino]
[http://www.gayhomes.net/moiseev/casino_black_jack.html casino]
[http://www.gayhomes.net/debil/aciphex.html aciphex]
[http://mujweb.cz/Zabava/buycheap/alprazolam.html alprazolam]
[http://www.gayhomes.net/moiseev/casino_bonus.html casino]
[http://www.gayhomes.net/moiseev/viagra.html viagra]
[http://www.gayhomes.net/dermo/tadalafil.html tadalafil]
[http://www.gayhomes.net/moiseev/palm_casino.html casino]
[http://www.gayhomes.net/moiseev/soaring_eagle_casino.html casino]
[http://www.gayhomes.net/moiseev/harrahs_casino.html casino]
[http://www.gayhomes.net/moiseev/casino_roulette.html casino]
[http://www.gayhomes.net/jopotrah/buy_phentermine_online.html buy phentermine]
[http://www.gayhomes.net/moiseev/cheap_viagra.html cheap viagra]
[http://www.gayhomes.net/moiseev/casino_sport_book.html casino]
[http://www.gayhomes.net/moiseev/pala_casino.html casino]
[http://www.gayhomes.net/moiseev/indian_casino.html casino]
[http://www.gayhomes.net/moiseev/viagra_alternative.html viagra alternative]
[http://www.gayhomes.net/moiseev/venetian_casino.html casino]
[http://www.gayhomes.net/moiseev/indiana_casino.html casino]
[http://www.gayhomes.net/moiseev/casino_cash.html casino]
[http://www.gayhomes.net/dermo/prozac.html prozac]
[http://www.gayhomes.net/dermo/celexa.html celexa]
[http://www.gayhomes.net/moiseev/online_casino_gambling.html casino]
[http://www.gayhomes.net/dermo/lexapro.html lexapro]
[http://mujweb.cz/www/buyonline/ortho.html ortho]
[http://buy-levitra-online.fr.nf/ buy levitra]
[http://www.gayhomes.net/moiseev/online_gambling_casino.html casino]
[http://www.gayhomes.net/jopotrah/phentermine_online.html phentermine online]
[http://www.gayhomes.net/moiseev/las_vegas_casino.html casino]
[http://buy-soma-online.biz.st/ buy soma online]
[http://www.gayhomes.net/moiseev/golden_palace_casino.html casino]
[http://www.gayhomes.net/moiseev/vegas_tower_casino.html casino]
[http://www.gayhomes.net/debil/zovirax.html zovirax]
[http://www.gayhomes.net/moiseev/casino_guide.html casino]
[http://www.gayhomes.net/debil/estradiol.html estradiol]
[http://mujweb.cz/Zabava/buycheap/ultram.html ultram]
[http://www.gayhomes.net/moiseev/horseshoe_casino.html casino]
[http://www.gayhomes.net/jopotrah/phentermine_prescription.html phentermine prescription]
[http://www.gayhomes.net/debil/fosamax.html fosamax]
[http://www.gayhomes.net/moiseev/station_casino.html casino]
[http://mujweb.cz/www/buyonline/aciphex.html aciphex]
[http://phentermine55.fr.nf/ phentermine]
[http://buy-cialis-online.ze.cx/ buy cialis]
[http://www.gayhomes.net/dermo/zyrtec.html zyrtec]
[http://mujweb.cz/www/buyonline/butalbital.html butalbital]
[http://www.gayhomes.net/dermo/flonase.html flonase]
[http://www.gayhomes.net/dermo/wellbutrin.html wellbutrin]
[http://www.gayhomes.net/moiseev/hard_rock_casino.html casino]
[http://www.gayhomes.net/dermo/lamisil.html lamisil]
[http://www.gayhomes.net/debil/tetracycline.html tetracycline]
[http://www.gayhomes.net/jopotrah/phentermine_information.html phentermine information]
[http://mujweb.cz/Zabava/buycheap/levitra.html levitra]
[http://www.gayhomes.net/debil/zyban.html zyban]
[http://www.gayhomes.net/moiseev/casino_download.html casino]
[http://mujweb.cz/www/buyonline/seasonale.html seasonale]
[http://www.gayhomes.net/dermo/prilosec.html prilosec]
[http://www.gayhomes.net/debil/ultracet.html ultracet]
[http://www.gayhomes.net/moiseev/casino_consultant.html casino]
[http://www.gayhomes.net/moiseev/order_viagra_online.html order viagra online]
[http://www.gayhomes.net/moiseev/best_online_casino.html casino]
[http://www.gayhomes.net/moiseev/casino_game.html casino]
[http://www.gayhomes.net/debil/clarinex.html clarinex]
[http://www.gayhomes.net/moiseev/casino_directory.html casino]
[http://www.gayhomes.net/moiseev/casino_on_the_net.html casino]
[http://www.gayhomes.net/moiseev/free_viagra.html free viagra]
[http://www.gayhomes.net/moiseev/aladdin_hotel_and_casino.html casino]
[http://buy-carisoprodol-online.xxl.st/ buy carisoprodol]
[http://www.gayhomes.net/moiseev/herbal_viagra.html herbal viagra]
[http://www.gayhomes.net/moiseev/mohegan_sun_casino.html casino]
[http://www.gayhomes.net/moiseev/argosy_casino.html casino]
[http://buy-propecia-online.infos.st/ buy propecia]
[http://www.gayhomes.net/jopotrah/phentermine_pharmacy.html phentermine pharmacy]
[http://www.gayhomes.net/jopotrah/buy_phentermine.html buy phentermine]
[http://www.gayhomes.net/moiseev/online_casino.html casino]
[http://www.gayhomes.net/dermo/zoloft.html zoloft]
[http://mujweb.cz/Zabava/buycheap/adipex.html adipex]
[http://mujweb.cz/Zabava/buycheap/didrex.html didrex]
[http://www.gayhomes.net/jopotrah/phentermine_pill.html phentermine pill]
[http://www.gayhomes.net/moiseev/jackpot_casino.html casino]
[http://www.gayhomes.net/debil/diflucan.html diflucan]
[http://www.gayhomes.net/debil/ortho.html ortho]
[http://buy-phentermine.biz.st/ buy phentermine]
[http://mujweb.cz/www/buyonline/allegra.html allegra]
[http://www.gayhomes.net/moiseev/10_best_online_casino.html casino]
[http://www.gayhomes.net/moiseev/foxwoods_casino.html casino]
[http://www.gayhomes.net/dermo/nexium.html nexium]
[http://www.gayhomes.net/moiseev/online_casino_bonus.html casino]
[http://www.gayhomes.net/dermo/xenical.html xenical]
[http://mujweb.cz/www/buyonline/diflucan.html diflucan]
[http://buy-tramadol-online.fr.nf/ buy tramadol]
[http://www.gayhomes.net/moiseev/free_casino.html casino]
[http://www.gayhomes.net/debil/flexeril.html flexeril]
[http://www.gayhomes.net/moiseev/play_casino.html casino]
[http://www.gayhomes.net/moiseev/casino_portal.html casino]
[http://www.gayhomes.net/jopotrah/cheap_phentermine.html cheap phentermine]
[http://www.gayhomes.net/debil/elavil.html elavil]
[http://www.gayhomes.net/jopotrah/phentermine.html phentermine]
[http://www.gayhomes.net/moiseev/lake_charles_casino.html casino]
[http://www.gayhomes.net/dermo/retin.html retin]
[http://www.gayhomes.net/moiseev/tunica_casino.html casino]
[http://www.gayhomes.net/debil/alesse.html alesse]
[http://www.gayhomes.net/jopotrah/phentermine_side_effects.html phentermine side effects]
[http://www.gayhomes.net/dermo/paxil.html paxil]
[http://mujweb.cz/Zabava/buycheap/clonazepam.html clonazepam]
[http://www.gayhomes.net/debil/motrin.html motrin]
[http://buyambienonline.blogspirit.com/ buy ambien]
</div>
