= kou::メモ

  * [wsm][ToDo] スナップショットのやつ．

      * 言語を変更する何か．クライアントのACCEPT_LANGUAGEはいじれないから，JavaScriptとCookieだろうなぁ．
      * フッタのレイアウト．著作権表示は入れたいだろう．
      * 最終更新時刻の表示場所．ページの上の方がすぐに見えていいけど，邪魔でもあるんだよなぁ．
      * 最後に更新されてからどのくらい経っているかの表示方法を現在の時刻から動的に変化させたい．JavaScriptを使うしかないな．JavaScriptが使えない環境だと表示されなくていいや．嘘の情報を書いても意味ないし．
      * アナウンスメールを書く．
      * JavaScriptは別ファイルにしたほうがいいかなぁ．いや，ページ毎に固有の状況があるだろうから，esmで動的に作って，ページに埋め込んじゃった方がいいかな．テキストなんだからサイズなんてそんな気になんないだろうし．
      * ダウンロードの種類をパラメタで代えられるようにする．tar.gzあるんだからtarはいらないか．

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
