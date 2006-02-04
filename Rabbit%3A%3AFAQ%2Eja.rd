= Rabbit::FAQ.ja

こんな感じで上の方に追加していってはどうでしょう？

== 質問...

答え...

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
