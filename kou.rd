= kou

((<ToWantToDo>))

COZMIXNGいいだしっぺ．
Matz日記にツッコミを入れた事はありません（念のため）．

  * ((<kou::Link>))
  * ((<kou::読書>))
  * ((<kou::メモ>))
  * ((<kou::ToDo>))
  * ((<Amway>))
  * ((<WebApplicationFramework>))
  * ((<日本語プログラミング>))
  * ((<GTK>))
  * ((<Rubyで関数プログラミング>))
#  * ((<WiLiKi:COZMIXNG:kou>))
  * ((<リアルタイムカウンタ>))
  * ((<SWIG>))
  * ((<Self>))
  * ((<gpg>))
  * ((<QuickCam>))
  * ((<cogito>))
  * ((<GW-US54GXS>))
  * ((<OpenSSL>))
  * ((<WX310SA>))
  * ((<CUPS>))

== 小物

  * ((<isary.rb>))
  * ((<svn-utils>))
  * ((<Test::Unit::Ext>))

== プロジェクト

  * ((<Pseudo Web Mail>))
  * ((<RWiki改造計画>))
  * ((<(('Ruby/RSS'))>)) => ((<RSS Parser>))に変更
  * ((<GalleryAdministrator>))
  * ((<ImportWiki計画>))
  * ((<RWiki Extension Kit>))
  * ((<Rabbit>))
  * ((<gdchart>))
  * ((<esm>))
  * ((<GaUnit>))
  * ((<dsm>))
  * ((<scratch>))
  * ((<marshal>)) => ((<msm>))に変更
  * ((<wsm>))
  * ((<benchmark>))
  * ((<tsm>))
  * ((<xsm>))
  * ((<Cutter>))
  * ((<RD2TeX>))
  * ((<scim>))
  * ((<SCIM-RubyBridge>))

# == 作りたい(るべき)もの

#  * ((<XML Validator for Ruby>))

== 調べもの

  * CVSで有効なタグの一覧を取得するにはどうしたらいい？
    
      % cvs status -v

    でいけるみたい．

  * FreeBSDのXFree86 4でマウスの左右のボタンを同時押しで真中ボタン押しになる設定(Emurate3Buttons)はどうすればいいの？

    * これでいいのか？いちおうきいているみたいだけど。(2003/03/24)
        Section "InputDevice"
                Identifier  "Mouse0"
                Driver      "mouse"
                Option      "Protocol" "auto"
                Option      "Device" "/dev/psm0"
                Option      "Emurate3Button" "true"
        EndSection

  * zshでタブ一発目は一覧表示だけにするにはどうしたらいいの？今は一発目から補完侯補が順に補完されちゃう。
    * デフォルトの動作がお望みのもののように思えてならないのですが。zsh -Y (MENU_COMPLETE)になってませんか？ -fuyuki
    * あ，本当だ．ありがとうございます．快適に過ごせるようになりました．

== ぼそ

  * 私家版REXML APIリファレンスかREXML 2.4.2のサンプル付きXPathの関数リファレンスかはしらないが，excellentなドキュメントをありがとうってメールを頂く．日本語は読めないけど充分役だったよ，だって．((<その人のページ|URL:http://www.lypanov.net/>))(だと思う)．なんかKDEプロジェクトのDeveloperみたい．(2003-05-05)

  * REXMLのTutorialの和訳をしたからあなたのサイトに載せてというメールを頂く(2003/03/06)。知らない人から(スパム以外の)メールをもらうなんてはじめて。

  * 献血したついでにメルシーのパソコンのお気に入りにCOZMIXNGのURIを追加しておく。2003/02/27
