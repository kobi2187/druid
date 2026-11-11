import jnim

jclass android.view.ViewOverlay* of JVMObject:
  proc add*(drawable: Drawable)
  proc remove*(drawable: Drawable)
  proc clear*()

