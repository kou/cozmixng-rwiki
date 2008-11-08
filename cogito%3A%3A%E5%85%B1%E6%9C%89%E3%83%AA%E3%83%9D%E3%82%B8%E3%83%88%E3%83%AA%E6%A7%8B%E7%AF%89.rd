= cogito::共有リポジトリ構築

複数人でコミットできる共有リポジトリの構築．共有リポジトリにはssh経由でアクセスする．

XXXリポジトリとかいう名称は適当．

Debianの話．

== リポジトリユーザの作成

共有リポジトリを置くサーバ上にユーザを作成．

  % sudo useradd git

リポジトリ用のディレクトリを作り，そのディレクトリをgit用に初期化する．

プロジェクトproject0用のリポジトリは以下のようになる．((*--shared*))がポイント．

  % sudo -u git mkdir -p ~git/repos/project0
  % cd ~git/repos/project0
  % sudo -u git git-init-db --shared

リポジトリにコミットしたいユーザをgitと同じユーザにする．

ユーザkouとuserがコミットしたい場合は以下のようになる．

  % sudo useradd kou git
  % sudo useradd user git

共有リポジトリがあるサーバでの作業はこれで終了．

== 初期コミット

ここからは，共有リポジトリをおいているサーバじゃなくて，手元の環境での作業．

まず，環境変数を設定．

  export EMAIL="kou@cozmixng.org"
  export GIT_AUTHOR_EMAIL="$EMAIL"
  export GIT_COMMITTER_EMAIL="$EMAIL"

手元にローカルリポジトリを作って，共有リポジトリにcg-pushする．

まず，初期データがあるディレクトリで，ローカルリポジトリを初期化する．

  % cd work/project0
  % cg-init

共有リポジトリをoriginブランチとして登録する．共有リポジトリがあるサーバのIPアドレスが192.168.0.123だったら以下のようになる．

  % cg-branch-add origin git+ssh://192.168.0.123/home/git/repos/project0

ユーザ名を指定して接続するには以下のようになる．

  % cg-branch-add origin git+ssh://user@192.168.0.123/home/git/repos/project0

あとは，originブランチにcg-pushすればOK．

  % cg-push

このあとは，普通のcg-cloneしたリポジトリと同じように以下のような流れになる．

  % cg-update
  編集
  % cg-commit
  編集
  % cg-commit
  ...
  % cg-push
  ...
  % cg-update
  編集
  % cg-commit
  ...
  % cg-push
  ...
