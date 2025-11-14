import jnim

jclass android.view.FallbackEventHandler* of JVMObject:
  proc setView*(v: View)
  proc preDispatchKeyEvent*(event: KeyEvent)
  proc dispatchKeyEvent*(event: KeyEvent): jboolean

