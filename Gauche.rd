= Gauche

Guahce関係の作業記録

== Gauche

=== portsでインストール

  %  sudo /usr/local/sbin/portupgrade -N -m "GAUCHE_THREADS=pthreads GAUCHE_ENCODING=euc-jp" gauche

gauche-gdbmは<gdbm.h>が見つからないのでコンパイルされない．見つからない理由は(g)ccのinclude pathに/usr/local/includeが含まれていないから．

ということでlang/gauche/Makefileを変更

  CONFIGURE_ARGS= --enable-threads=${GAUCHE_THREADS} \
  -    --enable-multibyte=${GAUCHE_ENCODING}
  +    --enable-multibyte=${GAUCHE_ENCODING} \
  +    --with-iconv-lib=iconv \
  +    --with-local=${PREFIX}


include pathは(g)ccに埋め込みなの？設定ファイルを読んだりしているわけではないの？

=== 普通にインストール

(1) 入手先
     http://www.shiro.dreamhost.com/scheme/gauche/download-j.html
     http://prdownloads.sourceforge.net/gauche/Gauche-0.6.7.1.tgz
(2) confiugreオプション
     ./configure --enable-multibyte=euc-jp --with-iconv=/usr/local --with-local=/usr/local
(3) 私的なmemo
    * make test して動作を確認すること
    * enable-multibyte=euc-jpはdefault. FreeBSD のconfigure でutf-8 を指定している．
    * enable-multithread=no がFreeBSDのdefault.
      * FreeBSDではBoehm GC がpthread safe ではないらしい
      * LispでもBoehmGC 使うんだ．．．
      * make test のthread はpassするんですが．

== WiLiKi

=== CVSのをインストール by ((<kou>))

  # cd /usr/local/share
  # cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/wiliki login
  # cvs -z3 -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/wiliki co WiLiKi
  # cd WiLiKi
  # ./DIST gen
  # ./configure
  # make
  # make install

wiliki.cgiとかはsrc以下にある．

=== インストール by ((<szk>))

WiLiKi-0.3 をインストールしました．が．．．

(1) 入手先
     http://www.shiro.dreamhost.com/scheme/wiliki/wiliki.cgi?WiLiKi%3aRSSMix&l=jp
     http://prdownloads.sourceforge.net/gauche/SXML-gauche-0.9.tgz
(2) インストール先は

     `gauche-config --sitelibdir`

(1) wiliki.cgi, rssmix.cgi, wiliki-sample.css はまだ ~suzuki/gauche/WiLiKi/src の下

(2) まだrssmix.cgi が動きません．はてな？
    まだ gauche がうまく使えない．シクハックして debug．
    * --enable-multithread=noでconfigureされていたので, RSSを集めるためのthread を作るところでnot implemented の error がraise.
    * cgi-main が :on-error でerror をcatchし，ERROR ページが表示される．
    * portsのMakefile には BoehmGCとFreeBSDpthreadは駄目らしいと書いてある．
    * でも multithread でconfigureして，動かしてみたが，thread は動くようだが，RSSはゲットできず，だんまりに．．．
    * その後調べたら，threadの中のhttp-getが終わってしていないもよう．ログでは，HTTP のGETは正常に終わっているように見える．はて．
    * thread やめてみるとRSSはとれるようになるが，SXMLでエラー？
