import jnim

jclass android.widget.ActionMenuPresenter* of BaseMenuPresenter:
  proc initForMenu*(context: Context, menu: MenuBuilder)
  proc onConfigurationChanged*(newConfig: Configuration)
  proc setWidthLimit*(width: jint, strict: jboolean)
  proc setReserveOverflow*(reserveOverflow: jboolean)
  proc setItemLimit*(itemCount: jint)
  proc setExpandedActionViewsExclusive*(isExclusive: jboolean)
  proc setOverflowIcon*(icon: Drawable)
  proc getOverflowIcon*(): Drawable
  proc getMenuView*(root: ViewGroup): MenuView
  proc getItemView*(item: MenuItemImpl, convertView: View, parent: ViewGroup): View
  proc bindItemView*(item: MenuItemImpl, itemView: MenuView.ItemView)
  proc shouldIncludeItem*(childIndex: jint, item: MenuItemImpl): jboolean
  proc updateMenuView*(cleared: jboolean)
  proc filterLeftoverView*(parent: ViewGroup, childIndex: jint): jboolean
  proc onSubMenuSelected*(subMenu: SubMenuBuilder): jboolean
  proc showOverflowMenu*(): jboolean
  proc hideOverflowMenu*(): jboolean
  proc dismissPopupMenus*(): jboolean
  proc hideSubMenus*(): jboolean
  proc isOverflowMenuShowing*(): jboolean
  proc isOverflowMenuShowPending*(): jboolean
  proc isOverflowReserved*(): jboolean
  proc flagActionItems*(): jboolean
  proc onCloseMenu*(menu: MenuBuilder, allMenusAreClosing: jboolean)
  proc onSaveInstanceState*(): Parcelable
  proc onRestoreInstanceState*(state: Parcelable)
  proc onSubUiVisibilityChanged*(isVisible: jboolean)
  proc setMenuView*(menuView: ActionMenuView)

