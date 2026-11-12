import jnim

jclass android.view.InsetsAnimationThread* of HandlerThread:
  proc release*() {.`static`.}
  proc get*(): InsetsAnimationThread {.`static`.}
  proc getHandler*(): Handler {.`static`.}

