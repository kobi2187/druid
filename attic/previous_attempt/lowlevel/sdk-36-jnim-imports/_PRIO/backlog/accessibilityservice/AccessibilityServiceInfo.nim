import jnim

jclass android.accessibilityservice.AccessibilityServiceInfo* of JVMObject:
  proc resetDynamicallyConfigurableProperties*()
  proc updateDynamicallyConfigurableProperties*(platformCompat: IPlatformCompat, other: AccessibilityServiceInfo)
  proc setComponentName*(component: ComponentName)
  proc setResolveInfo*(resolveInfo: ResolveInfo)
  proc getComponentName*(): ComponentName
  proc getId*(): string
  proc getResolveInfo*(): ResolveInfo
  proc getSettingsActivityName*(): string
  proc getTileServiceName*(): string
  proc getAnimatedImageRes*(): jint
  proc loadAnimatedImage*(context: Context): Drawable
  proc getCanRetrieveWindowContent*(): jboolean
  proc getCapabilities*(): jint
  proc setCapabilities*(capabilities: jint)
  proc getMotionEventSources*(): jint
  proc setMotionEventSources*(motionEventSources: jint)
  proc setObservedMotionEventSources*(observedMotionEventSources: jint)
  proc getObservedMotionEventSources*(): jint
  proc loadSummary*(packageManager: PackageManager): CharSequence
  proc loadIntro*(packageManager: PackageManager): CharSequence
  proc getDescription*(): string
  proc loadDescription*(packageManager: PackageManager): string
  proc loadHtmlDescription*(packageManager: PackageManager): string
  proc setNonInteractiveUiTimeoutMillis*(timeout: jint)
  proc getNonInteractiveUiTimeoutMillis*(): jint
  proc setInteractiveUiTimeoutMillis*(timeout: jint)
  proc getInteractiveUiTimeoutMillis*(): jint
  proc isDirectBootAware*(): jboolean
  proc setAccessibilityTool*(isAccessibilityTool: jboolean)
  proc isAccessibilityTool*(): jboolean
  proc describeContents*(): jint
  proc isWithinParcelableSize*(): jboolean
  proc writeToParcel*(parcel: Parcel, flagz: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc feedbackTypeToString*(feedbackType: jint): string {.`static`.}
  proc flagToString*(flag: jint): string {.`static`.}
  proc capabilityToString*(capability: jint): string {.`static`.}
  proc getCapabilityInfos*(): List[CapabilityInfo]
  proc getCapabilityInfos*(context: Context): List[CapabilityInfo]
  CAPABILITY_CAN_RETRIEVE_WINDOW_CONTENT*: jint {.`static`.}
  CAPABILITY_CAN_REQUEST_TOUCH_EXPLORATION*: jint {.`static`.}
  CAPABILITY_CAN_REQUEST_ENHANCED_WEB_ACCESSIBILITY*: jint {.`static`.}
  CAPABILITY_CAN_REQUEST_FILTER_KEY_EVENTS*: jint {.`static`.}
  CAPABILITY_CAN_CONTROL_MAGNIFICATION*: jint {.`static`.}
  CAPABILITY_CAN_PERFORM_GESTURES*: jint {.`static`.}
  CAPABILITY_CAN_REQUEST_FINGERPRINT_GESTURES*: jint {.`static`.}
  CAPABILITY_CAN_TAKE_SCREENSHOT*: jint {.`static`.}
  FEEDBACK_SPOKEN*: jint {.`static`.}
  FEEDBACK_HAPTIC*: jint {.`static`.}
  FEEDBACK_AUDIBLE*: jint {.`static`.}
  FEEDBACK_VISUAL*: jint {.`static`.}
  FEEDBACK_GENERIC*: jint {.`static`.}
  FEEDBACK_BRAILLE*: jint {.`static`.}
  FEEDBACK_ALL_MASK*: jint {.`static`.}
  DEFAULT*: jint {.`static`.}
  FLAG_INCLUDE_NOT_IMPORTANT_VIEWS*: jint {.`static`.}
  FLAG_REQUEST_TOUCH_EXPLORATION_MODE*: jint {.`static`.}
  FLAG_REQUEST_ENHANCED_WEB_ACCESSIBILITY*: jint {.`static`.}
  FLAG_REPORT_VIEW_IDS*: jint {.`static`.}
  FLAG_REQUEST_FILTER_KEY_EVENTS*: jint {.`static`.}
  FLAG_RETRIEVE_INTERACTIVE_WINDOWS*: jint {.`static`.}
  FLAG_ENABLE_ACCESSIBILITY_VOLUME*: jint {.`static`.}
  FLAG_REQUEST_ACCESSIBILITY_BUTTON*: jint {.`static`.}
  FLAG_REQUEST_FINGERPRINT_GESTURES*: jint {.`static`.}
  FLAG_REQUEST_SHORTCUT_WARNING_DIALOG_SPOKEN_FEEDBACK*: jint {.`static`.}
  FLAG_SERVICE_HANDLES_DOUBLE_TAP*: jint {.`static`.}
  FLAG_REQUEST_MULTI_FINGER_GESTURES*: jint {.`static`.}
  FLAG_REQUEST_2_FINGER_PASSTHROUGH*: jint {.`static`.}
  FLAG_SEND_MOTION_EVENTS*: jint {.`static`.}
  FLAG_INPUT_METHOD_EDITOR*: jint {.`static`.}
  FLAG_FORCE_DIRECT_BOOT_AWARE*: jint {.`static`.}
  eventTypes*: jint
  packageNames*: string
  feedbackType*: jint
  notificationTimeout*: jlong
  flags*: jint
  crashed*: jboolean
  CREATOR*: Parcelable.Creator[AccessibilityServiceInfo] {.`static`.}

jclass android.accessibilityservice.CapabilityInfo* of JVMObject:
  capability*: jint
  titleResId*: jint
  descResId*: jint

