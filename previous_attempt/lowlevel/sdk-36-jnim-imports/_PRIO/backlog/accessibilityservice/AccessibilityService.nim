import jnim

jclass android.accessibilityservice.AccessibilityService* of Service:
  proc onAccessibilityEvent*(event: AccessibilityEvent)
  proc onInterrupt*()
  proc onGesture*(gestureEvent: AccessibilityGestureEvent): jboolean
  proc onMotionEvent*(event: MotionEvent)
  proc getWindows*(): List[AccessibilityWindowInfo]
  proc getWindowsOnAllDisplays*(): SparseArray[List[AccessibilityWindowInfo]]
  proc getRootInActiveWindow*(): AccessibilityNodeInfo
  proc getRootInActiveWindow*(prefetchingStrategy: jint): AccessibilityNodeInfo
  proc disableSelf*()
  proc createDisplayContext*(display: Display): Context
  proc createWindowContext*(type: jint, options: Bundle): Context
  proc createWindowContext*(display: Display, type: jint, options: Bundle): Context
  proc getMagnificationController*(): MagnificationController
  proc getMagnificationController*(displayId: jint): MagnificationController
  proc getFingerprintGestureController*(): FingerprintGestureController
  proc dispatchGesture*(gesture: GestureDescription, callback: GestureResultCallback, handler: Handler): jboolean
  proc getConnectionId*(): jint
  proc getSoftKeyboardController*(): SoftKeyboardController
  proc onCreateInputMethod*(): InputMethod
  proc getInputMethod*(): InputMethod
  proc getAccessibilityButtonController*(): AccessibilityButtonController
  proc getAccessibilityButtonController*(displayId: jint): AccessibilityButtonController
  proc setCacheEnabled*(enabled: jboolean): jboolean
  proc clearCachedSubtree*(node: AccessibilityNodeInfo): jboolean
  proc clearCache*(): jboolean
  proc isNodeInCache*(node: AccessibilityNodeInfo): jboolean
  proc isCacheEnabled*(): jboolean
  proc onSystemActionsChanged*()
  proc getSystemActions*(): List[AccessibilityAction]
  proc performGlobalAction*(action: jint): jboolean
  proc findFocus*(focus: jint): AccessibilityNodeInfo
  proc getServiceInfo*(): AccessibilityServiceInfo
  proc setServiceInfo*(info: AccessibilityServiceInfo)
  proc getSystemService*(name: string): JObject
  proc takeScreenshot*(displayId: jint, executor: Executor, callback: TakeScreenshotCallback)
  proc takeScreenshotOfWindow*(accessibilityWindowId: jint, executor: Executor, callback: TakeScreenshotCallback)
  proc setAccessibilityFocusAppearance*(strokeWidth: jint, color: jint)
  proc onBind*(intent: Intent): IBinder
  proc setGestureDetectionPassthroughRegion*(displayId: jint, region: Region)
  proc setTouchExplorationPassthroughRegion*(displayId: jint, region: Region)
  proc setAnimationScale*(scale: jfloat)
  proc getTouchInteractionController*(displayId: jint): TouchInteractionController
  proc attachAccessibilityOverlayToDisplay*(displayId: jint, sc: SurfaceControl)
  proc attachAccessibilityOverlayToDisplay*(displayId: jint, sc: SurfaceControl, executor: Executor, callback: IntConsumer)
  proc attachAccessibilityOverlayToWindow*(accessibilityWindowId: jint, sc: SurfaceControl)
  proc attachAccessibilityOverlayToWindow*(accessibilityWindowId: jint, sc: SurfaceControl, executor: Executor, callback: IntConsumer)
  proc getBrailleDisplayController*(): BrailleDisplayController
  GESTURE_TOUCH_EXPLORATION*: jint {.`static`.}
  GESTURE_PASSTHROUGH*: jint {.`static`.}
  GESTURE_UNKNOWN*: jint {.`static`.}
  GESTURE_SWIPE_UP*: jint {.`static`.}
  GESTURE_SWIPE_DOWN*: jint {.`static`.}
  GESTURE_SWIPE_LEFT*: jint {.`static`.}
  GESTURE_SWIPE_RIGHT*: jint {.`static`.}
  GESTURE_SWIPE_LEFT_AND_RIGHT*: jint {.`static`.}
  GESTURE_SWIPE_RIGHT_AND_LEFT*: jint {.`static`.}
  GESTURE_SWIPE_UP_AND_DOWN*: jint {.`static`.}
  GESTURE_SWIPE_DOWN_AND_UP*: jint {.`static`.}
  GESTURE_SWIPE_LEFT_AND_UP*: jint {.`static`.}
  GESTURE_SWIPE_LEFT_AND_DOWN*: jint {.`static`.}
  GESTURE_SWIPE_RIGHT_AND_UP*: jint {.`static`.}
  GESTURE_SWIPE_RIGHT_AND_DOWN*: jint {.`static`.}
  GESTURE_SWIPE_UP_AND_LEFT*: jint {.`static`.}
  GESTURE_SWIPE_UP_AND_RIGHT*: jint {.`static`.}
  GESTURE_SWIPE_DOWN_AND_LEFT*: jint {.`static`.}
  GESTURE_SWIPE_DOWN_AND_RIGHT*: jint {.`static`.}
  GESTURE_DOUBLE_TAP*: jint {.`static`.}
  GESTURE_DOUBLE_TAP_AND_HOLD*: jint {.`static`.}
  GESTURE_2_FINGER_SINGLE_TAP*: jint {.`static`.}
  GESTURE_2_FINGER_DOUBLE_TAP*: jint {.`static`.}
  GESTURE_2_FINGER_TRIPLE_TAP*: jint {.`static`.}
  GESTURE_3_FINGER_SINGLE_TAP*: jint {.`static`.}
  GESTURE_3_FINGER_DOUBLE_TAP*: jint {.`static`.}
  GESTURE_3_FINGER_TRIPLE_TAP*: jint {.`static`.}
  GESTURE_2_FINGER_SWIPE_UP*: jint {.`static`.}
  GESTURE_2_FINGER_SWIPE_DOWN*: jint {.`static`.}
  GESTURE_2_FINGER_SWIPE_LEFT*: jint {.`static`.}
  GESTURE_2_FINGER_SWIPE_RIGHT*: jint {.`static`.}
  GESTURE_3_FINGER_SWIPE_UP*: jint {.`static`.}
  GESTURE_3_FINGER_SWIPE_DOWN*: jint {.`static`.}
  GESTURE_3_FINGER_SWIPE_LEFT*: jint {.`static`.}
  GESTURE_3_FINGER_SWIPE_RIGHT*: jint {.`static`.}
  GESTURE_4_FINGER_SWIPE_UP*: jint {.`static`.}
  GESTURE_4_FINGER_SWIPE_DOWN*: jint {.`static`.}
  GESTURE_4_FINGER_SWIPE_LEFT*: jint {.`static`.}
  GESTURE_4_FINGER_SWIPE_RIGHT*: jint {.`static`.}
  GESTURE_4_FINGER_SINGLE_TAP*: jint {.`static`.}
  GESTURE_4_FINGER_DOUBLE_TAP*: jint {.`static`.}
  GESTURE_4_FINGER_TRIPLE_TAP*: jint {.`static`.}
  GESTURE_2_FINGER_DOUBLE_TAP_AND_HOLD*: jint {.`static`.}
  GESTURE_3_FINGER_DOUBLE_TAP_AND_HOLD*: jint {.`static`.}
  GESTURE_2_FINGER_TRIPLE_TAP_AND_HOLD*: jint {.`static`.}
  GESTURE_3_FINGER_SINGLE_TAP_AND_HOLD*: jint {.`static`.}
  GESTURE_3_FINGER_TRIPLE_TAP_AND_HOLD*: jint {.`static`.}
  GESTURE_4_FINGER_DOUBLE_TAP_AND_HOLD*: jint {.`static`.}
  SERVICE_INTERFACE*: string {.`static`.}
  SERVICE_META_DATA*: string {.`static`.}
  GLOBAL_ACTION_BACK*: jint {.`static`.}
  GLOBAL_ACTION_HOME*: jint {.`static`.}
  GLOBAL_ACTION_RECENTS*: jint {.`static`.}
  GLOBAL_ACTION_NOTIFICATIONS*: jint {.`static`.}
  GLOBAL_ACTION_QUICK_SETTINGS*: jint {.`static`.}
  GLOBAL_ACTION_POWER_DIALOG*: jint {.`static`.}
  GLOBAL_ACTION_TOGGLE_SPLIT_SCREEN*: jint {.`static`.}
  GLOBAL_ACTION_LOCK_SCREEN*: jint {.`static`.}
  GLOBAL_ACTION_TAKE_SCREENSHOT*: jint {.`static`.}
  GLOBAL_ACTION_KEYCODE_HEADSETHOOK*: jint {.`static`.}
  GLOBAL_ACTION_ACCESSIBILITY_BUTTON*: jint {.`static`.}
  GLOBAL_ACTION_ACCESSIBILITY_BUTTON_CHOOSER*: jint {.`static`.}
  GLOBAL_ACTION_ACCESSIBILITY_SHORTCUT*: jint {.`static`.}
  GLOBAL_ACTION_ACCESSIBILITY_ALL_APPS*: jint {.`static`.}
  GLOBAL_ACTION_DISMISS_NOTIFICATION_SHADE*: jint {.`static`.}
  GLOBAL_ACTION_DPAD_UP*: jint {.`static`.}
  GLOBAL_ACTION_DPAD_DOWN*: jint {.`static`.}
  GLOBAL_ACTION_DPAD_LEFT*: jint {.`static`.}
  GLOBAL_ACTION_DPAD_RIGHT*: jint {.`static`.}
  GLOBAL_ACTION_DPAD_CENTER*: jint {.`static`.}
  GLOBAL_ACTION_MENU*: jint {.`static`.}
  GLOBAL_ACTION_MEDIA_PLAY_PAUSE*: jint {.`static`.}
  SHOW_MODE_AUTO*: jint {.`static`.}
  SHOW_MODE_HIDDEN*: jint {.`static`.}
  SHOW_MODE_IGNORE_HARD_KEYBOARD*: jint {.`static`.}
  SHOW_MODE_MASK*: jint {.`static`.}
  SHOW_MODE_HARD_KEYBOARD_ORIGINAL_VALUE*: jint {.`static`.}
  SHOW_MODE_HARD_KEYBOARD_OVERRIDDEN*: jint {.`static`.}
  TAKE_SCREENSHOT_SUCCESS*: jint {.`static`.}
  ERROR_TAKE_SCREENSHOT_INTERNAL_ERROR*: jint {.`static`.}
  ERROR_TAKE_SCREENSHOT_NO_ACCESSIBILITY_ACCESS*: jint {.`static`.}
  ERROR_TAKE_SCREENSHOT_INTERVAL_TIME_SHORT*: jint {.`static`.}
  ERROR_TAKE_SCREENSHOT_INVALID_DISPLAY*: jint {.`static`.}
  ERROR_TAKE_SCREENSHOT_INVALID_WINDOW*: jint {.`static`.}
  ERROR_TAKE_SCREENSHOT_SECURE_WINDOW*: jint {.`static`.}
  ACCESSIBILITY_TAKE_SCREENSHOT_REQUEST_INTERVAL_TIMES_MS*: jint {.`static`.}
  KEY_ACCESSIBILITY_SCREENSHOT_STATUS*: string {.`static`.}
  KEY_ACCESSIBILITY_SCREENSHOT_HARDWAREBUFFER*: string {.`static`.}
  KEY_ACCESSIBILITY_SCREENSHOT_COLORSPACE*: string {.`static`.}
  KEY_ACCESSIBILITY_SCREENSHOT_TIMESTAMP*: string {.`static`.}
  OVERLAY_RESULT_SUCCESS*: jint {.`static`.}
  OVERLAY_RESULT_INTERNAL_ERROR*: jint {.`static`.}
  OVERLAY_RESULT_INVALID*: jint {.`static`.}

jclass android.accessibilityservice.AccessibilityService.MagnificationController* of JVMObject:
  proc addListener*(listener: OnMagnificationChangedListener)
  proc addListener*(listener: OnMagnificationChangedListener, handler: Handler)
  proc removeListener*(listener: OnMagnificationChangedListener): jboolean
  proc getMagnificationConfig*(): MagnificationConfig
  proc getScale*(): jfloat
  proc getCenterX*(): jfloat
  proc getCenterY*(): jfloat
  proc getMagnificationRegion*(): Region
  proc getCurrentMagnificationRegion*(): Region
  proc reset*(animate: jboolean): jboolean
  proc resetCurrentMagnification*(animate: jboolean): jboolean
  proc setMagnificationConfig*(config: MagnificationConfig, animate: jboolean): jboolean
  proc setScale*(scale: jfloat, animate: jboolean): jboolean
  proc setCenter*(centerX: jfloat, centerY: jfloat, animate: jboolean): jboolean

jclass android.accessibilityservice.AccessibilityService.SoftKeyboardController* of JVMObject:
  proc addOnShowModeChangedListener*(listener: OnShowModeChangedListener)
  proc addOnShowModeChangedListener*(listener: OnShowModeChangedListener, handler: Handler)
  proc removeOnShowModeChangedListener*(listener: OnShowModeChangedListener): jboolean
  proc getShowMode*(): jint
  proc setShowMode*(showMode: jint): jboolean
  proc switchToInputMethod*(imeId: string): jboolean
  proc setInputMethodEnabled*(imeId: string, enabled: jboolean): jint

jclass android.accessibilityservice.AccessibilityService.IAccessibilityServiceClientWrapper* of JVMObject:
  proc init*(connection: IAccessibilityServiceConnection, connectionId: jint, windowToken: IBinder)
  proc onInterrupt*()
  proc onAccessibilityEvent*(event: AccessibilityEvent, serviceWantsEvent: jboolean)
  proc onGesture*(gestureInfo: AccessibilityGestureEvent)
  proc clearAccessibilityCache*()
  proc onKeyEvent*(event: KeyEvent, sequence: jint)
  proc onMagnificationChanged*(displayId: jint, region: Region, config: MagnificationConfig)
  proc onSoftKeyboardShowModeChanged*(showMode: jint)
  proc onPerformGestureResult*(sequence: jint, successfully: jboolean)
  proc onFingerprintCapturingGesturesChanged*(active: jboolean)
  proc onFingerprintGesture*(gesture: jint)
  proc onAccessibilityButtonClicked*(displayId: jint)
  proc onAccessibilityButtonAvailabilityChanged*(available: jboolean)
  proc onSystemActionsChanged*()
  proc createImeSession*(callback: IAccessibilityInputMethodSessionCallback)
  proc setImeSessionEnabled*(session: IAccessibilityInputMethodSession, enabled: jboolean)
  proc bindInput*()
  proc unbindInput*()
  proc startInput*(connection: IRemoteAccessibilityInputConnection, editorInfo: EditorInfo, restarting: jboolean)
  proc onMotionEvent*(event: MotionEvent)
  proc onTouchStateChanged*(displayId: jint, state: jint)

jclass android.accessibilityservice.AccessibilityService.GestureResultCallback* of JVMObject:
  proc onCompleted*(gestureDescription: GestureDescription)
  proc onCancelled*(gestureDescription: GestureDescription)

jclass android.accessibilityservice.AccessibilityService.ScreenshotResult* of JVMObject:
  proc getColorSpace*(): ColorSpace
  proc getHardwareBuffer*(): HardwareBuffer
  proc getTimestamp*(): jlong


jclass android.accessibilityservice.MagnificationController* of JVMObject:
  proc addListener*(listener: OnMagnificationChangedListener)
  proc addListener*(listener: OnMagnificationChangedListener, handler: Handler)
  proc removeListener*(listener: OnMagnificationChangedListener): jboolean
  proc getMagnificationConfig*(): MagnificationConfig
  proc getScale*(): jfloat
  proc getCenterX*(): jfloat
  proc getCenterY*(): jfloat
  proc getMagnificationRegion*(): Region
  proc getCurrentMagnificationRegion*(): Region
  proc reset*(animate: jboolean): jboolean
  proc resetCurrentMagnification*(animate: jboolean): jboolean
  proc setMagnificationConfig*(config: MagnificationConfig, animate: jboolean): jboolean
  proc setScale*(scale: jfloat, animate: jboolean): jboolean
  proc setCenter*(centerX: jfloat, centerY: jfloat, animate: jboolean): jboolean


jclass android.accessibilityservice.SoftKeyboardController* of JVMObject:
  proc addOnShowModeChangedListener*(listener: OnShowModeChangedListener)
  proc addOnShowModeChangedListener*(listener: OnShowModeChangedListener, handler: Handler)
  proc removeOnShowModeChangedListener*(listener: OnShowModeChangedListener): jboolean
  proc getShowMode*(): jint
  proc setShowMode*(showMode: jint): jboolean
  proc switchToInputMethod*(imeId: string): jboolean
  proc setInputMethodEnabled*(imeId: string, enabled: jboolean): jint
  ENABLE_IME_SUCCESS*: jint {.`static`.}
  ENABLE_IME_FAIL_BY_ADMIN*: jint {.`static`.}
  ENABLE_IME_FAIL_UNKNOWN*: jint {.`static`.}


jclass android.accessibilityservice.IAccessibilityServiceClientWrapper* of Stub:
  proc init*(connection: IAccessibilityServiceConnection, connectionId: jint, windowToken: IBinder)
  proc onInterrupt*()
  proc onAccessibilityEvent*(event: AccessibilityEvent, serviceWantsEvent: jboolean)
  proc onGesture*(gestureInfo: AccessibilityGestureEvent)
  proc clearAccessibilityCache*()
  proc onKeyEvent*(event: KeyEvent, sequence: jint)
  proc onMagnificationChanged*(displayId: jint, region: Region, config: MagnificationConfig)
  proc onSoftKeyboardShowModeChanged*(showMode: jint)
  proc onPerformGestureResult*(sequence: jint, successfully: jboolean)
  proc onFingerprintCapturingGesturesChanged*(active: jboolean)
  proc onFingerprintGesture*(gesture: jint)
  proc onAccessibilityButtonClicked*(displayId: jint)
  proc onAccessibilityButtonAvailabilityChanged*(available: jboolean)
  proc onSystemActionsChanged*()
  proc createImeSession*(callback: IAccessibilityInputMethodSessionCallback)
  proc setImeSessionEnabled*(session: IAccessibilityInputMethodSession, enabled: jboolean)
  proc bindInput*()
  proc unbindInput*()
  proc startInput*(connection: IRemoteAccessibilityInputConnection, editorInfo: EditorInfo, restarting: jboolean)
  proc onMotionEvent*(event: MotionEvent)
  proc onTouchStateChanged*(displayId: jint, state: jint)

jclass android.accessibilityservice.GestureResultCallback* of JVMObject:
  proc onCompleted*(gestureDescription: GestureDescription)
  proc onCancelled*(gestureDescription: GestureDescription)


jclass android.accessibilityservice.ScreenshotResult* of JVMObject:
  proc getColorSpace*(): ColorSpace
  proc getHardwareBuffer*(): HardwareBuffer
  proc getTimestamp*(): jlong

