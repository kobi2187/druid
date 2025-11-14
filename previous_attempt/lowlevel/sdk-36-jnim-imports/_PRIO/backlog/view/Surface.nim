import jnim

jclass android.view.Surface* of JVMObject:
  proc release*()
  proc destroy*()
  proc hwuiDestroy*()
  proc isValid*(): jboolean
  proc getGenerationId*(): jint
  proc getNextFrameNumber*(): jlong
  proc isConsumerRunningBehind*(): jboolean
  proc getDefaultSize*(): Point
  proc lockCanvas*(inOutDirty: Rect): Canvas
  proc unlockCanvasAndPost*(canvas: Canvas)
  proc lockHardwareCanvas*(): Canvas
  proc lockHardwareWideColorGamutCanvas*(): Canvas
  proc unlockCanvas*(canvas: Canvas)
  proc copyFrom*(other: SurfaceControl)
  proc copyFrom*(queue: BLASTBufferQueue)
  proc createFrom*(other: SurfaceControl)
  proc transferFrom*(other: Surface)
  proc describeContents*(): jint
  proc readFromParcel*(source: Parcel)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc allocateBuffers*()
  proc setScalingMode*(scalingMode: jint)
  proc attachAndQueueBufferWithColorSpace*(buffer: HardwareBuffer, colorSpace: ColorSpace)
  proc isSingleBuffered*(): jboolean
  proc setSharedBufferModeEnabled*(enabled: jboolean)
  proc isSharedBufferModeEnabled*(): jboolean
  proc setAutoRefreshEnabled*(enabled: jboolean)
  proc isAutoRefreshEnabled*(): jboolean
  proc setFrameRate*(frameRateParams: FrameRateParams)
  proc setFrameRate*(frameRate: jfloat, compatibility: jint, changeFrameRateStrategy: jint)
  proc clearFrameRate*()
  proc setFrameRate*(frameRate: jfloat, compatibility: jint)
  proc rotationToString*(rotation: jint): string {.`static`.}
  CREATOR*: Parcelable.Creator[Surface] {.`static`.}
  SCALING_MODE_FREEZE*: jint {.`static`.}
  SCALING_MODE_SCALE_TO_WINDOW*: jint {.`static`.}
  SCALING_MODE_SCALE_CROP*: jint {.`static`.}
  SCALING_MODE_NO_SCALE_CROP*: jint {.`static`.}
  ROTATION_0*: jint {.`static`.}
  ROTATION_90*: jint {.`static`.}
  ROTATION_180*: jint {.`static`.}
  ROTATION_270*: jint {.`static`.}
  FRAME_RATE_COMPATIBILITY_DEFAULT*: jint {.`static`.}
  FRAME_RATE_COMPATIBILITY_FIXED_SOURCE*: jint {.`static`.}
  FRAME_RATE_COMPATIBILITY_AT_LEAST*: jint {.`static`.}
  FRAME_RATE_COMPATIBILITY_EXACT*: jint {.`static`.}
  FRAME_RATE_COMPATIBILITY_NO_VOTE*: jint {.`static`.}
  FRAME_RATE_COMPATIBILITY_MIN*: jint {.`static`.}
  CHANGE_FRAME_RATE_ONLY_IF_SEAMLESS*: jint {.`static`.}
  CHANGE_FRAME_RATE_ALWAYS*: jint {.`static`.}
  FRAME_RATE_CATEGORY_DEFAULT*: jint {.`static`.}
  FRAME_RATE_CATEGORY_NO_PREFERENCE*: jint {.`static`.}
  FRAME_RATE_CATEGORY_LOW*: jint {.`static`.}
  FRAME_RATE_CATEGORY_NORMAL*: jint {.`static`.}
  FRAME_RATE_CATEGORY_HIGH_HINT*: jint {.`static`.}
  FRAME_RATE_CATEGORY_HIGH*: jint {.`static`.}

jclass android.view.Surface.FrameRateParams* of JVMObject:
  proc getDesiredMinRate*(): jfloat
  proc getDesiredMaxRate*(): jfloat
  proc getFixedSourceRate*(): jfloat
  proc getChangeFrameRateStrategy*(): jint

jclass android.view.FrameRateParams* of JVMObject:
  proc getDesiredMinRate*(): jfloat
  proc getDesiredMaxRate*(): jfloat
  proc getFixedSourceRate*(): jfloat
  proc getChangeFrameRateStrategy*(): jint
  IGNORE*: FrameRateParams {.`static`.}

jclass android.view.FrameRateParams.Builder* of JVMObject:
  proc setDesiredRateRange*(desiredMinRate: jfloat, desiredMaxRate: jfloat): Builder
  proc setFixedSourceRate*(fixedSourceRate: jfloat): Builder
  proc setChangeFrameRateStrategy*(changeFrameRateStrategy: jint): Builder
  proc build*(): FrameRateParams

jclass android.view.Builder* of JVMObject:
  proc setDesiredRateRange*(desiredMinRate: jfloat, desiredMaxRate: jfloat): Builder
  proc setFixedSourceRate*(fixedSourceRate: jfloat): Builder
  proc setChangeFrameRateStrategy*(changeFrameRateStrategy: jint): Builder
  proc build*(): FrameRateParams

jclass android.view.OutOfResourcesException* of RuntimeException:

