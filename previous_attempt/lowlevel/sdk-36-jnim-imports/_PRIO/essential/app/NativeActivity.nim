import jnim

jclass android.app.NativeActivity* of Activity:
  proc onConfigurationChanged*(newConfig: Configuration)
  proc onLowMemory*()
  proc onWindowFocusChanged*(hasFocus: jboolean)
  proc surfaceCreated*(holder: SurfaceHolder)
  proc surfaceChanged*(holder: SurfaceHolder, format: jint, width: jint, height: jint)
  proc surfaceRedrawNeeded*(holder: SurfaceHolder)
  proc surfaceDestroyed*(holder: SurfaceHolder)
  proc onInputQueueCreated*(queue: InputQueue)
  proc onInputQueueDestroyed*(queue: InputQueue)
  proc onGlobalLayout*()
  META_DATA_LIB_NAME*: string {.`static`.}
  META_DATA_FUNC_NAME*: string {.`static`.}

