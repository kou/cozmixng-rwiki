= kou::メモ::-2004


  * がびーん．phttpdが開発終了だって．．．

  * [Fit] なんだろう．((<FitNesse|URL:http://fitnesse.org/>))

  * [PostScript] BoundingBoxの単位はinchじゃなくてpointじゃないか？

  * [Rabbit] 今週の/~kou/以下のトラフィックの半分はrabbit-0.0.6.tar.gzなんだけど．まぁ，画像が多いからねぇ．大体80件くらい．

  * [Rabbit] rabbit-0.0.6.tar.gzが今までにないくらいもりもりダウンロードされている．lftpが多い．((<こ|URL:http://developer.momonga-linux.org/wiki/?StatusReport-20041218>))((<れ|URL:http://developer.momonga-linux.org/viewcvs/trunk/pkgs/rabbit/>))の影響か？

  * [Rabbit] 探訪Rubyに載っているということでLinux Magazine 2005年1月号を買ってしまった．

  * [風博士] ロケーションエントリで過去に入力したURIを自動で補完するには~/.kazehakase/kzrcのGlobalセクションに以下を記述．

      use_auto_completion=true

  * [ID3] ID3の文字エンコーディングを変換するやつってないかなぁ．

  * [GTK+] GTK+を使って解像度を得るにはどうすればよいのだろう．

    こうか？

      require "gtk2"
      Gtk.init
      width = Gdk::Screen.default.width
      width_mm = Gdk::Screen.default.width_mm
      resolution = (width * 25.4) / width_mm
      p resolution

  * [URI] ((<Codes for the Representation of Names of Languages|URL:http://www.loc.gov/standards/iso639-2/englangn.html>))

  * [風博士] テキストエリアにいるときはキーを奪わないで欲しいなぁ．

  * [RSS Parser] ((<Tea for Miki. - Rubyを使ってRSSを生成する|URL:http://www.tea4miki.org/articles/2004/11/15>))についてごにょごにょ．

    makerに設定する文字列のエンコーディングがShift_JISならこんなことを書いておくとよいです．

      maker.encoding = "Shift_JIS"

    出力するRSSのエンコーディングを変えたいなら，rss.to_sするまえにこんなことを書いておくとよいです．

      rss.output_encoding = "UTF-8"

  * [IME][IMM] Windowsでuimを使いたいな。関係するのは((<Active Input Method Manager|URL:http://msdn.microsoft.com/library/default.asp?url=/workshop/misc/AIMM/AIMM.asp>))
とか((<Input Method Editor|URL:http://msdn.microsoft.com/library/default.asp?url=/library/en-us/intl/ime_5tiq.asp>))あたりか？？？

  * [風博士] Ctrl+ホイールで一ページずつ移動するようにするには，((<URL:about:config>))を開いて，mousewheel.withcontrolkey.actionを1に設定する．

  * [h2g2] ((<これ|URL:http://hobbes.nmsu.edu/cgi-bin/h-browse?dir=/pub/.arch-download/hhgttg>))を聞いて英語の勉強だ．

  * [Ruby/RSVG] 作った．作業時間は4,5時間かなぁ．

  * [それいけ PC-UNIX] 適当なカウンタだから信頼性は薄いのだけど，全ページのトータルヒット数が100,000を越えていた．そんな2004-11-12．

    たまに，「それいけ Linux」で検索する人もいるのね．なんか，Googleで実際に検索してみるとトップに出てくるし．

    久しぶりにトップを見たけど，（更新履歴に書いてないやつもあるし）15コくらいソフトウェアを公開してたのね．更新履歴に書いてある最初のやつが2003/2/9だから，21ヶ月で15コくらい，ってことは平均すると1ヶ月半で1コ作っていることになるのね．うーん，この2年でだいぶ成長したなぁ．と，自分で言ってみる． :-P

  * [LibRSVG] Rubyバインディングはまだないのか．やる気がしない時にでも作ってみるか．あるとRabbitで使えそうだし．SVGはベクトルベース（？）だからEPSの変わりに使えるかもしんない．

  * [RSS Parser] ↓は手元では直した．parseしてto_sしてparseしても同じ内容になっていることを確認するテストを書かなきゃなぁ．（もう，この時点でテストファーストではないんだよな）

  * [RSS Parser] RSS::RDF#to_sしたときに，削除してはいけない空行（/rdf/channel/description/text()の中の空行とか）を削除している気がする．

  * [Linux][DAT] st（SCSIテープ）モジュールをロードする必要がある．

      % sudo modprobe st

    認識されているかどうかはdmesgを見たり，以下のコマンドを実行したりすればわかる．

      % sudo mt -f /dev/nst0

  * [Ruby/GnomePrintUI] 実は手元にあったりします．終了時にSegmentation faultを起こすので公開していませんが．たぶん，g_object_unrefしすぎなんだけど．．．どこで？？？

  * [CDR] クダーじゃなくてシーディーアール．日本語を使うときはUTF-8なのか？SJISで書き込んだらWindowsで文字化けしてた．

  * [DIG2004] 学生大賞は学部生までって．．．

  * [Gtk] 透過のヒントはtestgtk/shapeなんとか.rbにありそう。

  * [Rabbit] むむむ．rabbit-0.0.3.tar.gzが異常にダウンロードされているぞ．しかもlftp/3.0.9から．しかも全部.jpから．

    何かのパッケージにでもなったのか？？？libfetchだったらFreeBSDなんだろうけど，lftpってなんだろう．

  * [Gtk] ポップアップメニューはGtk::Menu#popup

  * [XVL] 

      # blockquote
      # cite = http://www.xvl3d.com/ja/support/xvl-etc/specification/
      # title = XVL仕様書
      == 非公開部分について

      XVLの仕様には、すべてのユーザに公開している部分と、特定ユーザのみに公開している部分がある。特に、ファイルフォーマットに関する部分は、原則として非公開である。

      従って、ユーザによっては、本仕様書のなかでリンクがあっても、実際には閲覧できないページがある。 

    ってことは*.xv?をパースする部分を作るのはすごい大変（というか面倒臭い）なんじゃないの？XVLを扱いたい時は製品を買えって事か？うーん，XVLは自由じゃないのか．だったらX3Dの方がいいなぁ．といってもまだ何も調べていないから，実はX3Dも自由じゃないってことがあるかもしれないんだけど．

  * [Debian] カーネル2.6でUSBマウスを使うときはusbmouseをmodprobeしないといけない．でも，デスクトップだとmodprobeしなくても使えているんだよなぁ．SDカードリーダ付きだから？？？

  * だめだ，やるべきことがやる気しない．

  * [((<SPA|URL:http://spa.jssst.or.jp/>))] 葛野君に教えてもらったやつ．

  * [Mozilla] tabextensionsを入れるとタブが出なくなるときは，~/.mozilla/default/XXXXX/pref.jsとか~/.mozilla/default/XXXXX/tabextensions.jsを以下のように変更すればよい．いっそ，コメントアウトとか削除しちゃってもよいかも．

      -pref("browser.tabs.extensions.use_another_binding", true);
      +pref("browser.tabs.extensions.use_another_binding", false);

  * [Rabbit] なんで，Ruby de GUIのRuby-GNOME2のリンクに，Rabbitがあるんだろう．いや，嬉しいんですけど．

  * [WikiLink] 一ヶ所typoがあった．．．てゆーか，なんで，typoで無限ループになるんだ？

  * [WikiLink] グループがバグっている．使っていなかったからなぁ．

  * [甚八] 葛野君が絡んでたのか．

  * [甚八(jiMPachi)] そう，こういうの（Rubyで書かれているやつ）が欲しかったの．

  * [GaUnit] 英語のドキュメントがだめだめって((<言われている．．．|URL:http://tunes.org/~nef/logs/scheme/04.07.04>))

  * [ノートPC] 電源を入れても起動しないときは，メモリをはめなおすと起動することもある．

  * [シェル] ひとつ前の単語を消す（zshではC-w，tcshだとたぶんbackward-delete-word）では無くてひとつ前のパスを消すのが欲しい．例えば，

      % cd /a/b/c |（←の「|」はカーソル）

    というのがあったときに，C-wとかを押したらこんな風になって欲しい．

      % cd /a/b|

    でもって，もう一回C-wとかするとこうなる．

      % cd /a|

  * [Debian] タブが開けない．mozilla-tabextensionsがおかしいみたい．removeすると開けるようになった．

  * [Debian] ((<Bug#232282|URL:http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=232282>))はいつクローズされるんだろう．

  * [The RWiki] だいたい1時間おきにアクセスしてくる61.210.244.59って何者だ？User Agentは"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)"だといっているけど，人間だとは思えない．

  * [bot] "Bloglines", "RssBandit", "Sage"


  * [bot] "Ask Jeeves/Teoma"

  * [WikiLink] HOMEをLink::IndexPageにすると@formatがNaviFormatになっちゃってうまくないなぁ．どうしよう．

  * [ドキュメント] ソースに書かれたドキュメントからマニュアルを生成するんじゃなくて，テスト（とそこに書かれたドキュメント）からマニュアルを生成できれば嬉しいんだけどなぁ．テストこそドキュメントであるという考えかた．

  * [RSS] どうしてRubyで実装されたスタンドアロンでGUIな電工掲示板風じゃないRSSリーダがないんだ？ひとつくらいあってもよさそうなのに．まぁ，個人的にはWikiLinkがあるから別に必要はないんだけど．

  * [LLW2004] Gaucheの宣伝にいったんだか，((<Rabbit>))の宣伝にいったんだか．．．

  * [LLW2004] 交通費・宿泊費を頂けたので非常に助かりました．

  * [LLW2004] ((<スライド|URL:http://pub.cozmixng.org/~gallery/kou/screenshot/rabbit/n-queens/>))．((<配布資料|URL:http://pub.cozmixng.org/~kou/llw2004.pdf>))．ソースは((<ここらへん|URL:http://www.cozmixng.org/repos/gauche/tsm/trunk/sample/nqueens/>))

  * [LLW2004] Python関係の人はPythonはいい，Pythonはいいって言っていた気がする．そのほかの陣営はあまり気にならなかったなぁ．Ruby関係の（とある）人はRubyに文句を言ってたくらいだし．

  * [Rabbit][FreeBSD] Tempfileを使うとrubyがSEGVるのはRuby/GTK2が悪いからみたい（ruby.core調べ）

  * [DIG2004] ((<DIG2004|URL:http://www-cg.cis.iwate-u.ac.jp/DIG04/index2.html>)) 受け付け開始が2004/10/1で，〆切が2004/10/31．今年は((<Rabbit>))で受賞できたらいいな．

  * [本] ((<Blog Hacks - プロが教えるテクニック & ツール100選|URL:http://www.oreilly.co.jp/BOOK/bloghks/>))

  * [128.104.8.231] 212.65.244.2と同じ

  * [Rabbit] 作り始めたのは2004-07-02からみたい（Subversion調べ）．

  * [Anthy][uim] .uimで設定した，generic-off-key?が無視されるのを解決するにはanthy.scmを以下のようにすればよい．ちなみに，trunkでは修正されているよう．

      - (define-key anthy-latin-key? generic-on-key?)
      + (define-key anthy-latin-key? 'generic-off-key?)

  * [212.65.244.2] なんだこいつ．testとかguestとかadminとかuserとかrootとかでsshでログインしようとしていやがる．パケットフィルタリングしたほうがよいかなぁ．

  * [Rabbit] 画像到着！だいぶ見た目がよくなりましたなぁ．やっぱり絵は大事だなぁ．

  * [Rabbit] 毎度のことながら思ったよりうけなかったなぁ．

  * [The RWiki] なんだこいつ．大量アクセスしてきやがって．ブロックだ．210.159.193.17 "Bitgear Image loader"

  * [dsm] あーー，HTTP対応とかUNIXドメインソケット対応とか書くのを忘れた．うぅぅ．明日だな．

  * [RWiki] ん？まだCVSにはコミットできないのかな？

  * [RSS] ((<多くのRSSリーダではまともに処理できないようだ|URL:http://web.sfc.keio.ac.jp/~s01397ms/d/?date=20040614#p02>))ってRSSじゃないものをRSSリーダが処理できないっていわれても，それは酷な話じゃ．．．((<RSS Parser>))でパースしてみて情報が取り出せなかったので，((<RSS Parser>))ってぜんぜんだめじゃんとか思ってしまった．

  * [Hiki] ((<編集履歴のページに前後のリビジョンとのdiffへのリンクを表示するパッチ|URL:http://pub.cozmixng.org/~kou/diff/hiki-history.diff>))

  * [URL] 面白い．((<URL:http://homepage3.nifty.com/oatu/misc/ht.html>))

  * [Swig] ようやく，パッチがコミットされそう．

  * [音] normalizeを使えば，音量をあげることが出来るみたい．

      % for x in *; do; normalize -gain 4 $x; done

  * [Ruby] REXMLは変だ．なんで，textはunnormalizeされたテキストがくるのに，attributeはunnormalizeされていないテキストがくるんだ． 

    修正パッチが取り込んでもらえた．

  * [((<GaUnit>))] ports化のあおりをうけて，((<RSS Parser>))よりも今週のダウンロード数が多くなっています．

  * [職] ((<ＩＴエンジニアのための転職情報|URL:http://homepage2.nifty.com/KUMANO/>))

  * [GTK] ((<GUIS|URL:http://starynkevitch.net/Basile/guisdoc.html>))ってGauche-gtkのgtk-listner(だっけ？)と同じようなやつかな？

  * [P2P] ((<P2Pの誤解|URL:http://japan.internet.com/column/webtech/20040331/6.html>))

  * [Libcroco] GNOMEのCSSパーサだって．CSS2に対応しているみたい．Cで書かれている．

  * [VB] AddressOf演算子を使っても高階関数は使えない。AddressOf演算子はDLL中のコールバック関数のためにあるんだそうで。

  * [Ruby] 某書籍にURLを載せていいかというメールがきた．もちろん快諾．光栄です．

  * [Ruby] "a9".succ -> "b0"

  * [Access] DAOよりADOの方が新しい

  * [音楽] GRAPEVINEの名前をすぐ忘れてしまう．

  * [Gallery] ((<なめらかアルバム|URL:http://sappari.org/hiki/hiki.cgi?%A4%CA%A4%E1%A4%E9%A4%AB%A5%A2%A5%EB%A5%D0%A5%E0>))も使えるようにしようかしら。

  * [Haskell] ((<URL:http://www.teu.ac.jp/kougi/koshida/Prog6/>))

  * [ソフトウェア] gDesklets．gkrellmよりかっこいい．

  * [Debian] discoverってのがあったんだ．すごい楽．

  * 時間がないので，あとで読む．((<firefoxからエディタを利用する方法|URL:http://www.mew.org/~kazu/toy/firefox-editor.html>))

  * [zphoto] --html-suffixを追加するパッチが取り込まれた．

  * [FreeBSD] 音の鳴らし方．

    /boot/loader.confに

      snd_driver_load="YES"

    と書いておけば

      device          pcm

    としてカーネルを再構築しなくてもすむ場合もある．

  * [Scheme] ((<SICPのビデオ|URL:http://swiss.csail.mit.edu/classes/6.001/abelson-sussman-lectures/>))

  * [((<RSS Parser::Tutorial.en>))] 誰かはわからないけど添削してもらった．だめだめな英語を直してくれて感謝してます．と日本語で書いてみる．

  * [Dia] ControlかAltが付いたキーをIMに渡さないから中国語が入力できない人がいたのでせっせとパッチを書いては送る．

    caseの書き方が嫌．フラグをいろいろ使うのが嫌．ついでに英語が嫌．

  * [((<WikiLink>))] ファイルには書き込まれているけど，ページには反映されていない．うーん．

  * [((<WikiLink>))] 前から気づいていたんだけど，なんか，新規登録できない．前は，二回連続で保存すれば登録できたんだけどなぁ．

  * [RWiki] 荒らし？Wed Mar 03 06:09:28 JST 2004に210.156.40.65によって((<Subversion>))中のSubversionという文字列が<B style="color:black;background-color:#ffff66">Subversion</b>に置換されていた．

    Googleでハイライトされたテキストをそのまま保存したのかな？？

  * [Dia] CVS HEADにpreedit stringを表示させる/入力したマルチバイト文字を正しく扱うパッチがようやく((<あたった|URL:http://bugzilla.gnome.org/show_bug.cgi?id=135930>))．

    パッチを添付するフォームを見付けられなかったから，コピペしたら怒られた．．．あんなとこにフォームへのリンクがあるなんてわからないよ．．．

  * [本] おもわず((<高村薫の本|URL:http://tkj.jp/bessatsu/4796638857/>))を買ってしまった．はやく，マークスの山読みたいな．

  * [((<RSS Parser>))] ((<内部的にはutf-8で処理している|URL:http://jarp.jin.gr.jp/diary/200402c.html#200402241>))のはXMLパーサとしてREXMLを使っているからでしょう．ちなみに，RSS::RDF#encodingで内部エンコーディングがわかります．

  * [Gauche][Parameter][Thread] スレッド中でloadしたファイルの中にmake-parameterがあるとそのスレッドローカルなparameterになってしまい，新しく生成されたスレッドからは見えなくなる．しかも，別スレッドでloadしてもparameterは見えない(みたい)．parameterがあるファイルはrootスレッドでロードすること．

  * [RWiki] aggressive development (idea)

    * RWiki専用クライアント
    * あ．．．ふとんの中で考えたのをほとんど忘れてる．．．

  * [Music] Norah Jonesを聴いてみよう．

  * [EmacsLisp] エラー(シグナル？)ハンドリングするにはcondition-caseを使う．

  * [Emacs][VC] C-x v aでChangeLogに書く内容を計算してくれるのか．あった気がすると思ってたんだけど，思い出せなかったからC-x 4 aしていた．

    日付だけじゃなくて時刻も挿入できるとなおうれしいんだけどなぁ．

  * [名前] 更新履歴がRecentChangesなWikiが多いなぁ．WiLiKiみたいに編集履歴にしようかなぁ．

    でも，個人的には更新履歴というとWiki全体での更新履歴じゃなくてそのページがどのように更新されてきたかというページ毎の更新履歴という感じがするんだよなぁ．だから，Hikiでもページのどこが変更されたかを見ようとして更新履歴にいっちゃってこれはRecentChangesじゃん．とか思うんだけど．

    まぁ，更新履歴でも編集履歴でもそのページの履歴という気がするのでしばらくしたら更新履歴じゃなくて編集履歴にしとこう．混乱は少ない方がいい．．．よね．

  * [フォント][アンチエイリアス][Debian] ようやくアンチエイリアスが効くようになった．

    /etc/fonts/fonts.confの以下の部分をコメントアウト．

      <edit name="embeddedbitmap" mode="assign">
              <bool>t</bool>
      </edit>

    FreeBSDにはfonts.conf相当のものはないのかなぁ．Debianの/etc/fonts/fonts.conf.debian相当のものなら/usr/X11R6/etc/fonts/fonts.confにあるけど．

  * [フォント] フォントの確認は以下のどちらでもできる．

      % fc-list | lv

      % nautilus fonts:///

  * [フォント] 液晶の自動サブピクセルレンダリングが有効かをチェック

      % xdpyinfo -ext RENDER | grep sub-pixel

    で以下のように表示されたらOK

      Screen 0 (sub-pixel order Horizontal RGB)

  * [Dia][Debian] IMで入力中のテキストを表示するパッチ for 2004/2/8のCVSのHEAD

    本家に取り込まれたので削除．

  * [Mozilla] F7を押すとキャレットモードになる．

  * [zsh] 最初のタブで補完する．

      setopt menu_complete

    私は補完して欲しくないので，こんなことはしない．

  * [継続] ((<"Martin Gasbichler and Michael Sperber, Final Shift for call/cc: Direct implementation of Shift and Reset, ICFP '02, 2002."|URL:http://citeseer.ist.psu.edu/gasbichler02final.html>))

  * [((<RSS Parser>))] TrackBackモジュールのAPIをどうしよう．

    悩んでいるのはtrackback:pingとtrackback:aboutの値を取得する方法．RSS 1.0の場合は

      item.trackback_ping.resource
      item.trackback_about.resource

    になるのは確定なんだけど，RSS 2.0の場合がねぇ．現在は

      item.trackback_ping.content
      item.trackback_about.content

    なんだけど，手元では

      item.trackback_ping
      item.trackback_about

    で取得できるようにしてみた．この場合だと，テキストしか中身のない要素の値は要素名と同じアクセサで直接参照できる，というポリシーを満たしている．ただ，使う側がRSS 1.0かRSS 2.0かで処理を振り分けなきゃいけなくなるんだよな．ということで，RSS 1.0でもRSS 2.0でも

      item.trackback_ping.resource
      item.trackback_about.resource

    で取得できるようにした方がいいのかなぁ．ただ，そうするとポリシーがなぁ．

  * [Ruby] ((<R.U.B.Y|URL:http://www.clio.ne.jp/home/web-i31s/Flotuard/Ruby/R.U.B.Y.txt>))おもしろい．．．bladeできた．

  * [Ruby] ((<RSS Parser>))((<標準|ruby-dev:22691>))((<添付|ruby-dev:22720>))((<なる|ruby-dev:22732>))((<か？|ruby-dev:22735>))

  * [Gallery] うぉーーーー，使っている人を((<はじめてみた|URL:http://mordenpaint.com/IMAGES/136/theme.html.en>))．でも，パスとか変更していないからCSSとかJavaScriptが使えていない．．．mod_rubyで動いているのかなぁ．

    とか思ったけどそんなことないじゃん．単にGA付属のテンプレートをRubyPhotoで使っただけか？

  * [Wiki] ログインじゃなくてリンクの張り具合によるユーザっぽさでユーザ毎に設定を変えてはどうか？

  * [Dia] ((<パッチを送った|URL:http://mail.gnome.org/archives/dia-list/2004-January/msg00019.html>))のになにもリアクションがないのはつらいなぁ．忙しいからみてられないとか，こんなんじゃだめだとか言ってくれればいいのに．英語の書き方が悪いのかなぁ．やる気なくなるなぁ．ということで，自分に送られてきたパッチは素早く処理しようと思うのでした．といっても，こないんだけど．

  * [YaTeX][prosper] prosperだとdviじゃきちんとプレビューできないからプレビューアにはdvipsしてgvを使うことにする．

      (setq dvi2-command "dvigv")

    dvigv

       #!/bin/sh
       dvips $1
       gv $1

  * [TeX][Debian] dvips: ! virtual recursion stack overflowを解決するには

      % sudo apt-get remove --purge dvi2ps-fontdata-{n2a,a2n}

    ついでに，gs-jaをデフォルトのgsにしておく．

      % sudo update-alternatives --config gs

  * [tgif] 影付きの絵を書く

    (1) [編集] -> [形に影を付ける]で3,3とかを指定．

        .Xresourcesに

          Tgif.ShapeShadowSpec: 3,3

        と書いても良い．

    (2) 背景を白とかに設定する．
    (3) [編集] -> [形]で絵を書く．

  * [LAML] ((<The LAML Home Page|URL:http://www.cs.auc.dk/~normark/laml/>))

  * [Flash] ((<Flash for Linux|URL:http://f4l.sourceforge.net/>))．時間ができたらRubyで作ろうと思っていたんだけどなぁ．拡張言語としてRubyとSchemeが使えるやつ．

  * [Emacs] [Quack] quack-fontify-styleがpltの時でも:keywordとか<class-name>の色が変わって欲しいなぁ，ということでad-hocに対応．

      (require 'quack)
      (defconst quack-pltish-fls-base
        `(("\\<<\\sw+>\\>" . font-lock-type-face)
          ("\\<:\\sw+\\>" . font-lock-builtin-face)
          ,@quack-pltish-fls-base))

  * [Emacs] list-mode.el由来のモード(SchemeモードとかEmacs-Lispモードとか)では"(def..."というフォームは定義フォームだと判定される．これはlisp-indent-function中で

      (string-match "\\`def" 

    とされているためで，

       '(default 1
                 2)

    としたくても

       '(default 1
          2)

    となってしまう(lisp-body-indentが2のとき)．うーん，どうしよう．

  * [WikiLink] RSSをパースした結果のHTMLを書き出すJavaScriptを出力できるようにしようかな．もちろんカテゴリ/グループ/リンク毎に．

    ネタなので時間ができてからね．

  * [論文] ((<IPSJ PRO|URL:http://www.ipsj.or.jp/sig/pro/>))

  * [Apache] 指定したIPアドレスからまたは認証に成功したクライアントからの接続を受け付ける設定

      Order deny,allow
      Deny from all
      Allow from 192.168.0.0/255.255.0.0

      AuthUserFile /path/to/.htpasswd
      AuthGroupFile /path/to/.htgroup
      AuthName "Auth Realm"
      AuthType Basic
      require valid-user

      Satisfy Any

    大事なのがSatisfy Any．Anyにしておくといづれかの認証方法(Orderによる認証やAuthによる認証など)をパスすると接続が許可される．Allだと全ての認証方法をパスしなければ接続を許可しない．

  * [Game] ((<Insaniquarium Game|URL:http://www.popcap.com/gamepopup.php?theGame=insaniquarium>))

  * [RSS] Ruby/RSSを改良(?)しているAustionからメールがきた．"I wanted to point you to the CVS for おいらのRSSプロジェクト"だそうだ．どういう意味だ？注意を向けて欲しいってこと？

    つーか，おいらのAPIは((*とても*))自然で使い易い．まぁ，あんたのライブラリのAPIとおいらのAPIとは比べ方がよくわからんけど．ってなんだ？馬鹿にしてるのか？

    ライブラリのユーザは特にRSSを作るのが簡単な方がいいって本当か？簡単にパースできて，パースされた内容をいじりたいんじゃないのか？

    ということで，なんて返事書けばいいんだ？結局，おいらのライブラリの方が良いからおまえもおいらのやつを手伝えって書いてあるようにしか読めんのだが．あ，バリデーションをどうすりゃいいのかわからんとも書いてあるな．

  * [ビデオ] ((<スーパーマリオブラザーズ|URL:http://home.megapass.co.kr/%7Ekys706700/moSMB3.wmv>))

  * [CSS] ((<印刷用スタイルシートのススメ|URL:http://alt.s31.xrea.com/tips/print_css.html>))

  * [椅子] ((<イトーキ　パソコン対応チェア|URL:http://www.rakuten.co.jp/moreliving/534112/534121/534703/536642/#484714>)) 

  * [お仕事] 結局おあずけです．まぁ，忙しくなりそうだからちょうどよかったかな．

  * [RSS] Sam Rubyのプレゼン資料: ((<ETCon:  Tutorial|URL:http://www.intertwingly.net/slides/2003/etcon/>)) ((<Seybold: Seybold 2003|URL:http://www.intertwingly.net/slides/2003/seybold/>))

  * [真綾] ((<末っ子長男姉三人|URL:http://www.tbs.co.jp/suekko/>))の7話にでてたのに見逃したー．出てるって知ったのがまさに番組終了時だなんて．．．

  * [CSS] ((<ブロックレベル要素をセンタリングする方法 - Web標準普及プロジェクト|URL:http://www.mozilla.gr.jp/standards/webtips0004.html>))

  * [UI] ((<Eclipse User Interface Guidelines|URL:http://www.eclipse.org/articles/Article-UI-Guidelines/Index.html>))をあとで読んでおこう．

  * [((<Audacity|URL:http://audacity.sourceforge.net/>))] freeなaudioエディタ．波形を見ながら編集できるし，多重録音(?)もできる．でも，うちのマイクだと録音できない．なんでー？alsaの設定が悪いのかなぁ．Windowsだと録音できるから接続はうまくいっているはずなんだけどなぁ．

    alsaとkernelのバージョンをあげたら録音出来るようになった．

      % cat /proc/asound/version 
      Advanced Linux Sound Architecture Driver Version 0.9.6.
      Compiled on Sep 19 2003 for kernel 2.4.22-1-k7 with versioned symbols.

  * [((<Julius|URL:http://julius.sourceforge.jp/>))] Juliusはフリーの高性能音声認識ソフトウェアです。数万語の語彙を対象とした文章発声の認識が行えます。だそうです．

  * [((<Borges|URL:http://segment7.net/ruby-code/borges/>))] Rubyで実装されたContinuationベースのWeb Application Framework．といってもSmalltalkからの移植らしい．

  * [((<opossum|URL:http://opossum.sourceforge.jp/>))] Ruby/GTK ベースの POS 端末です。バーコードスキャナと併用して、お手軽に商品会計を行うことを目的としています。だって．面白いなぁ．

  * [GIMP] ピンぼけした写真を修正する方法を教えてください．例えば，((<これ|URL:http://pub.cozmixng.org/~gallery/momi/La%20vie%20quotidienne/kilt%20014.jpg.html.ja>))とかを修正する方法なんか．

  * [読み方] CRLFは「((<クァリフ>))」と読む

  * [RSS] ((<Re: [tDiary-devel] Re: Reference to RSS version from <link> element|URL:http://www.tdiary.org/archive/devel/msg01108.html>))を後で考えよう．

  * [HNS] よくわからんけどrss.cgiを入れて欲しいなぁ > ((<葛野君|URL:http://kuzuno.jp/diary/>))．とここに書いてみたりする．なんか，日記に書いてある内容と関係ないことはツッコミづらい．

  * [WebApp] ((<Lisp in Web-Based Applications|URL:http://lib1.store.vip.sc5.yahoo.com/lib/paulgraham/bbnexcerpts.txt>))

  * [Scheme] ((<Lightweight Languages 2003 (LL3)|URL:http://ll3.ai.mit.edu/>))のFunctional Reactive Programming in Schemeが面白そう．ビデオでいうとSession 2の2時間ぐらいたったところらへんから2時間30分位までの部分．((<参加した人のレポート|URL:http://tabesugi.net/memo/2003/b1.html>))

  * [TeX] ((<Prosper|URL:http://www.cc.kyushu-u.ac.jp/RD/watanabe/RESERCH/PROSPER/>))っていうのがあるんだ．卒論の資料はこれで作ろう．

  * [FreeBSD] IRQを調べるにはdevinfo(5.x以降)とかpciconfを使う．

  * [Scheme] define-syntaxでこんなことはできないのか．．．な？

      (define-syntax foo
        (syntax-rules ()
          ((_ (name arg ...) body ...)
           (define (name arg ...)
             body ...))))
      
      (foo (bar baz . options)
        hoge)

  * [ギャラリー] ruby 1.8.1 (2003-10-31) [i386-freebsd4]に付属のcgi.rbだとファイルがアップできない(multipartのデータをパースできていないみたい)．ということで，手元のruby 1.8.1 (2003-11-08) [i386-linux]に付属のcgi.rbをコピーしておく．

  * [日本語入力] sodipodi + uimだとsegvる．sodipodi + im-jaだとできる．ということで，今のところ以下のような感じ．

      % alias sodipodi="GTK_IM_MODULE=im-ja \sodipodi"

    sources.listにはこれ

      deb http://im-ja.sourceforge.net/ ./
      deb-src http://im-ja.sourceforge.net/ ./ 

  * [ruby-gnome2] for sid

      deb http://ruby.yi.org/debian/ sid ruby-gnome2

  * [uim] ~/.uimの設定。

      ;;; -*- mode: scheme -*-

      (define _generic-on-key generic-on-key)
      ; (define generic-on-key
      ;   (lambda (key key-state)
      ;     (or (_generic-on-key key key-state)
      ;         (and (control-key-mask key-state)
      ;              (char=? (char-downcase key) #\o))))) ; C-o
      (define generic-on-key
        (lambda (key key-state)
          (or (_generic-on-key key key-state)
              (and (control-key-mask key-state)
                   (= (to-lower-char key) 111))))) ; C-o

      (define _generic-off-key generic-off-key)
      ; (define generic-off-key
      ;   (lambda (key key-state)
      ;     (or (_generic-off-key key key-state)
      ;         (and (control-key-mask key-state)
      ;              (char=? (char-downcase key) #\o))))) ; C-o
      (define generic-off-key
        (lambda (key key-state)
          (or (_generic-off-key key key-state)
              (and (control-key-mask key-state)
                   (= (to-lower-char key) 111))))) ; C-o

      (define ja-direct-rule
        (append '(
                  (" " " ")
                  )
                ja-direct-rule))

      (define ja-rk-rule
        (append '(
                  (((",") . ()) ("，" . "，"))
                  (((".") . ()) ("．" . "．"))
                  )
                  ja-rk-rule))

  * [日本語入力] PRIMEはなんか癖があって合わないな。頻繁に確定しないといけない。連文節変換が実現されたら、また使ってみよう。ということでAnthyを使うことにする。

    uimも使いはじめたんだけど、mozillaだと変換候補が左上のほうにいっちゃって書くのに集中出来ないなぁ。

  * [PRIME] PRIMEも試してみる．sources.listには以下を追加．

      deb http://prime.sourceforge.jp/debian ./
      deb http://taiyaki.org/debian ./

    うーん．これもいいねぇ．PRIMEで様子を見よう．

  * [Anthy] Anthyをいれてみる．cannaと同じ使い心地．乗り換えようかなあ．.emacsにはこれ．

       (setq default-input-method 'japanese-anthy)
       (anthy-load-hiragana-map anthy-alt-char-map)

  * [WikiLink] OPMLに対応しようかなぁ．

  * [学会誌] よくわからないけど，とりあえずメモ．((<URL:http://www.ipsj.or.jp/members//Magazine/Jpn/3804/index.html>))

  * [お仕事] Wikiとかギャラリーとかをバイト先で使えそう．ただし，自分で説明文やデザインを考えろだって．おいらにデザインって．．．

  * [WikiLink] グループページを追加．レイアウトを変更．本当に使う人いるのかなぁ．まぁ，いいか，自分は使っているんだし．

  * [Gauche] Debianのgauche 0.7.2-1だと make-server-socket が動かない

  * [PWM] 動いていない．とりあえず放置2．
    * devel/loggerのせいだった．progNameがprognameになっていたから．

  * [WikiLink] channelにしか更新時刻情報(dc:date or pubDate)がないRSSの場合，RSS::Maneger#recent_changesが呼び出されるたびにitemにdc_dateがついていってしまう．先頭のitemにだけつけるようにしたいが，まぁ，とりあえず放置．

  * [Subversion] アップデートに関するHow to ((<URL:http://svn.collab.net/repos/svn/trunk/notes/repos_upgrade_HOWTO>))

  * [お仕事] Wikiとかギャラリーとかをバイト先で使えなそう．

  * [Subversion] フォーマットが変わるらしい．面倒くさいな．どうしよう．

  * [NetHack] WikiLinkにNetHackのリンクが追加されていたので思わずやってしまう．うーん，分かりづらい．

  * [お仕事] Wikiとかギャラリーとかをバイト先で使えそう．

  * [Lisp,XML] ((<URL:http://www.graco.c.u-tokyo.ac.jp/~kamina/>)) 後で読んでおこう．

  * [((<tluc|URL:http://www.tluc.org/>))] ティーエルユーシーと読むそう．Rubyの勉強会が盛岡であったのでお邪魔してきました．こういうのは初めてなのでこういうもんなのか，と思って興味深く参加させて頂きました．えぇ，楽しかったですよ．ただ，少々濃いとは思いましたけど．．．

  * [((<デジタル・イーハトーヴ・グランプリ2003|URL:http://www-cg.cis.iwate-u.ac.jp/DIG03/index2.html>))] あれ、岩大に書類おくってたんだけどよかったのかなぁ。まぁ、もう締め切りすぎてるからどうしようもないけどさ。

  * [Wiki] 木曜の午後に((<group-2003: 最近の更新|URL:http://pub.cozmixng.org/~wiliki/group-2003.cgi?c=r&l=jp>))を何度もリロードするのが好きです。ものすごい勢いで書き換えられていて面白いです。

  * [UI] やっぱり((<説明という行為は最後の手段|URL:http://www.laplace-lab.org/diary/archives/000048.html>))だよな．

  * [test] あとで((<dW : Java technology : Javaコードの診断: テスト可能な アプリケーションの設計|URL:http://www-6.ibm.com/jp/developerworks/java/020125/j_j-diag0911.html>))よんどこ．

  * [JavaScript][XML] ((<Hawk'sW3L: XMLデータを扱う|URL:http://www.hawk.34sp.com/smpview.php?src=tips_xml>))

  * [Wiki] ((<VisulTour|URL:http://todo.is.os-omicron.org/tiki.cgi?c=v&p=VisualTour>)) WikiLinkにもこんなのつけたいなぁ。

  * [Scheme] SICPに出てくるPainterのImageMagickを使った実装((<URL:http://www.scheme.dk/imagemagick-for-mzscheme/examples/painters/>))

  * [視力] ((<得するテレビ 1月27日の放送内容|URL:http://www.asahi.co.jp/toku/html/bn_20020127.html>)) ((<視力回復|URL:http://www.age.ne.jp/x/ichiki/WP/WP.html>))

  * [ssh] ((<FreeBSD QandA 2255|URL:http://www.jp.freebsd.org/QandA/HTML/2255.html>))コマンドを制限するにはこうするのか．

  * [((<WIkiLink|URL:http://pub.cozmixng.org/~rwiki/index.rb?cmd=view;name=WikiLink>))] Linkのページを更新してもCategoryのページが更新されない．storycardではどうやってindexページを更新しているのかが分からん．とりあえず，同じページを二回保存すると更新される．

  * [((<デジタル・イーハトーヴ・グランプリ2003|URL:http://www-cg.cis.iwate-u.ac.jp/DIG03/index2.html>))] とりあえず，応募用紙を書いてみた．

  * [uptime] 平均すると120days。次回も停電で停止になるのかな？

  * [NPO] ((<いわてＮＰＯサポートルーム|URL:http://www.iwate-npo.org/>))あとで読んでおこう。

  * [CSS] ((<CSS  Laboratory|URL:http://is.vis.ne.jp/>))

  * [RD] とりあえずメモっておく．((<RD記法|URL:http://yebisu.ics.es.osaka-u.ac.jp/~kawaji/rd_howto.html>))

  * [gFTP] SFTPを使うには、メニューのFTP->オプション->SSH->Use SSH2SFTP subsysにチェックする。

  * [((<コンパイラ演習レジュメ|URL:http://www.is.s.u-tokyo.ac.jp/~vu/01/jugyo/processor/process/soft/compilerresume/index.html>))]　あとで読んでおこう。

  * [Konqueror] IEよりも(CSSが)使えないかも．

  * [MUSIC] このあいだ実家に帰ったときに「((<ハチポチ>))」買ったばかり((-いや，中古なんだけど-))なのにもう「((<ニコパチ|URL:http://www.jvcmusic.co.jp/maaya/newrelease/>))」がでてる．初回はDVD付きだって．いいなぁ．でもDVDプレーヤ無いしな．

  * [MUSIC] 日本語情報のあるCDDB．設定->その他->ファイル名に日本語(EUC-JP)を使用する，にチェックを入れればGripでも使える．

    * http://ns.w7r.net/~cddb/cddbeuc.cgi

    こっちはどうなんだろう．

    * http://ns.w7r.net/~cddb/cddb.cgi

      EUCに変換しないやつかな．

  * [MUSIC] 実家に帰ったとき(2003/8/9-2003/8/17)に((<PUNK CHIPS|URL:http://www.lastrum.co.jp/Music/punkchips/>))というCDが太陽堂のレジのところに売ってあった。オムニバスCD+Tシャツ付きで1500円というお買い得価格+ファンキーなパッケージなので思わずゲット。内容もよく、今夏一番の買い物だったのではないかと思う今日この頃(2003-08-29)。

  * [VB] 文字列中で"をエスケープするには？

      * """ => "
      * """" => "
      * """"" => ""
      * """a"" => "a"

    わけわからん

  * [Windows] ルータにするには((<ケーブルテレビのインターネット接続事情|URL:http://www.watch.impress.co.jp/pc/docs/article/20000616/catv13.htm>))あたりを参考に。とりあえず、外部ネットワーク用のNICのプロパティの共有タブで「この接続でインターネット接続の共有を使用可能にする(E)」にチェックを入れればいい。

  * [CSS] ((<URL:http://www.fromdfj.net/>))でも見て勉強しよう

  * [((<独習 Scheme 三週間 Teach Yourself Scheme in Fixnum Days|URL:http://www.sampou.org/scheme/t-y-scheme/t-y-scheme-Z-H-1.html>))]  

  * [((<デジタル・イーハトーヴ・グランプリ2003|URL:http://www-cg.cis.iwate-u.ac.jp/DIG03/index2.html>))] ((<GalleryAdministrator>))でデジタル技術部門に応募しよう。

    * 賞金  等：「((<優秀賞>))」と「((<学生大賞>))」には，表彰状，表彰プレート，および賞金が用意されています．さらに，「((<特別賞>))」には，表彰状と賞品・賞金が別に用意されます．
    * 募集開始：2003年 9月 2日（火）　 （マルチメディア研究会設立記念日）
    * 〆切：2003年10月15日（水）  （消印有効）
    * 発表イベント：2003年11月29日（土） 

  * [((<ActiveSquare|URL:http://www.namo.com/jp/activesquare/>))] すごそうな気がする．でも，このページはAcriveSquareでは作っていないみたい．

  * [((<KartOO|URL:http://www.kartoo.com/>))] すごいよ．

  * ((<JavaScript>))

  * Windows上のSFTPクライアント((<FileZilla|URL:http://sourceforge.net/projects/filezilla/>))(((<日本語化パッチ|URL:http://www.exa5.jp/>)))

  * [Access]((<レポートで連番をつける|URL:http://yokohama.cool.ne.jp/machida/access2.htm#77>))

  * ((<WikiRoom|URL:http://www.wikiroom.com/>))みたいにしっかり((<利用規約|URL:http://www.wikiroom.com/?%CD%F8%CD%D1%B5%AC%CC%F3>))を作らないとだめだな．たぶん．面倒臭い．

  * A Cookbook for Using the Model-View-Controller User Interface Paradigm in Smalltalk-80


  * ImageMagickのdisplayでサムネイル表示

      % display "vid:*.png"

  * Windows用ICONファイルの作り方．

      % ppmtowinicon -o favicon.ico favicon16.ppm favicon32.ppm

    : favicon.ico
        出力ファイル名
    : favicon16.ppm
        16x16のPPMファイル
    : favicon32.ppm
        32x32のPPMファイル

    favicon??.ppmは1〜n個指定可能

  * REXMLはIOオブジェクトでかつUTF-8以外のエンコーディングのXML文書をパースできない．Stringオブジェクトに変換する必要がある．

  * TeX: alltt環境内での上付き文字は\sp，下付き文字は\sb

  * TeX: 細長い<は\langle，>は\rangle．YaTeXでは\C-cmで補完できる．

  * あとで，これやっとこう[2003-05-19 17:58:15(JST)] ((<URL:http://www.atmarkit.co.jp/flinux/rensai/root08/root08c.html>))

  * sodipodiで日本語の文字を表示する

    ベクトルベースのお絵書きソフト．イラストレーターの変わりになるか？

    右クリックでDialogs -> Text Editingでフォントの設定が出来る．ここだと，kinput2で日本語入力も出来る．

  * JDKのAPTの場所

      deb ftp://sunsite.auc.dk/packages/java/java-linux/debian unstable main non-free

  * DebianでのPPPoEの設定(FLET'S ADSL)

    pppoeconfを使うと楽．

    使わない場合は/etc/ppp/{chap,pap}-secretsの最後に

      "接続ID" * "パスワード"

    を書く．chap-secretsの場合は"パスワード"の後に*が必要かもしれない．

    ppp0がupしたときにdefault routeの設定をするように/etc/ppp/if-up.d/以下に次のようなスクリプトを実行権を付けて置いておく．もし，/etc/init.d/ppp startする時点でdefault routeが設定されていなければこれは必要ない．

      #!/bin/sh
      /sbin/route add default dev $PPP_IFACE

    if-up.d以下のスクリプトはファイル名順に実行されるので，ファイル名を0からはじめていたりすると，比較的早く実行してくれる．


  * NISクライアントの設定

    /etc/passwdに

      +:::::::::

    /etc/groupに

      +:*::

    を書く

  * GTK2を用いたアプリケーションでEmacs風キーバインドを用いる

    ~/.gtkrc-2.0に以下を記述

      gtk-key-theme-name = "Emacs"

  * winegcc

      /* winegcc -o msgbox msgbox.c */
      #include <windows.h>
      
      int
      main(int argc, char **argv, char **env)
      {
        MessageBox(NULL, "こんにちは、世界。", "build by winegcc", MB_OK);
        return 0;
      }

  * mingw32msvc-gcc

      % i586-mingw32msvc-gcc -o msgbox.exe msgbox.c
      % wine msgbox.exe

  * ((<Emacs>))

  * すごい！((<w3m-0.4 リリースノート|URL:http://w3m.sourceforge.net/RELNOTE-0.4>))

  * ((<daemontools|URL:http://tools.qmail.jp/daemontools/>))っていいんじゃない？

  * FreeBSDでMozillaの日本語メニューが文字化けする時は~/.mozilla/hoge/fuga/prefs.jsに
      user_pref("fonts.xft.enabled", false);
    と書いておくとよい。

  * FreeBSDでirqを調べるにはdmesgを見るしかないのか？/proc/以下にないのか？lspciとかないのか？使いづらくないのか？
    今日(2003/03/05)のためにpccardのNICを使えるようにしようとして/etc/pccard.confに以下のように書いておいた。機種(?)はLaneedのLD-CDS。IRQの8番は使えないと言われた。
      irq 9 13

    * devinfoとかpciconfとかでしょうか？ - f

    * なるほど，((<FreeBSD QandA 1408|URL:http://www.jp.freebsd.org/QandA/HTML/1408.html>))を見ればよかったんですね．devinfoは5.x以降か．情報ありがとうございます． - kou

  * こいつは楽だなぁ．((<＠IT：パケットをキャプチャするには|URL:http://www.atmarkit.co.jp/flinux/rensai/linuxtips/424cappkt.html>))

  * Apacheで"/~ユーザ名"じゃなくて"/ユーザ名"だけで"/home/*/public_html"を表示するには以下のようにするとよい。ただし、"/manual/"とかいうようにユーザ以外のパスが使えなくなる。

      AliasMatch ^/([^~/][^/]+)/(.*) /home/$1/public_html/$2

  * proxyを越えてSubversionを使う．((<URL:http://subversion.tigris.org/project_faq.html#proxy>))

  * ssh port forwardingでproxyを越えてSubversionを使う．

      % ssh -L 10000:www.cozmixng.org:80 -f www.cozmixng.org ping -i 60 localhost > /dev/null
      % svn co http://localhost:10000/repos/...
