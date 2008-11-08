= Prototype-Based Application Construction Using SELF 4.0

((<Self Tutorial|URL:http://research.sun.com/research/self/release_4.0/Self-4.0/Tutorial/>))を勝手に翻訳．やばかったら消します．

図がないので，オリジナルの文書と一緒に見る必要があります．

== Selfって何？どうして作られたの？どこからきたの？

Selfは純粋なオブジェクト指向言語で，プログラミング環境と結び
付いています．Selfの精神と意味はSmalltalkのそれと近いです．

  * 純粋なオブジェクト指向言語です．例えば，Selfの世界のすべ
    てのものはオブジェクトです．

  * 構文の多くをSmalltalkから取り入れています．

  * Smalltalkのように，変数に型はありません．

  * 制御構造を実装するためにブロックを使います．ブロックとは
    手続きの様に振る舞うオブジェクトのことです．

  * プログラムはプログラミング環境の中で徐々に構築されます．
    探索的なスタイルが推奨されます．

しかし，いくつかの重要な点でSmalltalkと異なっています．Self
は単純で具体性のあることに重点を置かれて設計されています．こ
の設計を導く大きな力は以下のように表されています．

Slefは構文と意味において，Smalltalkよりもはるかに単純になっ
ています．Selfシステムの基本的な機能の多くはSelf自身によって
実装されています．

Selfにはクラスがありません．代わりに，より直感的なオブジェク
トベースの継承機構が提供されます．プログラミング環境は直感的
な操作を促進します．このため，プログラマは改変するために"道
具" を使うよりも，オブジェクトと直感的にコミュニケーションを
取ることができます．

== 言語

((<Self Language>))
