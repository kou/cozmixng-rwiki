= svn-utils

Subversionのための小物たち(Powered by Ruby)

== 含まれているもの

  * commitメールを送信したり，commit RSSを出力するスクリプト

== 入手方法

アーカイブはありません．

  % svn co http://www.cozmixng.org/repos/ruby/svn-utils/trunk/ svn-utils

== bin/commit-email.rb

commitメールを送信したり，commit RSSを出力するスクリプト

=== 設定

リポジトリ/hooks/post-commitを以下のようにする．実行権を付けるのを忘れずに．

  #!/bin/sh
  REPOS="$1"
  REV="$2"
  
  PATH=/usr/local/bin:/usr/bin:/bin
  # ↑ svnlookとかrubyとかcommit-email.rbがあるパスを含めること．
  export PATH
  
  commit-email.rb \
    "$REPOS" "$REV" メールを送るアドレス \
    -I svn-utils/libへのパス \
    -r リポジトリのURI（最後に/を付けない） \
    --rss-path 出力するRSSへのパス（URIじゃない！） \
    --rss-uri RSSのURI \
    --name プロジェクト名 \
    --error-to エラーが起こった時に通知先アドレス \
    --from メールのFromにするアドレス

ちなみに，RSSを出力しなくてもよいならこれでよいです．

  commit-email.rb \
    "$REPOS" "$REV" メールを送るアドレス \
    -I svn-utils/libへのパス \
    -r リポジトリのURI（最後に/を付けない） \
    --name プロジェクト名 \
    --error-to エラーが起こった時に通知先アドレス \
    --from メールのFromにするアドレス

とにかく動かしたいならこれでもよいです．

  commit-email.rb \
    "$REPOS" "$REV" メールを送るアドレス \
    -I svn-utils/libへのパス

=== 設定例

RWikiの((<リポジトリ|URL:http://www.cozmixng.org/repos/rwiki/>))では以下のようにしています．

前提:

  * svn-utilsは~kou/work/ruby/svn-utils/以下にチェックアウトしてある．
  * svnlookとrubyは/usr/local/bin/以下にある．
  * コミットメールはrwiki-commit@ml.cozmixng.orgというMLに送る．
  * リポジトリのURIはhttp://www.cozmixng.org/repos/rwiki
  * RSSは/usr/local/var/svn/rss/rwiki.rdfに出力する．
  * RSSのURIはhttp://www.cozmixng.org/rss/rwiki.rdf
  * プロジェクト名はRWiki
  * エラーが発生したらkou@cozmixng.orgに通知．
  * コミットメールはnull@cozmixng.orgから送られてくる（コミットメールを送るMLは参加者しか投稿できないので，これは重要）．

これをふまえて，こうなります．

  #!/bin/sh
  REPOS="$1"
  REV="$2"
  
  PATH=/usr/local/bin:/usr/bin:/bin
  export PATH
  
  ~kou/work/ruby/svn-utils/bin/commit-email.rb \
    "$REPOS" "$REV" rwiki-commit@ml.cozmixng.org \
    -I ~kou/work/ruby/svn-utils/lib \
    -r http://www.cozmixng.org/repos/rwiki \
    --rss-path /usr/local/var/svn/rss/rwiki.rdf \
    --rss-uri http://www.cozmixng.org/rss/rwiki.rdf \
    --name RWiki \
    --error-to kou@cozmixng.org \
    --from null@cozmixng.org
