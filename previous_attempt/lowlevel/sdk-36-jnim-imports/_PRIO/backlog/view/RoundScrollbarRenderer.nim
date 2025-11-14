import jnim

jclass android.view.RoundScrollbarRenderer* of JVMObject:
  proc drawRoundScrollbars*(canvas: Canvas, alpha: jfloat, bounds: Rect, drawToLeft: jboolean)
  BLUECHIP_ENABLED_SYSPROP*: string {.`static`.}

