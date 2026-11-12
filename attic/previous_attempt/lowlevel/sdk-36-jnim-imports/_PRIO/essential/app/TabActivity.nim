import jnim

jclass android.app.TabActivity* of ActivityGroup:
  proc setDefaultTab*(tag: string)
  proc setDefaultTab*(index: jint)
  proc onContentChanged*()
  proc getTabHost*(): TabHost
  proc getTabWidget*(): TabWidget

