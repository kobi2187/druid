import jnim

jclass android.view.SubMenu* of Menu:
  proc setHeaderTitle*(titleRes: jint): SubMenu
  proc setHeaderTitle*(title: CharSequence): SubMenu
  proc setHeaderIcon*(iconRes: jint): SubMenu
  proc setHeaderIcon*(icon: Drawable): SubMenu
  proc setHeaderView*(view: View): SubMenu
  proc clearHeader*()
  proc setIcon*(iconRes: jint): SubMenu
  proc setIcon*(icon: Drawable): SubMenu
  proc getItem*(): MenuItem

