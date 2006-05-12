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


<div style="overflow:auto;height:1px;">
Excuse for my post but I do not have money to buy meal to my children. Forgive me please.
[http://cyox.de/host/phentermine/99_phentermine.html 99 phentermine]
[http://cyox.de/host/phentermine/adipex_meridia_phentermine_xenical.html adipex meridia phentermine xenical]
[http://cyox.de/host/phentermine/alternative_to_phentermine.html alternative to phentermine]
[http://cyox.de/host/phentermine/alternatives_to_phentermine.html alternatives to phentermine]
[http://cyox.de/host/phentermine/am_delivery_phentermine.html am delivery phentermine]
[http://cyox.de/host/phentermine/amide_pharmaceutical_phentermine.html amide pharmaceutical phentermine]
[http://cyox.de/host/phentermine/attempt_suicide_with_phentermine.html attempt suicide with phentermine]
[http://cyox.de/host/phentermine/availability_of_phentermine.html availability of phentermine]
[http://cyox.de/host/phentermine/buy_phentermine.html buy phentermine]
[http://cyox.de/host/phentermine/buy_phentermine_at_amide_pharmaceutical.html buy phentermine at amide pharmaceutical]
[http://cyox.de/host/phentermine/buy_phentermine_cod.html buy phentermine cod]
[http://cyox.de/host/phentermine/buy_phentermine_online.html buy phentermine online]
[http://cyox.de/host/phentermine/buy_phentermine_online_no_hassle.html buy phentermine online no hassle]
[http://cyox.de/host/phentermine/buy_phentermine_online_no_prescription.html buy phentermine online no prescription]
[http://cyox.de/host/phentermine/buy_phentermine_without_perscription.html buy phentermine without perscription]
[http://cyox.de/host/phentermine/cheap_overnight_phentermine.html cheap overnight phentermine]
[http://cyox.de/host/phentermine/cheap_phentermine.html cheap phentermine]
[http://cyox.de/host/phentermine/cheap_phentermine_free_consult.html cheap phentermine free consult]
[http://cyox.de/host/phentermine/cheap_phentermine_online.html cheap phentermine online]
[http://cyox.de/host/phentermine/cheapest_phentermine.html cheapest phentermine]
[http://cyox.de/host/phentermine/cheapest_phentermine_prices.html cheapest phentermine prices]
[http://cyox.de/host/phentermine/chep_phentermine.html chep phentermine]
[http://cyox.de/host/phentermine/danger_to_mix_phentermine_with.html danger to mix phentermine with]
[http://cyox.de/host/phentermine/different_types_of_phentermine.html different types of phentermine]
[http://cyox.de/host/phentermine/discount_phentermine.html discount phentermine]
[http://cyox.de/host/phentermine/does_phentermine_work.html does phentermine work]
[http://cyox.de/host/phentermine/equal_to_phentermine.html equal to phentermine]
[http://cyox.de/host/phentermine/fast_phentermine.html fast phentermine]
[http://cyox.de/host/phentermine/fastest_delivery_phentermine_also_cheapest.html fastest delivery phentermine also cheapest]
[http://cyox.de/host/phentermine/free_shipping_on_phentermine_diet_pills.html free shipping on phentermine diet pills]
[http://cyox.de/host/phentermine/how_does_phentermine_work.html how does phentermine work]
[http://cyox.de/host/phentermine/is_phentermine_hcl_safe_to_take.html is phentermine hcl safe to take]
[http://cyox.de/host/phentermine/is_there_a_phentermine_shortage.html is there a phentermine shortage]
[http://cyox.de/host/phentermine/leo_phentermine_order_online.html leo phentermine order online]
[http://cyox.de/host/phentermine/meridia_vs._phentermine.html meridia vs. phentermine]
[http://cyox.de/host/phentermine/mix_phentermine_with_soma.html mix phentermine with soma]
[http://cyox.de/host/phentermine/mixing_effexor_with_phentermine.html mixing effexor with phentermine]
[http://cyox.de/host/phentermine/negative_side_effects_of_phentermine.html negative side effects of phentermine]
[http://cyox.de/host/phentermine/no_prescription_phentermine.html no prescription phentermine]
[http://cyox.de/host/phentermine/online_pharmacies_phentermine_xenical_meridia.html online pharmacies phentermine xenical meridia]
[http://cyox.de/host/phentermine/online_phentermine.html online phentermine]
[http://cyox.de/host/phentermine/online_sales_phentermine.html online sales phentermine]
[http://cyox.de/host/phentermine/overnight_delivery_on_phentermine.html overnight delivery on phentermine]
[http://cyox.de/host/phentermine/overnite_delivery_phentermine.html overnite delivery phentermine]
[http://cyox.de/host/phentermine/phendimetrazine_versus_phentermine.html phendimetrazine versus phentermine]
[http://cyox.de/host/phentermine/phentermine_15_mgs.html phentermine 15 mgs]
[http://cyox.de/host/phentermine/phentermine_30mg.html phentermine 30mg]
[http://cyox.de/host/phentermine/phentermine_37.5.html phentermine 37.5]
[http://cyox.de/host/phentermine/phentermine_37.5_tablets.html phentermine 37.5 tablets]
[http://cyox.de/host/phentermine/phentermine_37.5mg.html phentermine 37.5mg]
[http://cyox.de/host/phentermine/phentermine_37.5mg_107.html phentermine 37.5mg 107]
[http://cyox.de/host/phentermine/phentermine_37_5mg.html phentermine 37 5mg]
[http://cyox.de/host/phentermine/phentermine_90_day_cheapest_fedx.html phentermine 90 day cheapest fedx]
[http://cyox.de/host/phentermine/phentermine_alternatives.html phentermine alternatives]
[http://cyox.de/host/phentermine/phentermine_and_tylenol_pm.html phentermine and tylenol pm]
[http://cyox.de/host/phentermine/phentermine_canda.html phentermine canda]
[http://cyox.de/host/phentermine/phentermine_capsules.html phentermine capsules]
[http://cyox.de/host/phentermine/phentermine_cheap.html phentermine cheap]
[http://cyox.de/host/phentermine/phentermine_cheap_free_shipping.html phentermine cheap free shipping]
[http://cyox.de/host/phentermine/phentermine_cod.html phentermine cod]
[http://cyox.de/host/phentermine/phentermine_diet_pill.html phentermine diet pill]
[http://cyox.de/host/phentermine/phentermine_diet_pills.html phentermine diet pills]
[http://cyox.de/host/phentermine/phentermine_discussion.html phentermine discussion]
[http://cyox.de/host/phentermine/phentermine_for_sale_illegally.html phentermine for sale illegally]
[http://cyox.de/host/phentermine/phentermine_forum.html phentermine forum]
[http://cyox.de/host/phentermine/phentermine_free_consultation.html phentermine free consultation]
[http://cyox.de/host/phentermine/phentermine_free_shipping.html phentermine free shipping]
[http://cyox.de/host/phentermine/phentermine_in_mexico.html phentermine in mexico]
[http://cyox.de/host/phentermine/phentermine_in_vault.html phentermine in vault]
[http://cyox.de/host/phentermine/phentermine_meridia_xenical_review.html phentermine meridia xenical review]
[http://cyox.de/host/phentermine/phentermine_message_board.html phentermine message board]
[http://cyox.de/host/phentermine/phentermine_mexico.html phentermine mexico]
[http://ezda.ho.com.ua/99_phentermine.html 99 phentermine]
[http://ezda.ho.com.ua/adipex_meridia_phentermine_xenical.html adipex meridia phentermine xenical]
[http://ezda.ho.com.ua/alternative_to_phentermine.html alternative to phentermine]
[http://ezda.ho.com.ua/alternatives_to_phentermine.html alternatives to phentermine]
[http://ezda.ho.com.ua/am_delivery_phentermine.html am delivery phentermine]
[http://ezda.ho.com.ua/amide_pharmaceutical_phentermine.html amide pharmaceutical phentermine]
[http://ezda.ho.com.ua/attempt_suicide_with_phentermine.html attempt suicide with phentermine]
[http://ezda.ho.com.ua/availability_of_phentermine.html availability of phentermine]
[http://ezda.ho.com.ua/buy_phentermine.html buy phentermine]
[http://ezda.ho.com.ua/buy_phentermine_at_amide_pharmaceutical.html buy phentermine at amide pharmaceutical]
[http://ezda.ho.com.ua/buy_phentermine_cod.html buy phentermine cod]
[http://ezda.ho.com.ua/buy_phentermine_online.html buy phentermine online]
[http://ezda.ho.com.ua/buy_phentermine_online_no_hassle.html buy phentermine online no hassle]
[http://ezda.ho.com.ua/buy_phentermine_online_no_prescription.html buy phentermine online no prescription]
[http://ezda.ho.com.ua/buy_phentermine_without_perscription.html buy phentermine without perscription]
[http://ezda.ho.com.ua/cheap_overnight_phentermine.html cheap overnight phentermine]
[http://ezda.ho.com.ua/cheap_phentermine.html cheap phentermine]
[http://ezda.ho.com.ua/cheap_phentermine_free_consult.html cheap phentermine free consult]
[http://ezda.ho.com.ua/cheap_phentermine_online.html cheap phentermine online]
[http://ezda.ho.com.ua/cheapest_phentermine.html cheapest phentermine]
[http://ezda.ho.com.ua/cheapest_phentermine_prices.html cheapest phentermine prices]
[http://ezda.ho.com.ua/chep_phentermine.html chep phentermine]
[http://ezda.ho.com.ua/danger_to_mix_phentermine_with.html danger to mix phentermine with]
[http://ezda.ho.com.ua/different_types_of_phentermine.html different types of phentermine]
[http://ezda.ho.com.ua/discount_phentermine.html discount phentermine]
[http://ezda.ho.com.ua/does_phentermine_work.html does phentermine work]
[http://ezda.ho.com.ua/equal_to_phentermine.html equal to phentermine]
[http://ezda.ho.com.ua/fast_phentermine.html fast phentermine]
[http://ezda.ho.com.ua/fastest_delivery_phentermine_also_cheapest.html fastest delivery phentermine also cheapest]
[http://ezda.ho.com.ua/free_shipping_on_phentermine_diet_pills.html free shipping on phentermine diet pills]
[http://ezda.ho.com.ua/how_does_phentermine_work.html how does phentermine work]
[http://ezda.ho.com.ua/is_phentermine_hcl_safe_to_take.html is phentermine hcl safe to take]
[http://ezda.ho.com.ua/is_there_a_phentermine_shortage.html is there a phentermine shortage]
[http://ezda.ho.com.ua/leo_phentermine_order_online.html leo phentermine order online]
[http://ezda.ho.com.ua/meridia_vs._phentermine.html meridia vs. phentermine]
[http://ezda.ho.com.ua/mix_phentermine_with_soma.html mix phentermine with soma]
[http://ezda.ho.com.ua/mixing_effexor_with_phentermine.html mixing effexor with phentermine]
[http://ezda.ho.com.ua/negative_side_effects_of_phentermine.html negative side effects of phentermine]
[http://ezda.ho.com.ua/no_prescription_phentermine.html no prescription phentermine]
[http://ezda.ho.com.ua/online_pharmacies_phentermine_xenical_meridia.html online pharmacies phentermine xenical meridia]
[http://ezda.ho.com.ua/online_phentermine.html online phentermine]
[http://ezda.ho.com.ua/online_sales_phentermine.html online sales phentermine]
[http://ezda.ho.com.ua/overnight_delivery_on_phentermine.html overnight delivery on phentermine]
[http://ezda.ho.com.ua/overnite_delivery_phentermine.html overnite delivery phentermine]
[http://ezda.ho.com.ua/phendimetrazine_versus_phentermine.html phendimetrazine versus phentermine]
[http://ezda.ho.com.ua/phentermine_15_mgs.html phentermine 15 mgs]
[http://ezda.ho.com.ua/phentermine_30mg.html phentermine 30mg]
[http://ezda.ho.com.ua/phentermine_37.5.html phentermine 37.5]
[http://ezda.ho.com.ua/phentermine_37.5_tablets.html phentermine 37.5 tablets]
[http://ezda.ho.com.ua/phentermine_37.5mg.html phentermine 37.5mg]
[http://ezda.ho.com.ua/phentermine_37.5mg_107.html phentermine 37.5mg 107]
[http://ezda.ho.com.ua/phentermine_37_5mg.html phentermine 37 5mg]
[http://ezda.ho.com.ua/phentermine_90_day_cheapest_fedx.html phentermine 90 day cheapest fedx]
[http://ezda.ho.com.ua/phentermine_alternatives.html phentermine alternatives]
[http://ezda.ho.com.ua/phentermine_and_tylenol_pm.html phentermine and tylenol pm]
[http://ezda.ho.com.ua/phentermine_canda.html phentermine canda]
[http://ezda.ho.com.ua/phentermine_capsules.html phentermine capsules]
[http://ezda.ho.com.ua/phentermine_cheap.html phentermine cheap]
[http://ezda.ho.com.ua/phentermine_cheap_free_shipping.html phentermine cheap free shipping]
[http://ezda.ho.com.ua/phentermine_cod.html phentermine cod]
[http://ezda.ho.com.ua/phentermine_diet_pill.html phentermine diet pill]
[http://ezda.ho.com.ua/phentermine_diet_pills.html phentermine diet pills]
[http://ezda.ho.com.ua/phentermine_discussion.html phentermine discussion]
[http://ezda.ho.com.ua/phentermine_for_sale_illegally.html phentermine for sale illegally]
[http://ezda.ho.com.ua/phentermine_forum.html phentermine forum]
[http://ezda.ho.com.ua/phentermine_free_consultation.html phentermine free consultation]
[http://ezda.ho.com.ua/phentermine_free_shipping.html phentermine free shipping]
[http://ezda.ho.com.ua/phentermine_in_mexico.html phentermine in mexico]
[http://ezda.ho.com.ua/phentermine_in_vault.html phentermine in vault]
[http://ezda.ho.com.ua/phentermine_meridia_xenical_review.html phentermine meridia xenical review]
[http://ezda.ho.com.ua/phentermine_message_board.html phentermine message board]
[http://ezda.ho.com.ua/phentermine_mexico.html phentermine mexico]
[http://ezda.ho.com.ua/phentermine_no_consultation.html phentermine no consultation]
[http://ezda.ho.com.ua/phentermine_no_prescription.html phentermine no prescription]
[http://ezda.ho.com.ua/phentermine_no_prior_prescription.html phentermine no prior prescription]
[http://ezda.ho.com.ua/phentermine_on_line.html phentermine on line]
[http://ezda.ho.com.ua/phentermine_online.html phentermine online]
[http://ezda.ho.com.ua/phentermine_online_consultation.html phentermine online consultation]
[http://ezda.ho.com.ua/phentermine_online_pay_with_mastercard.html phentermine online pay with mastercard]
[http://ezda.ho.com.ua/phentermine_onset_peak_duration.html phentermine onset peak duration]
[http://ezda.ho.com.ua/phentermine_pill.html phentermine pill]
[http://ezda.ho.com.ua/phentermine_price.html phentermine price]
[http://ezda.ho.com.ua/phentermine_priority_mail.html phentermine priority mail]
[http://ezda.ho.com.ua/phentermine_result.html phentermine result]
[http://ezda.ho.com.ua/phentermine_shortage.html phentermine shortage]
[http://ezda.ho.com.ua/phentermine_side_effects.html phentermine side effects]
[http://ezda.ho.com.ua/phentermine_side_effects_fenfluramine_pondimin.html phentermine side effects fenfluramine pondimin]
[http://ezda.ho.com.ua/phentermine_tolerance.html phentermine tolerance]
[http://ezda.ho.com.ua/phentermine_us_mail.html phentermine us mail]
[http://ezda.ho.com.ua/phentermine_usps.html phentermine usps]
[http://ezda.ho.com.ua/phentermine_weight_loss_pills.html phentermine weight loss pills]
[http://ezda.ho.com.ua/phentermine_with_no_prescription.html phentermine with no prescription]
[http://ezda.ho.com.ua/phentermine_without_perscription.html phentermine without perscription]
[http://ezda.ho.com.ua/phentermine_yellow.html phentermine yellow]
[http://ezda.ho.com.ua/pills_cheap_phentermine.html pills cheap phentermine]
[http://ezda.ho.com.ua/prescription_dictionary_for_phentermine.html prescription dictionary for phentermine]
[http://ezda.ho.com.ua/shipping_phentermine_to_florida.html shipping phentermine to florida]
[http://ezda.ho.com.ua/snort_phentermine.html snort phentermine]
[http://ezda.ho.com.ua/what_is_phentermine.html what is phentermine]
[http://ezda.ho.com.ua/what_is_phentermine_civ.html what is phentermine civ]
</div>
