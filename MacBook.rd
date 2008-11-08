= MacBook

MacBook上で動いているDebian GNU/Linuxについて。

キーボードの「n」が入力されないときがある。

== タッチパッドの設定

基本的には((<MacBook - Debian Wiki|URL:http://wiki.debian.org/MacBook>))に書いてあるとおりで、以下のように変更。

  * 二本指スクロールを有効
  * 二本指（三本指）での右クリック（真ん中クリック）を無効
  * 左上隅タップで真ん中クリック
  * 右上隅タップで右クリック
  * 下隅スクロールを有効

どこからEdgeにするかなどの微調整には((<synclient>))を使用。

/etc/X11/xorg.confの該当部分は以下のとおり。

  Section "InputDevice"
          Identifier      "Synaptics Touchpad"
          Driver          "synaptics"
          Option          "CorePointer"
          Option          "Device" "/dev/psaux"
          Option          "Protocol" "auto-dev"
          Option          "LeftEdge" "100"
          Option          "RightEdge" "1000"
          Option          "TopEdge" "100"
          Option          "BottomEdge" "300"
          Option          "FingerLow" "5"
          Option          "FingerHigh" "7"
          Option          "MaxTapTime" "180"
          Option          "MaxTapMove" "220"
          Option          "MaxDoubleTapTime" "180"
          Option          "TapButton2" "0"
          Option          "TapButton3" "0"
          Option          "VertTwoFingerScroll" "true"
          Option          "HorizTwoFingerScroll" "true"
          Option          "VertScrollDelta" "7"
          Option          "HorizScrollDelta" "3"
          Option          "MinSpeed" "0.79"
          Option          "MaxSpeed" "0.88"
          Option          "AccelFactor" "0.0015"
          Option          "LeftRightRepeat" "0"
          Option          "UpDownRepeat" "0"
          Option          "UpDownScrolling" "on"
  # turn off corner buttons
          Option          "RTCornerButton" "3"
          Option          "RBCornerButton" "0"
          Option          "LTCornerButton" "2"
          Option          "LBCornerButton" "0"
  # edge motion
          Option          "EdgeMotionUseAlways" "0"
          Option          "EdgeMotionMinZ" "25"
          Option          "EdgeMotionMaxZ" "60"
          Option          "EdgeMotionMinSpeed" "150"
          Option          "EdgeMotionMaxSpeed" "200"
          Option          "SHMConfig" "on"
  EndSection

== プロジェクタへの出力

MacBookの画面は1280x800だけど、普通のプロジェクタは1024x768で縦横の比率が違う。プレゼンのときはプロジェクタに映っている内容と同じものを画面にも映したい。でも、MacBookの解像度を1024x768にすると、頑張ってくれて、画面全体で1024x768の画面を表示してくれようとする。でも、そうすると画面が歪んでしまう。ということで、1024x768にしても1024x768の縦横の比率を変えずに表示する設定。

  % xrandr --output LVDS --set PANEL_FITTING center --mode 1024x768

PANEL_FITTINGプロパティの値をcenterにするのがポイント。デフォルトはfull_aspectで、この値だと画面に合わせるように縦横比を変更する。

ちなみに、プロパティの値は以下のように確認できる。

  % xrandr --properties

ついでに、プロジェクタ（VGA）への表示を有効にする方法も書いておく。

  % xrandr --output VGA --auto

明示的に解像度を指定する場合は--modeを使う。

  % xrandr --output VGA --mode 1024x768

利用できる--modeの値は引数なしでxrandrを起動すると確認できる。

  % xrandr

プロジェクタ（VGA）への出力をやめる場合はこうする。

  % xrandr --output VGA --off
