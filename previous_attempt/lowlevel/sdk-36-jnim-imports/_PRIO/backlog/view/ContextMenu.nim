import jnim

jclass android.view.ContextMenu* of Menu:
  proc setHeaderTitle*(titleRes: jint): ContextMenu
  proc setHeaderTitle*(title: CharSequence): ContextMenu
  proc setHeaderIcon*(iconRes: jint): ContextMenu
  proc setHeaderIcon*(icon: Drawable): ContextMenu
  proc setHeaderView*(view: View): ContextMenu
  proc clearHeader*()

