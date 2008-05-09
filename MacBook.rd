= MacBook

MacBook上で動いているDebia GNU/Linuxについて。

キーボードの「n」が入力されないときがある。

== タッチパッドの設定

基本的には((<MacBook - Debian Wiki|URL:http://wiki.debian.org/MacBook>))に書いてあるとおりで、以下のように変更。

  * 二本指スクロールを有効
  * 二本指（三本指）での右クリック（真ん中クリック）を無効
  * 左上隅タップで真ん中クリック
  * 右上隅タップで右クリック

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
