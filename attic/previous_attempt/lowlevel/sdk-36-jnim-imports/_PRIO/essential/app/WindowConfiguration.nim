import jnim

jclass android.app.WindowConfiguration* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)
  proc describeContents*(): jint
  proc setBounds*(rect: Rect)
  proc setAppBounds*(rect: Rect)
  proc setMaxBounds*(rect: Rect)
  proc setMaxBounds*(left: jint, top: jint, right: jint, bottom: jint)
  proc setDisplayRotation*(rotation: jint)
  proc setAlwaysOnTop*(alwaysOnTop: jboolean)
  proc unsetAlwaysOnTop*()
  proc setAppBounds*(left: jint, top: jint, right: jint, bottom: jint)
  proc getAppBounds*(): Rect
  proc getBounds*(): Rect
  proc getMaxBounds*(): Rect
  proc getDisplayRotation*(): jint
  proc getRotation*(): jint
  proc setRotation*(rotation: jint)
  proc setWindowingMode*(windowingMode: jint)
  proc getWindowingMode*(): jint
  proc setActivityType*(activityType: jint)
  proc getActivityType*(): jint
  proc setTo*(other: WindowConfiguration)
  proc unset*()
  proc setToDefaults*()
  proc scale*(scale: jfloat)
  proc updateFrom*(delta: WindowConfiguration): jint
  proc setTo*(delta: WindowConfiguration, mask: jint)
  proc diff*(other: WindowConfiguration, compareUndefined: jboolean): jlong
  proc compareTo*(that: WindowConfiguration): jint
  proc equals*(that: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc dumpDebug*(protoOutputStream: ProtoOutputStream, fieldId: jlong)
  proc readFromProto*(proto: ProtoInputStream, fieldId: jlong)
  proc hasWindowShadow*(): jboolean
  proc canResizeTask*(): jboolean
  proc tasksAreFloating*(): jboolean
  proc isFloating*(windowingMode: jint): jboolean {.`static`.}
  proc inMultiWindowMode*(windowingMode: jint): jboolean {.`static`.}
  proc canReceiveKeys*(): jboolean
  proc isAlwaysOnTop*(): jboolean
  proc useWindowFrameForBackdrop*(): jboolean
  proc hasMovementAnimations*(): jboolean
  proc supportSplitScreenWindowingMode*(): jboolean
  proc supportSplitScreenWindowingMode*(activityType: jint): jboolean {.`static`.}
  proc areConfigurationsEqualForDisplay*(newConfig: Configuration, oldConfig: Configuration): jboolean {.`static`.}
  proc windowingModeToString*(windowingMode: jint): string {.`static`.}
  proc activityTypeToString*(applicationType: jint): string {.`static`.}
  proc alwaysOnTopToString*(alwaysOnTop: jint): string {.`static`.}
  ROTATION_UNDEFINED*: jint {.`static`.}
  WINDOWING_MODE_UNDEFINED*: jint {.`static`.}
  WINDOWING_MODE_FULLSCREEN*: jint {.`static`.}
  WINDOWING_MODE_PINNED*: jint {.`static`.}
  WINDOWING_MODE_FREEFORM*: jint {.`static`.}
  WINDOWING_MODE_MULTI_WINDOW*: jint {.`static`.}
  ACTIVITY_TYPE_UNDEFINED*: jint {.`static`.}
  ACTIVITY_TYPE_STANDARD*: jint {.`static`.}
  ACTIVITY_TYPE_HOME*: jint {.`static`.}
  ACTIVITY_TYPE_RECENTS*: jint {.`static`.}
  ACTIVITY_TYPE_ASSISTANT*: jint {.`static`.}
  ACTIVITY_TYPE_DREAM*: jint {.`static`.}
  WINDOW_CONFIG_BOUNDS*: jint {.`static`.}
  WINDOW_CONFIG_APP_BOUNDS*: jint {.`static`.}
  WINDOW_CONFIG_MAX_BOUNDS*: jint {.`static`.}
  WINDOW_CONFIG_WINDOWING_MODE*: jint {.`static`.}
  WINDOW_CONFIG_ACTIVITY_TYPE*: jint {.`static`.}
  WINDOW_CONFIG_ALWAYS_ON_TOP*: jint {.`static`.}
  WINDOW_CONFIG_ROTATION*: jint {.`static`.}
  WINDOW_CONFIG_DISPLAY_ROTATION*: jint {.`static`.}
  CREATOR*: Creator[WindowConfiguration] {.`static`.}

