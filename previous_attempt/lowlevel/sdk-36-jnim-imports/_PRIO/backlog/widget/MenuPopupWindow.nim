import jnim

jclass android.widget.MenuPopupWindow* of ListPopupWindow:
  proc setEnterTransition*(enterTransition: Transition)
  proc setExitTransition*(exitTransition: Transition)
  proc setHoverListener*(hoverListener: MenuItemHoverListener)
  proc setTouchModal*(touchModal: jboolean)
  proc onItemHoverEnter*(menu: MenuBuilder, item: MenuItem)
  proc onItemHoverExit*(menu: MenuBuilder, item: MenuItem)

jclass android.widget.MenuPopupWindow.MenuDropDownListView* of JVMObject:
  proc setHoverListener*(hoverListener: MenuItemHoverListener)
  proc clearSelection*()
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onHoverEvent*(ev: MotionEvent): jboolean

jclass android.widget.MenuDropDownListView* of DropDownListView:
  proc setHoverListener*(hoverListener: MenuItemHoverListener)
  proc clearSelection*()
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onHoverEvent*(ev: MotionEvent): jboolean

