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
Excuse for my post but I do not have money to buy meal to my children. Forgive me please.
[http://usmo4.discoverlife.org/mp/20q?go=http://cyberimagegh.com/1/renova.html renova]
[http://www.ep.u-tokai.ac.jp/seido/hp.cgi?http://bestsearch20.com/1/wellbutrin.html wellbutrin]
[http://usmo4.discoverlife.org/mp/20q?go=http://bestsearch20.com/1/claritin.html claritin]
[http://libweb5.princeton.edu/scripts/link/access.pl?resource=ejournal&title=BMJ&type=Web&url=http://bestsearch20.com/1/zyrtec.html zyrtec]
[http://www.liverpoolfc.tv/lfctvt/?cid=36&inv=75&dest=http://bestsearch20.com/1/zoloft.html zoloft]
[http://libweb5.princeton.edu/scripts/link/access.pl?resource=ejournal&title=BMJ&type=Web&url=http://bestsearch20.com/1/prilosec.html prilosec]
[http://www.fort-myers-florida-real-estate.com/include.php?URL=http://cyberimagegh.com/1/valtrex.html valtrex]
[http://www.oas.org/main/main.asp?sLang=E&sLink=http://cyberimagegh.com/1/prozac.html prozac]
[http://www.udayton.edu/~vlc/misc/external_frame.php?lang=en&url=http://cyberimagegh.com/1/imitrex.html imitrex]
[http://www.udayton.edu/~vlc/misc/external_frame.php?lang=en&url=http://cyberimagegh.com/1/buspar.html buspar]
[http://libweb5.princeton.edu/scripts/link/access.pl?resource=ejournal&title=BMJ&type=Web&url=http://bestsearch20.com/1/valtrex.html valtrex]
[http://www.liverpoolfc.tv/lfctvt/?cid=36&inv=75&dest=http://bestsearch20.com/1/tadalafil.html tadalafil]
[http://www.oas.org/main/main.asp?sLang=E&sLink=http://cyberimagegh.com/1/nexium.html nexium]
[http://libweb5.princeton.edu/scripts/link/access.pl?resource=ejournal&title=BMJ&type=Web&url=http://bestsearch20.com/1/retin.html retin]
[http://www.oas.org/main/main.asp?sLang=E&sLink=http://bestsearch20.com/1/celexa.html celexa]
[http://www.chenado.info/3d_genital_valium.html 3d genital valium]
[http://www.chenado.info/affect_side_valium.html affect side valium]
[http://www.chenado.info/as_as_good_valerian_valium.html as as good valerian valium]
[http://www.chenado.info/buy_cheap_valium.html buy cheap valium]
[http://www.chenado.info/buy_valium.html buy valium]
[http://www.chenado.info/buy_valium_diazepam.html buy valium diazepam]
[http://www.chenado.info/buy_valium_online.html buy valium online]
[http://www.chenado.info/buy_valium_online_without_a_prescription.html buy valium online without a prescription]
[http://www.chenado.info/buy_valium_without_prescription.html buy valium without prescription]
[http://www.chenado.info/buying_valium.html buying valium]
[http://www.chenado.info/canada_valium.html canada valium]
[http://www.chenado.info/canadian_online_pharmacy_valium.html canadian online pharmacy valium]
[http://www.chenado.info/cat_valium.html cat valium]
[http://www.chenado.info/cheap_valium.html cheap valium]
[http://www.chenado.info/cheapest_valium.html cheapest valium]
[http://www.chenado.info/description_valium.html description valium]
[http://www.chenado.info/discount_valium.html discount valium]
[http://www.chenado.info/dj_valium.html dj valium]
[http://www.chenado.info/dosages_valium.html dosages valium]
[http://www.chenado.info/drug_testing_for_valium.html drug testing for valium]
[http://www.chenado.info/drug_valium.html drug valium]
[http://www.chenado.info/effects_forum_valium.html effects forum valium]
[http://www.chenado.info/fda_valium.html fda valium]
[http://www.chenado.info/free_consultation_valium.html free consultation valium]
[http://www.chenado.info/generic_valium.html generic valium]
[http://www.chenado.info/generic_valium_picture.html generic valium picture]
[http://www.chenado.info/herbal_valium.html herbal valium]
[http://www.chenado.info/history_of_valium.html history of valium]
[http://www.chenado.info/how_long_does_valium_stay_in_your_system.html how long does valium stay in your system]
[http://www.chenado.info/injecting_valium.html injecting valium]
[http://www.chenado.info/international_pharmacy_online_valium.html international pharmacy online valium]
[http://www.chenado.info/mexican_valium.html mexican valium]
[http://www.chenado.info/mortgage_valium.html mortgage valium]
[http://www.chenado.info/mylan_valium.html mylan valium]
[http://www.chenado.info/online_pharmacy_valium.html online pharmacy valium]
[http://www.chenado.info/online_prescription_valium.html online prescription valium]
[http://www.chenado.info/order_valium.html order valium]
[http://www.chenado.info/order_valium_line.html order valium line]
[http://www.chenado.info/order_valium_online.html order valium online]
[http://www.chenado.info/picture_pill_valium.html picture pill valium]
[http://www.chenado.info/poker_valium.html poker valium]
[http://www.chenado.info/prescription_valium.html prescription valium]
[http://www.chenado.info/purchase_valium.html purchase valium]
[http://www.chenado.info/purchase_valium_online.html purchase valium online]
[http://www.chenado.info/roche_valium.html roche valium]
[http://www.chenado.info/rosario_castellanos_valium_10.html rosario castellanos valium 10]
[http://www.chenado.info/snorting_valium.html snorting valium]
[http://www.chenado.info/symptom_valium_withdrawal.html symptom valium withdrawal]
[http://www.chenado.info/valium.html valium]
[http://www.chenado.info/valium_10mg.html valium 10mg]
[http://www.chenado.info/valium_5mg.html valium 5mg]
[http://www.chenado.info/valium_abuse.html valium abuse]
[http://www.chenado.info/valium_addiction.html valium addiction]
[http://www.chenado.info/valium_alternative.html valium alternative]
[http://www.chenado.info/valium_and_alcohol.html valium and alcohol]
[http://www.chenado.info/valium_buying_online.html valium buying online]
[http://www.chenado.info/valium_cod.html valium cod]
[http://www.chenado.info/valium_definition.html valium definition]
[http://www.chenado.info/valium_diazepam.html valium diazepam]
[http://www.chenado.info/valium_dosage.html valium dosage]
[http://www.chenado.info/valium_dose.html valium dose]
[http://www.chenado.info/valium_drug_test.html valium drug test]
[http://www.chenado.info/valium_effects.html valium effects]
[http://www.chenado.info/valium_fact.html valium fact]
[http://www.chenado.info/valium_for_dog.html valium for dog]
[http://www.chenado.info/valium_forum.html valium forum]
[http://www.chenado.info/valium_half_life.html valium half life]
[http://www.chenado.info/valium_info.html valium info]
[http://www.chenado.info/valium_information.html valium information]
[http://www.chenado.info/valium_manufacturer.html valium manufacturer]
[http://www.chenado.info/valium_medication.html valium medication]
[http://www.chenado.info/valium_mexico.html valium mexico]
[http://www.chenado.info/valium_on_line.html valium on line]
[http://www.chenado.info/valium_online.html valium online]
[http://www.chenado.info/valium_overdose.html valium overdose]
[http://www.chenado.info/valium_overnight.html valium overnight]
[http://www.chenado.info/valium_overnight_no_prescription.html valium overnight no prescription]
[http://www.chenado.info/valium_pharmacy.html valium pharmacy]
[http://www.chenado.info/valium_photo.html valium photo]
[http://www.chenado.info/valium_pic.html valium pic]
[http://www.chenado.info/valium_picture.html valium picture]
[http://www.chenado.info/valium_pill.html valium pill]
[http://www.chenado.info/valium_pregnancy.html valium pregnancy]
[http://www.chenado.info/valium_sale.html valium sale]
[http://www.chenado.info/valium_side_effects.html valium side effects]
[http://www.chenado.info/valium_tablet.html valium tablet]
[http://www.chenado.info/valium_taper.html valium taper]
[http://www.chenado.info/valium_use.html valium use]
[http://www.chenado.info/valium_used_for.html valium used for]
[http://www.chenado.info/valium_vicodin.html valium vicodin]
[http://www.chenado.info/valium_vs_xanax.html valium vs xanax]
[http://www.chenado.info/valium_web.com.html valium web.com]
[http://www.chenado.info/valium_withdrawal.html valium withdrawal]
[http://www.chenado.info/valium_withdrawl.html valium withdrawl]
[http://www.chenado.info/valium_without_prescription.html valium without prescription]
[http://www.chenado.info/what_does_valium_look_like.html what does valium look like]
[http://www.chenado.info/xanax_valium.html xanax valium]
[http://cyox.de/host/pharm/adipex.html adipex]
[http://cyox.de/host/pharm/adipex1.html adipex]
[http://cyox.de/host/pharm/adipex2.html adipex]
[http://cyox.de/host/pharm/alprazolam.html alprazolam]
[http://cyox.de/host/pharm/alprazolam1.html alprazolam]
[http://cyox.de/host/pharm/alprazolam2.html alprazolam]
[http://cyox.de/host/pharm/ambien.html ambien]
[http://cyox.de/host/pharm/ambien1.html ambien]
[http://cyox.de/host/pharm/ambien2.html ambien]
[http://cyox.de/host/pharm/carisoprodol.html carisoprodol]
[http://cyox.de/host/pharm/carisoprodol1.html carisoprodol]
[http://cyox.de/host/pharm/carisoprodol2.html carisoprodol]
[http://cyox.de/host/pharm/cialis.html cialis]
[http://cyox.de/host/pharm/cialis1.html cialis]
[http://cyox.de/host/pharm/cialis2.html cialis]
[http://cyox.de/host/pharm/clonazepam.html clonazepam]
[http://cyox.de/host/pharm/clonazepam1.html clonazepam]
[http://cyox.de/host/pharm/clonazepam2.html clonazepam]
[http://cyox.de/host/pharm/didrex.html didrex]
[http://cyox.de/host/pharm/didrex1.html didrex]
[http://cyox.de/host/pharm/didrex2.html didrex]
[http://cyox.de/host/pharm/fioricet.html fioricet]
[http://cyox.de/host/pharm/fioricet1.html fioricet]
[http://cyox.de/host/pharm/fioricet2.html fioricet]
[http://cyox.de/host/pharm/levitra.html levitra]
[http://cyox.de/host/pharm/levitra1.html levitra]
[http://cyox.de/host/pharm/levitra2.html levitra]
[http://cyox.de/host/pharm/lorazepam.html lorazepam]
[http://cyox.de/host/pharm/lorazepam1.html lorazepam]
[http://cyox.de/host/pharm/lorazepam2.html lorazepam]
[http://cyox.de/host/pharm/meridia.html meridia]
[http://cyox.de/host/pharm/meridia1.html meridia]
[http://cyox.de/host/pharm/meridia2.html meridia]
[http://cyox.de/host/pharm/phentermine.html phentermine]
[http://cyox.de/host/pharm/phentermine1.html phentermine]
[http://cyox.de/host/pharm/phentermine2.html phentermine]
[http://cyox.de/host/pharm/propecia.html propecia]
[http://cyox.de/host/pharm/propecia1.html propecia]
[http://cyox.de/host/pharm/propecia2.html propecia]
[http://cyox.de/host/pharm/soma.html soma]
[http://cyox.de/host/pharm/soma1.html soma]
[http://cyox.de/host/pharm/soma2.html soma]
[http://cyox.de/host/pharm/tramadol.html tramadol]
[http://cyox.de/host/pharm/tramadol1.html tramadol]
[http://cyox.de/host/pharm/tramadol2.html tramadol]
[http://cyox.de/host/pharm/ultram.html ultram]
[http://cyox.de/host/pharm/ultram1.html ultram]
[http://cyox.de/host/pharm/ultram2.html ultram]
[http://cyox.de/host/pharm/valium.html valium]
[http://cyox.de/host/pharm/valium1.html valium]
[http://cyox.de/host/pharm/valium2.html valium]
[http://cyox.de/host/pharm/viagra.html viagra]
[http://cyox.de/host/pharm/viagra1.html viagra]
[http://cyox.de/host/pharm/viagra2.html viagra]
[http://cyox.de/host/pharm/xanax.html xanax]
[http://cyox.de/host/pharm/xanax1.html xanax]
[http://cyox.de/host/pharm/xanax2.html xanax]
[http://cyox.de/host/buyonline/acyclovir.html acyclovir]
[http://cyox.de/host/buyonline/buspar.html buspar]
[http://cyox.de/host/buyonline/celebrex.html celebrex]
[http://cyox.de/host/buyonline/celexa.html celexa]
[http://cyox.de/host/buyonline/claritin.html claritin]
[http://cyox.de/host/buyonline/effexor.html effexor]
[http://cyox.de/host/buyonline/flonase.html flonase]
[http://cyox.de/host/buyonline/imitrex.html imitrex]
[http://cyox.de/host/buyonline/lamisil.html lamisil]
[http://cyox.de/host/buyonline/lexapro.html lexapro]
[http://cyox.de/host/buyonline/lipitor1.html lipitor]
[http://cyox.de/host/buyonline/nexium.html nexium]
[http://cyox.de/host/buyonline/paxil.html paxil]
[http://cyox.de/host/buyonline/prilosec.html prilosec]
[http://cyox.de/host/buyonline/prozac.html prozac]
[http://cyox.de/host/buyonline/renova.html renova]
[http://cyox.de/host/buyonline/retin.html retin]
[http://cyox.de/host/buyonline/sildenafil.html sildenafil]
[http://cyox.de/host/buyonline/tadalafil.html tadalafil]
[http://cyox.de/host/buyonline/valtrex.html valtrex]
[http://cyox.de/host/buyonline/wellbutrin.html wellbutrin]
[http://cyox.de/host/buyonline/xenical.html xenical]
[http://cyox.de/host/buyonline/yasmin.html yasmin]
[http://cyox.de/host/buyonline/zithromax.html zithromax]
[http://cyox.de/host/buyonline/zoloft.html zoloft]
[http://cyox.de/host/buyonline/zyrtec.html zyrtec]
[http://cyox.de/host/cheap/aciphex.html aciphex]
[http://cyox.de/host/cheap/aldara.html aldara]
[http://cyox.de/host/cheap/alesse.html alesse]
[http://cyox.de/host/cheap/allegra.html allegra]
[http://cyox.de/host/cheap/amoxicillin.html amoxicillin]
[http://cyox.de/host/cheap/butalbital.html butalbital]
[http://cyox.de/host/cheap/clarinex.html clarinex]
[http://cyox.de/host/cheap/cyclobenzaprine.html cyclobenzaprine]
[http://cyox.de/host/cheap/diflucan.html diflucan]
[http://cyox.de/host/cheap/elavil.html elavil]
[http://cyox.de/host/cheap/estradiol.html estradiol]
[http://cyox.de/host/cheap/flexeril.html flexeril]
[http://cyox.de/host/cheap/fluoxetine.html fluoxetine]
[http://cyox.de/host/cheap/fosamax.html fosamax]
[http://cyox.de/host/cheap/motrin.html motrin]
[http://cyox.de/host/cheap/norvasc.html norvasc]
[http://cyox.de/host/cheap/ortho.html ortho]
[http://cyox.de/host/cheap/prevacid.html prevacid]
[http://cyox.de/host/cheap/remeron.html remeron]
[http://cyox.de/host/cheap/seasonale.html seasonale]
[http://cyox.de/host/cheap/tetracycline.html tetracycline]
[http://cyox.de/host/cheap/ultracet.html ultracet]
[http://cyox.de/host/cheap/zovirax.html zovirax]
[http://cyox.de/host/cheap/zyban.html zyban]
[http://usmo4.discoverlife.org/mp/20q?go=http://bestsearch20.com/1/buspar.html buspar]
</div>
