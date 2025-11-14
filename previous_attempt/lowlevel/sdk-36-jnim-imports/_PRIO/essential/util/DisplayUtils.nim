import jnim

jclass android.util.DisplayUtils* of JVMObject:
  proc getDisplayUniqueIdConfigIndex*(res: Resources, displayUniqueId: string): jint {.`static`.}
  proc getMaximumResolutionDisplayMode*(modes: seq[Display.Mode]): Display.Mode {.`static`.}
  proc getPhysicalPixelDisplaySizeRatio*(physicalWidth: jint, physicalHeight: jint, currentWidth: jint, currentHeight: jint): jfloat {.`static`.}

