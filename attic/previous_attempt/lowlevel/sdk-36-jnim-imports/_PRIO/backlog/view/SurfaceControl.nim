import jnim

jclass android.view.SurfaceControl* of JVMObject:
  proc rotationToBufferTransform*(rotation: jint): jint {.`static`.}
  proc addOnReparentListener*(listener: OnReparentListener): jboolean
  proc removeOnReparentListener*(listener: OnReparentListener): jboolean
  proc copyFrom*(other: SurfaceControl, callsite: string)
  proc readFromParcel*(in: Parcel)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc setDebugUsageAfterRelease*(debug: jboolean) {.`static`.}
  proc setUnreleasedWarningCallSite*(callsite: string)
  proc isSameSurface*(other: SurfaceControl): jboolean
  proc getChoreographer*(): Choreographer
  proc getChoreographer*(looper: Looper): Choreographer
  proc hasChoreographer*(): jboolean
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc release*()
  proc disconnect*()
  proc isValid*(): jboolean
  proc openTransaction*() {.`static`.}
  proc closeTransaction*() {.`static`.}
  proc clearContentFrameStats*(): jboolean
  proc getContentFrameStats*(outStats: WindowContentFrameStats): jboolean
  proc clearAnimationFrameStats*(): jboolean {.`static`.}
  proc getAnimationFrameStats*(outStats: WindowAnimationFrameStats): jboolean {.`static`.}
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getLocalOwnerView*(): View
  proc toString*(): string
  proc setDisplayPowerMode*(displayToken: IBinder, mode: jint) {.`static`.}
  proc getStaticDisplayInfo*(displayId: jlong): StaticDisplayInfo {.`static`.}
  proc getDynamicDisplayInfo*(displayId: jlong): DynamicDisplayInfo {.`static`.}
  proc getDisplayedContentSamplingAttributes*(displayToken: IBinder): DisplayedContentSamplingAttributes {.`static`.}
  proc setDisplayedContentSamplingEnabled*(displayToken: IBinder, enable: jboolean, componentMask: jint, maxFrames: jint): jboolean {.`static`.}
  proc getDisplayedContentSample*(displayToken: IBinder, maxFrames: jlong, timestamp: jlong): DisplayedContentSample {.`static`.}
  proc setDesiredDisplayModeSpecs*(displayToken: IBinder, desiredDisplayModeSpecs: DesiredDisplayModeSpecs): jboolean {.`static`.}
  proc getDesiredDisplayModeSpecs*(displayToken: IBinder): DesiredDisplayModeSpecs {.`static`.}
  proc getDisplayNativePrimaries*(displayToken: IBinder): DisplayPrimaries {.`static`.}
  proc setActiveColorMode*(displayToken: IBinder, colorMode: jint): jboolean {.`static`.}
  proc getCompositionColorSpaces*(): seq[ColorSpace] {.`static`.}
  proc getOverlaySupport*(): OverlayProperties {.`static`.}
  proc getBootDisplayModeSupport*(): jboolean {.`static`.}
  proc setBootDisplayMode*(displayToken: IBinder, displayModeId: jint) {.`static`.}
  proc clearBootDisplayMode*(displayToken: IBinder) {.`static`.}
  proc setAutoLowLatencyMode*(displayToken: IBinder, on: jboolean) {.`static`.}
  proc setGameContentType*(displayToken: IBinder, on: jboolean) {.`static`.}
  proc getProtectedContentSupport*(): jboolean {.`static`.}
  proc getDisplayBrightnessSupport*(displayToken: IBinder): jboolean {.`static`.}
  proc setDisplayBrightness*(displayToken: IBinder, brightness: jfloat): jboolean {.`static`.}
  proc setDisplayBrightness*(displayToken: IBinder, sdrBrightness: jfloat, sdrBrightnessNits: jfloat, displayBrightness: jfloat, displayBrightnessNits: jfloat): jboolean {.`static`.}
  proc mirrorSurface*(mirrorOf: SurfaceControl): SurfaceControl {.`static`.}
  proc setGlobalShadowSettings*(ambientColor: seq[jfloat], spotColor: seq[jfloat], lightPosY: jfloat, lightPosZ: jfloat, lightRadius: jfloat) {.`static`.}
  proc getDisplayDecorationSupport*(displayToken: IBinder): DisplayDecorationSupport {.`static`.}
  proc addOnJankDataListener*(listener: OnJankDataListener): OnJankDataListenerRegistration
  proc getGPUContextPriority*(): jint {.`static`.}
  proc bootFinished*(): jboolean {.`static`.}
  proc getMaxPictureProfiles*(): jint {.`static`.}
  proc resize*(w: jint, h: jint)
  proc getTransformHint*(): jint
  proc setTransformHint*(transformHint: jint)
  proc getLayerId*(): jint
  proc getStalledTransactionInfo*(pid: jint): StalledTransactionInfo {.`static`.}
  proc notifyShutdown*() {.`static`.}
  BUFFER_TRANSFORM_IDENTITY*: jint {.`static`.}
  BUFFER_TRANSFORM_MIRROR_HORIZONTAL*: jint {.`static`.}
  BUFFER_TRANSFORM_MIRROR_VERTICAL*: jint {.`static`.}
  BUFFER_TRANSFORM_ROTATE_90*: jint {.`static`.}
  BUFFER_TRANSFORM_ROTATE_180*: jint {.`static`.}
  BUFFER_TRANSFORM_ROTATE_270*: jint {.`static`.}
  mNativeObject*: jlong
  HIDDEN*: jint {.`static`.}
  SKIP_SCREENSHOT*: jint {.`static`.}
  SECURE*: jint {.`static`.}
  ENABLE_BACKPRESSURE*: jint {.`static`.}
  DISPLAY_DECORATION*: jint {.`static`.}
  IGNORE_DESTINATION_FRAME*: jint {.`static`.}
  LAYER_IS_REFRESH_RATE_INDICATOR*: jint {.`static`.}
  CAN_OCCLUDE_PRESENTATION*: jint {.`static`.}
  RECOVERABLE_FROM_BUFFER_STUFFING*: jint {.`static`.}
  NON_PREMULTIPLIED*: jint {.`static`.}
  OPAQUE*: jint {.`static`.}
  PROTECTED_APP*: jint {.`static`.}
  CURSOR_WINDOW*: jint {.`static`.}
  NO_COLOR_FILL*: jint {.`static`.}
  FX_SURFACE_NORMAL*: jint {.`static`.}
  FX_SURFACE_EFFECT*: jint {.`static`.}
  FX_SURFACE_CONTAINER*: jint {.`static`.}
  FX_SURFACE_BLAST*: jint {.`static`.}
  FX_SURFACE_MASK*: jint {.`static`.}
  DISPLAY_RECEIVES_INPUT*: jint {.`static`.}
  POWER_MODE_OFF*: jint {.`static`.}
  POWER_MODE_DOZE*: jint {.`static`.}
  POWER_MODE_NORMAL*: jint {.`static`.}
  POWER_MODE_DOZE_SUSPEND*: jint {.`static`.}
  POWER_MODE_ON_SUSPEND*: jint {.`static`.}
  CACHING_DISABLED*: jint {.`static`.}
  CACHING_ENABLED*: jint {.`static`.}
  METADATA_OWNER_UID*: jint {.`static`.}
  METADATA_WINDOW_TYPE*: jint {.`static`.}
  METADATA_TASK_ID*: jint {.`static`.}
  METADATA_MOUSE_CURSOR*: jint {.`static`.}
  METADATA_ACCESSIBILITY_ID*: jint {.`static`.}
  METADATA_OWNER_PID*: jint {.`static`.}
  METADATA_GAME_MODE*: jint {.`static`.}
  FRAME_RATE_SELECTION_STRATEGY_PROPAGATE*: jint {.`static`.}
  FRAME_RATE_SELECTION_STRATEGY_OVERRIDE_CHILDREN*: jint {.`static`.}
  FRAME_RATE_SELECTION_STRATEGY_SELF*: jint {.`static`.}
  CREATOR*: Creator[SurfaceControl] {.`static`.}

jclass android.view.SurfaceControl.JankData* of JVMObject:
  proc getVsyncId*(): jlong
  proc getJankType*(): jint
  proc getFrameIntervalNanos*(): jlong
  proc getScheduledAppFrameTimeNanos*(): jlong
  proc getActualAppFrameTimeNanos*(): jlong
  proc toString*(): string

jclass android.view.SurfaceControl.OnJankDataListenerRegistration* of JVMObject:
  proc flush*()
  proc removeAfter*(afterVsync: jlong)
  proc release*()

jclass android.view.SurfaceControl.Builder* of JVMObject:
  proc build*(): SurfaceControl
  proc setName*(name: string): Builder
  proc setLocalOwnerView*(view: View): Builder
  proc setBufferSize*(width: jint, height: jint): Builder
  proc setFormat*(format: jint): Builder
  proc setProtected*(protectedContent: jboolean): Builder
  proc setSecure*(secure: jboolean): Builder
  proc setOpaque*(opaque: jboolean): Builder
  proc setHidden*(hidden: jboolean): Builder
  proc setParent*(parent: SurfaceControl): Builder
  proc setMetadata*(key: jint, data: jint): Builder
  proc setEffectLayer*(): Builder
  proc setColorLayer*(): Builder
  proc setBLASTLayer*(): Builder
  proc setContainerLayer*(): Builder
  proc setFlags*(flags: jint): Builder
  proc setCallsite*(callsite: string): Builder

jclass android.view.SurfaceControl.StaticDisplayInfo* of JVMObject:
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.view.SurfaceControl.DynamicDisplayInfo* of JVMObject:
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.view.SurfaceControl.DisplayMode* of JVMObject:
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.view.SurfaceControl.RefreshRateRange* of JVMObject:
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc copyFrom*(other: RefreshRateRange)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.view.SurfaceControl.RefreshRateRanges* of JVMObject:
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc copyFrom*(other: RefreshRateRanges)

jclass android.view.SurfaceControl.IdleScreenRefreshRateConfig* of JVMObject:
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc copyFrom*(other: IdleScreenRefreshRateConfig)

jclass android.view.SurfaceControl.DesiredDisplayModeSpecs* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc equals*(other: DesiredDisplayModeSpecs): jboolean
  proc hashCode*(): jint
  proc copyFrom*(other: DesiredDisplayModeSpecs)
  proc toString*(): string

jclass android.view.SurfaceControl.TransactionStats* of JVMObject:
  proc close*()
  proc getLatchTimeNanos*(): jlong
  proc getPresentFence*(): SyncFence

jclass android.view.SurfaceControl.TrustedPresentationCallback* of JVMObject:
  proc onTrustedPresentationChanged*(inTrustedPresentationState: jboolean)

jclass android.view.SurfaceControl.Transaction* of JVMObject:
  proc setDefaultApplyToken*(token: IBinder) {.`static`.}
  proc getDefaultApplyToken*(): IBinder {.`static`.}
  proc apply*()
  proc applyAsyncUnsafe*()
  proc clear*()
  proc close*()
  proc apply*(sync: jboolean)
  proc setVisibility*(sc: SurfaceControl, visible: jboolean): Transaction
  proc setFrameRateSelectionPriority*(sc: SurfaceControl, priority: jint): Transaction
  proc show*(sc: SurfaceControl): Transaction
  proc hide*(sc: SurfaceControl): Transaction
  proc setPosition*(sc: SurfaceControl, x: jfloat, y: jfloat): Transaction
  proc setScale*(sc: SurfaceControl, scaleX: jfloat, scaleY: jfloat): Transaction
  proc setBufferSize*(sc: SurfaceControl, w: jint, h: jint): Transaction
  proc setFixedTransformHint*(sc: SurfaceControl, transformHint: jint): Transaction
  proc unsetFixedTransformHint*(sc: SurfaceControl): Transaction
  proc setLayer*(sc: SurfaceControl, z: jint): Transaction
  proc setRelativeLayer*(sc: SurfaceControl, relativeTo: SurfaceControl, z: jint): Transaction
  proc setTransparentRegionHint*(sc: SurfaceControl, transparentRegion: Region): Transaction
  proc setAlpha*(sc: SurfaceControl, alpha: jfloat): Transaction
  proc setInputWindowInfo*(sc: SurfaceControl, handle: InputWindowHandle): Transaction
  proc addWindowInfosReportedListener*(listener: Runnable): Transaction
  proc setGeometry*(sc: SurfaceControl, sourceCrop: Rect, destFrame: Rect, orientation: jint): Transaction
  proc setMatrix*(sc: SurfaceControl, dsdx: jfloat, dtdx: jfloat, dtdy: jfloat, dsdy: jfloat): Transaction
  proc setMatrix*(sc: SurfaceControl, matrix: Matrix, float9: seq[jfloat]): Transaction
  proc setColorTransform*(sc: SurfaceControl, matrix: seq[jfloat], translation: seq[jfloat]): Transaction
  proc setColorSpaceAgnostic*(sc: SurfaceControl, agnostic: jboolean): Transaction
  proc setWindowCrop*(sc: SurfaceControl, crop: Rect): Transaction
  proc setCrop*(sc: SurfaceControl, crop: Rect): Transaction
  proc setWindowCrop*(sc: SurfaceControl, width: jint, height: jint): Transaction
  proc setCrop*(sc: SurfaceControl, left: jfloat, top: jfloat, right: jfloat, bottom: jfloat): Transaction
  proc setCornerRadius*(sc: SurfaceControl, cornerRadius: jfloat): Transaction
  proc setClientDrawnCornerRadius*(sc: SurfaceControl, clientDrawnCornerRadius: jfloat): Transaction
  proc setBackgroundBlurRadius*(sc: SurfaceControl, radius: jint): Transaction
  proc setBlurRegions*(sc: SurfaceControl, regions: seq[seq[jfloat]]): Transaction
  proc setStretchEffect*(sc: SurfaceControl, width: jfloat, height: jfloat, vecX: jfloat, vecY: jfloat, maxStretchAmountX: jfloat, maxStretchAmountY: jfloat, childRelativeLeft: jfloat, childRelativeTop: jfloat, childRelativeRight: jfloat, childRelativeBottom: jfloat): Transaction
  proc setEdgeExtensionEffect*(sc: SurfaceControl, edge: jint): Transaction
  proc setLayerStack*(sc: SurfaceControl, layerStack: jint): Transaction
  proc reparent*(sc: SurfaceControl, newParent: SurfaceControl): Transaction
  proc setColor*(sc: SurfaceControl, color: seq[jfloat]): Transaction
  proc unsetColor*(sc: SurfaceControl): Transaction
  proc setSecure*(sc: SurfaceControl, isSecure: jboolean): Transaction
  proc setDisplayDecoration*(sc: SurfaceControl, displayDecoration: jboolean): Transaction
  proc setOpaque*(sc: SurfaceControl, isOpaque: jboolean): Transaction
  proc setDisplaySurface*(displayToken: IBinder, surface: Surface): Transaction
  proc setDisplayLayerStack*(displayToken: IBinder, layerStack: jint): Transaction
  proc setDisplayFlags*(displayToken: IBinder, flags: jint): Transaction
  proc setDisplayProjection*(displayToken: IBinder, orientation: jint, layerStackRect: Rect, displayRect: Rect): Transaction
  proc setDisplaySize*(displayToken: IBinder, width: jint, height: jint): Transaction
  proc setAnimationTransaction*(): Transaction
  proc setEarlyWakeupStart*(): Transaction
  proc setEarlyWakeupEnd*(): Transaction
  proc getId*(): jlong
  proc setMetadata*(sc: SurfaceControl, key: jint, data: jint): Transaction
  proc setMetadata*(sc: SurfaceControl, key: jint, data: Parcel): Transaction
  proc setShadowRadius*(sc: SurfaceControl, shadowRadius: jfloat): Transaction
  proc setBorderSettings*(sc: SurfaceControl, settings: BorderSettings): Transaction
  proc setFrameRate*(sc: SurfaceControl, frameRate: jfloat, compatibility: jint): Transaction
  proc setFrameRate*(sc: SurfaceControl, frameRate: jfloat, compatibility: jint, changeFrameRateStrategy: jint): Transaction
  proc setFrameRate*(sc: SurfaceControl, frameRateParams: Surface.FrameRateParams): Transaction
  proc clearFrameRate*(sc: SurfaceControl): Transaction
  proc setDefaultFrameRateCompatibility*(sc: SurfaceControl, compatibility: jint): Transaction
  proc setFrameRateCategory*(sc: SurfaceControl, category: jint, smoothSwitchOnly: jboolean): Transaction
  proc setFrameRateSelectionStrategy*(sc: SurfaceControl, strategy: jint): Transaction
  proc setFocusedWindow*(token: IBinder, windowName: string, displayId: jint): Transaction
  proc removeCurrentInputFocus*(displayId: jint): Transaction
  proc setSkipScreenshot*(sc: SurfaceControl, skipScrenshot: jboolean): Transaction
  proc setBuffer*(sc: SurfaceControl, buffer: GraphicBuffer): Transaction
  proc setBuffer*(sc: SurfaceControl, buffer: HardwareBuffer): Transaction
  proc unsetBuffer*(sc: SurfaceControl): Transaction
  proc setBuffer*(sc: SurfaceControl, buffer: HardwareBuffer, fence: SyncFence): Transaction
  proc setBuffer*(sc: SurfaceControl, buffer: HardwareBuffer, fence: SyncFence, releaseCallback: Consumer[SyncFence]): Transaction
  proc setBufferTransform*(sc: SurfaceControl, transform: jint): Transaction
  proc setDamageRegion*(sc: SurfaceControl, region: Region): Transaction
  proc setDimmingEnabled*(sc: SurfaceControl, dimmingEnabled: jboolean): Transaction
  proc setColorSpace*(sc: SurfaceControl, colorSpace: ColorSpace): Transaction
  proc setDataSpace*(sc: SurfaceControl, dataspace: jint): Transaction
  proc setExtendedRangeBrightness*(sc: SurfaceControl, currentBufferRatio: jfloat, desiredRatio: jfloat): Transaction
  proc setDesiredHdrHeadroom*(sc: SurfaceControl, desiredRatio: jfloat): Transaction
  proc setLuts*(sc: SurfaceControl, displayLuts: DisplayLuts): Transaction
  proc setPictureProfileHandle*(sc: SurfaceControl, handle: PictureProfileHandle): Transaction
  proc setContentPriority*(sc: SurfaceControl, priority: jint): Transaction
  proc setCachingHint*(sc: SurfaceControl, cachingHint: jint): Transaction
  proc setTrustedOverlay*(sc: SurfaceControl, isTrustedOverlay: jboolean): Transaction
  proc setTrustedOverlay*(sc: SurfaceControl, trustedOverlay: jint): Transaction
  proc setDropInputMode*(sc: SurfaceControl, mode: jint): Transaction
  proc setCanOccludePresentation*(sc: SurfaceControl, canOccludePresentation: jboolean): Transaction
  proc sendSurfaceFlushJankData*(sc: SurfaceControl) {.`static`.}
  proc sanitize*(pid: jint, uid: jint)
  proc setDestinationFrame*(sc: SurfaceControl, destinationFrame: Rect): Transaction
  proc setDestinationFrame*(sc: SurfaceControl, width: jint, height: jint): Transaction
  proc merge*(other: Transaction): Transaction
  proc remove*(sc: SurfaceControl): Transaction
  proc setFrameTimeline*(vsyncId: jlong): Transaction
  proc setFrameTimelineVsync*(frameTimelineVsyncId: jlong): Transaction
  proc addTransactionCommittedListener*(executor: Executor, listener: TransactionCommittedListener): Transaction
  proc addTransactionCompletedListener*(executor: Executor, listener: Consumer[TransactionStats]): Transaction
  proc setTrustedPresentationCallback*(sc: SurfaceControl, thresholds: TrustedPresentationThresholds, executor: Executor, listener: Consumer[Boolean]): Transaction
  proc clearTrustedPresentationCallback*(sc: SurfaceControl): Transaction
  proc setDesiredPresentTimeNanos*(desiredPresentTimeNanos: jlong): Transaction
  proc setRecoverableFromBufferStuffing*(sc: SurfaceControl): Transaction
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint


jclass android.view.JankData* of JVMObject:
  proc getVsyncId*(): jlong
  proc getJankType*(): jint
  proc getFrameIntervalNanos*(): jlong
  proc getScheduledAppFrameTimeNanos*(): jlong
  proc getActualAppFrameTimeNanos*(): jlong
  proc toString*(): string
  JANK_NONE*: jint {.`static`.}
  JANK_COMPOSER*: jint {.`static`.}
  JANK_APPLICATION*: jint {.`static`.}
  JANK_OTHER*: jint {.`static`.}


jclass android.view.OnJankDataListenerRegistration* of JVMObject:
  proc flush*()
  proc removeAfter*(afterVsync: jlong)
  proc release*()
  NONE*: OnJankDataListenerRegistration {.`static`.}

jclass android.view.Builder* of JVMObject:
  proc build*(): SurfaceControl
  proc setName*(name: string): Builder
  proc setLocalOwnerView*(view: View): Builder
  proc setBufferSize*(width: jint, height: jint): Builder
  proc setFormat*(format: jint): Builder
  proc setProtected*(protectedContent: jboolean): Builder
  proc setSecure*(secure: jboolean): Builder
  proc setOpaque*(opaque: jboolean): Builder
  proc setHidden*(hidden: jboolean): Builder
  proc setParent*(parent: SurfaceControl): Builder
  proc setMetadata*(key: jint, data: jint): Builder
  proc setEffectLayer*(): Builder
  proc setColorLayer*(): Builder
  proc setBLASTLayer*(): Builder
  proc setContainerLayer*(): Builder
  proc setFlags*(flags: jint): Builder
  proc setCallsite*(callsite: string): Builder

jclass android.view.StaticDisplayInfo* of JVMObject:
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  isInternal*: jboolean
  density*: jfloat
  secure*: jboolean
  deviceProductInfo*: DeviceProductInfo
  installOrientation*: jint

jclass android.view.DynamicDisplayInfo* of JVMObject:
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  supportedDisplayModes*: DisplayMode
  activeDisplayModeId*: jint
  renderFrameRate*: jfloat
  hasArrSupport*: jboolean
  frameRateCategoryRate*: FrameRateCategoryRate
  supportedRefreshRates*: jfloat
  supportedColorModes*: jint
  activeColorMode*: jint
  hdrCapabilities*: Display.HdrCapabilities
  autoLowLatencyModeSupported*: jboolean
  gameContentTypeSupported*: jboolean
  preferredBootDisplayMode*: jint

jclass android.view.DisplayMode* of JVMObject:
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  id*: jint
  width*: jint
  height*: jint
  xDpi*: jfloat
  yDpi*: jfloat
  peakRefreshRate*: jfloat
  vsyncRate*: jfloat
  appVsyncOffsetNanos*: jlong
  presentationDeadlineNanos*: jlong
  supportedHdrTypes*: jint
  group*: jint

jclass android.view.RefreshRateRange* of JVMObject:
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc copyFrom*(other: RefreshRateRange)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  TAG*: string {.`static`.}
  FLOAT_TOLERANCE*: jfloat {.`static`.}
  min*: jfloat
  max*: jfloat
  CREATOR*: Creator[RefreshRateRange] {.`static`.}

jclass android.view.RefreshRateRanges* of JVMObject:
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc copyFrom*(other: RefreshRateRanges)
  TAG*: string {.`static`.}
  physical*: RefreshRateRange
  render*: RefreshRateRange

jclass android.view.IdleScreenRefreshRateConfig* of JVMObject:
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc copyFrom*(other: IdleScreenRefreshRateConfig)
  timeoutMillis*: jint

jclass android.view.DesiredDisplayModeSpecs* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc equals*(other: DesiredDisplayModeSpecs): jboolean
  proc hashCode*(): jint
  proc copyFrom*(other: DesiredDisplayModeSpecs)
  proc toString*(): string
  defaultMode*: jint
  allowGroupSwitching*: jboolean
  primaryRanges*: RefreshRateRanges
  appRequestRanges*: RefreshRateRanges
  idleScreenRefreshRateConfig*: IdleScreenRefreshRateConfig

jclass android.view.CieXyz* of JVMObject:
  X*: jfloat
  Y*: jfloat
  Z*: jfloat

jclass android.view.DisplayPrimaries* of JVMObject:
  red*: CieXyz
  green*: CieXyz
  blue*: CieXyz
  white*: CieXyz


jclass android.view.TransactionStats* of JVMObject:
  proc close*()
  proc getLatchTimeNanos*(): jlong
  proc getPresentFence*(): SyncFence


jclass android.view.TrustedPresentationCallback* of JVMObject:
  proc onTrustedPresentationChanged*(inTrustedPresentationState: jboolean)

jclass android.view.Transaction* of JVMObject:
  proc setDefaultApplyToken*(token: IBinder) {.`static`.}
  proc getDefaultApplyToken*(): IBinder {.`static`.}
  proc apply*()
  proc applyAsyncUnsafe*()
  proc clear*()
  proc close*()
  proc apply*(sync: jboolean)
  proc setVisibility*(sc: SurfaceControl, visible: jboolean): Transaction
  proc setFrameRateSelectionPriority*(sc: SurfaceControl, priority: jint): Transaction
  proc show*(sc: SurfaceControl): Transaction
  proc hide*(sc: SurfaceControl): Transaction
  proc setPosition*(sc: SurfaceControl, x: jfloat, y: jfloat): Transaction
  proc setScale*(sc: SurfaceControl, scaleX: jfloat, scaleY: jfloat): Transaction
  proc setBufferSize*(sc: SurfaceControl, w: jint, h: jint): Transaction
  proc setFixedTransformHint*(sc: SurfaceControl, transformHint: jint): Transaction
  proc unsetFixedTransformHint*(sc: SurfaceControl): Transaction
  proc setLayer*(sc: SurfaceControl, z: jint): Transaction
  proc setRelativeLayer*(sc: SurfaceControl, relativeTo: SurfaceControl, z: jint): Transaction
  proc setTransparentRegionHint*(sc: SurfaceControl, transparentRegion: Region): Transaction
  proc setAlpha*(sc: SurfaceControl, alpha: jfloat): Transaction
  proc setInputWindowInfo*(sc: SurfaceControl, handle: InputWindowHandle): Transaction
  proc addWindowInfosReportedListener*(listener: Runnable): Transaction
  proc setGeometry*(sc: SurfaceControl, sourceCrop: Rect, destFrame: Rect, orientation: jint): Transaction
  proc setMatrix*(sc: SurfaceControl, dsdx: jfloat, dtdx: jfloat, dtdy: jfloat, dsdy: jfloat): Transaction
  proc setMatrix*(sc: SurfaceControl, matrix: Matrix, float9: seq[jfloat]): Transaction
  proc setColorTransform*(sc: SurfaceControl, matrix: seq[jfloat], translation: seq[jfloat]): Transaction
  proc setColorSpaceAgnostic*(sc: SurfaceControl, agnostic: jboolean): Transaction
  proc setWindowCrop*(sc: SurfaceControl, crop: Rect): Transaction
  proc setCrop*(sc: SurfaceControl, crop: Rect): Transaction
  proc setWindowCrop*(sc: SurfaceControl, width: jint, height: jint): Transaction
  proc setCrop*(sc: SurfaceControl, left: jfloat, top: jfloat, right: jfloat, bottom: jfloat): Transaction
  proc setCornerRadius*(sc: SurfaceControl, cornerRadius: jfloat): Transaction
  proc setClientDrawnCornerRadius*(sc: SurfaceControl, clientDrawnCornerRadius: jfloat): Transaction
  proc setBackgroundBlurRadius*(sc: SurfaceControl, radius: jint): Transaction
  proc setBlurRegions*(sc: SurfaceControl, regions: seq[seq[jfloat]]): Transaction
  proc setStretchEffect*(sc: SurfaceControl, width: jfloat, height: jfloat, vecX: jfloat, vecY: jfloat, maxStretchAmountX: jfloat, maxStretchAmountY: jfloat, childRelativeLeft: jfloat, childRelativeTop: jfloat, childRelativeRight: jfloat, childRelativeBottom: jfloat): Transaction
  proc setEdgeExtensionEffect*(sc: SurfaceControl, edge: jint): Transaction
  proc setLayerStack*(sc: SurfaceControl, layerStack: jint): Transaction
  proc reparent*(sc: SurfaceControl, newParent: SurfaceControl): Transaction
  proc setColor*(sc: SurfaceControl, color: seq[jfloat]): Transaction
  proc unsetColor*(sc: SurfaceControl): Transaction
  proc setSecure*(sc: SurfaceControl, isSecure: jboolean): Transaction
  proc setDisplayDecoration*(sc: SurfaceControl, displayDecoration: jboolean): Transaction
  proc setOpaque*(sc: SurfaceControl, isOpaque: jboolean): Transaction
  proc setDisplaySurface*(displayToken: IBinder, surface: Surface): Transaction
  proc setDisplayLayerStack*(displayToken: IBinder, layerStack: jint): Transaction
  proc setDisplayFlags*(displayToken: IBinder, flags: jint): Transaction
  proc setDisplayProjection*(displayToken: IBinder, orientation: jint, layerStackRect: Rect, displayRect: Rect): Transaction
  proc setDisplaySize*(displayToken: IBinder, width: jint, height: jint): Transaction
  proc setAnimationTransaction*(): Transaction
  proc setEarlyWakeupStart*(): Transaction
  proc setEarlyWakeupEnd*(): Transaction
  proc getId*(): jlong
  proc setMetadata*(sc: SurfaceControl, key: jint, data: jint): Transaction
  proc setMetadata*(sc: SurfaceControl, key: jint, data: Parcel): Transaction
  proc setShadowRadius*(sc: SurfaceControl, shadowRadius: jfloat): Transaction
  proc setBorderSettings*(sc: SurfaceControl, settings: BorderSettings): Transaction
  proc setFrameRate*(sc: SurfaceControl, frameRate: jfloat, compatibility: jint): Transaction
  proc setFrameRate*(sc: SurfaceControl, frameRate: jfloat, compatibility: jint, changeFrameRateStrategy: jint): Transaction
  proc setFrameRate*(sc: SurfaceControl, frameRateParams: Surface.FrameRateParams): Transaction
  proc clearFrameRate*(sc: SurfaceControl): Transaction
  proc setDefaultFrameRateCompatibility*(sc: SurfaceControl, compatibility: jint): Transaction
  proc setFrameRateCategory*(sc: SurfaceControl, category: jint, smoothSwitchOnly: jboolean): Transaction
  proc setFrameRateSelectionStrategy*(sc: SurfaceControl, strategy: jint): Transaction
  proc setFocusedWindow*(token: IBinder, windowName: string, displayId: jint): Transaction
  proc removeCurrentInputFocus*(displayId: jint): Transaction
  proc setSkipScreenshot*(sc: SurfaceControl, skipScrenshot: jboolean): Transaction
  proc setBuffer*(sc: SurfaceControl, buffer: GraphicBuffer): Transaction
  proc setBuffer*(sc: SurfaceControl, buffer: HardwareBuffer): Transaction
  proc unsetBuffer*(sc: SurfaceControl): Transaction
  proc setBuffer*(sc: SurfaceControl, buffer: HardwareBuffer, fence: SyncFence): Transaction
  proc setBuffer*(sc: SurfaceControl, buffer: HardwareBuffer, fence: SyncFence, releaseCallback: Consumer[SyncFence]): Transaction
  proc setBufferTransform*(sc: SurfaceControl, transform: jint): Transaction
  proc setDamageRegion*(sc: SurfaceControl, region: Region): Transaction
  proc setDimmingEnabled*(sc: SurfaceControl, dimmingEnabled: jboolean): Transaction
  proc setColorSpace*(sc: SurfaceControl, colorSpace: ColorSpace): Transaction
  proc setDataSpace*(sc: SurfaceControl, dataspace: jint): Transaction
  proc setExtendedRangeBrightness*(sc: SurfaceControl, currentBufferRatio: jfloat, desiredRatio: jfloat): Transaction
  proc setDesiredHdrHeadroom*(sc: SurfaceControl, desiredRatio: jfloat): Transaction
  proc setLuts*(sc: SurfaceControl, displayLuts: DisplayLuts): Transaction
  proc setPictureProfileHandle*(sc: SurfaceControl, handle: PictureProfileHandle): Transaction
  proc setContentPriority*(sc: SurfaceControl, priority: jint): Transaction
  proc setCachingHint*(sc: SurfaceControl, cachingHint: jint): Transaction
  proc setTrustedOverlay*(sc: SurfaceControl, isTrustedOverlay: jboolean): Transaction
  proc setTrustedOverlay*(sc: SurfaceControl, trustedOverlay: jint): Transaction
  proc setDropInputMode*(sc: SurfaceControl, mode: jint): Transaction
  proc setCanOccludePresentation*(sc: SurfaceControl, canOccludePresentation: jboolean): Transaction
  proc sendSurfaceFlushJankData*(sc: SurfaceControl) {.`static`.}
  proc sanitize*(pid: jint, uid: jint)
  proc setDestinationFrame*(sc: SurfaceControl, destinationFrame: Rect): Transaction
  proc setDestinationFrame*(sc: SurfaceControl, width: jint, height: jint): Transaction
  proc merge*(other: Transaction): Transaction
  proc remove*(sc: SurfaceControl): Transaction
  proc setFrameTimeline*(vsyncId: jlong): Transaction
  proc setFrameTimelineVsync*(frameTimelineVsyncId: jlong): Transaction
  proc addTransactionCommittedListener*(executor: Executor, listener: TransactionCommittedListener): Transaction
  proc addTransactionCompletedListener*(executor: Executor, listener: Consumer[TransactionStats]): Transaction
  proc setTrustedPresentationCallback*(sc: SurfaceControl, thresholds: TrustedPresentationThresholds, executor: Executor, listener: Consumer[Boolean]): Transaction
  proc clearTrustedPresentationCallback*(sc: SurfaceControl): Transaction
  proc setDesiredPresentTimeNanos*(desiredPresentTimeNanos: jlong): Transaction
  proc setRecoverableFromBufferStuffing*(sc: SurfaceControl): Transaction
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  sRegistry*: NativeAllocationRegistry {.`static`.}
  mNativeObject*: jlong
  CREATOR*: Creator[Transaction] {.`static`.}

jclass android.view.LockDebuggingTransaction* of Transaction:

