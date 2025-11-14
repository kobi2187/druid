import jnim

jclass android.widget.TabHost* of FrameLayout:
  proc newTabSpec*(tag: string): TabSpec
  proc setup*()
  proc sendAccessibilityEventInternal*(eventType: jint)
  proc setup*(activityGroup: LocalActivityManager)
  proc onTouchModeChanged*(isInTouchMode: jboolean)
  proc addTab*(tabSpec: TabSpec)
  proc clearAllTabs*()
  proc getTabWidget*(): TabWidget
  proc getCurrentTab*(): jint
  proc getCurrentTabTag*(): string
  proc getCurrentTabView*(): View
  proc getCurrentView*(): View
  proc setCurrentTabByTag*(tag: string)
  proc getTabContentView*(): FrameLayout
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc dispatchWindowFocusChanged*(hasFocus: jboolean)
  proc getAccessibilityClassName*(): CharSequence
  proc setCurrentTab*(index: jint)
  proc setOnTabChangedListener*(l: OnTabChangeListener)

jclass android.widget.TabHost.TabSpec* of JVMObject:
  proc setIndicator*(label: CharSequence): TabSpec
  proc setIndicator*(label: CharSequence, icon: Drawable): TabSpec
  proc setIndicator*(view: View): TabSpec
  proc setContent*(viewId: jint): TabSpec
  proc setContent*(contentFactory: TabContentFactory): TabSpec
  proc setContent*(intent: Intent): TabSpec
  proc getTag*(): string



jclass android.widget.TabSpec* of JVMObject:
  proc setIndicator*(label: CharSequence): TabSpec
  proc setIndicator*(label: CharSequence, icon: Drawable): TabSpec
  proc setIndicator*(view: View): TabSpec
  proc setContent*(viewId: jint): TabSpec
  proc setContent*(contentFactory: TabContentFactory): TabSpec
  proc setContent*(intent: Intent): TabSpec
  proc getTag*(): string

