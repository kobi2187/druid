import jnim

jclass android.view.WindowManagerGlobal* of JVMObject:
  proc initialize*() {.`static`.}
  proc getInstance*(): WindowManagerGlobal {.`static`.}
  proc setWindowManagerServiceForSystemProcess*(wms: IWindowManager) {.`static`.}
  proc getWindowManagerService*(): IWindowManager {.`static`.}
  proc getWindowSession*(): IWindowSession {.`static`.}
  proc peekWindowSession*(): IWindowSession {.`static`.}
  proc getViewRootNames*(): seq[string]
  proc getRootViews*(token: IBinder): ArrayList[ViewRootImpl]
  proc getWindowViews*(): ArrayList[View]
  proc addWindowViewsListener*(executor: Executor, consumer: Consumer[List[View]])
  proc removeWindowViewsListener*(consumer: Consumer[List[View]])
  proc getWindowView*(windowToken: IBinder): View
  proc getRootView*(name: string): View
  proc addView*(view: View, params: ViewGroup.LayoutParams, display: Display, parentWindow: Window, userId: jint)
  proc updateViewLayout*(view: View, params: ViewGroup.LayoutParams)
  proc removeView*(view: View, immediate: jboolean)
  proc closeAll*(token: IBinder, who: string, what: string)
  proc closeAllExceptView*(token: IBinder, view: View, who: string, what: string)
  proc trimMemory*(level: jint)
  proc trimCaches*(level: jint)
  proc dumpGfxInfo*(fd: FileDescriptor, args: seq[string])
  proc setStoppedState*(token: IBinder, stopped: jboolean)
  proc reportNewConfiguration*(config: Configuration)
  proc changeCanvasOpacity*(token: IBinder, opaque: jboolean)
  proc mirrorWallpaperSurface*(displayId: jint): SurfaceControl
  proc registerProposedRotationListener*(contextToken: IBinder, executor: Executor, listener: IntConsumer)
  proc unregisterProposedRotationListener*(contextToken: IBinder, listener: IntConsumer)
  proc registerTrustedPresentationListener*(window: IBinder, thresholds: TrustedPresentationThresholds, executor: Executor, listener: Consumer[Boolean])
  proc unregisterTrustedPresentationListener*(listener: Consumer[Boolean])
  proc addWindowlessRoot*(impl: ViewRootImpl)
  proc removeWindowlessRoot*(impl: ViewRootImpl)
  proc setRecentsAppBehindSystemBars*(behindSystemBars: jboolean)
  RELAYOUT_RES_FIRST_TIME*: jint {.`static`.}
  RELAYOUT_RES_SURFACE_CHANGED*: jint {.`static`.}
  RELAYOUT_RES_SURFACE_RESIZED*: jint {.`static`.}
  RELAYOUT_RES_CONSUME_ALWAYS_SYSTEM_BARS*: jint {.`static`.}
  RELAYOUT_RES_CANCEL_AND_REDRAW*: jint {.`static`.}
  RELAYOUT_INSETS_PENDING*: jint {.`static`.}
  ADD_FLAG_IN_TOUCH_MODE*: jint {.`static`.}
  ADD_FLAG_APP_VISIBLE*: jint {.`static`.}
  ADD_FLAG_ALWAYS_CONSUME_SYSTEM_BARS*: jint {.`static`.}
  ADD_OKAY*: jint {.`static`.}
  ADD_BAD_APP_TOKEN*: jint {.`static`.}
  ADD_BAD_SUBWINDOW_TOKEN*: jint {.`static`.}
  ADD_NOT_APP_TOKEN*: jint {.`static`.}
  ADD_APP_EXITING*: jint {.`static`.}
  ADD_DUPLICATE_ADD*: jint {.`static`.}
  ADD_STARTING_NOT_NEEDED*: jint {.`static`.}
  ADD_MULTIPLE_SINGLETON*: jint {.`static`.}
  ADD_PERMISSION_DENIED*: jint {.`static`.}
  ADD_INVALID_DISPLAY*: jint {.`static`.}
  ADD_INVALID_TYPE*: jint {.`static`.}
  ADD_INVALID_USER*: jint {.`static`.}

