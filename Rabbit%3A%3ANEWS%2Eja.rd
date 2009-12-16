# -*- rd -*-

= NEWS.ja

$Id: NEWS.ja 1330 2009-12-16 13:07:47Z kou $

== 0.6.2から0.6.3の変更点: 2009-12-16

=== 改良

  * [#180] Wikiフォーマットの定義リスト内でインラインマーク
    アップが効かない問題を修正。
    [kdmsnrさん]
  * 執事うさぎを標準テーマに追加。
  * 印刷時でもデフォルトでは拡大・縮小後の画像を使用。
  * アルファチャンネル付きのpixbufレンダリング対応。
    （cairoレンダリングエンジン使用時）

==== テーマ

  * 追加
    * lightning-monochrome:
      高橋メソッドスライド + モノクロな通常スライド
  * 変更
    * default-block-quote: 背景画像の透明度を指定する
      @block_quote_image_background_alphaパラメーターを追加。
    * default-preformatted: テキストの自動サイズ調整をカスタ
      マイズできるようにした。@preformatted_keep_in_sizeパラ
      メータで変更可能。
    * clear-blue: デフォルトで左下にタイトルを表示するように
      変更。無効にする場合は以下を追加するとよい。
        include_theme("clear-blue")
        @slide_footer_info_left_text = ""
  * 箇条書きと列挙のネスト"itemize > enum"と
    "itemize > itemize > enum"に対応

==== 実験的

((*変更される可能性があります。*))

  * タグのサポート

    構文:
      (('tag:name:内容'))
    または
      (('tag:name'))内容

    例:
      slide.rab:
        (('tag:center'))どうもどうも

      theme.rb:
        match("**", CustomTag) do |tags|
          tags.each do |tag|
            case tag.name
            when "center"
              tag.parent.horizontal_centering = true
            end
          end
        end

    出力（テーマ適用前）:
      +-------------------+
      | どうもどうも      |
      +-------------------+

    出力（テーマ適用後）:
      +-------------------+
      |   どうもどうも    |
      +-------------------+

=== 修正

  * Ruby 1.9でフルスクリーンが動かない問題を修正 [助田さん]
  * [#179] マウス使用時にクラッシュすることがある問題を修正
    [kdmsnrさん]
  * newline-in-slidesテーマ: 整形済みテキストでは改行を置換
    しないようにした。
  * フルスクリーン解除時にカーソルが表示されない問題を修正

=== 感謝

  * 助田さん
  * kdmsnrさん

== 0.6.1から0.6.2の変更点: 2009-10-03

=== 改良

  * RabbitがMacPortsの正式パッケージになった！ [木村さん]
  * Wikiの'''すごい強調'''マークアップに対応 [kdmsnrさん]
  * Wikiマークアップでレベル2以上のセクションを無視
    [kdmsnrさん]
  * テーマ
    * pdf-tortoise-and-hare: 画面端とうさぎとかめの間にマー
      ジンを設定
    * clear-blue: うさぎとかめの画像が変更可能に。
    * set_font_resolution_ratioの追加。文字の大きさを一括で
      変更できる。
  * rabbit-mode: rabbit-commandに対応。
  * prototype.jsをアップデート: 1.4.0 -> 1.6.0
  * 両端揃えに対応。
  * 現在のスライドをRDフォーマットで取得するコマンドを追加。
  * --geometryオプションの追加。
  * RubyGemsに対応。

=== 修正

  * lightning-simpleテーマでallotted-timeの設定が無視される
    問題を修正。 [西山さん]
  * システムのDPIによって文字の大きさが変わってしまう問題を
    修正。 [西山さん]
  * 画面とPDFで文字の大きさが変わってしまう問題を修正。
    [西山さん]
  * GDKバックエンドで画像がリサイズされない問題を修正。

== 0.6.0から0.6.1の変更点: 2009-07-17

=== 改良

  * 画像をディスプレイ表示時はGdk::Pixbufで拡大縮小してから
    描画
  * テーマ
    * lightning-talk-toolkit: :hide-titleをサポート
    * slide-show: ループ毎にタイマーをリセット
    * slide-show: 持ち時間からデフォルトのスライド切り替え時
      間を算出
  * デフォルトで"\n"を使用可能に変更
  * Wikiフォーマットがスライドプロパティに対応
  * RDフォーマットがネストした箇条書きの'wait'に対応 [西山さん]

=== 修正

  * GPLのライセンス文を追加
  * 画面サイズが変わったときにPDFのサイズが拡大縮小されない
    問題を修正
  * タイトルページしかない場合にインデックスモードに変更でき
    ない問題の修正 [rabbit-shockers:654] [おばたさん]
  * ブロックレベルでのwaitが動かない問題の修正 [おばたさん]

== 0.5.9から0.6.0の変更点: 2009-05-23

=== 改良

  * Bonjour対応: [木村さん]
  * マスコットキャラクタ「たいらび」の追加: [モモさん]
    * ((<URL:http://www.cozmixng.org/repos/rabbit/trunk/sample/momo/tailavi/>))
  * ウィンドウタイトルにサブタイトルも表示
  * スライドプロパティ対応
  * 「うさぎとかめ」が使えないような場でのプレゼン用の代替画像を追加
  * PDFに埋め込む画像をリサイズ前の元画像を埋め込むように変更

=== 修正

  * sample/kof2005/gesture.rbの修正: [#143][いわいさん]
  * インストールドキュメントの修正: [zundaさん]
  * 英語の修正: [Eduardoさん]

== 0.5.8から0.5.9の変更点: 2009-02-09

  * 改良
    * HTML出力: PDFへのリンク対応
    * Rabbitをコマンドラインから制御するrabbit-commandの追加
    * 鏡に反射したような画像効果のサポート
      （kdmsnrさんからのリクエスト）

      使用例:
        * ((<URL:http://www.clear-code.com/archives/SendaiRubyKaigi01/love-and-continue-it-104.html>))
        * ((<URL:http://www.clear-code.com/archives/SendaiRubyKaigi01/love-and-continue-it-085.html>))

      書き方:
        # image
        # src = XXX.jpg
        # relative_height = 80
        # reflect_ratio = 0.5

  * テーマ
    * 新規テーマ
      * pdf-tortoise-and-hare:
        PDFビューアとしてRabbitを使うときに、うさぎとかめタ
        イマーを使う。持ち時間はRABBIT_ALLOTTED_TIME環境変数
        で指定。

        使い方:
          % RABBIT_ALLOTTED_TIME=4.5m rabbit --theme pdf-tortoise-and-hare XXX.pdf
      * lightning-clear-blue:
        青っぽいclear-blueテーマの中でたまに大きな文字のスラ
        イドを使う。
      * title-on-image-toolkit:
        画像の上にタイトルを重ねる。

        使用例:
        ((<URL:http://www.clear-code.com/archives/SendaiRubyKaigi01/love-and-continue-it-036.html>))

        使い方:
          スライド:
            = ユーザーズグループ

              # image
              # src = shocker.jpg
              # relative_height = 90

          テーマ:
            include_theme("title-on-image-toolkit")

            match(Slide) do |slides|
              slides.each do |slide|
                slide.title_on_image if slide.title_on_image?
              end
            end

  * バグ修正
    * Wikiフォーマットの検出を失敗する問題の修正

== 0.5.7から0.5.8の変更点: 2008-10-19

  * 改良
    * Clutterのサポート
      * ページ切り替え時の効果をサポート
      * スライド上に流れるコメント表示方法をサポート
    * IRCバックエンドのサポート
      * RabbIRC（やまださん）
  * テーマ
    * 引用マークに影を追加
    * ヒラギノフォントを優先的に使うように変更
    * 新規テーマ
      * newline-in-slides: \nで改行を入力
  * バグ修正
    * 虫眼鏡でマウスポインタを掴みつづける問題の修正
    * Tofuバックエンドが動かなくなっている問題の修正
    * Asakusa.rbで報告されていた問題の修正

== 0.5.6から0.5.7の変更点: 2008-07-31

  * バグの修正
    * 壊れたPDFを出力問題の修正
  * 改良
    * GTK+/Quartz対応（Mac OS Xネイティブで動く）
    * Control + 左クリックでコンテキストメニュー（おばたさんに
      よる提案）
    * align = XXXで:rightや"left"を指定可能にした
    * (('note:XXX:YYY:...'))というようにラベルを入れ子にでき
      るようにした
    * 「次」・「前」アクション（ポーズを考慮した移動アクショ
      ン）の追加
    * 「タイマーリセット」アクションの追加
    * コマンドラインでフルスクリーンが指定された場合はできる
      だけ早くフルスクリーンにするようにした
    * Wiki形式で{{wait}}と{{br}}を使えるようにした
    * サンプルのスライドが汚かったのをいいかげんに直した
  * テーマ
    * 本体部分の余白を増やした
    * 項目マークの種類に"dash"を追加
    * デフォルトテーマのリストマークでMagicPoint由来のド派手
      な色を使うことをやめた
    * ひととおりプロパティを網羅
    * 新規テーマ
      * newline-in-title: \nで改行を入力
      * edge-info-toolkit: スライドの端に何かを表示
      * slide-header-info: スライドの上部に何かを表示
      * slide-footer-info: スライドの下部に何かを表示
      * footer-logo: スライドの下部にロゴを表示
      * blue-bar: スライドの上下に青いバーがあるテーマ
      * clear-blue: 青っぽいテーマ

== 0.5.5から0.5.6の変更点: 2008-04-21

  * RTtoolの削除
  * 少しRuby 1.9対応
  * ポーズ対応

== 0.5.4から0.5.5の変更点: 2008-03-01

  * バグの修正
    * テストの修正（おばたさんによる報告）
    * --marginオプションの修正
  * RubyGemsでインストールされているHikiDocのサポート
  * Tgif関係のファイルが残っていたものを削除（おばたさんに
    よる報告）
  * 必要のないwindows-adjustテーマの削除
  * 索引ページ生成時の進行状況メッセージの表示をやめた
  * --log-levelオプションの追加
  * MacPorts用のドキュメントを更新
  * rabbit-mode.el:
    * 不要な変数の削除

== 0.5.3から0.5.4の変更点: 2007-12-15

  * ドキュメントの更新
    * ruby.stのURLを修正（きたさん）
    * MacPortsのドキュメントを更新（木村さん）
  * テーマ
    * night-blackテーマの色設定を追加
    * slide-logoテーマの追加
    * slide-footerテーマの追加
  * バグの修正
    * cairoバックエンドが利用可能かどうかのチェックを修正
    * Wikiパーサの読み込みエラーを修正（おばたさんによる報告）
    * Windows上での警告を除去
    * Windows上での"/"の扱いの修正（中井さん、おばたさん）
  * バックグラウンドでの作業状況をログに出力（おばたさんによる提案）
  * PDFをデフォルトの印刷フォーマットに変更
  * 箇条書きの印として「チェック」をサポート
  * --show-native-window-idオプションの追加
  * Wikiパーサでの<<< LANG\n...\n>>>のサポート
  * サンプルに引用を追加
  * 入力として画像ファイルをサポート
    （Rabbitが画像ビューアにもなる）
  * 画像の大きさの指定としてas_large_as_possibleを追加
  * setup.rb cleanでconfig.rbを削除（小林さん）
  * Tgifサポートの削除
  * --manオプションの追加（小林さん）
  * 入力としてslideshare.netのサポート
  * ドラッグアンドドロップのサポート

== 0.5.2から0.5.3の変更点: 2007-08-04

  * テーマ
    * Day White/Night Blackテーマの追加（たださん）
    * テーマ確認用スライドの追加（たださんによる提案）
    * 緑の円テーマの追加。
    * Auto SlideをSlide Showに変更。
    * テーマ（のコード）を綺麗に。
  * ドキュメントの更新
    * INSTALL.win32（むとうさん、zundaさん）
  * バグの修正
    * ページ一覧でのエスケープ漏れの修正（前田さんによる報告）
    * GRClosure絡みの問題の修正（やまださん）
    * ソース再読み込み時のクラッシュバグの修正
    * --output-index-htmlなしで--output-htmlを指定したときに発
      生するバグの修正。
    * 印刷時にフォントが反映されないバグの修正。
  * GIMPサポートの改良（やまださん）
  * libgnomeprintサポートの削除。
  * Wiki記法（HikiDoc）のサポート。
    （本リリースのみhikidoc.rbを同梱）
  * PS/PDFの品質が微妙である記述の削除。
  * 虫眼鏡のon/offをメニューに追加。
  * スポットライトのon/offをメニューに追加。
  * 部分レンダリングのサポート。
    （ソースレベルの文法は未サポート）
  * {start,stop}_reload_timer -> {start,stop}_redraw_timer
    （後方互換性のため{start,stop}_reload_timerも使用可能）

== 0.5.1から0.5.2の変更点: 2007-06-02

  * ドキュメントの更新
    * rabbit-mode.el（武田くん）
    * MacPorts（木村さん）
  * rabbit-mode.elの改良（武田くん）
    * rabbit-default-image-size-unit変数の追加
  * 起動に失敗するバグの修正（atzmさんによる報告）
  * その他、細かな修正（おばたさんによる報告）

== 0.5.0から0.5.1の変更点: 2007-03-29

  * 入力フォーマットとしてPDFサポートを追加。
  * rabbit-mode.elの改良。（武田くん）
    * rabbit-copy-slide: 追加
    * rabbit-duplicate-slide: 追加
  * フランス語のメッセージの更新。（スクリチくん）
  * 印刷時のフォント名の不具合の修正。
  * libgnomeprintサポートの廃止。

== 0.4.2から0.5.0の変更点: 2006-11-03

  * GtkGLExtのロード絡みのバグを修正．（かくたにさん）
  * rabbit-mode.elの改良．（武田くん）
  * emerge関係のドキュメントの更新．（あかぴさん）
  * MacPorts用のドキュメントの追加．（きむらさん）
  * RSVGのパス解決に対応策を追加．
  * （役に立たない）Ruby/Anthyのサポート．
  * マルチディスプレイ用情報ウィンドウのサポート．
  * フォント名にRabbit/Rabbit Monospaceがあったら，優先的に
    使うようにした．
  * アフィン変換系のAPIの追加．
    * canvas.rotate_context
    * canvas.scale_context
    * canvas.translate_context
    * canvas.reflect_context
    * canvas.shear_context
  * 描画情報を保存しておくAPIの追加．
    * canvas.save_context
    * canvas.restore_context
  * lightning-talkテーマでは"\n"で改行できるようにした．
  * aroundフックの追加．
  * 新しいテーマの追加．
    * rotate-zoom-effect
    * emphasize-keyword
    * scroll-effect
    * mirror-effect
  * スポットライト機能の追加．
    ((<URL:http://pub.cozmixng.org/~gallery/kou/screenshot/rabbit/spotlight/>))
  * 虫眼鏡機能の追加．
    ((<URL:http://pub.cozmixng.org/~gallery/kou/screenshot/rabbit/magnifier/>))
  * グラデーションのサポート．
  * setup.rb 3.4.1を使うように変更．

== 0.4.1から0.4.2の変更点

  * 検索時の正規表現のバグを修正．（西川さん）
  * ドキュメントを修正．（西川さん，きたさん）
  * rabbit-mode.elの追加（武田くん）
  * HTML生成のバグの修正．（かくたにさん）
  * アリスの画像を追加．（朝日奈さん）
  * rabbit-mode.lの修正．（みやむこさん，id:wata_dさん）
  * 高橋エイリアスから高橋メソッドへ．
  * Ruby/Popplerを用いたPDF表示のサポート．
  * OpenGLサポートの改良．
  * RabrickでのAJAXをサポート．
  * 携帯電話をサポート．
  * メモり使用を改善．

=== 他のニュース

  * きむらさんがMac OS Xのパッケージ（DarwinPorts用）を作ってくれました．

