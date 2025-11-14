import jnim

jclass android.app.UiModeManager* of JVMObject:
  proc enableCarMode*(flags: jint)
  proc enableCarMode*(priority: jint, flags: jint)
  proc disableCarMode*(flags: jint)
  proc invalidateCurrentModeTypeCache*() {.`static`.}
  proc getCurrentModeType*(): jint
  proc setNightMode*(mode: jint)
  proc setNightModeCustomType*(nightModeCustomType: jint)
  proc getNightModeCustomType*(): jint
  proc setAttentionModeThemeOverlay*(attentionModeThemeOverlayType: jint)
  proc getAttentionModeThemeOverlay*(): jint
  proc setApplicationNightMode*(mode: jint)
  proc invalidateNightModeCache*() {.`static`.}
  proc getNightMode*(): jint
  proc isUiModeLocked*(): jboolean
  proc isNightModeLocked*(): jboolean
  proc setNightModeActivatedForCustomMode*(nightModeCustomType: jint, active: jboolean): jboolean
  proc setNightModeActivated*(active: jboolean): jboolean
  proc getCustomNightModeStart*(): LocalTime
  proc setCustomNightModeStart*(time: LocalTime)
  proc getCustomNightModeEnd*(): LocalTime
  proc setCustomNightModeEnd*(time: LocalTime)
  proc requestProjection*(projectionType: jint): jboolean
  proc releaseProjection*(projectionType: jint): jboolean
  proc getProjectingPackages*(projectionType: jint): Set[string]
  proc getActiveProjectionTypes*(): jint
  proc addOnProjectionStateChangedListener*(projectionType: jint, executor: Executor, listener: OnProjectionStateChangedListener)
  proc removeOnProjectionStateChangedListener*(listener: OnProjectionStateChangedListener)
  proc getContrast*(): jfloat
  proc addContrastChangeListener*(executor: Executor, listener: ContrastChangeListener)
  proc removeContrastChangeListener*(listener: ContrastChangeListener)
  proc getForceInvertState*(): jint
  proc addForceInvertStateChangeListener*(executor: Executor, listener: ForceInvertStateChangeListener)
  proc removeForceInvertStateChangeListener*(listener: ForceInvertStateChangeListener)
  ACTION_ENTER_CAR_MODE*: string {.`static`.}
  ACTION_ENTER_CAR_MODE_PRIORITIZED*: string {.`static`.}
  ACTION_EXIT_CAR_MODE*: string {.`static`.}
  ACTION_EXIT_CAR_MODE_PRIORITIZED*: string {.`static`.}
  ACTION_ENTER_DESK_MODE*: string {.`static`.}
  ACTION_EXIT_DESK_MODE*: string {.`static`.}
  EXTRA_CALLING_PACKAGE*: string {.`static`.}
  EXTRA_PRIORITY*: string {.`static`.}
  MODE_NIGHT_AUTO*: jint {.`static`.}
  MODE_NIGHT_CUSTOM*: jint {.`static`.}
  MODE_NIGHT_NO*: jint {.`static`.}
  MODE_NIGHT_YES*: jint {.`static`.}
  MODE_ATTENTION_THEME_OVERLAY_OFF*: jint {.`static`.}
  MODE_ATTENTION_THEME_OVERLAY_NIGHT*: jint {.`static`.}
  MODE_ATTENTION_THEME_OVERLAY_DAY*: jint {.`static`.}
  MODE_ATTENTION_THEME_OVERLAY_UNKNOWN*: jint {.`static`.}
  MODE_NIGHT_CUSTOM_TYPE_UNKNOWN*: jint {.`static`.}
  MODE_NIGHT_CUSTOM_TYPE_SCHEDULE*: jint {.`static`.}
  MODE_NIGHT_CUSTOM_TYPE_BEDTIME*: jint {.`static`.}
  FORCE_INVERT_TYPE_OFF*: jint {.`static`.}
  FORCE_INVERT_TYPE_DARK*: jint {.`static`.}
  FORCE_INVERT_TYPE_LIGHT*: jint {.`static`.}
  ENABLE_CAR_MODE_GO_CAR_HOME*: jint {.`static`.}
  ENABLE_CAR_MODE_ALLOW_SLEEP*: jint {.`static`.}
  DISABLE_CAR_MODE_GO_HOME*: jint {.`static`.}
  DISABLE_CAR_MODE_ALL_PRIORITIES*: jint {.`static`.}
  DEFAULT_PRIORITY*: jint {.`static`.}
  PROJECTION_TYPE_NONE*: jint {.`static`.}
  PROJECTION_TYPE_AUTOMOTIVE*: jint {.`static`.}
  PROJECTION_TYPE_ALL*: jint {.`static`.}

jclass android.app.UiModeManager.ContrastUtils* of JVMObject:
  proc toContrastLevel*(contrast: jfloat): jint {.`static`.}
  proc fromContrastLevel*(contrastLevel: jint): jfloat {.`static`.}



jclass android.app.ContrastUtils* of JVMObject:
  proc toContrastLevel*(contrast: jfloat): jint {.`static`.}
  proc fromContrastLevel*(contrastLevel: jint): jfloat {.`static`.}
  CONTRAST_DEFAULT_VALUE*: jfloat {.`static`.}
  CONTRAST_LEVEL_STANDARD*: jint {.`static`.}
  CONTRAST_LEVEL_MEDIUM*: jint {.`static`.}
  CONTRAST_LEVEL_HIGH*: jint {.`static`.}

