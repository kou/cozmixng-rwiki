# -*- rd -*-

= README.ja

$Id: README.ja 172 2004-06-12 15:28:45Z kou $

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

GPL or BSD License

== メーリングリスト

((<COZMIXNG RWiki - 連絡先|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))を御覧下さい．

== なにこれ？

Schemeで実装された埋め込みScheme処理系です．フィルタプログラ
ムとしてではなくSchemeプログラム中でライブラリとして使用され
ることを想定しています．

同様のものに
((<escm|URL:http://www.shiro.dreamhost.com/scheme/vault/escm.html>)) 
，((<embedded
scheme|URL:http://homepage1.nifty.com/blankspace/scheme/embed.html>))
，((<BRL|URL:http://brl.sourceforge.net/>))などがあります．

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/esm.tar.gz>))

  % svn co http://www.cozmixng.org/repos/gauche/esm/trunk esm

== インストール

  # gosh install/install.scm

== 構文

  * <% expr ... %>
    
    Scheme式の埋め込み．出力されない．

  * <%= expr ... %>
    
    Scheme式の埋め込み．最後に評価された式の値が出力される．

  * <%; ... %>
    
    コメント．

  * その他
    
    テキスト．そのまま出力される．

== Gaucheで使う

とりあえず

  (use esm.gauche)

して下さい．
