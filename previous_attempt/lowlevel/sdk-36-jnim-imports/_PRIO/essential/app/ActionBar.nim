import jnim

jclass android.app.ActionBar* of JVMObject:
  proc setCustomView*(view: View)
  proc setCustomView*(view: View, layoutParams: LayoutParams)
  proc setCustomView*(resId: jint)
  proc setIcon*(resId: jint)
  proc setIcon*(icon: Drawable)
  proc setLogo*(resId: jint)
  proc setLogo*(logo: Drawable)
  proc setListNavigationCallbacks*(adapter: SpinnerAdapter, callback: OnNavigationListener)
  proc setSelectedNavigationItem*(position: jint)
  proc getSelectedNavigationIndex*(): jint
  proc getNavigationItemCount*(): jint
  proc setTitle*(title: CharSequence)
  proc setTitle*(resId: jint)
  proc setSubtitle*(subtitle: CharSequence)
  proc setSubtitle*(resId: jint)
  proc setDisplayOptions*(options: jint)
  proc setDisplayOptions*(options: jint, mask: jint)
  proc setDisplayUseLogoEnabled*(useLogo: jboolean)
  proc setDisplayShowHomeEnabled*(showHome: jboolean)
  proc setDisplayHomeAsUpEnabled*(showHomeAsUp: jboolean)
  proc setDisplayShowTitleEnabled*(showTitle: jboolean)
  proc setDisplayShowCustomEnabled*(showCustom: jboolean)
  proc setBackgroundDrawable*(d: Drawable)
  proc setStackedBackgroundDrawable*(d: Drawable)
  proc setSplitBackgroundDrawable*(d: Drawable)
  proc getCustomView*(): View
  proc getTitle*(): CharSequence
  proc getSubtitle*(): CharSequence
  proc getNavigationMode*(): jint
  proc setNavigationMode*(mode: jint)
  proc getDisplayOptions*(): jint
  proc newTab*(): Tab
  proc addTab*(tab: Tab)
  proc addTab*(tab: Tab, setSelected: jboolean)
  proc addTab*(tab: Tab, position: jint)
  proc addTab*(tab: Tab, position: jint, setSelected: jboolean)
  proc removeTab*(tab: Tab)
  proc removeTabAt*(position: jint)
  proc removeAllTabs*()
  proc selectTab*(tab: Tab)
  proc getSelectedTab*(): Tab
  proc getTabAt*(index: jint): Tab
  proc getTabCount*(): jint
  proc getHeight*(): jint
  proc show*()
  proc hide*()
  proc isShowing*(): jboolean
  proc addOnMenuVisibilityListener*(listener: OnMenuVisibilityListener)
  proc removeOnMenuVisibilityListener*(listener: OnMenuVisibilityListener)
  proc setHomeButtonEnabled*(enabled: jboolean)
  proc getThemedContext*(): Context
  proc isTitleTruncated*(): jboolean
  proc setHomeAsUpIndicator*(indicator: Drawable)
  proc setHomeAsUpIndicator*(resId: jint)
  proc setHomeActionContentDescription*(description: CharSequence)
  proc setHomeActionContentDescription*(resId: jint)
  proc setHideOnContentScrollEnabled*(hideOnContentScroll: jboolean)
  proc isHideOnContentScrollEnabled*(): jboolean
  proc getHideOffset*(): jint
  proc setHideOffset*(offset: jint)
  proc setElevation*(elevation: jfloat)
  proc getElevation*(): jfloat
  proc setDefaultDisplayHomeAsUpEnabled*(enabled: jboolean)
  proc setShowHideAnimationEnabled*(enabled: jboolean)
  proc onConfigurationChanged*(config: Configuration)
  proc dispatchMenuVisibilityChanged*(visible: jboolean)
  proc startActionMode*(callback: ActionMode.Callback): ActionMode
  proc openOptionsMenu*(): jboolean
  proc closeOptionsMenu*(): jboolean
  proc invalidateOptionsMenu*(): jboolean
  proc onMenuKeyEvent*(event: KeyEvent): jboolean
  proc onKeyShortcut*(keyCode: jint, event: KeyEvent): jboolean
  proc collapseActionView*(): jboolean
  proc setWindowTitle*(title: CharSequence)
  proc onDestroy*()
  NAVIGATION_MODE_STANDARD*: jint {.`static`.}
  NAVIGATION_MODE_LIST*: jint {.`static`.}
  NAVIGATION_MODE_TABS*: jint {.`static`.}
  DISPLAY_USE_LOGO*: jint {.`static`.}
  DISPLAY_SHOW_HOME*: jint {.`static`.}
  DISPLAY_HOME_AS_UP*: jint {.`static`.}
  DISPLAY_SHOW_TITLE*: jint {.`static`.}
  DISPLAY_SHOW_CUSTOM*: jint {.`static`.}
  DISPLAY_TITLE_MULTIPLE_LINES*: jint {.`static`.}

jclass android.app.ActionBar.OnNavigationListener* of JVMObject:
  proc onNavigationItemSelected*(itemPosition: jint, itemId: jlong): jboolean

jclass android.app.ActionBar.OnMenuVisibilityListener* of JVMObject:
  proc onMenuVisibilityChanged*(isVisible: jboolean)

jclass android.app.ActionBar.Tab* of JVMObject:
  proc getPosition*(): jint
  proc getIcon*(): Drawable
  proc getText*(): CharSequence
  proc setIcon*(icon: Drawable): Tab
  proc setIcon*(resId: jint): Tab
  proc setText*(text: CharSequence): Tab
  proc setText*(resId: jint): Tab
  proc setCustomView*(view: View): Tab
  proc setCustomView*(layoutResId: jint): Tab
  proc getCustomView*(): View
  proc setTag*(obj: JObject): Tab
  proc getTag*(): JObject
  proc setTabListener*(listener: TabListener): Tab
  proc select*()
  proc setContentDescription*(resId: jint): Tab
  proc setContentDescription*(contentDesc: CharSequence): Tab
  proc getContentDescription*(): CharSequence

jclass android.app.ActionBar.TabListener* of JVMObject:
  proc onTabSelected*(tab: Tab, ft: FragmentTransaction)
  proc onTabUnselected*(tab: Tab, ft: FragmentTransaction)
  proc onTabReselected*(tab: Tab, ft: FragmentTransaction)

jclass android.app.OnNavigationListener* of JVMObject:
  proc onNavigationItemSelected*(itemPosition: jint, itemId: jlong): jboolean

jclass android.app.OnMenuVisibilityListener* of JVMObject:
  proc onMenuVisibilityChanged*(isVisible: jboolean)

jclass android.app.Tab* of JVMObject:
  proc getPosition*(): jint
  proc getIcon*(): Drawable
  proc getText*(): CharSequence
  proc setIcon*(icon: Drawable): Tab
  proc setIcon*(resId: jint): Tab
  proc setText*(text: CharSequence): Tab
  proc setText*(resId: jint): Tab
  proc setCustomView*(view: View): Tab
  proc setCustomView*(layoutResId: jint): Tab
  proc getCustomView*(): View
  proc setTag*(obj: JObject): Tab
  proc getTag*(): JObject
  proc setTabListener*(listener: TabListener): Tab
  proc select*()
  proc setContentDescription*(resId: jint): Tab
  proc setContentDescription*(contentDesc: CharSequence): Tab
  proc getContentDescription*(): CharSequence
  INVALID_POSITION*: jint {.`static`.}

jclass android.app.TabListener* of JVMObject:
  proc onTabSelected*(tab: Tab, ft: FragmentTransaction)
  proc onTabUnselected*(tab: Tab, ft: FragmentTransaction)
  proc onTabReselected*(tab: Tab, ft: FragmentTransaction)

jclass android.app.LayoutParams* of MarginLayoutParams:
  gravity*: jint

