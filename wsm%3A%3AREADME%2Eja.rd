# -*- RD -*-

= README.ja

$Id: README.ja 50 2004-06-24 16:24:15Z kou $

== 作者

  * Kouhei Sutou <kou@cozmixng.org>
  * 伊藤秀悦 <shuetsu@star.odn.ne.jp>

== ライセンス

GPL or BSD License

== メーリングリスト

((<COZMIXNG RWiki - 連絡先|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))を御覧下さい．

== なにこれ？

なんてことはないWikiエンジンです．

== 依存ライブラリ

  * ((<Gauche|URL:http://www.shiro.dreamhost.com/scheme/gauche/>)) >= 0.7.4
  * ((<esm|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=esm>))
  * ((<dsm|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=dsm>))
  * ((<marshal|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=marshal>))

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/wsm.tar.gz>))

  % svn co http://www.cozmixng.org/repos/wsm/trunk wsm

== インストール

  # gosh install/install.scm

メニューを国際化(現在は日本語と英語のみ)したいならpo/#{言語}.poを
/usr/share/locale/#{言語}/LC_MESSAGES/wsm.poとしてコピーしてくだ
さい．

例:
  # cp po/ja.po /usr/share/locale/ja/LC_MESSAGES/wsm.po

もしかしたら/usr/share/locale/じゃなくて
/usr/local/share/locale/かもしれません．

== 使う

bin/wsm-server.scmを起動

  % bin/wsm-server.scm

bin/cgi.scmをCGIとして実行し，ブラウザからアクセスする

例:

  % mkdir -p ~/public_html/wsm/
  % cp bin/cgi.scm ~/public_html/wsm/index.cgi
  % chmod +x ~/public_html/wsm/index.cgi

== WiLiKiからwsmへ移行

sample/wiliki2wsm.scmを使えばWiLiKiのデータをwsmのデータ(1ペー
ジ1ファイル形式)に変換できます．

  % gosh sample/wiliki2wsm.scm <WiLiKiのdbのパス> <wsmのデータのbase-path>
