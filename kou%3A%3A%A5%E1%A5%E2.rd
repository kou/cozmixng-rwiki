= kou::メモ

  * USB NICを買ってきた．おぉ，挿すだけで認識する！さすが．

  * CVSからSubversionにしたら起動時間も使用メモリも増えちゃった．

  * radvdを立ち上げないとダメらしい．

  * しまったー！PCカードのNICあげちゃったんだった．．．
    * ぬっ!あっしも今は無線のNICしかありません。プライベートアドレスに閉じ込めるってのでどうでしょう。念のためNIC二枚挿しのPCをFreeBSDですが用意してDTCPをしゃべるルータになれるようにしときますねー。 - osaru
    * ちょっと探しておきます．
    * ありがとう。 - osaru

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
