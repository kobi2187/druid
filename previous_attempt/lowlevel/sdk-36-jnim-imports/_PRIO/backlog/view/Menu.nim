import jnim

jclass android.view.Menu* of JVMObject:
  proc add*(title: CharSequence): MenuItem
  proc add*(titleRes: jint): MenuItem
  proc add*(groupId: jint, itemId: jint, order: jint, title: CharSequence): MenuItem
  proc add*(groupId: jint, itemId: jint, order: jint, titleRes: jint): MenuItem
  proc addIntentOptions*(groupId: jint, itemId: jint, order: jint, caller: ComponentName, specifics: seq[Intent], intent: Intent, flags: jint, outSpecificItems: seq[MenuItem]): jint
  proc removeItem*(id: jint)
  proc removeGroup*(groupId: jint)
  proc clear*()
  proc setGroupCheckable*(group: jint, checkable: jboolean, exclusive: jboolean)
  proc setGroupVisible*(group: jint, visible: jboolean)
  proc setGroupEnabled*(group: jint, enabled: jboolean)
  proc hasVisibleItems*(): jboolean
  proc findItem*(id: jint): MenuItem
  proc size*(): jint
  proc getItem*(index: jint): MenuItem
  proc close*()
  proc performShortcut*(keyCode: jint, event: KeyEvent, flags: jint): jboolean
  proc performIdentifierAction*(id: jint, flags: jint): jboolean
  proc setQwertyMode*(isQwerty: jboolean)

