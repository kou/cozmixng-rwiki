= gpg

GnuPGシステムのメインプログラム．

== 鍵の作成

一から鍵を作成するなら，念のため，~/.gnupg/を削除しておいた方がいいかも．

  % rm -rf ~/.gnupg/

鍵を作成する．

  % gpg --gen-key

いろいろ質問されるので適当に答える．

== 失効鍵の作成

鍵が盗まれたとかしたときに，鍵を無効にするための鍵を生成する．

  % gpg --gen-revoke user_id

ユーザIDにはメールアドレスを指定するらしい．なので，例えばこんな感じになるのかな．

  % gpg --gen-revoke "Kouhei Sutou <kou@cozmixng.org>"

"Kouhei Sutou <kou@cozmixng.org>"じゃなくて"kou@cozminxg.org"だけでいいのかもしれないけど，よくわからない．

== 鍵をキーサーバに登録する

まず，自分の公開鍵の名前を調べる．

  % gpg --fingerprint kou@cozmixng.org
  pub   1024D/1C837F31 2004-06-11
                   指紋 = 7714 A383 F6F7 3E2D 9828  791D 1742 3F64 1C83 7F31
  uid                  Kouhei Sutou <kou@cozmixng.org>
  sub   1024g/C0E70A35 2004-06-11

この出力の((%pub  1024D/1C837F31%))の((*1C837F31*))の部分が名前になる．

名前がわかったらキーサーバに鍵をアップロードする．

  % gpg --send-keys 1C837F31

しばらくして手元の鍵を更新してみて，自分の鍵が見付かれば登録は成功している．

  % gpg --refresh-keys

デフォルトで使用されるキーサーバは~/.gnupg/gpg.confに例えば以下のように書いてある．

  keyserver hkp://subkeys.pgp.net

これを変更する場合は--keyserverで指定できる．

  % gpg --keyserver hkp://keys.exapmle.com --send-keys 1C837F31

== メールを署名する．

Mewの場合は，draftモードで，C-cC-sで署名出来る．このとき，鍵を作成した時に指定したパスフレーズを聞かれる．

== 鍵を配布する．

Mewで公開鍵を配布するには，C-cC-aして，添付ファイルを作成するようにしてから，添付領域でpを押すと，公開鍵を添付出来る．

== 公開鍵をテキストファイルとして書き出す

公開鍵を

  -----BEGIN PGP PUBLIC KEY BLOCK-----
  Version: GnuPG v1.2.4 (GNU/Linux)
  
  mQGiBEDJ3qQRBADTBcjbdh9rGbvZgYDNe3hc0ICRfv5Ex/PaJ1dkmZr5hHlKTIyQ
  ...
  =To6Z
  -----END PGP PUBLIC KEY BLOCK-----

というように，テキストファイルとして出力するには，以下のようにする．

  % gpg --export --armor

== 相手の公開鍵を信用する．

相手の公開鍵を自分の秘密鍵で署名する．何か聞かれるのでそれについて答えていく．

  % gpg -lsign-key xxx@example.com

相手の公開鍵を信用する．

  % gpg --edit-key xxx@example.com

コマンドを聞いてくるのでtrustと入力する．あとは，聞かれたことに答えていくだけ．

== 自分の公開鍵を送る．

MewではC-cC-aで添付領域を作って，その中でpを入力すればよい．

== 相手の公開鍵で暗号化する．

Mewでは，draftモードでC-cC-eを入力する．この際，相手の公開鍵を信用していなければ暗号化は出来ない．

== インラインPGPメッセージを復号化する

Mewでは，自動で復号化できないが，C-cC-zとすると復号化出来る．
