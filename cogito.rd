= cogito

gitで管理されているcairoのリポジトリにcogitでアクセス。自分のリポジトリも公開したい。

== 元になるリポジトリを持ってくる

  % cg-clone git://git.cairographics.org/git/cairo

== 変更する

ファイルを追加した場合。

  % cg-add XXX.c

一通り変更したらコミットする。このコミットはローカルのリポジトリへのコミットになるので、ビビる必要は無い。

ただし、コミットする前に環境変数GIT_AUTHOR_EMAILとGIT_COMMITTER_EMAILを設定しておいたほうがよい。

以下のようなやつを~/.zshenvにでも書いておく。

  export EMAIL="kou@cozmixng.org"
  export GIT_AUTHOR_EMAIL="$EMAIL"
  export GIT_COMMITTER_EMAIL="$EMAIL"

必要ならEDITORも設定しておくとよい。

コミットは単にcg-commitを呼ぶだけ。

  % cg-commit

== 公開場所を用意する

ここからが公開する用意。

HTTPでcg-cloneできるように、~/public_html/以下に作る。

今回は

  % cg-clone http://pub.cozmixng.org/~kou/git/cairo/.git

できるようにする。

  % ssh pub.cozmixng.org
  pub% mkdir -p ~/public_html/git/cairo
  pub% cd ~/public_html/git/cairo
  pub% git-init-db

== 公開場所を登録する

cg-pushで公開場所に自分のリポジトリを公開できるようにする。

まず、ブランチを作成する。ブランチには自分の名前を付けるのが普通みたい。

  % cd cg-cloneでとってきたリポジトリがあるディレクトリ
  % cg-branch-add kou git+ssh://pub.cozmixng.org/home/kou/public_html/git/cairo

ちなみに、ブランチのURIを変更するにはcg-branch-chgを使う。

  % cg-branch-chk kou git+ssh://XXX/....

公開するにはcg-pushで、cg-branch-addで付けた名前のブランチを指定する。

  % cg-push kou
