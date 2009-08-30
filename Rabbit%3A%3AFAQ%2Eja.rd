= Rabbit::FAQ.ja

Rabbit だけど何か質問ある?
  * 命名: 西川さん
  * 賛同: babieさん

こんな感じで上の方に追加していってはどうでしょう？

== 質問...

答え...

== PDFでうさぎと亀を使いたいときは？

pdf-tortoise-and-hareテーマとRABBIT_ALLOTTED_TIME環境変数を使います。

  % RABBIT_ALLOTTED_TIME=5m rabbit --theme pdf-tortoise-and-hare slide.pdf

RABBIT_ALLOTTED_TIMEの値の書式はスライド中に

  : allotted-time
      5m

と書くときと同じものが使えます。

上の例だと「5m」なので、亀が5分かけて走ります。

== 亀を元に戻したいときは？

 Alt+t

== 高橋メソッドスライドの中に普通のスライドを混ぜたいときは？

高橋メソッド用のテーマはRabbitではlightning-talkと呼ばれています．

通常，高橋メソッドのみを使ったスライドを作成する場合は以下のように「lightning-talk」テーマを使います．

  = タイトル
  : author
     オレ
  : theme
     lightning-talk # <= こんな感じ

  = オレは

  = オレだ

もし，高橋メソッドを使ったスライドだけではなく，箇条書きなどを使った「普通の」スライドを混ぜたい場合はこれではうまくいきません．なぜなら，「lightning-talk」テーマは箇条書きなどの見栄え定義を持たないからです．

これを解決するには，テーマを混ぜます．実は，「ligntning-talk」と混ざったテーマが標準でいくつか用意されています．例えば，「rabbit」テーマと「lignting-talk」テーマを混ぜた「lightning-rabbit」です．このテーマを使うと以下のように，高橋メソッドを使ったスライドと普通の「rabbit」テーマのスライドを混ぜることができます．

  = タイトル
  : author
     オレ
  : theme
     lightning-rabbit

  = オレは

  = ．．．

    * ．．．
    * ．．．
    * ．．．

  = オレだ

「lightning-rabbit」テーマは以下のようにとても小さなテーマです．

  # enscript ruby
  include_theme("rabbit")       # (1)

  @lightning_talk_proc_name = "lightning-rabbit"
  @lightning_talk_as_large_as_possible = true
  include_theme("lightning-talk-toolkit")

  match(Slide) do |slides|
    slides.each do |slide|
      if slide.lightning_talk?  # (2)
        slide.lightning_talk    # (3)
      end
    end
  end

作戦は，以下のようになっています．

  (1) ベースとなるテーマを適用する．（(1)の部分）
  (2) lightning-talk用のスライドだけ（(2)の部分）
      見栄えをlightning-talk用の見栄え定義で上書きする．（(3)の部分）

これを応用すれば，簡単にちょっとだけ高橋メソッドを使ったプレゼンテーションを行うことができます．注意点は「((*slide.lightning_talkは最後に！*))」ということです．これは，既存の見栄えを上書きするという作戦を用いているためです．

ちなみに，(({slide.lightning_talk}))の別名として(({slide.takahashi}))が，(({slide.lightning_talk?}))の別名として(({slide.takahashi?}))が用意されています．

Happy Rabbitting!

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

== スライドの背景を指定するには？

例えば，背景を赤くしたい場合は以下のようにします．

  set_background("red")

背景色の指定には(({#RRGGBB}))形式も使えます．以下の例も背景を赤くします．

  set_background("#ff0000")

色ではなくて，画像を指定したいときはslide-background-imageテーマを使います．

((*注意: 0.3.2まではslide-background-imageではなくて，slide-backgroundという名前でした．*))

以下は背景にマスコットキャラクタ「ラビィ」を指定する例です．

  @slide_background_image = "lavie.png"
  include_theme("slide-background-image")
