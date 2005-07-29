= kou::ToDo

* svn: いらないのもあるだろうけど，とりあえずリストアップしておく．
  * \/: svn_auth.h: Subversion's authentication system
    * svn_auth_open
    * svn_auth_set_parameter
    * svn_auth_get_parameter
    * x: svn_auth_first_credentials
    * x: svn_auth_next_credentials
    * x: svn_auth_save_credentials
  * -: svn_base64.h: Base64 encoding and decoding functions
  * svn_client.h: Public interface for libsvn_client
  * -: svn_cmdline.h: Support functions for command line programs
  * svn_config.h: Accessing SVN configuration files
  * -: svn_ctype.h: Character classification routines
  * -: svn_dav.h: Code related to WebDAV/DeltaV usage in Subversion
  * svn_delta.h: Delta-parsing
  * svn_diff.h: Contextual diffing
  * o: svn_error.h: Common exception handling for Subversion
  * o: svn_error_codes.h: Subversion error codes
  * svn_fs.h: Interface to the Subversion filesystem
  * -: svn_hash.h: Dumping and reading hash tables to/from files
  * svn_io.h: General file I/O for Subversion
  * -: svn_md5.h: Converting and comparing MD5 checksums
  * o: svn_nls.h: Support functions for NLS programs
  * svn_opt.h: Option and argument parsing for Subversion command lines
  * -: svn_path.h: A path manipulation library
  * o: svn_pools.h: APR pool management for Subversion
  * svn_props.h: Subversion properties
  * -: svn_quoprint.h: Quoted-printable encoding and decoding functions
  * svn_ra.h: Repository Access
  * -: svn_ra_svn.h: Libsvn_ra_svn functions used by the server
  * svn_repos.h: Tools built on top of the filesystem
  * -: svn_sorts.h: All sorts of sorts
  * svn_string.h: Counted-length strings for Subversion, plus some C string goodies
  * -: svn_subst.h: Data substitution (keywords and EOL style)
  * svn_time.h: Time/date utilities
  * svn_types.h: Subversion's data types
  * svn_utf.h: UTF-8 conversion routines
  * \/: svn_version.h: Version information
    * svn_ver_compatible
    * svn_ver_equal
    * svn_subr_version
    * \/: svn_ver_check_list
  * svn_wc.h: The Subversion Working Copy Library
  * -: svn_xml.h: XML code shared by various Subversion libraries

* ((<Gauche>))の((<SWIG>))対応．
  * -> これやってたりしますか？ qt bindingが欲しいのでswigを使おうかなと思ってここを見つけました．((<ねる|URL:http://www.soraneko.com/~nel/>))
  * ごめんなさい．最近はめっきり手を付けていません．「そういえばGaucheの拡張ライブラリって書いた事ないなぁ，そこから調べなきゃ」とか思っているうちに時間が過ぎています．
  * ああ，了解です．では，こちらでやってみますね．
* RWikiのrt2rwiki-libのInlineParserをどうにかする．
* ((<Ruby>))で実装されたRelax NGバリデータを作る/探す
* RWikiのRD2RWikiVisitor#default_ext_*をrwiki/rd/ext/以下のクラスに移動してはどうかと提案する．
* ゼミのネタを考える．
  * 関数型make
  * ((<Self Tutorial|URL:http://research.sun.com/research/self/release_4.0/Self-4.0/Tutorial/>))
  * アスペクト指向
* Diaにrotateを実装する．
* GaucheとGTK+ のプログレスバーとタイムアウトとかについてまとめる．
* Metacityとgconftool-2についてまとめる．オプション: -R, --set, --type
* WiLiKi:kouを整理する
* ((<benchmark>)) -> ((<bsm>))
* ((<GalleryAdministrator>))（というか，RubyPhoto）の高速化．
* RWikiのnaviのborderを百分率でも指定できるようにする．例えば，上位30%（つまり，borderは（下から）70%）はヘッダに表示とか．
* Rabbit: Thread -> Gtkのtimeout
* Rabbit: SOAPインターフェイス

== pending
* ((<wsm>))でgoshがSEGVるのを追う．
  * -> スレッドがからむのであきらめた．
* ((<wsm>))がアクセスのたびにどんどん太っていくのをどうにかする．
  * --enable-threads=noにしてgoshをコンパイルしたら直ったので，FreeBSDだとBoehm GCとpthreadsの相性が悪いんだろうということで放置．
* ((<WikiLink>))で登録できなくなっているのを直す．
  * なにもしていないけど直っている？？？
