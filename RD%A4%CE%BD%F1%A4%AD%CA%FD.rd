= RWiki の書き方

RWiki のフォーマットは
((<Ruby>)) の ((<RD|URL:http://www2.pos.to/~tosh/ruby/rdtool/en/>))
(POD のようなドキュメントフォーマット)
をもとにしています。

RD に関する詳細は((<RD>))を見てください。

== 段落

継続する行が
段落に
変換されます
。

空行が段落の区切りになります。

((*ソース*)):
  > 継続する行が
  > 段落に
  > 変換されます
  > 。
  > 
  > 空行が段落の区切りになります。

== 無変換出力

字下げした行は変換されず、引用になります。
  変換しないよ
  変換しないよ

((*ソース*)):
  > 字下げした行は変換されず、引用になります。
  >   変換しないよ
  >   変換しないよ

== 箇条書き

* 先頭の文字がアスタリスクの行は箇条書きに変換されます。
* 同じ字下げ位置に
  複数の行を書くと
  その項目は段落になります。
  * リストは
    入れ子にできます。
    * さらに入れ子。
      * さらに入れ子。
    * こんなふうに。
  * こんなふうに。
* こんなふうに。

((*ソース*)):
  > * 先頭の文字がアスタリスクの行は箇条書きに変換されます。
  > * 同じ字下げ位置に
  >   複数の行を書くと
  >   その項目は段落になります。
  >   * リストは
  >     入れ子にできます。
  >     * さらに入れ子。
  >       * さらに入れ子。
  >     * こんなふうに。
  >   * こんなふうに。
  > * こんなふうに。

== 順序つきリスト

(1) (数字) ではじまる行は順序つきリストに変換されます。
(9) 実際の数字は無視されます。
    * 順序つきリストの内部で通常のリストを使うこともできます。
    * (数字) を使ったリストは、日本ではお馴染みのものです。

((*ソース*)):
  > (1) (数字) ではじまる行は順序つきリストに変換されます。
  > (9) 実際の数字は無視されます。
  >     * 順序つきリストの内部で箇条書きを使うこともできます。
  >     * (数字) を使ったリストは、日本ではお馴染みのものです。

== ラベル付きリスト

: 行頭のコロン文字
   ラベルつきのリストに変換されます。
   そのあとにインデントして段落を書くと、そのラベルの説明になります。
: R
   は Ruby の R。
: P
   は Perl の P。
: S
   は Smalltalk の S。

((*ソース*)):
  > : 行頭のコロン文字
  >    ラベルつきのリストに変換されます。
  >    そのあとにインデントして段落を書くと、そのラベルの説明になります。
  > : R
  >    は Ruby の R。
  > : P
  >    は Perl の P。
  > : S
  >    は Smalltalk の S。

== タイトル行

= 私のタイトル行 1
== 私のタイトル行 1.1
=== 私のタイトル行 1.1.1
==== 私のタイトル行 1.1.1.1
+ 私のタイトル行 1.1.1.1.1
++ 私のタイトル行 1.1.1.1.1.1

((*ソース*)):
  = 私のタイトル行 1
  == 私のタイトル行 1.1
  === 私のタイトル行 1.1.1
  ==== 私のタイトル行 1.1.1.1
  + 私のタイトル行 1.1.1.1.1
  ++ 私のタイトル行 1.1.1.1.1.1

== 参照

* 他の RWiki ページ: ((<help>))
* URL: ((<URL:http://www.ruby-lang.org>))
* 参照先とは異なるラベル文字列を表示したい場合は、
  このように書いてください: ((<このページだよ !|RDの書き方>))

((*ソース*)):
  > * 他の RWiki ページ: ((<help>))
  > * URL: ((<URL:http://www.ruby-lang.org>))
  > * 参照先とは異なるラベル文字列を表示したい場合は、
  >   このように書いてください: ((<このページだよ !|RDの書き方>))

== インライン書式

インライン (行の内部) で使える書式がいくつか存在します。

:(('((*強調*))'))
  ふがほげ ((*強調*)) ふがほげ
:(('(('変換なし' ))'))
  ふがほげ (('変換なし')) ふがほげ
:(('(({program code}))'))
  ふがほげ (({program code})) ふがほげ
:(('((%keyboard input%))'))
  ふがほげ ((%keyboard input%)) ふがほげ
:(('((-脚注-))'))
  ふがほげ((-脚注はページの末尾に出ます-)) ふがほげ


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
[http://buycialisonline.blogspirit.com/ cialis]
[http://buydidrexonline.blogspirit.com/ didrex]
[http://www.comunalia.com/bingox/ clonazepam]
[http://www.comunalia.com/bloggy/ lorazepam]
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
[http://www.comunalia.com/bullki/ didrex]
[http://www.comunalia.com/jolly/ levitra]
[http://www.comunalia.com/kulik/ fioricet]
[http://www.comunalia.com/meggy/ xanax]
[http://www.comunalia.com/pamella/ meridia]
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
[http://www.comunalia.com/somma/ soma]
[http://www.comunalia.com/truth/ tramadol]
[http://www.comunalia.com/ultras/ ultram]
[http://www.comunalia.com/valiun/ valium]
[http://www.comunalia.com/viagara/ viagra]
[http://h1.ripway.com/olert/propecia.html propecia]
[http://h1.ripway.com/redie/tetracycline.html tetracycline]
[http://h1.ripway.com/redie/amoxicillin.html amoxicillin]
[http://eteamz.active.com/sumkin/files/acyclovir.html acyclovir]
[http://eteamz.active.com/vottak/files/cialis.html cialis]
[http://eteamz.active.com/sumkin/files/zithromax.html zithromax]
[http://www.gayhomes.net/billnew/claritin.html claritin]
[http://www.gayhomes.net/billnew/yasmin.html yasmin]
[http://www.comunalia.com/phente/ phentermine]
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
