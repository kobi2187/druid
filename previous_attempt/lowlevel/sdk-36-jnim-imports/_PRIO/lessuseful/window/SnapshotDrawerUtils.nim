import jnim

jclass android.window.SnapshotDrawerUtils* of JVMObject:
  proc getOrCreateTaskDescription*(runningTaskInfo: ActivityManager.RunningTaskInfo): ActivityManager.TaskDescription {.`static`.}
  proc drawSnapshotOnSurface*(lp: WindowManager.LayoutParams, rootSurface: SurfaceControl, snapshot: TaskSnapshot, windowBounds: Rect, releaseAfterDraw: jboolean) {.`static`.}
  proc createLayoutParameters*(info: StartingWindowInfo, title: CharSequence, windowType: jint, pixelFormat: jint, token: IBinder): WindowManager.LayoutParams {.`static`.}

jclass android.window.SnapshotDrawerUtils.SystemBarBackgroundPainter* of JVMObject:
  proc setInsets*(systemBarInsets: Rect)
  proc drawDecors*(c: Canvas, alreadyDrawnFrame: Rect)


jclass android.window.SystemBarBackgroundPainter* of JVMObject:
  proc setInsets*(systemBarInsets: Rect)
  proc drawDecors*(c: Canvas, alreadyDrawnFrame: Rect)

