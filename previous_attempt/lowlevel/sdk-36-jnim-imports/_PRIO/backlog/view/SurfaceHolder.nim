import jnim

jclass android.view.SurfaceHolder* of JVMObject:
  proc addCallback*(callback: Callback)
  proc removeCallback*(callback: Callback)
  proc isCreating*(): jboolean
  proc setType*(type: jint)
  proc setFixedSize*(width: jint, height: jint)
  proc setSizeFromLayout*()
  proc setFormat*(format: jint)
  proc setKeepScreenOn*(screenOn: jboolean)
  proc lockCanvas*(): Canvas
  proc lockCanvas*(dirty: Rect): Canvas
  proc unlockCanvasAndPost*(canvas: Canvas)
  proc getSurfaceFrame*(): Rect
  proc getSurface*(): Surface
  SURFACE_TYPE_NORMAL*: jint {.`static`.}
  SURFACE_TYPE_HARDWARE*: jint {.`static`.}
  SURFACE_TYPE_GPU*: jint {.`static`.}
  SURFACE_TYPE_PUSH_BUFFERS*: jint {.`static`.}

jclass android.view.BadSurfaceTypeException* of RuntimeException:


jclass android.view.Callback2* of Callback:

