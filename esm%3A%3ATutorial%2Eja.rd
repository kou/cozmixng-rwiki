# -*- rd -*-

= Tutorial.ja

私はGaucheで使っていますが，おそらく，少しいじれば他の処理系
でも使えると思います．

例にはGauche特有の記述が含まれています．

== 基本

esmはテキストをScheme処理系が解釈できるソースコードに変換す
るライブラリです．それだけだと面白くないので，テキストの中に
はSchemeのソースコードを埋め込むことが出来ます．

esmには3つの構文があります．

  * <% expr ... %>
    
    Schemeのソースコードの埋め込み．出力されない．

  * <%= expr ... %>
    
    Schemeのソースコードの埋め込み．最後に評価されたS式の値
    がdisplayで出力される．

  * <%; ... %>
    
    コメント．出力されない．

上記の3つ以外の部分はテキスト部分でそのまま出力されます．
Scheme処理系からはテキスト部分は一つの式とみなされます．

== 例1: 埋め込み

単純な例としてテキストにSchemeで計算した結果を埋め込んでみま
しょう．

  emb.esm
  1 + 2 = <%= (+ 1 2) %>

実行するにはbin/esm.scmを使うといいでしょう．

  % bin/esm.scm sample/emb.esm

このような結果を得ることでしょう．

  emb.esm
  1 + 2 = 3

<%= (+ 1 2) %>の部分が(+ 1 2)を評価した結果，つまり3に置き換
わっています．

esmとSchemeを用いて動的にテキストを生成することが出来ます．

== 例2: if

現在の時刻によって違う値を出力するesmコードを書いてみましょ
う．

  if.esm
  <%
    (use srfi-19)
    (if (< (date-hour (current-date)) 12)
  %>
  午前
  <%; ダミー %>
  午後
  <% ) %>

実行すると，例えばこんな結果を得るでしょう．

  if.esm
  
  午後
  
「if.esm」と「午後」のあいだの空行は

  <%
    (use srfi-19)
    (if (< (date-hour (current-date)) 12)
  %>

の%>の後にある改行のせいです．esmで生成されたテキストには余
分な空白が入り，見にくくなることがあります．HTMLやXMLなどの
(特定の場所以外の)空白を無視するテキストを生成する場合には問
題になることは少ないですが，そうでないテキストを生成する場合
には気を付けなければいけません．

((<RAA:erb>))はtrimモード等でこれに対応しています．


=== テキストは一つの文

esmコードに

  <%; ダミー %>

というコメントが入っているのにはわけがあります．ifのthen節と
else節を分けるためです．テキスト節は一つの文と見なされるので

  <% (if (< (date-hour (current-date)) 12) %>
  午前
  午後
  <% ) %>
  
とするとthen節が

  午前
  午後

でelse節が省略されたと見なされます．

今回のように

  <%; ダミー %>

としてthen節とelse節を分けずに

  <%
    (if (< (date-hour (current-date)) 12)
        (begin
  %>
  午前
  <% ) (begin %>
  午後
  <% )) %>
  
というようにbeginを使っても良いでしょう．

ただし，

  <%
    (if (< (date-hour (current-date)) 12)
        (begin
  %>
  午前<%= (current-date) %>時
  <% ) (begin %>
  午後はあと<%= (- 24 (current-date)) %>時間
  <% )) %>
    
というようにthen節やelse節がテキストのみではなく<% ... %>や
<%= ... %>等で区切られている場合はbeginが必要です．

== 例3: 手続き化

そろそろesmをライブラリとして使ってみましょう．

define-esmを使うとesmで処理したテキストを返す手続きを定義す
ることが出来ます．

ここでは2つのesmコード，1つのSchemeコードがあるとします．

=== 1つめのesmコード

  child.esm
  <%= (get-param :arg) %>
  end child.esm

=== 2つめのesmコード

  parent.esm
  <%= (child :arg 1) %>
  end parent.esm
  
=== Schemeコード

  #!/usr/bin/env gosh
  # nested.scm

  (use esm.gauche)

  (define-esm parent "parent.esm")
  (define-esm child "child.esm")

  (define (main args)
    (display (parent))
    0)

=== 実行結果

Schemeコードを実行すると以下のようになります．

  parent.esm
  child.esm
  1
  end child.esm

  end parent.esm

parent.esmの中でchild.esmの内容をesmで変換したテキストを出力
しています．

parent.esmの中のchild.esmの呼出し

  <%= (child :arg 1) %>

に注目して下さい．esmの出力テキストを返す手続きを定義するこ
とにより引数でesmの出力テキストに影響を与えることが出来ます．

手続き化することによりesmの出力テキストを部品として使えるよ
うになります．

== 例4: CGI

未稿

== リファレンス

esmは以下の手続きを用意しています．

--- esm-compile(src)

    srcをコンパイルする．srcは文字列か入力ポート．

--- esm-result(src . env)

    srcをコンパイルして環境envで評価した結果の文字列を返す．
    envが省略された場合は*esm-default-environment* 
    が使用される．

--- esm-run(src . env)

    (apply esm-result src env)で得られた文字列をdisplayで出
    力する．envが省略された場合は*esm-default-environment*
    が使用される．

esmは以下の構文を用意しています．

--- esm-result*(src)
    
    srcをコンパイルして評価した結果の文字列を返す．
    esm-resultと違ってsrcのコンパイルは実行時ではなく，プロ
    グラムのコンパイル時に行われる．

--- esm-run*(src)
    
    srcをコンパイルして評価した結果の文字列をdisplayで出力する．
    esm-runと違ってsrcのコンパイルは実行時ではなく，プログラ
    ムのコンパイル時に行われる．

--- define-esm(name filename)

    ファイル名filenameのesmコードをコンパイルし評価した結果
    を返すnameという名前の手続きを定義する．

