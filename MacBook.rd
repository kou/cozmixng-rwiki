= MacBook

MacBook���ư���Ƥ���Debian GNU/Linux�ˤĤ��ơ�

�����ܡ��ɤΡ�n�פ����Ϥ���ʤ��Ȥ������롣

== ���å��ѥåɤ�����

����Ū�ˤ�((<MacBook - Debian Wiki|URL:http://wiki.debian.org/MacBook>))�˽񤤤Ƥ���Ȥ���ǡ��ʲ��Τ褦���ѹ���

  * ���ܻإ��������ͭ��
  * ���ܻءʻ��ܻءˤǤα�����å��ʿ����楯��å��ˤ�̵��
  * ��������åפǿ����楯��å�
  * ��������åפǱ�����å�
  * �������������ͭ��

�ɤ�����Edge�ˤ��뤫�ʤɤ���Ĵ���ˤ�((<synclient>))����ѡ�

/etc/X11/xorg.conf�γ�����ʬ�ϰʲ��ΤȤ��ꡣ

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

== �ץ��������ؤν���

MacBook�β��̤�1280x800�����ɡ����̤Υץ���������1024x768�ǽĲ�����Ψ���㤦���ץ쥼��ΤȤ��ϥץ��������˱ǤäƤ������Ƥ�Ʊ����Τ���̤ˤ�Ǥ��������Ǥ⡢MacBook�β����٤�1024x768�ˤ���ȡ���ĥ�äƤ���ơ��������Τ�1024x768�β��̤�ɽ�����Ƥ���褦�Ȥ��롣�Ǥ⡢��������Ȳ��̤��Ĥ�Ǥ��ޤ����Ȥ������Ȥǡ�1024x768�ˤ��Ƥ�1024x768�νĲ�����Ψ���Ѥ�����ɽ���������ꡣ

  % xrandr --output LVDS --set PANEL_FITTING center --mode 1024x768

PANEL_FITTING�ץ�ѥƥ����ͤ�center�ˤ���Τ��ݥ���ȡ��ǥե���Ȥ�full_aspect�ǡ������ͤ��Ȳ��̤˹�碌��褦�˽Ĳ�����ѹ����롣

���ʤߤˡ��ץ�ѥƥ����ͤϰʲ��Τ褦�˳�ǧ�Ǥ��롣

  % xrandr --properties

�Ĥ��Ǥˡ��ץ���������VGA�ˤؤ�ɽ����ͭ���ˤ�����ˡ��񤤤Ƥ�����

  % xrandr --output VGA --auto

����Ū�˲����٤���ꤹ�����--mode��Ȥ���

  % xrandr --output VGA --mode 1024x768

���ѤǤ���--mode���ͤϰ����ʤ���xrandr��ư����ȳ�ǧ�Ǥ��롣

  % xrandr

�ץ���������VGA�ˤؤν��Ϥ������Ϥ������롣

  % xrandr --output VGA --off
