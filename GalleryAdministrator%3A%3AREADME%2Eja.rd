# -*- rd -*-

= README.ja

$Id: README.ja 574 2005-05-20 13:56:34Z kou $

== 作者

Kouhei Sutou <kou@cozmixng.org>

== ライセンス

Ruby's

無保証です。

== お願い

GalleryAdministratorは多言語化されたソフトウェアです．しかし，
私が理解できないため日本語と(それっぽい)英語以外のメッセージ
が用意できません．そのため，私は(しっかりした)英語やフランス
語等のメッセージファイルを求めています．

== メーリングリスト

((<COZMIXNG RWiki - 連絡先
|URL:http://www.cozmixng.org/~rwiki/?cmd=view;name=%CF%A2%CD%ED%C0%E8>))
を御覧下さい．

== バグトラッキングシステム

ご意見ご要望不具合報告等は作者へのメール，上記のメーリングリ
スト，RWikiへの書き込みまたは((<影舞
|URL:http://www.cozmixng.org/~kagemai/?project=gallery;action=top>))
をご利用下さい．

== なにこれ？

((<RAA:RubyPhoto>))と
((<zphoto|URL:http://namazu.org/~satoru/zphoto>))のメールと
CGIのインターフェイスです．

これには拡張版RubyPhotoが付属してあります．拡張版でないと動きません．
また，オリジナルのサンプルは付属していません．

zphotoは，バージョンが1.1以上のものを使うとなおよいです．

複数の言語に対応したギャラリーを生成できます。

サンプルとして(tDiaryの)テーマをユーザが変更できるギャラリー
のテンプレートとJavaScript、携帯用のギャラリーを生成するテン
プレートも付属しています。

== 依存ライブラリ

  * ((<RAA:RubyPhoto>))改(アーカイブに含まれています。)
  * ((<RAA:RMagick>))または((<RAA:Imlib2-Ruby>))または
    ImageMagickのコマンド(convertとidentify)
  * ((<RAA:rss>))(日本語を使うのであれば必須)
  * Iconvバインディングまたは((<RAA:Uconv>))(((<RAA:Uconv>))の方がお奨め)
  * XMLプロセサ(((<RAA:REXML>))2.5.0以上または
    ((<RAA:xmlscan>))または((<RAA:xmlparser>)))

=== あればいいライブラリ

  * ((<RAA:TMail>))(メールインターフェイスを使うのであれば必要)

=== あればいいもの

  * ((<zphoto|URL:http://www.namazu.org/~satoru/zphoto/>))

== 入手方法

((<URL:http://www.cozmixng.org/~kou/download/gallery.tar.gz>))

  % svn co http://www.cozmixng.org/repos/ruby/gallery/trunk gallery

== インストール

  % ruby setup.rb config
  % ruby setup.rb setup
  # ruby setup.rb install

== 設定

いくつかのファイルをコピー(cp)またはリンク(ln -s)して，設定
ファイル(admin.rbやshared.xml)を編集してください。以下の例で
はコピーしています．

=== CGI用

  % cp interface/admin.rb /HTTPでアクセスするディレクトリ/
  % cp sample/counter.rb /admin.rbと同じディレクトリ/
  % cp sample/{http,gallery}.conf /ロードパスが通っているディレクトリ/
  % cp sample/dot.htaccess /HTTPでアクセスするディレクトリ/.htaccess
  % cp sample/scripts/* /JS_PATHに設定したディレクトリ/
  % cp sample/dot.rubyphoto-ignore /ENV["HOME"]に設定したディレクトリ/.rubyphoto-ignore

あとは，

  * admin.rb, httpd.conf, gallery.confの設定を変更
  * admin.rbをCGIとして実行できるように設定（実行権を追加したりなど）
  * admin.rbがGALLERY_DIRとGALLERY_DATA_DIRに書き込めるように設定

して下さい．

=== テンプレート用

sample/templates/にいくつかテンプレートが用意してあるので好きなものを
選択して下さい．複数選択してもかまいません．もちろん，自分で作ってもか
まいません．

zphotoで始まるテンプレートはzphoto用のテンプレートになります．

  % cp -R sample/templates/好きなテンプレート /TEMPLATES_DIRに設定したディレクトリ/
  % cp sample/css/* /CSS用のディレクトリ/
  % cp sample/images/* /画像(アイコン等)用のディレクトリ/

あとは各テンプレートのshared.xmlの設定を変更して下さい．

=== RubyPhoto用

   % cp sample/dot.rubyphoto-ignore /ENV['HOME']に設定したディレクトリ/

  * 日本語用

      % cp sample/album.xml.ja /ギャラリーのディレクトリ/album.xml.ja
      % cp sample/album.xml.ja /ギャラリーデータのディレクトリ/album.xml.ja

  * 英語用

      % cp sample/album.xml.en /ギャラリーのディレクトリ/album.xml.en
      % cp sample/album.xml.en /ギャラリーデータのディレクトリ/album.xml.en

=== メール用

メールで画像を投稿したい場合は，以下の作業も必要になります．

  % cp sample/mail.conf /ロードパスが通っているディレクトリ/
  % cp interface/mail_admin.rb /どこか/

必要ならば，

  % cp sample/dot.forward /ホームディレクトリ/.forward

== 使う

ブラウザでadmin.rbにアクセスして下さい．

== Tips

=== 管理者のパスワード設定

"."は管理者権限を持ったユーザになります．なので，まず，「ユー
ザ登録」で"."のパスワードを設定して下さい．

=== バックアップ

GALLERY_DATA_DIRさえバックアップすればGALLERY_DIRに生成され
るHTMLは完全に復活できます．もし，GALLERY_DIRの内容が消えて
しまった場合は以下のようにして下さい．

  * GALLERY_DATA_DIRをGALLERY_DIRにコピー

    % rm -rf GALLERY_DIR; cp -r GALLERY_DATA_DIR GALLERY_DIR

  * gallery.confのALWAYS_OUTPUT_ALL_HTMLをtrueに変更
  * admin.rbで，適当なギャラリーまたは画像の説明などを変更し
    て保存する．

  * かなり時間がかかると思いますが，HTMLが生成されます．ただ
    し，Flashや他言語のページへのリンクが生成されないと思う
    のでもう一度適当なギャラリーまたは画像の説明などを変更し
    て保存するといいでしょう．さらに，ホームページやメールア
    ドレスへのリンクが全てadmin.rbにログインした人のものにな
    るはずなので，各々のユーザにログインしてもらってHTMLを再
    生成しなければいけません．

うーん，あんまり嬉しくないですね．

=== コンソールからアップデート

sample/initgallery.rbを使います．

  % initgallery.rb --config-file gallery.confへのパス --lang .ja

例えば，gallery.confが~gallery/site/gallery.confにある場合は
こんな感じ．

  % initgallery.rb --config-file ~gallery/site/gallery.conf --lang .ja

進行状況を表示したかったら--verbosity 3を指定する．

  % initgallery.rb --config-file ~gallery/site/gallery.conf --lang .ja --verbosity 3

ちなみに，英語用のギャラリーを更新したい場合は--lang .enを携
帯用は--lang .ja.iを指定してください．

== 感謝

  * おばたさん: たくさんのバグレポートと，いくつかのパッチを
    頂きました．ありがとうございます．
