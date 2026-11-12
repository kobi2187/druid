import jnim

jclass android.widget.Toolbar* of ViewGroup:
  proc setPopupTheme*(resId: jint)
  proc getPopupTheme*(): jint
  proc setTitleMargin*(start: jint, top: jint, end: jint, bottom: jint)
  proc getTitleMarginStart*(): jint
  proc setTitleMarginStart*(margin: jint)
  proc getTitleMarginTop*(): jint
  proc setTitleMarginTop*(margin: jint)
  proc getTitleMarginEnd*(): jint
  proc setTitleMarginEnd*(margin: jint)
  proc getTitleMarginBottom*(): jint
  proc setTitleMarginBottom*(margin: jint)
  proc onRtlPropertiesChanged*(layoutDirection: jint)
  proc setLogo*(resId: jint)
  proc canShowOverflowMenu*(): jboolean
  proc isOverflowMenuShowing*(): jboolean
  proc isOverflowMenuShowPending*(): jboolean
  proc showOverflowMenu*(): jboolean
  proc hideOverflowMenu*(): jboolean
  proc setMenu*(menu: MenuBuilder, outerPresenter: ActionMenuPresenter)
  proc dismissPopupMenus*()
  proc isTitleTruncated*(): jboolean
  proc setLogo*(drawable: Drawable)
  proc getLogo*(): Drawable
  proc setLogoDescription*(resId: jint)
  proc setLogoDescription*(description: CharSequence)
  proc getLogoDescription*(): CharSequence
  proc hasExpandedActionView*(): jboolean
  proc collapseActionView*()
  proc getTitle*(): CharSequence
  proc setTitle*(resId: jint)
  proc setTitle*(title: CharSequence)
  proc getSubtitle*(): CharSequence
  proc setSubtitle*(resId: jint)
  proc setSubtitle*(subtitle: CharSequence)
  proc setTitleTextAppearance*(context: Context, resId: jint)
  proc setSubtitleTextAppearance*(context: Context, resId: jint)
  proc setTitleTextColor*(color: jint)
  proc setSubtitleTextColor*(color: jint)
  proc getNavigationContentDescription*(): CharSequence
  proc setNavigationContentDescription*(resId: jint)
  proc setNavigationContentDescription*(description: CharSequence)
  proc setNavigationIcon*(resId: jint)
  proc setNavigationIcon*(icon: Drawable)
  proc getNavigationIcon*(): Drawable
  proc setNavigationOnClickListener*(listener: OnClickListener)
  proc getNavigationView*(): View
  proc getCollapseContentDescription*(): CharSequence
  proc setCollapseContentDescription*(resId: jint)
  proc setCollapseContentDescription*(description: CharSequence)
  proc getCollapseIcon*(): Drawable
  proc setCollapseIcon*(resId: jint)
  proc setCollapseIcon*(icon: Drawable)
  proc getMenu*(): Menu
  proc setOverflowIcon*(icon: Drawable)
  proc getOverflowIcon*(): Drawable
  proc inflateMenu*(resId: jint)
  proc setOnMenuItemClickListener*(listener: OnMenuItemClickListener)
  proc setContentInsetsRelative*(contentInsetStart: jint, contentInsetEnd: jint)
  proc getContentInsetStart*(): jint
  proc getContentInsetEnd*(): jint
  proc setContentInsetsAbsolute*(contentInsetLeft: jint, contentInsetRight: jint)
  proc getContentInsetLeft*(): jint
  proc getContentInsetRight*(): jint
  proc getContentInsetStartWithNavigation*(): jint
  proc setContentInsetStartWithNavigation*(insetStartWithNavigation: jint)
  proc getContentInsetEndWithActions*(): jint
  proc setContentInsetEndWithActions*(insetEndWithActions: jint)
  proc getCurrentContentInsetStart*(): jint
  proc getCurrentContentInsetEnd*(): jint
  proc getCurrentContentInsetLeft*(): jint
  proc getCurrentContentInsetRight*(): jint
  proc onTouchEvent*(ev: MotionEvent): jboolean
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc getWrapper*(): DecorToolbar
  proc setCollapsible*(collapsible: jboolean)
  proc setMenuCallbacks*(pcb: MenuPresenter.Callback, mcb: MenuBuilder.Callback)

jclass android.widget.Toolbar.OnMenuItemClickListener* of JVMObject:
  proc onMenuItemClick*(item: MenuItem): jboolean

jclass android.widget.OnMenuItemClickListener* of JVMObject:
  proc onMenuItemClick*(item: MenuItem): jboolean

jclass android.widget.LayoutParams* of LayoutParams:

