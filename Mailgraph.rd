= Mailgraph

((<Postfix>))のログからメールの流量をグラフ化するソフトウェア．

== インストール

  % sudo portupgrade -NRr mailgraph

== 設定

/etc/rc.confに以下を追加．

  mailgraph_enable="YES"
  mailgraph_user="postfix"
  mailgraph_group="postfix"

/usr/local/sbin/mailgraph.plは，/var/log/maillogからメールの流量を((<RRDTool>))が使えるデータを生成する．デフォルトだとwwwユーザ権限で動くが，これだと，/var/log/maillogをwwwユーザ権限で読み込み可能でなければいけない．これは気持ち悪い．

ということで，postfixユーザ／グループ権限で動くようにして，/var/log/maillogのグループを変更．

  % sudo chgrp postfix /var/log/maillog

ついでに，RRDTool用データの出力先/var/db/mailgraphの権限も変更．

  % sudo chown -R postfix:postfix /var/db/mailgraph


