import jnim

jclass android.widget.ShareActionProvider* of ActionProvider:
  proc setOnShareTargetSelectedListener*(listener: OnShareTargetSelectedListener)
  proc onCreateActionView*(): View
  proc hasSubMenu*(): jboolean
  proc onPrepareSubMenu*(subMenu: SubMenu)
  proc setShareHistoryFileName*(shareHistoryFile: string)
  proc setShareIntent*(shareIntent: Intent)
  DEFAULT_SHARE_HISTORY_FILE_NAME*: string {.`static`.}

jclass android.widget.ShareActionProvider.OnShareTargetSelectedListener* of JVMObject:
  proc onShareTargetSelected*(source: ShareActionProvider, intent: Intent): jboolean

jclass android.widget.OnShareTargetSelectedListener* of JVMObject:
  proc onShareTargetSelected*(source: ShareActionProvider, intent: Intent): jboolean

