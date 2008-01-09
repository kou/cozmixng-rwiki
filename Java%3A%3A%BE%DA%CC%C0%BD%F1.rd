= Java::証明書

テスト用などで作成した自前の証明書をJavaで使用する方法。

== 概要

keystoreという証明書のデータベースに登録する必要がある。keystoreの管理はkeytoolで行う。

== 登録

証明書は((<OpenSSL>))でserver.crtというファイル名で作成したものとする。

  % keytool -import -alias local-server -file /tmp/server.crt -trustcacerts -noprompt

「-alias local-server」は省略可能で省略するとmykeyになる。

実行するとパスワードを聞かれるので二回入力する。（パスワードの設定）

ちなみに、証明書は~/.keystoreに登録される。

== 確認

以下の実行結果の中に-aliasで指定した名前があるはず。

  % keytool -list

== 使用

あとは普通にプログラムを実行すればよい。

だめならjavaの起動オプションに「-Djavax.net.ssl.trustStore=$HOME/.keystore」を指定してみる。

  % JAVAOPTS="-Djavax.net.ssl.trustStore=$HOME/.keystore" コマンド

それでもだめなら、システムのkeystoreに登録してみる。

  % sudo keytool -import -alias local-server -file /tmp/server.crt -trustcacerts -noprompt -keystore /usr/lib/jvm/java-6-sun/jre/lib/security/cacerts

ちなみにシステムのkeystoreのパスワードはデフォルトでは「changeit」で、ファイルは$JRE_ROOT/lib/security/cacertsにある。
