import jnim

jclass android.view.Display* of JVMObject:
  proc getDisplayId*(): jint
  proc getUniqueId*(): string
  proc isValid*(): jboolean
  proc getDisplayInfo*(outDisplayInfo: DisplayInfo): jboolean
  proc getLayerStack*(): jint
  proc getFlags*(): jint
  proc getType*(): jint
  proc getAddress*(): DisplayAddress
  proc getOwnerUid*(): jint
  proc getOwnerPackageName*(): string
  proc getDisplayAdjustments*(): DisplayAdjustments
  proc getName*(): string
  proc getBrightnessDefault*(): jfloat
  proc getBrightnessInfo*(): BrightnessInfo
  proc getSize*(outSize: Point)
  proc getRectSize*(outSize: Rect)
  proc getCurrentSizeRange*(outSmallestSize: Point, outLargestSize: Point)
  proc getMaximumSizeDimension*(): jint
  proc getMinSizeDimensionDp*(): jfloat
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getRotation*(): jint
  proc getInstallOrientation*(): jint
  proc getOrientation*(): jint
  proc getCutout*(): DisplayCutout
  proc getRoundedCorner*(position: jint): RoundedCorner
  proc getShape*(): DisplayShape
  proc getPixelFormat*(): jint
  proc getRefreshRate*(): jfloat
  proc getSupportedRefreshRates*(): seq[jfloat]
  proc getSupportedRefreshRatesLegacy*(): seq[jfloat]
  proc getMode*(): Mode
  proc getDefaultMode*(): Mode
  proc getSupportedModes*(): seq[Mode]
  proc getSystemSupportedModes*(): seq[Mode]
  proc hasArrSupport*(): jboolean
  proc getSuggestedFrameRate*(category: jint): jfloat
  proc isMinimalPostProcessingSupported*(): jboolean
  proc requestColorMode*(colorMode: jint)
  proc getColorMode*(): jint
  proc getRemoveMode*(): jint
  proc getSystemPreferredDisplayMode*(): Display.Mode
  proc getHdrCapabilities*(): HdrCapabilities
  proc getReportedHdrTypes*(): seq[jint]
  proc isHdr*(): jboolean
  proc isHdrSdrRatioAvailable*(): jboolean
  proc getHdrSdrRatio*(): jfloat
  proc registerHdrSdrRatioChangedListener*(executor: Executor, listener: Consumer[Display])
  proc unregisterHdrSdrRatioChangedListener*(listener: Consumer[Display])
  proc getHighestHdrSdrRatio*(): jfloat
  proc setUserPreferredDisplayMode*(mode: Display.Mode)
  proc clearUserPreferredDisplayMode*()
  proc getUserPreferredDisplayMode*(): Display.Mode
  proc isWideColorGamut*(): jboolean
  proc getPreferredWideGamutColorSpace*(): ColorSpace
  proc getOverlaySupport*(): OverlayProperties
  proc getSupportedColorModes*(): seq[jint]
  proc getSupportedWideColorGamut*(): seq[ColorSpace]
  proc getAppVsyncOffsetNanos*(): jlong
  proc getPresentationDeadlineNanos*(): jlong
  proc getDeviceProductInfo*(): DeviceProductInfo
  proc getMetrics*(outMetrics: DisplayMetrics)
  proc getRealSize*(outSize: Point)
  proc getRealMetrics*(outMetrics: DisplayMetrics)
  proc getState*(): jint
  proc getCommittedState*(): jint
  proc canHostTasks*(): jboolean
  proc hasAccess*(uid: jint): jboolean
  proc hasAccess*(uid: jint, flags: jint, ownerUid: jint, displayId: jint): jboolean {.`static`.}
  proc isPublicPresentation*(): jboolean
  proc isTrusted*(): jboolean
  proc canStealTopFocus*(): jboolean
  proc toString*(): string
  proc typeToString*(type: jint): string {.`static`.}
  proc stateToString*(state: jint): string {.`static`.}
  proc stateReasonToString*(reason: jint): string {.`static`.}
  proc isSuspendedState*(state: jint): jboolean {.`static`.}
  proc isDozeState*(state: jint): jboolean {.`static`.}
  proc isActiveState*(state: jint): jboolean {.`static`.}
  proc isOffState*(state: jint): jboolean {.`static`.}
  proc isOnState*(state: jint): jboolean {.`static`.}
  proc isWidthValid*(width: jint): jboolean {.`static`.}
  proc isHeightValid*(height: jint): jboolean {.`static`.}
  proc isRefreshRateValid*(refreshRate: jfloat): jboolean {.`static`.}
  proc getDisplayDecorationSupport*(): DisplayDecorationSupport
  DEFAULT_DISPLAY*: jint {.`static`.}
  INVALID_DISPLAY*: jint {.`static`.}
  INVALID_DISPLAY_WIDTH*: jint {.`static`.}
  INVALID_DISPLAY_HEIGHT*: jint {.`static`.}
  INVALID_DISPLAY_REFRESH_RATE*: jfloat {.`static`.}
  DEFAULT_DISPLAY_GROUP*: jint {.`static`.}
  INVALID_DISPLAY_GROUP*: jint {.`static`.}
  FLAG_SUPPORTS_PROTECTED_BUFFERS*: jint {.`static`.}
  FLAG_SECURE*: jint {.`static`.}
  FLAG_PRIVATE*: jint {.`static`.}
  FLAG_PRESENTATION*: jint {.`static`.}
  FLAG_ROUND*: jint {.`static`.}
  FLAG_CAN_SHOW_WITH_INSECURE_KEYGUARD*: jint {.`static`.}
  FLAG_SHOULD_SHOW_SYSTEM_DECORATIONS*: jint {.`static`.}
  FLAG_TRUSTED*: jint {.`static`.}
  FLAG_OWN_DISPLAY_GROUP*: jint {.`static`.}
  FLAG_ALWAYS_UNLOCKED*: jint {.`static`.}
  FLAG_TOUCH_FEEDBACK_DISABLED*: jint {.`static`.}
  FLAG_OWN_FOCUS*: jint {.`static`.}
  FLAG_STEAL_TOP_FOCUS_DISABLED*: jint {.`static`.}
  FLAG_REAR*: jint {.`static`.}
  FLAG_ROTATES_WITH_CONTENT*: jint {.`static`.}
  FLAG_ALLOWS_CONTENT_MODE_SWITCH*: jint {.`static`.}
  FLAG_SCALING_DISABLED*: jint {.`static`.}
  TYPE_UNKNOWN*: jint {.`static`.}
  TYPE_INTERNAL*: jint {.`static`.}
  TYPE_EXTERNAL*: jint {.`static`.}
  TYPE_WIFI*: jint {.`static`.}
  TYPE_OVERLAY*: jint {.`static`.}
  TYPE_VIRTUAL*: jint {.`static`.}
  TYPE_MAX*: jint {.`static`.}
  STATE_UNKNOWN*: jint {.`static`.}
  STATE_OFF*: jint {.`static`.}
  STATE_ON*: jint {.`static`.}
  STATE_DOZE*: jint {.`static`.}
  STATE_DOZE_SUSPEND*: jint {.`static`.}
  STATE_VR*: jint {.`static`.}
  STATE_ON_SUSPEND*: jint {.`static`.}
  STATE_REASON_UNKNOWN*: jint {.`static`.}
  STATE_REASON_DEFAULT_POLICY*: jint {.`static`.}
  STATE_REASON_DRAW_WAKE_LOCK*: jint {.`static`.}
  STATE_REASON_OFFLOAD*: jint {.`static`.}
  STATE_REASON_TILT*: jint {.`static`.}
  STATE_REASON_DREAM_MANAGER*: jint {.`static`.}
  STATE_REASON_KEY*: jint {.`static`.}
  STATE_REASON_MOTION*: jint {.`static`.}
  COLOR_MODE_INVALID*: jint {.`static`.}
  COLOR_MODE_DEFAULT*: jint {.`static`.}
  COLOR_MODE_BT601_625*: jint {.`static`.}
  COLOR_MODE_BT601_625_UNADJUSTED*: jint {.`static`.}
  COLOR_MODE_BT601_525*: jint {.`static`.}
  COLOR_MODE_BT601_525_UNADJUSTED*: jint {.`static`.}
  COLOR_MODE_BT709*: jint {.`static`.}
  COLOR_MODE_DCI_P3*: jint {.`static`.}
  COLOR_MODE_SRGB*: jint {.`static`.}
  COLOR_MODE_ADOBE_RGB*: jint {.`static`.}
  COLOR_MODE_DISPLAY_P3*: jint {.`static`.}
  REMOVE_MODE_MOVE_CONTENT_TO_PRIMARY*: jint {.`static`.}
  REMOVE_MODE_DESTROY_CONTENT*: jint {.`static`.}
  DISPLAY_MODE_ID_FOR_FRAME_RATE_OVERRIDE*: jint {.`static`.}
  FRAME_RATE_CATEGORY_NORMAL*: jint {.`static`.}
  FRAME_RATE_CATEGORY_HIGH*: jint {.`static`.}

jclass android.view.Display.Mode* of JVMObject:
  proc getModeId*(): jint
  proc getPhysicalWidth*(): jint
  proc getPhysicalHeight*(): jint
  proc getRefreshRate*(): jfloat
  proc getVsyncRate*(): jfloat
  proc isSynthetic*(): jboolean
  proc getAlternativeRefreshRates*(): seq[jfloat]
  proc getSupportedHdrTypes*(): seq[jint]
  proc matches*(width: jint, height: jint, refreshRate: jfloat): jboolean
  proc matchesIfValid*(width: jint, height: jint, peakRefreshRate: jfloat): jboolean
  proc equalsExceptRefreshRate*(other: Display.Mode): jboolean
  proc isRefreshRateSet*(): jboolean
  proc isResolutionSet*(): jboolean
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, parcelableFlags: jint)

jclass android.view.Display.HdrCapabilities* of JVMObject:
  proc getSupportedHdrTypes*(): seq[jint]
  proc getDesiredMaxLuminance*(): jfloat
  proc getDesiredMaxAverageLuminance*(): jfloat
  proc getDesiredMinLuminance*(): jfloat
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc readFromParcel*(source: Parcel)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  proc hdrTypeToString*(hdrType: jint): string {.`static`.}

jclass android.view.Mode* of JVMObject:
  proc getModeId*(): jint
  proc getPhysicalWidth*(): jint
  proc getPhysicalHeight*(): jint
  proc getRefreshRate*(): jfloat
  proc getVsyncRate*(): jfloat
  proc isSynthetic*(): jboolean
  proc getAlternativeRefreshRates*(): seq[jfloat]
  proc getSupportedHdrTypes*(): seq[jint]
  proc matches*(width: jint, height: jint, refreshRate: jfloat): jboolean
  proc matchesIfValid*(width: jint, height: jint, peakRefreshRate: jfloat): jboolean
  proc equalsExceptRefreshRate*(other: Display.Mode): jboolean
  proc isRefreshRateSet*(): jboolean
  proc isResolutionSet*(): jboolean
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, parcelableFlags: jint)
  EMPTY_ARRAY*: Mode {.`static`.}
  INVALID_MODE_ID*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[Mode] {.`static`.}

jclass android.view.Mode.Builder* of JVMObject:
  proc setResolution*(width: jint, height: jint): Builder
  proc setRefreshRate*(refreshRate: jfloat): Builder
  proc build*(): Mode

jclass android.view.Builder* of JVMObject:
  proc setResolution*(width: jint, height: jint): Builder
  proc setRefreshRate*(refreshRate: jfloat): Builder
  proc build*(): Mode

jclass android.view.HdrCapabilities* of JVMObject:
  proc getSupportedHdrTypes*(): seq[jint]
  proc getDesiredMaxLuminance*(): jfloat
  proc getDesiredMaxAverageLuminance*(): jfloat
  proc getDesiredMinLuminance*(): jfloat
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc readFromParcel*(source: Parcel)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  proc hdrTypeToString*(hdrType: jint): string {.`static`.}
  INVALID_LUMINANCE*: jfloat {.`static`.}
  HDR_TYPE_INVALID*: jint {.`static`.}
  HDR_TYPE_DOLBY_VISION*: jint {.`static`.}
  HDR_TYPE_HDR10*: jint {.`static`.}
  HDR_TYPE_HLG*: jint {.`static`.}
  HDR_TYPE_HDR10_PLUS*: jint {.`static`.}
  HDR_TYPES*: jint {.`static`.}
  CREATOR*: Creator[HdrCapabilities] {.`static`.}

