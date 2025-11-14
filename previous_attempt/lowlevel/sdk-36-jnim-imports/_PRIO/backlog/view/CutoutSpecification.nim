import jnim

jclass android.view.CutoutSpecification* of JVMObject:
  proc getPath*(): Path
  proc getLeftBound*(): Rect
  proc getTopBound*(): Rect
  proc getRightBound*(): Rect
  proc getBottomBound*(): Rect
  proc getSafeInset*(): Rect

jclass android.view.CutoutSpecification.Parser* of JVMObject:
  proc parse*(originalSpec: string): CutoutSpecification

jclass android.view.Parser* of JVMObject:
  proc parse*(originalSpec: string): CutoutSpecification

