import jnim

jclass android.view.WindowMetrics* of JVMObject:
  proc getBounds*(): Rect
  proc getWindowInsets*(): WindowInsets
  proc getDensity*(): jfloat
  proc toString*(): string

