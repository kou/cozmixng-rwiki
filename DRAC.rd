= DRAC

DRAC関係の作業記録です。

インストールは((<Qpopper>))参照．

== 基本的な設定

/etc/rc.confに以下を追加

  portmap_enable="YES"
  dracd_enable="YES"
  drac_flags="-i -e 5"

DRACを使うにはportmapが起動していないといけない．
