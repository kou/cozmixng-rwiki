= RWiki Extension Kit

パッケージは
((<ここから|URL:http://www.cozmixng.org/~kou/download/rwiki-ext-0.0.1.tar.gz>))
スナップショットは

  % svn co http://www.cozmixng.org/repos/ruby/rwiki-ext/trunk

でどうぞ．

== 異なったRWiki間でのページのコピー

SOAPを用いる．

=== インストール方法

要 : ((<RAA:SOAP4R>)) >= 1.4.8 and (((<RAA:XMLParser>)) or ((<RAA:REXML>)))

((<RAA:xmlscan>))でもOKか？少なくとも((<RAA:NQXML>))ではダメ。エンコーディングを自分でUTF-8からEUC-JPに変換しなきゃいけないから。たぶん。

  require 'rwiki/soap'

=== 使用法

  (1) 左側のメニューの[((<SOAP|soap>))]へ移動
  (1) コピー元ページ、コピー元ページのあるRWikiサーバ(dRubyサーバ)に接続するSOAPサーバ、コピー(追加)先ページ(省略するとコピー元ページと等しいとみなされる)を指定
  (1) copyまたはappendボタンを押す
  (1) コピー(追加)先ページを編集してsubmit

=== Known Bugs

  * 存在しないページをコピー元ページとして指定するとサーバに接続できないと言われる。

== 異なったWikiのRecentを表示

インストールするとメニューに[RSS 1.0], [RSS Recent], [RSS Topic]というメニューが増えます。

  * [RSS 1.0]は[Recent]の上位15件をRSS 1.0形式で出力します。
  * [RSS Recent]はRSS 1.0を収集して更新順に表示します。
  * [RSS Topic]は各ページに表示されるトピックの設定をします。

You can find [RSS 1.0], [RSS Recent] and [RSS Topic] menus over each page when you can success installation.

  * [RSS 1.0] output top 15 of [Recent] as RSS 1.0.
  * [RSS Recent] collect RSS 1.0s and display those items with sort by update time.
  * [RSS Topic] do settings of a topic of displaying each page.

==== Customize

You can change some default settings. For example expire of cache and so on.

If you want to customize, define below constants:

  * RWiki::RSS::MINIMUM_EXPIRE (minimum cache expire(second) | default : 60 * 60)
  * RWiki::RSS::EXPIRE (default value of cache expire(second) | default : 2 * 60 * 60)
  * RWiki::RSS::DISPLAY (display or not | default : true)
  * RWiki::RSS::DISPLAY_NUMBER (display number | default : 5)
  * RWiki::RSS::DISPLAY_CHARACTERS (display characters | default : 20)
  * RWiki::RSS::TRUE_VALUES (array of value that is recognized true | default : ["はい", "yes", "true"] | 「((<"はい">))」 is "yes" in Japanese)

before

  require 'rwiki/rss'

=== インストール方法

要: ((<RAA:rss>))

  require 'rwiki/rss'

=== Install to RWiki

Require: ((<RAA:rss>))

Add bellow to your rwiki.rb.

  require 'rwiki/rss'

=== TIPS

キャッシュの有効期限の最小値などを変更する事ができます。

変更するには

  require 'rwiki/rss'

する前に

  * RWiki::RSS::MINIMUM_EXPIRE (最低キャッシュ時間(秒) | デフォルト : 60 * 60)
  * RWiki::RSS::EXPIRE (キャッシュ時間のデフォルト値(秒) | デフォルト : 2 * 60 * 60)
  * RWiki::RSS::DISPLAY (表示するかどうか | デフォルト : true)
  * RWiki::RSS::DISPLAY_NUMBER (表示する件数 | デフォルト : 5)
  * RWiki::RSS::DISPLAY_CHARACTERS (表示する文字数 | デフォルト : 20)
  * RWiki::RSS::TRUE_VALUES (真と認識する文字列の配列 | デフォルト : ["はい", "yes", "true"])

という定数を定義してください。

You can change some default settings. For example expire of cache and so on.

If you want to customize, define below constants:

  * RWiki::RSS::MINIMUM_EXPIRE (minimum cache expire(second) | default : 60 * 60)
  * RWiki::RSS::EXPIRE (default value of cache expire(second) | default : 2 * 60 * 60)
  * RWiki::RSS::DISPLAY (display or not | default : true)
  * RWiki::RSS::DISPLAY_NUMBER (display number | default : 5)
  * RWiki::RSS::DISPLAY_CHARACTERS (display characters | default : 20)
  * RWiki::RSS::TRUE_VALUES (array of value that is recognized true | default : ["はい", "yes", "true"] | 「((<"はい">))」 is "yes" in Japanese)

before

  require 'rwiki/rss'

== ImportWiki

異なるWikiのページをこのRWikiで閲覧/編集します．

=== インストール方法

  require 'rwiki/importwiki'

必要に応じて

  require 'rwiki/importrwiki'

とか

  require 'rwiki/importwiliki'

とか．

=== TIPS

  * 上述のコピー機能とあわせて使うと、手元のRWikiのページを他のWikiにコピーできる。

    やり方は、To:にImportWikiNameを書くだけ。たとえば、((*WiLiKi:COZMIXNG:テスト*))とか。


== メニューの名前を変更

(ここでは)左に出ているメニュー名を変更します

=== インストール方法

  require 'rwiki/rename-menu'

以下の((|book|))はRWiki::Bookオブジェクト．

  substitution_table = {
  	"Home" => "ホーム/Home",
  	"Info" => "情報/Info",
  	"Map" => "マップ/Map",
  	"Recent" => "最近の更新/Recent",
  	"List" => "ページ一覧/List",
  	"Page Rank" => "参照状況/Page Rank",
  	"Orphan" => "孤立ページ/Orphan",
  	"Like" => "タイトル検索/Like",
  	"Concat" => "結合/Concat",
  	# navi labels
  	"link" => "リンク/Link",
  	"src" => "ソース/Src",
  	"edit" => "編集/Edit",
  	"help" => "ヘルプ/Help",
  	"search" => "検索/Search",
  }

  book.rename_menu(substitution_table)

== WikiLink

Wikiをバックエンドとしたリンクシステム

=== インストール

  require 'rwiki/link'

  RWiki::LinkSystem.install("WikiLink", "Link", "Category")

これでWikiLinkというページがWikiLinkとなる．わかりづらいな．

=== メモ

  * リンクのページを削除できるようにする．

    * した．[2003-10-09]

      タイトルと説明を消すと削除される．

  * ページにカウンタを付けて良く見られているページが分かるようにする．

    これは，ページが見られる毎にページを書き換えていけばいいだろう．revisionはすぐに増えてしまうけど，Last-modifiedが変わるから誰かが見たことはすぐに分かる．

    * した．[2003-10-09]
