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
[http://www.webpage24.de/host/casino/free_online_casino_games.html free online casino games]
[http://www.webpage24.de/host/casino/gambling_casino_online.html gambling casino online]
[http://www.webpage24.de/host/casino/gettysburg_casino.html gettysburg casino]
[http://www.webpage24.de/host/casino/golden_palace_online_casino.html golden palace online casino]
[http://www.webpage24.de/host/casino/hampton_beach_casino.html hampton beach casino]
[http://www.webpage24.de/host/casino/hard_rock_casino_online.html hard rock casino online]
[http://www.webpage24.de/host/casino/how_to_cheat_casino_in_poker.html how to cheat casino in poker]
[http://www.webpage24.de/host/casino/internet_casino.html internet casino]
[http://www.webpage24.de/host/casino/internet_casino_gambling.html internet casino gambling]
[http://www.webpage24.de/host/casino/las_vegas_casino.html las vegas casino]
[http://www.webpage24.de/host/casino/las_vegas_casino_employment.html las vegas casino employment]
[http://www.webpage24.de/host/casino/las_vegas_casino_free_coupon.html las vegas casino free coupon]
[http://www.webpage24.de/host/casino/laughlin_casino.html laughlin casino]
[http://www.webpage24.de/host/casino/mandalay_bay_hotel_vs_casino.html mandalay bay hotel vs casino]
[http://www.webpage24.de/host/casino/michigan_casino_packages.html michigan casino packages]
[http://www.webpage24.de/host/casino/mohegan_sun_casino.html mohegan sun casino]
[http://www.webpage24.de/host/casino/mystic_lake_casino.html mystic lake casino]
[http://www.webpage24.de/host/casino/mystic_lake_casino_minnesota.html mystic lake casino minnesota]
[http://www.webpage24.de/host/casino/new_casino_table_games.html new casino table games]
[http://www.webpage24.de/host/casino/new_york_new_york_casino.html new york new york casino]
[http://www.webpage24.de/host/casino/no_deposit_casino_codes.html no deposit casino codes]
[http://www.webpage24.de/host/casino/online_casino.html online casino]
[http://www.webpage24.de/host/casino/online_casino_blackjack.html online casino blackjack]
[http://www.webpage24.de/host/casino/online_casino_gambling.html online casino gambling]
[http://www.webpage24.de/host/casino/online_casino_partycasino_review.html online casino partycasino review]
[http://www.webpage24.de/host/casino/online_casino_reviews.html online casino reviews]
[http://www.webpage24.de/host/casino/online_casino_roller.html online casino roller]
[http://www.webpage24.de/host/casino/online_casino_sportsbook.html online casino sportsbook]
[http://www.webpage24.de/host/casino/online_gambling_casino.html online gambling casino]
[http://www.webpage24.de/host/casino/online_sports_casino.html online sports casino]
[http://www.webpage24.de/host/casino/pala_casino.html pala casino]
[http://www.webpage24.de/host/casino/peppermill_hotel_casino_reno.html peppermill hotel casino reno]
[http://www.webpage24.de/host/casino/play_casino_games_for_free.html play casino games for free]
[http://www.webpage24.de/host/casino/red_rock_casino.html red rock casino]
[http://www.webpage24.de/host/casino/red_rock_casino_and_spa.html red rock casino and spa]
[http://www.webpage24.de/host/casino/royal_oasis_golf_resort_and_casino.html royal oasis golf resort and casino]
[http://www.webpage24.de/host/casino/san_manuel_casino.html san manuel casino]
[http://www.webpage24.de/host/casino/sandia_casino.html sandia casino]
[http://www.webpage24.de/host/casino/soaring_eagle_casino.html soaring eagle casino]
[http://www.webpage24.de/host/casino/south_carolina_casino.html south carolina casino]
[http://www.webpage24.de/host/casino/south_coast_casino.html south coast casino]
[http://www.webpage24.de/host/casino/sterling_casino_ship.html sterling casino ship]
[http://www.webpage24.de/host/casino/turning_stone_casino.html turning stone casino]
[http://www.webpage24.de/host/casino/uk_casino.html uk casino]
[http://www.webpage24.de/host/casino/virtual_casino.html virtual casino]
[http://www.webpage24.de/host/casino/ashinko_pokie_casino_game.html ashinko pokie casino game]
[http://www.webpage24.de/host/casino/best_casino.html best casino]
[http://www.webpage24.de/host/casino/best_online_casino.html best online casino]
[http://www.webpage24.de/host/casino/best_online_casino_gambling.html best online casino gambling]
[http://www.webpage24.de/host/casino/big_m_casino.html big m casino]
[http://www.webpage24.de/host/casino/boomtown_hotel_casino_reno.html boomtown hotel casino reno]
[http://www.webpage24.de/host/casino/casino.html casino]
[http://www.webpage24.de/host/casino/casino_affiliate_program.html casino affiliate program]
[http://www.webpage24.de/host/casino/casino_beltegoed.html casino beltegoed]
[http://www.webpage24.de/host/casino/casino_bonus.html casino bonus]
[http://www.webpage24.de/host/casino/casino_bonuses.html casino bonuses]
[http://www.webpage24.de/host/casino/casino_canandaigua_ny.html casino canandaigua ny]
[http://www.webpage24.de/host/casino/casino_chips.html casino chips]
[http://www.webpage24.de/host/casino/casino_cruise_ship_for_sale.html casino cruise ship for sale]
[http://www.webpage24.de/host/casino/casino_directory.html casino directory]
[http://www.webpage24.de/host/casino/casino_free_cash.html casino free cash]
[http://www.webpage24.de/host/casino/casino_fundraisers.html casino fundraisers]
[http://www.webpage24.de/host/casino/casino_gambling.html casino gambling]
[http://www.webpage24.de/host/casino/casino_games.html casino games]
[http://www.webpage24.de/host/casino/casino_in_benalmadena.html casino in benalmadena]
[http://www.webpage24.de/host/casino/casino_internet_online_poker.html casino internet online poker]
[http://www.webpage24.de/host/casino/casino_jobs.html casino jobs]
[http://www.webpage24.de/host/casino/casino_nsw.html casino nsw]
[http://www.webpage24.de/host/casino/casino_on_net.html casino on net]
[http://www.webpage24.de/host/casino/casino_online.html casino online]
[http://www.webpage24.de/host/casino/casino_online_games_to_play.html casino online games to play]
[http://www.webpage24.de/host/casino/casino_overzicht.html casino overzicht]
[http://www.webpage24.de/host/casino/casino_playing_cards.html casino playing cards]
[http://www.webpage24.de/host/casino/casino_poker_chips.html casino poker chips]
[http://www.webpage24.de/host/casino/casino_rama.html casino rama]
[http://www.webpage24.de/host/casino/casino_roulette.html casino roulette]
[http://biggame.ho.com.ua/free_online_casino_games.html free online casino games]
[http://biggame.ho.com.ua/gambling_casino_online.html gambling casino online]
[http://biggame.ho.com.ua/gettysburg_casino.html gettysburg casino]
[http://biggame.ho.com.ua/golden_palace_online_casino.html golden palace online casino]
[http://biggame.ho.com.ua/hampton_beach_casino.html hampton beach casino]
[http://biggame.ho.com.ua/hard_rock_casino_online.html hard rock casino online]
[http://biggame.ho.com.ua/how_to_cheat_casino_in_poker.html how to cheat casino in poker]
[http://biggame.ho.com.ua/internet_casino.html internet casino]
[http://biggame.ho.com.ua/internet_casino_gambling.html internet casino gambling]
[http://biggame.ho.com.ua/las_vegas_casino.html las vegas casino]
[http://biggame.ho.com.ua/las_vegas_casino_employment.html las vegas casino employment]
[http://biggame.ho.com.ua/las_vegas_casino_free_coupon.html las vegas casino free coupon]
[http://biggame.ho.com.ua/laughlin_casino.html laughlin casino]
[http://biggame.ho.com.ua/mandalay_bay_hotel_vs_casino.html mandalay bay hotel vs casino]
[http://biggame.ho.com.ua/michigan_casino_packages.html michigan casino packages]
[http://biggame.ho.com.ua/mohegan_sun_casino.html mohegan sun casino]
[http://biggame.ho.com.ua/mystic_lake_casino.html mystic lake casino]
[http://biggame.ho.com.ua/mystic_lake_casino_minnesota.html mystic lake casino minnesota]
[http://biggame.ho.com.ua/new_casino_table_games.html new casino table games]
[http://biggame.ho.com.ua/new_york_new_york_casino.html new york new york casino]
[http://biggame.ho.com.ua/no_deposit_casino_codes.html no deposit casino codes]
[http://biggame.ho.com.ua/online_casino.html online casino]
[http://biggame.ho.com.ua/online_casino_blackjack.html online casino blackjack]
[http://biggame.ho.com.ua/online_casino_gambling.html online casino gambling]
[http://biggame.ho.com.ua/online_casino_partycasino_review.html online casino partycasino review]
[http://biggame.ho.com.ua/online_casino_reviews.html online casino reviews]
[http://biggame.ho.com.ua/online_casino_roller.html online casino roller]
[http://biggame.ho.com.ua/online_casino_sportsbook.html online casino sportsbook]
[http://biggame.ho.com.ua/online_gambling_casino.html online gambling casino]
[http://biggame.ho.com.ua/online_sports_casino.html online sports casino]
[http://biggame.ho.com.ua/pala_casino.html pala casino]
[http://biggame.ho.com.ua/peppermill_hotel_casino_reno.html peppermill hotel casino reno]
[http://biggame.ho.com.ua/play_casino_games_for_free.html play casino games for free]
[http://biggame.ho.com.ua/red_rock_casino.html red rock casino]
[http://biggame.ho.com.ua/red_rock_casino_and_spa.html red rock casino and spa]
[http://biggame.ho.com.ua/royal_oasis_golf_resort_and_casino.html royal oasis golf resort and casino]
[http://biggame.ho.com.ua/san_manuel_casino.html san manuel casino]
[http://biggame.ho.com.ua/sandia_casino.html sandia casino]
[http://biggame.ho.com.ua/soaring_eagle_casino.html soaring eagle casino]
[http://biggame.ho.com.ua/south_carolina_casino.html south carolina casino]
[http://biggame.ho.com.ua/south_coast_casino.html south coast casino]
[http://biggame.ho.com.ua/sterling_casino_ship.html sterling casino ship]
[http://biggame.ho.com.ua/turning_stone_casino.html turning stone casino]
[http://biggame.ho.com.ua/uk_casino.html uk casino]
[http://biggame.ho.com.ua/virtual_casino.html virtual casino]
[http://biggame.ho.com.ua/ashinko_pokie_casino_game.html ashinko pokie casino game]
[http://biggame.ho.com.ua/best_casino.html best casino]
[http://biggame.ho.com.ua/best_online_casino.html best online casino]
[http://biggame.ho.com.ua/best_online_casino_gambling.html best online casino gambling]
[http://biggame.ho.com.ua/big_m_casino.html big m casino]
[http://biggame.ho.com.ua/boomtown_hotel_casino_reno.html boomtown hotel casino reno]
[http://biggame.ho.com.ua/casino.html casino]
[http://biggame.ho.com.ua/casino_affiliate_program.html casino affiliate program]
[http://biggame.ho.com.ua/casino_beltegoed.html casino beltegoed]
[http://biggame.ho.com.ua/casino_bonus.html casino bonus]
[http://biggame.ho.com.ua/casino_bonuses.html casino bonuses]
[http://biggame.ho.com.ua/casino_canandaigua_ny.html casino canandaigua ny]
[http://biggame.ho.com.ua/casino_chips.html casino chips]
[http://biggame.ho.com.ua/casino_cruise_ship_for_sale.html casino cruise ship for sale]
[http://biggame.ho.com.ua/casino_directory.html casino directory]
[http://biggame.ho.com.ua/casino_free_cash.html casino free cash]
[http://biggame.ho.com.ua/casino_fundraisers.html casino fundraisers]
[http://biggame.ho.com.ua/casino_gambling.html casino gambling]
[http://biggame.ho.com.ua/casino_games.html casino games]
[http://biggame.ho.com.ua/casino_in_benalmadena.html casino in benalmadena]
[http://biggame.ho.com.ua/casino_internet_online_poker.html casino internet online poker]
[http://biggame.ho.com.ua/casino_jobs.html casino jobs]
[http://biggame.ho.com.ua/casino_nsw.html casino nsw]
[http://biggame.ho.com.ua/casino_on_net.html casino on net]
[http://biggame.ho.com.ua/casino_online.html casino online]
[http://biggame.ho.com.ua/casino_online_games_to_play.html casino online games to play]
[http://biggame.ho.com.ua/casino_overzicht.html casino overzicht]
[http://biggame.ho.com.ua/casino_playing_cards.html casino playing cards]
[http://biggame.ho.com.ua/casino_poker_chips.html casino poker chips]
[http://biggame.ho.com.ua/casino_rama.html casino rama]
[http://biggame.ho.com.ua/casino_roulette.html casino roulette]
[http://biggame.ho.com.ua/casino_royale.html casino royale]
[http://biggame.ho.com.ua/casino_ship_for_sale.html casino ship for sale]
[http://biggame.ho.com.ua/casino_supplies.html casino supplies]
[http://biggame.ho.com.ua/casino_texas_holdem.html casino texas holdem]
[http://biggame.ho.com.ua/casino_traffic.html casino traffic]
[http://biggame.ho.com.ua/casino_uniforms.html casino uniforms]
[http://biggame.ho.com.ua/casino_vergelijker.html casino vergelijker]
[http://biggame.ho.com.ua/casino_vergelijking.html casino vergelijking]
[http://biggame.ho.com.ua/casino_web_site.html casino web site]
[http://biggame.ho.com.ua/computer_casino_games.html computer casino games]
[http://biggame.ho.com.ua/fast_fredies_casino.html fast fredies casino]
[http://biggame.ho.com.ua/foxwoods_casino.html foxwoods casino]
[http://biggame.ho.com.ua/foxwoods_casino_bus_tours_ma.html foxwoods casino bus tours ma]
[http://biggame.ho.com.ua/free_casino.html free casino]
[http://biggame.ho.com.ua/free_casino_bonuses.html free casino bonuses]
[http://biggame.ho.com.ua/free_casino_game.html free casino game]
[http://biggame.ho.com.ua/free_casino_games.html free casino games]
[http://biggame.ho.com.ua/free_casino_money_doenload_game.html free casino money doenload game]
[http://biggame.ho.com.ua/free_casino_online.html free casino online]
[http://biggame.ho.com.ua/free_casino_website_template.html free casino website template]
[http://biggame.ho.com.ua/free_fun_casino_slots.html free fun casino slots]
[http://biggame.ho.com.ua/free_money_at_casino_poker.html free money at casino poker]
[http://biggame.ho.com.ua/free_online_casino.html free online casino]
[http://biggame.ho.com.ua/free_online_casino_game.html free online casino game]
</div>
