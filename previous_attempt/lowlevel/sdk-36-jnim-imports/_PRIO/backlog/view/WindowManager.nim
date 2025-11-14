import jnim

jclass android.view.WindowManager* of ViewManager:
  proc getDefaultDisplay*(): Display
  proc removeViewImmediate*(view: View)
  proc requestAppKeyboardShortcuts*(receiver: KeyboardShortcutsReceiver, deviceId: jint)
  proc getCurrentImeTouchRegion*(): Region
  PARCEL_KEY_SHORTCUTS_ARRAY*: string {.`static`.}
  PROPERTY_SUPPORTS_MULTI_INSTANCE_SYSTEM_UI*: string {.`static`.}

jclass android.view.WindowManager.LayoutParams* of JVMObject:
  proc isSystemAlertWindowType*(type: jint): jboolean {.`static`.}
  proc mayUseInputMethod*(flags: jint): jboolean {.`static`.}
  proc setInsetsParams*(insetsParams: List[InsetsParams])
  proc setFitInsetsTypes*(types: jint)
  proc setFitInsetsSides*(sides: jint)
  proc setFitInsetsIgnoringVisibility*(ignore: jboolean)
  proc setTrustedOverlay*()
  proc setSystemApplicationOverlay*(isSystemApplicationOverlay: jboolean)
  proc isSystemApplicationOverlay*(): jboolean
  proc setWallpaperTouchEventsEnabled*(enable: jboolean)
  proc areWallpaperTouchEventsEnabled*(): jboolean
  proc setCanPlayMoveAnimation*(enable: jboolean)
  proc canPlayMoveAnimation*(): jboolean
  proc getFitInsetsTypes*(): jint
  proc getFitInsetsSides*(): jint
  proc isFitInsetsIgnoringVisibility*(): jboolean
  proc forRotation*(rotation: jint): LayoutParams
  proc setTitle*(title: CharSequence)
  proc getTitle*(): CharSequence
  proc setSurfaceInsets*(view: View, manual: jboolean, preservePrevious: jboolean)
  proc isHdrConversionEnabled*(): jboolean
  proc setHdrConversionEnabled*(enabled: jboolean)
  proc setColorMode*(colorMode: jint)
  proc getColorMode*(): jint
  proc setDesiredHdrHeadroom*(desiredHeadroom: jfloat)
  proc getDesiredHdrHeadroom*(): jfloat
  proc setFrameRateBoostOnTouchEnabled*(enabled: jboolean)
  proc getFrameRateBoostOnTouchEnabled*(): jboolean
  proc setFrameRatePowerSavingsBalanced*(enabled: jboolean)
  proc isFrameRatePowerSavingsBalanced*(): jboolean
  proc setBlurBehindRadius*(blurBehindRadius: jint)
  proc getBlurBehindRadius*(): jint
  proc setUserActivityTimeout*(timeout: jlong)
  proc getUserActivityTimeout*(): jlong
  proc setWindowContextToken*(token: IBinder)
  proc getWindowContextToken*(): IBinder
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, parcelableFlags: jint)
  proc copyFrom*(o: LayoutParams): jint
  proc debug*(output: string): string
  proc toString*(): string
  proc dumpDimensions*(sb: StringBuilder)
  proc toString*(prefix: string): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc scale*(scale: jfloat)
  proc isFullscreen*(): jboolean
  proc layoutInDisplayCutoutModeToString*(mode: jint): string {.`static`.}
  proc isModal*(): jboolean

jclass android.view.WindowManager.InsetsParams* of JVMObject:
  proc setInsetsSize*(insets: Insets): InsetsParams
  proc getType*(): jint
  proc getInsetsSize*(): Insets

jclass android.view.BadTokenException* of RuntimeException:

jclass android.view.InvalidDisplayException* of RuntimeException:


jclass android.view.LayoutParams* of LayoutParams:
  proc isSystemAlertWindowType*(type: jint): jboolean {.`static`.}
  proc mayUseInputMethod*(flags: jint): jboolean {.`static`.}
  proc setInsetsParams*(insetsParams: List[InsetsParams])
  proc setFitInsetsTypes*(types: jint)
  proc setFitInsetsSides*(sides: jint)
  proc setFitInsetsIgnoringVisibility*(ignore: jboolean)
  proc setTrustedOverlay*()
  proc setSystemApplicationOverlay*(isSystemApplicationOverlay: jboolean)
  proc isSystemApplicationOverlay*(): jboolean
  proc setWallpaperTouchEventsEnabled*(enable: jboolean)
  proc areWallpaperTouchEventsEnabled*(): jboolean
  proc setCanPlayMoveAnimation*(enable: jboolean)
  proc canPlayMoveAnimation*(): jboolean
  proc getFitInsetsTypes*(): jint
  proc getFitInsetsSides*(): jint
  proc isFitInsetsIgnoringVisibility*(): jboolean
  proc forRotation*(rotation: jint): LayoutParams
  proc setTitle*(title: CharSequence)
  proc getTitle*(): CharSequence
  proc setSurfaceInsets*(view: View, manual: jboolean, preservePrevious: jboolean)
  proc isHdrConversionEnabled*(): jboolean
  proc setHdrConversionEnabled*(enabled: jboolean)
  proc setColorMode*(colorMode: jint)
  proc getColorMode*(): jint
  proc setDesiredHdrHeadroom*(desiredHeadroom: jfloat)
  proc getDesiredHdrHeadroom*(): jfloat
  proc setFrameRateBoostOnTouchEnabled*(enabled: jboolean)
  proc getFrameRateBoostOnTouchEnabled*(): jboolean
  proc setFrameRatePowerSavingsBalanced*(enabled: jboolean)
  proc isFrameRatePowerSavingsBalanced*(): jboolean
  proc setBlurBehindRadius*(blurBehindRadius: jint)
  proc getBlurBehindRadius*(): jint
  proc setUserActivityTimeout*(timeout: jlong)
  proc getUserActivityTimeout*(): jlong
  proc setWindowContextToken*(token: IBinder)
  proc getWindowContextToken*(): IBinder
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, parcelableFlags: jint)
  proc copyFrom*(o: LayoutParams): jint
  proc debug*(output: string): string
  proc toString*(): string
  proc dumpDimensions*(sb: StringBuilder)
  proc toString*(prefix: string): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc scale*(scale: jfloat)
  proc isFullscreen*(): jboolean
  proc layoutInDisplayCutoutModeToString*(mode: jint): string {.`static`.}
  proc isModal*(): jboolean
  x*: jint
  y*: jint
  horizontalWeight*: jfloat
  verticalWeight*: jfloat
  typ*: jint
  FIRST_APPLICATION_WINDOW*: jint {.`static`.}
  TYPE_BASE_APPLICATION*: jint {.`static`.}
  TYPE_APPLICATION*: jint {.`static`.}
  TYPE_APPLICATION_STARTING*: jint {.`static`.}
  TYPE_DRAWN_APPLICATION*: jint {.`static`.}
  LAST_APPLICATION_WINDOW*: jint {.`static`.}
  FIRST_SUB_WINDOW*: jint {.`static`.}
  TYPE_APPLICATION_PANEL*: jint {.`static`.}
  TYPE_APPLICATION_MEDIA*: jint {.`static`.}
  TYPE_APPLICATION_SUB_PANEL*: jint {.`static`.}
  TYPE_APPLICATION_ATTACHED_DIALOG*: jint {.`static`.}
  TYPE_APPLICATION_MEDIA_OVERLAY*: jint {.`static`.}
  TYPE_APPLICATION_ABOVE_SUB_PANEL*: jint {.`static`.}
  LAST_SUB_WINDOW*: jint {.`static`.}
  FIRST_SYSTEM_WINDOW*: jint {.`static`.}
  TYPE_STATUS_BAR*: jint {.`static`.}
  TYPE_SEARCH_BAR*: jint {.`static`.}
  TYPE_PHONE*: jint {.`static`.}
  TYPE_SYSTEM_ALERT*: jint {.`static`.}
  TYPE_KEYGUARD*: jint {.`static`.}
  TYPE_TOAST*: jint {.`static`.}
  TYPE_SYSTEM_OVERLAY*: jint {.`static`.}
  TYPE_PRIORITY_PHONE*: jint {.`static`.}
  TYPE_SYSTEM_DIALOG*: jint {.`static`.}
  TYPE_KEYGUARD_DIALOG*: jint {.`static`.}
  TYPE_SYSTEM_ERROR*: jint {.`static`.}
  TYPE_INPUT_METHOD*: jint {.`static`.}
  TYPE_INPUT_METHOD_DIALOG*: jint {.`static`.}
  TYPE_WALLPAPER*: jint {.`static`.}
  TYPE_STATUS_BAR_PANEL*: jint {.`static`.}
  TYPE_SECURE_SYSTEM_OVERLAY*: jint {.`static`.}
  TYPE_DRAG*: jint {.`static`.}
  TYPE_STATUS_BAR_SUB_PANEL*: jint {.`static`.}
  TYPE_POINTER*: jint {.`static`.}
  TYPE_NAVIGATION_BAR*: jint {.`static`.}
  TYPE_VOLUME_OVERLAY*: jint {.`static`.}
  TYPE_BOOT_PROGRESS*: jint {.`static`.}
  TYPE_INPUT_CONSUMER*: jint {.`static`.}
  TYPE_NAVIGATION_BAR_PANEL*: jint {.`static`.}
  TYPE_DISPLAY_OVERLAY*: jint {.`static`.}
  TYPE_MAGNIFICATION_OVERLAY*: jint {.`static`.}
  TYPE_PRIVATE_PRESENTATION*: jint {.`static`.}
  TYPE_VOICE_INTERACTION*: jint {.`static`.}
  TYPE_ACCESSIBILITY_OVERLAY*: jint {.`static`.}
  TYPE_VOICE_INTERACTION_STARTING*: jint {.`static`.}
  TYPE_DOCK_DIVIDER*: jint {.`static`.}
  TYPE_QS_DIALOG*: jint {.`static`.}
  TYPE_SCREENSHOT*: jint {.`static`.}
  TYPE_PRESENTATION*: jint {.`static`.}
  TYPE_APPLICATION_OVERLAY*: jint {.`static`.}
  TYPE_ACCESSIBILITY_MAGNIFICATION_OVERLAY*: jint {.`static`.}
  TYPE_NOTIFICATION_SHADE*: jint {.`static`.}
  TYPE_STATUS_BAR_ADDITIONAL*: jint {.`static`.}
  LAST_SYSTEM_WINDOW*: jint {.`static`.}
  INVALID_WINDOW_TYPE*: jint {.`static`.}
  MEMORY_TYPE_NORMAL*: jint {.`static`.}
  MEMORY_TYPE_HARDWARE*: jint {.`static`.}
  MEMORY_TYPE_GPU*: jint {.`static`.}
  MEMORY_TYPE_PUSH_BUFFERS*: jint {.`static`.}
  memoryType*: jint
  FLAG_ALLOW_LOCK_WHILE_SCREEN_ON*: jint {.`static`.}
  FLAG_DIM_BEHIND*: jint {.`static`.}
  FLAG_BLUR_BEHIND*: jint {.`static`.}
  FLAG_NOT_FOCUSABLE*: jint {.`static`.}
  FLAG_NOT_TOUCHABLE*: jint {.`static`.}
  FLAG_NOT_TOUCH_MODAL*: jint {.`static`.}
  FLAG_TOUCHABLE_WHEN_WAKING*: jint {.`static`.}
  FLAG_KEEP_SCREEN_ON*: jint {.`static`.}
  FLAG_LAYOUT_IN_SCREEN*: jint {.`static`.}
  FLAG_LAYOUT_NO_LIMITS*: jint {.`static`.}
  FLAG_FULLSCREEN*: jint {.`static`.}
  FLAG_FORCE_NOT_FULLSCREEN*: jint {.`static`.}
  FLAG_DITHER*: jint {.`static`.}
  FLAG_SECURE*: jint {.`static`.}
  FLAG_SCALED*: jint {.`static`.}
  FLAG_IGNORE_CHEEK_PRESSES*: jint {.`static`.}
  FLAG_LAYOUT_INSET_DECOR*: jint {.`static`.}
  FLAG_ALT_FOCUSABLE_IM*: jint {.`static`.}
  FLAG_WATCH_OUTSIDE_TOUCH*: jint {.`static`.}
  FLAG_SHOW_WHEN_LOCKED*: jint {.`static`.}
  FLAG_SHOW_WALLPAPER*: jint {.`static`.}
  FLAG_TURN_SCREEN_ON*: jint {.`static`.}
  FLAG_DISMISS_KEYGUARD*: jint {.`static`.}
  FLAG_SPLIT_TOUCH*: jint {.`static`.}
  FLAG_HARDWARE_ACCELERATED*: jint {.`static`.}
  FLAG_LAYOUT_IN_OVERSCAN*: jint {.`static`.}
  FLAG_TRANSLUCENT_STATUS*: jint {.`static`.}
  FLAG_TRANSLUCENT_NAVIGATION*: jint {.`static`.}
  FLAG_LOCAL_FOCUS_MODE*: jint {.`static`.}
  FLAG_SLIPPERY*: jint {.`static`.}
  FLAG_LAYOUT_ATTACHED_IN_DECOR*: jint {.`static`.}
  FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS*: jint {.`static`.}
  flags*: jint
  PRIVATE_FLAG_FORCE_HARDWARE_ACCELERATED*: jint {.`static`.}
  PRIVATE_FLAG_WANTS_OFFSET_NOTIFICATIONS*: jint {.`static`.}
  PRIVATE_FLAG_SYSTEM_APPLICATION_OVERLAY*: jint {.`static`.}
  SYSTEM_FLAG_SHOW_FOR_ALL_USERS*: jint {.`static`.}
  PRIVATE_FLAG_UNRESTRICTED_GESTURE_EXCLUSION*: jint {.`static`.}
  PRIVATE_FLAG_NO_MOVE_ANIMATION*: jint {.`static`.}
  PRIVATE_FLAG_APP_PROGRESS_GENERATION_ALLOWED*: jint {.`static`.}
  PRIVATE_FLAG_SYSTEM_ERROR*: jint {.`static`.}
  PRIVATE_FLAG_OPTIMIZE_MEASURE*: jint {.`static`.}
  PRIVATE_FLAG_DISABLE_WALLPAPER_TOUCH_EVENTS*: jint {.`static`.}
  PRIVATE_FLAG_EDGE_TO_EDGE_ENFORCED*: jint {.`static`.}
  PRIVATE_FLAG_LAYOUT_SIZE_EXTENDED_BY_CUTOUT*: jint {.`static`.}
  PRIVATE_FLAG_FORCE_DECOR_VIEW_VISIBILITY*: jint {.`static`.}
  PRIVATE_FLAG_LAYOUT_CHILD_WINDOW_IN_PARENT_FRAME*: jint {.`static`.}
  PRIVATE_FLAG_FORCE_DRAW_BAR_BACKGROUNDS*: jint {.`static`.}
  PRIVATE_FLAG_SUSTAINED_PERFORMANCE_MODE*: jint {.`static`.}
  PRIVATE_FLAG_IMMERSIVE_CONFIRMATION_WINDOW*: jint {.`static`.}
  PRIVATE_FLAG_OVERRIDE_LAYOUT_IN_DISPLAY_CUTOUT_MODE*: jint {.`static`.}
  SYSTEM_FLAG_HIDE_NON_SYSTEM_OVERLAY_WINDOWS*: jint {.`static`.}
  PRIVATE_FLAG_IS_ROUNDED_CORNERS_OVERLAY*: jint {.`static`.}
  PRIVATE_FLAG_EXCLUDE_FROM_SCREEN_MAGNIFICATION*: jint {.`static`.}
  PRIVATE_FLAG_NOT_MAGNIFIABLE*: jint {.`static`.}
  PRIVATE_FLAG_ALLOW_ACTION_KEY_EVENTS*: jint {.`static`.}
  PRIVATE_FLAG_COLOR_SPACE_AGNOSTIC*: jint {.`static`.}
  PRIVATE_FLAG_CONSUME_IME_INSETS*: jint {.`static`.}
  PRIVATE_FLAG_OPT_OUT_EDGE_TO_EDGE*: jint {.`static`.}
  PRIVATE_FLAG_FIT_INSETS_CONTROLLED*: jint {.`static`.}
  PRIVATE_FLAG_TRUSTED_OVERLAY*: jint {.`static`.}
  PRIVATE_FLAG_INSET_PARENT_FRAME_BY_IME*: jint {.`static`.}
  PRIVATE_FLAG_INTERCEPT_GLOBAL_DRAG_AND_DROP*: jint {.`static`.}
  privateFlags*: jint
  SOFT_INPUT_MASK_STATE*: jint {.`static`.}
  SOFT_INPUT_STATE_UNSPECIFIED*: jint {.`static`.}
  SOFT_INPUT_STATE_UNCHANGED*: jint {.`static`.}
  SOFT_INPUT_STATE_HIDDEN*: jint {.`static`.}
  SOFT_INPUT_STATE_ALWAYS_HIDDEN*: jint {.`static`.}
  SOFT_INPUT_STATE_VISIBLE*: jint {.`static`.}
  SOFT_INPUT_STATE_ALWAYS_VISIBLE*: jint {.`static`.}
  SOFT_INPUT_MASK_ADJUST*: jint {.`static`.}
  SOFT_INPUT_ADJUST_UNSPECIFIED*: jint {.`static`.}
  SOFT_INPUT_ADJUST_RESIZE*: jint {.`static`.}
  SOFT_INPUT_ADJUST_PAN*: jint {.`static`.}
  SOFT_INPUT_ADJUST_NOTHING*: jint {.`static`.}
  SOFT_INPUT_IS_FORWARD_NAVIGATION*: jint {.`static`.}
  softInputMode*: jint
  gravity*: jint
  horizontalMargin*: jfloat
  verticalMargin*: jfloat
  surfaceInsets*: Rect
  hasManualSurfaceInsets*: jboolean
  receiveInsetsIgnoringZOrder*: jboolean
  preservePreviousSurfaceInsets*: jboolean
  format*: jint
  windowAnimations*: jint
  alpha*: jfloat
  dimAmount*: jfloat
  BRIGHTNESS_OVERRIDE_NONE*: jfloat {.`static`.}
  BRIGHTNESS_OVERRIDE_OFF*: jfloat {.`static`.}
  BRIGHTNESS_OVERRIDE_FULL*: jfloat {.`static`.}
  screenBrightness*: jfloat
  buttonBrightness*: jfloat
  ROTATION_ANIMATION_UNSPECIFIED*: jint {.`static`.}
  ROTATION_ANIMATION_ROTATE*: jint {.`static`.}
  ROTATION_ANIMATION_CROSSFADE*: jint {.`static`.}
  ROTATION_ANIMATION_JUMPCUT*: jint {.`static`.}
  ROTATION_ANIMATION_SEAMLESS*: jint {.`static`.}
  rotationAnimation*: jint
  token*: IBinder
  mWindowContextToken*: IBinder
  packageName*: string
  screenOrientation*: jint
  preferredRefreshRate*: jfloat
  preferredDisplayModeId*: jint
  preferredMinDisplayRefreshRate*: jfloat
  preferredMaxDisplayRefreshRate*: jfloat
  DISPLAY_FLAG_DISABLE_HDR_CONVERSION*: jint {.`static`.}
  systemUiVisibility*: jint
  subtreeSystemUiVisibility*: jint
  hasSystemUiListeners*: jboolean
  layoutInDisplayCutoutMode*: jint
  LAYOUT_IN_DISPLAY_CUTOUT_MODE_DEFAULT*: jint {.`static`.}
  LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES*: jint {.`static`.}
  LAYOUT_IN_DISPLAY_CUTOUT_MODE_NEVER*: jint {.`static`.}
  LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS*: jint {.`static`.}
  INPUT_FEATURE_NO_INPUT_CHANNEL*: jint {.`static`.}
  INPUT_FEATURE_DISABLE_USER_ACTIVITY*: jint {.`static`.}
  INPUT_FEATURE_SPY*: jint {.`static`.}
  INPUT_FEATURE_SENSITIVE_FOR_PRIVACY*: jint {.`static`.}
  inputFeatures*: jint
  userActivityTimeout*: jlong
  accessibilityIdOfAnchor*: jlong
  accessibilityTitle*: CharSequence
  hideTimeoutMilliseconds*: jlong
  preferMinimalPostProcessing*: jboolean
  insetsFlags*: InsetsFlags
  providedInsets*: InsetsFrameProvider
  forciblyShownTypes*: jint
  paramsForRotation*: LayoutParams
  CREATOR*: Parcelable.Creator[LayoutParams] {.`static`.}
  LAYOUT_CHANGED*: jint {.`static`.}
  TYPE_CHANGED*: jint {.`static`.}
  FLAGS_CHANGED*: jint {.`static`.}
  FORMAT_CHANGED*: jint {.`static`.}
  ANIMATION_CHANGED*: jint {.`static`.}
  DIM_AMOUNT_CHANGED*: jint {.`static`.}
  TITLE_CHANGED*: jint {.`static`.}
  ALPHA_CHANGED*: jint {.`static`.}
  MEMORY_TYPE_CHANGED*: jint {.`static`.}
  SOFT_INPUT_MODE_CHANGED*: jint {.`static`.}
  SCREEN_ORIENTATION_CHANGED*: jint {.`static`.}
  SCREEN_BRIGHTNESS_CHANGED*: jint {.`static`.}
  ROTATION_ANIMATION_CHANGED*: jint {.`static`.}
  BUTTON_BRIGHTNESS_CHANGED*: jint {.`static`.}
  SYSTEM_UI_VISIBILITY_CHANGED*: jint {.`static`.}
  SYSTEM_UI_LISTENER_CHANGED*: jint {.`static`.}
  INPUT_FEATURES_CHANGED*: jint {.`static`.}
  PRIVATE_FLAGS_CHANGED*: jint {.`static`.}
  USER_ACTIVITY_TIMEOUT_CHANGED*: jint {.`static`.}
  TRANSLUCENT_FLAGS_CHANGED*: jint {.`static`.}
  SURFACE_INSETS_CHANGED*: jint {.`static`.}
  PREFERRED_REFRESH_RATE_CHANGED*: jint {.`static`.}
  DISPLAY_FLAGS_CHANGED*: jint {.`static`.}
  PREFERRED_DISPLAY_MODE_ID*: jint {.`static`.}
  ACCESSIBILITY_ANCHOR_CHANGED*: jint {.`static`.}
  ACCESSIBILITY_TITLE_CHANGED*: jint {.`static`.}
  COLOR_MODE_CHANGED*: jint {.`static`.}
  INSET_FLAGS_CHANGED*: jint {.`static`.}
  MINIMAL_POST_PROCESSING_PREFERENCE_CHANGED*: jint {.`static`.}
  BLUR_BEHIND_RADIUS_CHANGED*: jint {.`static`.}
  PREFERRED_MIN_DISPLAY_REFRESH_RATE*: jint {.`static`.}
  PREFERRED_MAX_DISPLAY_REFRESH_RATE*: jint {.`static`.}

jclass android.view.InsetsParams* of JVMObject:
  proc setInsetsSize*(insets: Insets): InsetsParams
  proc getType*(): jint
  proc getInsetsSize*(): Insets

