import jnim

jclass android.window.DisplayAreaOrganizer* of WindowOrganizer:
  proc getExecutor*(): Executor
  proc registerOrganizer*(displayAreaFeature: jint): List[DisplayAreaAppearedInfo]
  proc unregisterOrganizer*()
  proc createTaskDisplayArea*(displayId: jint, parentFeatureId: jint, name: string): DisplayAreaAppearedInfo
  proc deleteTaskDisplayArea*(taskDisplayArea: WindowContainerToken)
  proc onDisplayAreaAppeared*(displayAreaInfo: DisplayAreaInfo, leash: SurfaceControl)
  proc onDisplayAreaVanished*(displayAreaInfo: DisplayAreaInfo)
  proc onDisplayAreaInfoChanged*(displayAreaInfo: DisplayAreaInfo)
  KEY_ROOT_DISPLAY_AREA_ID*: string {.`static`.}
  FEATURE_UNDEFINED*: jint {.`static`.}
  FEATURE_SYSTEM_FIRST*: jint {.`static`.}
  FEATURE_ROOT*: jint {.`static`.}
  FEATURE_DEFAULT_TASK_CONTAINER*: jint {.`static`.}
  FEATURE_WINDOW_TOKENS*: jint {.`static`.}
  FEATURE_ONE_HANDED*: jint {.`static`.}
  FEATURE_WINDOWED_MAGNIFICATION*: jint {.`static`.}
  FEATURE_FULLSCREEN_MAGNIFICATION*: jint {.`static`.}
  FEATURE_HIDE_DISPLAY_CUTOUT*: jint {.`static`.}
  FEATURE_IME_PLACEHOLDER*: jint {.`static`.}
  FEATURE_IME*: jint {.`static`.}
  FEATURE_WINDOWING_LAYER*: jint {.`static`.}
  FEATURE_APP_ZOOM_OUT*: jint {.`static`.}
  FEATURE_SYSTEM_LAST*: jint {.`static`.}
  FEATURE_VENDOR_FIRST*: jint {.`static`.}
  FEATURE_VENDOR_LAST*: jint {.`static`.}
  FEATURE_RUNTIME_TASK_CONTAINER_FIRST*: jint {.`static`.}

