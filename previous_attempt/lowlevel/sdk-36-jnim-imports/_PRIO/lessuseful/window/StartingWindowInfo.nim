import jnim

jclass android.window.StartingWindowInfo* of JVMObject:
  proc notifyAddComplete*(addedSurface: SurfaceControl)
  proc allowHandleSolidColorSplashScreen*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  STARTING_WINDOW_TYPE_NONE*: jint {.`static`.}
  STARTING_WINDOW_TYPE_SPLASH_SCREEN*: jint {.`static`.}
  STARTING_WINDOW_TYPE_SNAPSHOT*: jint {.`static`.}
  STARTING_WINDOW_TYPE_SOLID_COLOR_SPLASH_SCREEN*: jint {.`static`.}
  STARTING_WINDOW_TYPE_LEGACY_SPLASH_SCREEN*: jint {.`static`.}
  STARTING_WINDOW_TYPE_WINDOWLESS*: jint {.`static`.}
  taskInfo*: ActivityManager.RunningTaskInfo
  taskBounds*: Rect
  targetActivityInfo*: ActivityInfo
  mainWindowLayoutParams*: WindowManager.LayoutParams
  TYPE_PARAMETER_NEW_TASK*: jint {.`static`.}
  TYPE_PARAMETER_TASK_SWITCH*: jint {.`static`.}
  TYPE_PARAMETER_PROCESS_RUNNING*: jint {.`static`.}
  TYPE_PARAMETER_ALLOW_TASK_SNAPSHOT*: jint {.`static`.}
  TYPE_PARAMETER_ACTIVITY_CREATED*: jint {.`static`.}
  TYPE_PARAMETER_USE_SOLID_COLOR_SPLASH_SCREEN*: jint {.`static`.}
  TYPE_PARAMETER_ACTIVITY_DRAWN*: jint {.`static`.}
  TYPE_PARAMETER_ALLOW_HANDLE_SOLID_COLOR_SCREEN*: jint {.`static`.}
  TYPE_PARAMETER_WINDOWLESS*: jint {.`static`.}
  TYPE_PARAMETER_APP_PREFERS_ICON*: jint {.`static`.}
  TYPE_PARAMETER_LEGACY_SPLASH_SCREEN*: jint {.`static`.}
  startingWindowTypeParameter*: jint
  splashScreenThemeResId*: jint
  isKeyguardOccluded*: jboolean
  taskSnapshot*: TaskSnapshot
  requestedVisibleTypes*: jint
  appToken*: IBinder
  windowlessStartingSurfaceCallback*: IWindowlessStartingSurfaceCallback
  rootSurface*: SurfaceControl
  CREATOR*: Creator[StartingWindowInfo] {.`static`.}

