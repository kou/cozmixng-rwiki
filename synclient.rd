= synclient

X11のSynaptics TouchPadドライバの設定を確認したり、変更したりするためのユーティリティ。

== モニタ

触っている部分がどの位置にあるかなどを表示する。

  % syclient -m 1

Edgeの場所を決めるときなどに便利。

== 確認

現在の設定一覧を表示する。

  % synclient -l

== 変更

設定を変更する。

  % synclient 名前1=値1 名前2=値2 ...

二本指横スクロールを有効にする例:
  % synclient HorizTwoFingerScroll=true
