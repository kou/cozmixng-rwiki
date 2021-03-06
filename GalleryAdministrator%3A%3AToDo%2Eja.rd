= GalleryAdministratorのToDo

なんと((<Yahoo!にも同じ様なサービス|URL:http://photos.yahoo.co.jp>))があった．

差別化を計るためにも何か出来た方がいいだろう．まぁ，オープンソースってのが最大の売りでもあるんだけどね．

== メモ

=== メールインターフェイスが使いづらい

メール本文に認証情報などを含めるのは使いづらい気がする。

==== 理由

  * mailtoのqueryで件名とか本文とかの値を指定できない場合がある。
    * auの携帯ではできないものがあるものを確認。

  * mailtoのqueryで日本語を指定するときの文字コードをどうすればよいかわからない。
    * 現在はISO-2022-JPをURLエンコード
    * 文字化けするメーラとしないメーラがある。これはブラウザの問題も関わってくるのだろうか。

==== 解決案

  * ユーザ管理で自分のメールアドレスが登録できるのだからそこから送られてきたメールは認証されたものとする。

    * 危険ではないか？メールのFromなんて簡単に詐称できるではないか。おまけに生成されるHTMLにメールアドレスも含めることが出来るのでその人がどのメールアドレスを登録しているかはすぐにわかってしまうし。

  * mailto:にしないで，メールアドレスを入力してもらってそこに画像登録用メールのテンプレートとなるメールを送ればいいのかな．

  * うーん。

== 未解決

=== 遅い

処理時間はテンプレート数に比例．

テンプレートを一種類だけに限定するといくらかは良くなるけど，それじゃあなぁ．

RubyPhotoをベースにしている限りこれは解決しそうにないなぁ．

=== リファクタリング

今は一枚岩なのでモジュール化しよう．

もう，汚すぎで嫌になっちゃう．

=== 圧縮されたファイルからギャラリーを展開

いちいち一個ずつ画像をアップするのは面倒だろうという事で，あらかじめ階層化されたギャラリーを圧縮して一つのファイルとして送ることでギャラリーを生成できるようにしたら便利なんじゃない？

=== 英語が変

どうしようもないよ、これは。。。

== 解決

=== 依存ライブラリを選択できるように

同じ様な機能を提供するライブラリがいくつかあったりします(例えばXMLパーサには((<RAA:xmlscan>))や((<RAA:REXML>))等があります)．できれば，この機能を提供するライブラリのどれか一つがあれば使えるようにしたいです．

とりあえず，((<RAA:RMagick>))がなくても((<RAA:Imlib2-Ruby>))か((<RAA:Ruby-GNOME>))があれば動くようにしたいです(これは((<RAA:RubyPhoto>))の問題)．

=== うごかないらしい - (2003-09-24)

あとで((<URL:http://arika.org/tmp/gallery-svn20030920.patch>))をみておくこと

typoを直した．

=== 作成者の情報を入力できるようにする - (2003-07-14)

ユーザ管理から出来るようにした．

=== パスワードファイルの名前 - (2003-07-04)

.htpasswdから.gallerypasswdに変更

0.0.3では.htpasswdでも.gallerypasswdでもオッケーで，0.0.4,5,6くらいからは.gallerypasswdのみにしようっと．

=== 動作を軽快に - (2003-06-04)

画像数、ギャラリー数、テンプレート数に比例して処理時間が延びていきます。CGIなのでどうにかしたいものです。

  * いくらかは解消されたので，まぁよし．

=== メールインタフェースを付ける - (2003-06-04)

携帯で写真が撮れる時代になりました．なんと，撮った写真をメールで添付することが出来るそうです．メール添付でギャラリーが作れるようになれば興味を持つ人もいるのではないでしょうか？

=== 更新時刻を入れる - (2003-06-04)

どの画像がいつ更新されたのかを入れた方がいいだろうなぁ，多分．そして，更新順表示とか出来たらなおいいだろう．
