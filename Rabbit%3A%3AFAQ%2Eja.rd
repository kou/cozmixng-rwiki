= Rabbit::FAQ.ja

こんな感じで上の方に追加していってはどうでしょう？

== 質問...

答え...

== 特定のスライドだけプロパティを変えたい時は？

例えば以下は "Redhanded" を含むスライドのフォントをイタリックに変更します。
 match Slide do |slides| 
   slides.each do |slide| 
     if slide.match?(/Redhanded/) 
       slide.prop_set("style", "italic") 
     end 
   end 
 end 


== 改行をするには？

以下のように書きます．

  (('&NewLine;'))

これはスライドの内容だけではなく，スライドタイトルでも有効です．

== 改行が書きづらいんですけど．．．

RabbitにはRubyと同じ魔法の粉がかかっています．つまり，「やってはいけないことは汚く見える」ようになっています((-Rubyの魔法の粉は，例えばグローバル変数に(({$}))を使うというものです．-))．

Rabbitで改行が書きづらくて，書くとソースが見づらくるのも，Rabbitが改行をできるだけ使わないで欲しいからです．

できるだけ使わないで欲しい一番の理由は「スライドには改行をしなければいけないくらい長い文章は書かない方がよい」からです．文章が長くなってしまった場合は，改行をすることを考える前にその文章を短く言い替えられないかなどを考えた方がよいでしょう．

スライドに長い文章を書くと，お客さんはスライドの内容を読むことに集中して，発表者への注意が少なくなってしまいがちです．プレゼンテーションのテクニックとして，「大事なこと，一番言いたいことを話すときは発表者に注目させる」というものがあります((-ホント？-))．スライドに長い文章を書いていると，このテクニックが使いづらくなってしまいます．

== ブラックアウト？ホワイトアウト？

スライド全体を黒または白くして，スライドの内容を見えなくして，「発表者に注目させる」というテクニックを使うときに利用するための機能です．

ブラックアウトは((%B%))で，ホワイトアウトは((%W%))で切替えることができます．それぞれのキーバインドの理由は((*B*))lackと((*W*))hiteです．

== タイトルスライドの背景を指定するには？

title-background-colorテーマを使います．

例えば，背景を赤くしたい場合は以下のようにします．

  @title_background_color = "red"
  include_theme("title-background-color")

背景色の指定には(({#RRGGBB}))形式も使えます．以下の例も背景を赤くします．

  @title_background_color = "#ff0000"
  include_theme("title-background-color")

色ではなくて，画像を指定したいときはtitle-background-imageテーマを使います．

((*注意: 0.3.1まではtitle-background-imageではなくて，title-backgroundという名前でした．*))

以下は背景にマスコットキャラクタ「ラビィ」を指定する例です．

  @title_background_image = "lavie.png"
  include_theme("title-background-image")

=== スライドの背景を指定するには？

例えば，背景を赤くしたい場合は以下のようにします．

  set_background("red")

背景色の指定には(({#RRGGBB}))形式も使えます．以下の例も背景を赤くします．

  set_background("#ff0000")

色ではなくて，画像を指定したいときはslide-background-imageテーマを使います．

((*注意: 0.3.2まではslide-background-imageではなくて，slide-backgroundという名前でした．*))

以下は背景にマスコットキャラクタ「ラビィ」を指定する例です．

  @slide_background_image = "lavie.png"
  include_theme("slide-background-image")
