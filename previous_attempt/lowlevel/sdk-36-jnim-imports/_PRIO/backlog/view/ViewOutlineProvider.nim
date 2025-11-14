import jnim

jclass android.view.ViewOutlineProvider* of JVMObject:
  proc getOutline*(view: View, outline: Outline)
  BACKGROUND*: ViewOutlineProvider {.`static`.}
  BOUNDS*: ViewOutlineProvider {.`static`.}
  PADDED_BOUNDS*: ViewOutlineProvider {.`static`.}

