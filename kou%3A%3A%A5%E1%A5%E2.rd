= kou::メモ

  * なんだこいつ？行儀悪いなぁ．拒否しよっかなぁ。

    ((<"222.10.18.29: Priscilla/0.10 (http://kiyoya.comthy.org/priscilla/)"|URL:http://kiyoya.comthy.org/priscilla/>))

    うざいから拒否した．リダイレクトに対応していないのかなぁ．

  * アップデートではまる．．．
    * amavisd-newが起動スクリプトを/usr/local/etc/rc.d/じゃなくて/etc/rc.d/以下にインストールするのはなぜだ！？
    * coulier-authlib-userdb見付けられなかった．．．
    * 絶対/usr/local/libexec/courier-imap/{imap,pop3}d.rcはバグっていると思う．

  * Hikiがプラグインエラーのときにエスケープが足りない。 ((<パッチ|URL:http://pub.cozmixng.org/~kou/diff/hiki-escape-exception-message.diff>))

  * assert-in-delta, assert-not-*を作ろう．

  * [Subversion][ToDo] (('del:"temporarily", not "temporally".'))

  * [風博士] ((<ローカルファイルのパスを補完|URL:http://pub.cozmixng.org/~kou/diff/kazehakase-file-completion.diff>)): inline-completeionと組み合わせるとだいぶしあわせに．MLへは少し使ってみてから．

  * ホームユースにはanacron．

  * @pubのためのセカンダリの設定がおかしいなぁ．

  * ((<asin:B00009PJON>))

  * [風博士] Mozilla/Firefoxの設定UIを使う．

    (1) スマートブックマークを編集してchrome:でGoogleに飛ばないようにする．

    (2) Mozillaなら((<URL:chrome://communicator/content/pref/pref.xul>))にアクセスする．

        Firefoxなら((<URL:chrome://browser/content/pref/pref.xul>))にアクセスする．

  * HDDを認識しないときは，BIOSの設定を確認．

  * [WikiLink] dc:rightsの情報も入れる．

  * ImageMagickがバグっている．

      % convert /tmp/a.jpg /tmp/a%x.jpg

    で/tmp/a0.jpgができる．「%」の扱いが怪しい．

  * [Samba] エンコーディング．後で実験．

    * UTF-8を利用

        dos charset = CP932
        unix charset = UTF-8
        display charset = UTF-8

    * EUCを利用

        doc charset = CP932
        unix charset = EUCJP-MS
        display charset = EUCJP-MS

    * SJISを利用

        doc charset = CP932
        unix charset = CP932
        display charset = CP932

    * HEXとCAP

        doc charset = CP932
        unix charset = CP932
        display charset = CP932
        vfs object = cap # or hex

  * [Gallery Administrator][ToDo] RSS Makerを使うように変更する．

  * [RSS Parser][ToDo] 0.1.4リリース．preview出てからの方が良いかなぁ．

  * 新pub構築は5.4が出てからにしようかしら．

  * [FreeBSD] HDDのコピー: ((<FreeBSD QandA 1859|URL:http://www.jp.freebsd.org/QandA/HTML/1859.html>))

  * ロボット（e-SocietyRobot(http://www.yama.info.waseda.ac.jp/~yamana/es/)）がWiLiKiのコンテンツを収集しにくると結構Load Averageがあがるなぁ．拒否した方が良いかしら．

    でも，あがっても誰かが困る程ロボット以外からのアクセスは無いし，別にいっか．

  * 自動でimgのnameを集めてSET_DHTMLに登録できるようにしたら素敵だろうなぁ．

  * ispell -a -m

  * [ToDo] (('del:マクロの引数が違った時のエラーを捕捉する．'))

  * がびーん．藤じゃなくて東だった．．．

  * [ToDo][できれば] Flash挿入用のReaderMacroを作る。

  * [ToDo] (('del:MLを作る。'))

  * [ToDo][できれば] スペルチェック機能をつける。

  * [ToDo] ちゃんとやってるみたい: (('del:起動時に{Reader,Writer}Macroページをパースする。'))

  * [ToDo] ネタはボツ．画像アップロードをサポートした: (('del:画像置場を作る．ネタは思い浮かんだ。'))

  * ((<K2Y|URL:http://pub.cozmixng.org/~kou/ajax/k2y>))

  * Ignore entries under copied directories.

  * ((<Ajax を使った 日本語 IME|URL:http://chasen.org/~taku/software/ajax/ime/>))

  * [Subversion] ようやくHACKINGを((<翻訳|URL:http://pub.cozmixng.org/~kou/text/HACKING.ja>))し終わった．1週間くらいかかった気がする．．．

  * [RSS Parser] Dublin Coreの文字コード変換周りがバグっている．．．converterを伝搬していない感じ．
    
    RSS::Element#childrenをextensibleにしないと．

    こんなこと↑せずに修正．

  * CVSからSubversionへ変換．いらないファイルの履歴は削除する．

      % cvs2svn --dumpfile=repos.dump --dump-only --trunk-only --keywords-off CVSリポジトリのパス
      % svndumpfilter exclude いらないファイルのプレフィックス < repos.dump > repos-filtered.dump

    例:

      % cvs2svn --dumpfile=repos.dump --dump-only --trunk-only --keywords-off CVSREPOS/rd
      % svndumpfilter exclude trunk/navi.rd < repos.dump >! repos-filtered.dump

  * [ToDo] [RSS Parser] (('del:0.1.3をリリースする．'))

  * [ToDo] [Subversion] (('del:commit-email.rbで，コピー先ディレクトリの下にあるディレクトリ追加されたディレクトリとして扱わないで無視するようにする．'))

  * [ToDo] [RSS Parser]
    * (('del:Dublin Core周りのドキュメントを更新する．'))
    * (('del:test/test_maker_dc.rbに複数のDublin Coreを扱えるかのテストを追加する．'))
    * (('del:ruby_1_8にマージする．'))

  * [Ruby] 1.8.3 prevewは来週(12日)っぽいみたい．

  * [Subversion] 1.2.xにRubyのやつが入りそう．RC1には入っているし．

  * [RSS Parser] ようやく複数のDublinCoreの要素（？）を扱えるようになった．

  * [ToDo] (('del:表も作りやすく．'))

  * [ToDo] (('del:ブラウザ上で簡単にルビをふれるようなインターフェイスを作る．MecabだかChaSenとAjaxを使った日本語変換デモをどこかで見たなぁ．'))

  * [Mozilla][風博士] Ctrl+スクロールで1ページ単位でスクロールさせるには((<URL:about:config>))で

      mousewheel.withcontrolkey.action

    を

      1

    にすればよい．

  * ((<hown wiki - モナド|URL:http://howm.sourceforge.jp/cgi-bin/hiki/hiki.cgi?Monad>))

  * [Subversion] Ruby関係じゃないところにパッチを当ててコミットするときはlog messageに以下のようなやつを書くんだって．

      Approved by: XXX

  * [Ruby][Subversion] trunkにマージされた．

  * [Ruby][Subversion] FreeBSDだと落ちる．Svn::Contextにnotify_{func,baton}を設定していないから？libsvn_client/update.c:116とかsvn_wc_get_update_editorが怪しい．update_editorがちゃんと設定されていないのかしら．

  * [CSS] 角を丸くする（IEでもGeckoでも動く）

    CSS:

      # enscript css
      div.round
      {
        background: #f8f;
      }

      div.round p
      {
        margin: 0px;
      }

      div.round span.top,
      div.round span.bottom
      {
        display: block;
        background: #fff;
      }

      div.round span.top *,
      div.round span.bottom *
      {
        display: block;
        height: 1px;
        overflow: hidden;
        background: #f8f;
      }

      span.r1 {margin: 0px 5px}
      span.r2 {margin: 0px 3px}
      span.r3 {margin: 0px 2px}
      span.r4 {margin: 0px 1px; height: 2px}

    HTML:

      # enscript html
      <div class="round">
      <span class="top">
        <span class="r1"></span>
        <span class="r2"></span>
        <span class="r3"></span>
        <span class="r4"></span>
      </span>
      <p>あいうえお</p>
      <span class="bottom">
        <span class="r4"></span>
        <span class="r3"></span>
        <span class="r2"></span>
        <span class="r1"></span>
      </span>
      </div> 

  * ((<[debian-users:43271] Dell PowerEdge SC420にsargeのインストール|URL:http://lists.debian.or.jp/debian-users/200503/msg00128.html>))

  * [XSLT] xsltproc: コマンドラインのXSLTプロセサ．

  * wwwのバックアップ容量が150MB減った．CSDのリポジトリ（無意味に）でかすぎだよ．．．

  * いっちゃんのは見にいけない．．． XO

  * [wsm][ToDo] スナップショットのやつ．

      * done: 黙ってリンクを生成するようにした．(('del:言語を変更する何か．クライアントのACCEPT_LANGUAGEはいじれないから，JavaScriptとCookieだろうなぁ．'))
      * done: ページでカスタマイズできるようにした． (('del:フッタのレイアウト．著作権表示は入れたいだろう．'))
      * 最終更新時刻の表示場所．ページの上の方がすぐに見えていいけど，邪魔でもあるんだよなぁ．
      * done: (('del:最後に更新されてからどのくらい経っているかの表示方法を現在の時刻から動的に変化させたい．JavaScriptを使うしかないな．JavaScriptが使えない環境だと表示されなくていいや．嘘の情報を書いても意味ないし．'))
      * done: (('del:アナウンスメールを書く．'))
      * done: 別ファイルに作ることにした．esmは使わない．esmを使う場合はHTMLに埋め込んじゃう．(('del:JavaScriptは別ファイルにしたほうがいいかなぁ．いや，ページ毎に固有の状況があるだろうから，esmで動的に作って，ページに埋め込んじゃった方がいいかな．テキストなんだからサイズなんてそんな気になんないだろうし．'))
      * done: キーはarchive_type，tarは削除．(('del:ダウンロードの種類をパラメタで代えられるようにする．tar.gzあるんだからtarはいらないか．'))

  * [CGI] ダウンロード

       Content-Disposition: attachment; filename=XXX

  * [Debian] /etc/console-tools/remap

  * [libtool] 共有ライブラリの拡張子を変更

      % ./libtool --mode=link gcc -shrext .bundle ...

    --mode=relinkのときとかに，--tagを指定しろと言われて，さらにLINK-COMMANDがccの時は--tagを指定しなくてもLINK-COMMANDをgccとかにするとうまく動く．

  * ルータできた．

    IPv6のパケット転送を有効にする．

      % sudo sh -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

    DTCPCを動かす．以下のXXXX:XXXX:XXXX:XXXX::/64はDTCPでもらったネットワークプレフィックス．

    eth1にIPv6のアドレスを付加．

      % sudo ip addr add XXXX:XXXX:XXXX:XXXX::2/64 dev eth1

    内部ネットワークのパケットはeth1に送るようにする．

      % sudo /sbin/ip route add XXXX:XXXX:XXXX:XXXX::/64 dev eth1

    RAをするサーバradvdをインストール．

      % sudo apt-get -u --purge -V install radvd

    /etc/radvd.confを作成

      interface eth1
      {
         AdvSendAdvert on;
         prefix XXXX:XXXX:XXXX:XXXX::/64
         {
           AdvOnLink on;
           AdvAutonomous on;
           AdvRouterAddr on;
         };
      };

    radvdを起動．

      % sudo env - /etc/init.d/radvd restart

  * USB NICを買ってきた．おぉ，挿すだけで認識する！さすが．
    * なんだか申し訳ないっす&ありがとう。明日楽しみにしてますねー。 - osaru
    * 明日のv活研は18:30開始ですが、16:30頃から準備していると思いますので、適当なタイミングで紛れ込んでください。 - osaru

  * CVSからSubversionにしたら起動時間も使用メモリも増えちゃった．

  * radvdを立ち上げないとダメらしい．

  * [JXTA] むむん？MLに入っています？？？
    * やば，やらかしたのばれちゃいましたか。 - osaru
    * いろいろ訳があるんすよー。 - osaru

  * [Debian] アップデートしたらアップデートが失敗していてEmacsの初期化がうまく動かないようになってしまった．．．これじゃ何もできないよぅ．

  * [Ruby][FreeBSD] RWikiを再起動させようとしてもcoreを吐いて死んでしまう．

    おっ，RUBY_ENABLE_PTHREADというオプションが増えてるじゃん．これをつければうまくいく．．．かしら．

    いや，デフォルトで有効になっているな．ということは，付けないと（noにすると）いけるのか？

    ビンゴ！FreeBSDのpthreadって嫌い！

  * [Ruby][Subversion]

      # enscript ruby
      def diff(options, path1, rev1, path2, rev2,
               out_file, err_file, recurse=true,
               ignore_ancestry=false,
               no_diff_deleted=false, force=false)
        Client.diff2(options, path1, rev1, path2, rev2,
                     recurse, ignore_ancestry,
                     no_diff_deleted, force, out_file,
                     err_file, self, @pool)
      end

  * [ドメイン] 1年更新．

  * [ストリーミング] ファイアウォールの中からでもNegativeXが聞けるように，expの80番につなげばstreamingの8000番につないだように動作させようと思ったけど出来なかった（時間がないので深く追っていない）．Squidってキャッシュなしリバースプロキシって出来るのかしら．ようは，単なるデータの素通し．Rubyで書いた方が早いかしら．
    * リバースプロキシは作ったことがないんで的外れかもしれませんが，acl と no_cache だかを使って URL に含まれる文字列や dst アドレスなどでキャッシュの有無を設定した覚えがあります。(そういうことでない?) - osaru
    * そういうことなんですが，うまくいかないんです．ということで，勝手に「Squidは全部データを受け取ってからでないとクライアントにデータを送らないんじゃないか」と邪推しているわけです．

  * [DTCP] ((<とりあえず動くもの|URL:http://www.cozmixng.org/repos/ruby/dtcpc/trunk/>))．

  * [IPv6] 亀が踊った！

    Debianなら6in4tunnelをインストールして以下のコマンドでいける．

      % sudo /usr/sbin/6in4tunnel add device デバイス名 ルータのIPv4のアドレス 自分のIPv6のアドレス 2000::/3

    : デバイス名
        好きな名前
    : ルータのIPv4のアドレス
        教えてもらったやつ
    : 自分のIPv6のアドレス
        ネットワーク単位でアドレスをもらっていたら，それの最後に::1とか付ければよい．

    * おめでとさんです。v活研のHikiで繋ぎ方をチョチョっと書いておいてもらえるとうれしいっす。 - osaru
      * DTCHCを作ったらそうしようと思っています．もうちょっと待ってくださいね．

  * [Ruby] ((<Year planner PDF generation in Python|URL:http://www.mechanicalcat.net/richard/log/Python/Year_planner_PDF_generation_in_Python>))をRuby/GnomePrintで書いてみよう．

  * [風博士] ~/.kazehakase/mozilla/kazehakase/prefs.jsに

      user_pref("mozilla.widget.raise-on-setfocus", false);

    と書けば幸せになれるらしい．

  * [e-moriokaコミュニティ] 会員登録しないとMLに参加できないのか．参加するには各団体の管理者にメールだってさ．閉じてるなぁというかそのくらい自動化しようよというか．

  * [Ruby][Subversion] Ruby Subversion bindingをもう一度((<遊び出した|URL:http://pub.cozmixng.org/~kou/diff/>))．

  * ((<kou::メモ::-2004>))
