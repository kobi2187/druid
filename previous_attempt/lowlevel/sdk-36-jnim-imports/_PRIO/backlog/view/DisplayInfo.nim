import jnim

jclass android.view.DisplayInfo* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc equals*(other: DisplayInfo): jboolean
  proc equals*(other: DisplayInfo, compareOnlyBasicChanges: jboolean): jboolean
  proc hashCode*(): jint
  proc copyFrom*(other: DisplayInfo)
  proc readFromParcel*(source: Parcel)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc getRefreshRate*(): jfloat
  proc getMode*(): Display.Mode
  proc getDefaultMode*(): Display.Mode
  proc findDefaultModeByRefreshRate*(refreshRate: jfloat): Display.Mode
  proc getDefaultRefreshRates*(): seq[jfloat]
  proc getDefaultRefreshRatesLegacy*(): seq[jfloat]
  proc getAppMetrics*(outMetrics: DisplayMetrics)
  proc getAppMetrics*(outMetrics: DisplayMetrics, displayAdjustments: DisplayAdjustments)
  proc getAppMetrics*(outMetrics: DisplayMetrics, ci: CompatibilityInfo, configuration: Configuration)
  proc getLogicalMetrics*(outMetrics: DisplayMetrics, compatInfo: CompatibilityInfo, configuration: Configuration)
  proc getMaxBoundsMetrics*(outMetrics: DisplayMetrics, compatInfo: CompatibilityInfo, configuration: Configuration)
  proc getNaturalWidth*(): jint
  proc getNaturalHeight*(): jint
  proc isHdr*(): jboolean
  proc isWideColorGamut*(): jboolean
  proc hasAccess*(uid: jint): jboolean
  proc toString*(): string
  proc dumpDebug*(protoOutputStream: ProtoOutputStream, fieldId: jlong)
  layerStack*: jint
  flags*: jint
  typ*: jint
  displayId*: jint
  displayGroupId*: jint
  address*: DisplayAddress
  deviceProductInfo*: DeviceProductInfo
  name*: string
  uniqueId*: string
  appWidth*: jint
  appHeight*: jint
  smallestNominalAppWidth*: jint
  smallestNominalAppHeight*: jint
  largestNominalAppWidth*: jint
  largestNominalAppHeight*: jint
  logicalWidth*: jint
  logicalHeight*: jint
  displayCutout*: DisplayCutout
  rotation*: jint
  modeId*: jint
  renderFrameRate*: jfloat
  hasArrSupport*: jboolean
  frameRateCategoryRate*: FrameRateCategoryRate
  supportedRefreshRates*: jfloat
  defaultModeId*: jint
  userPreferredModeId*: jint
  supportedModes*: Display.Mode
  appsSupportedModes*: Display.Mode
  colorMode*: jint
  supportedColorModes*: jint
  hdrCapabilities*: Display.HdrCapabilities
  userDisabledHdrTypes*: jint
  isForceSdr*: jboolean
  minimalPostProcessingSupported*: jboolean
  logicalDensityDpi*: jint
  physicalXDpi*: jfloat
  physicalYDpi*: jfloat
  appVsyncOffsetNanos*: jlong
  presentationDeadlineNanos*: jlong
  state*: jint
  committedState*: jint
  ownerUid*: jint
  ownerPackageName*: string
  refreshRateOverride*: jfloat
  removeMode*: jint
  brightnessMinimum*: jfloat
  brightnessMaximum*: jfloat
  brightnessDefault*: jfloat
  brightnessDim*: jfloat
  roundedCorners*: RoundedCorners
  installOrientation*: jint
  displayShape*: DisplayShape
  layoutLimitedRefreshRate*: SurfaceControl.RefreshRateRange
  hdrSdrRatio*: jfloat
  thermalRefreshRateThrottling*: SparseArray[SurfaceControl.RefreshRateRange]
  thermalBrightnessThrottlingDataId*: string
  canHostTasks*: jboolean
  CREATOR*: Creator[DisplayInfo] {.`static`.}

