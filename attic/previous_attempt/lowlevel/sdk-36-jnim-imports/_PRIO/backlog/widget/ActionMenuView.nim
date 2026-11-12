import jnim

jclass android.widget.ActionMenuView* of LinearLayout:
  proc setPopupTheme*(resId: jint)
  proc getPopupTheme*(): jint
  proc setPresenter*(presenter: ActionMenuPresenter)
  proc onConfigurationChanged*(newConfig: Configuration)
  proc setOnMenuItemClickListener*(listener: OnMenuItemClickListener)
  proc onDetachedFromWindow*()
  proc setOverflowIcon*(icon: Drawable)
  proc getOverflowIcon*(): Drawable
  proc isOverflowReserved*(): jboolean
  proc setOverflowReserved*(reserveOverflow: jboolean)
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc generateOverflowButtonLayoutParams*(): LayoutParams
  proc invokeItem*(item: MenuItemImpl): jboolean
  proc getWindowAnimations*(): jint
  proc initialize*(menu: MenuBuilder)
  proc getMenu*(): Menu
  proc setMenuCallbacks*(pcb: MenuPresenter.Callback, mcb: MenuBuilder.Callback)
  proc peekMenu*(): MenuBuilder
  proc showOverflowMenu*(): jboolean
  proc hideOverflowMenu*(): jboolean
  proc isOverflowMenuShowing*(): jboolean
  proc isOverflowMenuShowPending*(): jboolean
  proc dismissPopupMenus*()
  proc dispatchPopulateAccessibilityEventInternal*(event: AccessibilityEvent): jboolean
  proc setExpandedActionViewsExclusive*(exclusive: jboolean)

jclass android.widget.ActionMenuView.OnMenuItemClickListener* of JVMObject:
  proc onMenuItemClick*(item: MenuItem): jboolean

jclass android.widget.ActionMenuView.ActionMenuChildView* of JVMObject:
  proc needsDividerBefore*(): jboolean
  proc needsDividerAfter*(): jboolean

jclass android.widget.OnMenuItemClickListener* of JVMObject:
  proc onMenuItemClick*(item: MenuItem): jboolean

jclass android.widget.ActionMenuChildView* of JVMObject:
  proc needsDividerBefore*(): jboolean
  proc needsDividerAfter*(): jboolean

jclass android.widget.LayoutParams* of LayoutParams:
  isOverflowButton*: jboolean
  cellsUsed*: jint
  extraPixels*: jint
  expandable*: jboolean
  preventEdgeOffset*: jboolean
  expanded*: jboolean

