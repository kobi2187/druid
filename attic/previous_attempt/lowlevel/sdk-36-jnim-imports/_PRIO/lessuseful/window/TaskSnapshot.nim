import jnim

jclass android.window.TaskSnapshot* of JVMObject:
  proc getId*(): jlong
  proc getCaptureTime*(): jlong
  proc getTopActivityComponent*(): ComponentName
  proc getSnapshot*(): GraphicBuffer
  proc getHardwareBuffer*(): HardwareBuffer
  proc getColorSpace*(): ColorSpace
  proc getOrientation*(): jint
  proc getRotation*(): jint
  proc getTaskSize*(): Point
  proc getContentInsets*(): Rect
  proc getLetterboxInsets*(): Rect
  proc isLowResolution*(): jboolean
  proc isRealSnapshot*(): jboolean
  proc isTranslucent*(): jboolean
  proc hasImeSurface*(): jboolean
  proc getWindowingMode*(): jint
  proc getAppearance*(): jint
  proc getUiMode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc addReference*(usage: jint)
  proc removeReference*(usage: jint)
  proc setSafeRelease*(releaser: Consumer[HardwareBuffer])
  REFERENCE_NONE*: jint {.`static`.}
  REFERENCE_BROADCAST*: jint {.`static`.}
  REFERENCE_CACHE*: jint {.`static`.}
  REFERENCE_PERSIST*: jint {.`static`.}
  REFERENCE_CONTENT_SUGGESTION*: jint {.`static`.}
  REFERENCE_WRITE_TO_PARCEL*: jint {.`static`.}
  CREATOR*: Creator[TaskSnapshot] {.`static`.}

jclass android.window.TaskSnapshot.Builder* of JVMObject:
  proc setId*(id: jlong): Builder
  proc setCaptureTime*(captureTime: jlong): Builder
  proc setTopActivityComponent*(name: ComponentName): Builder
  proc setSnapshot*(buffer: HardwareBuffer): Builder
  proc setColorSpace*(colorSpace: ColorSpace): Builder
  proc setOrientation*(orientation: jint): Builder
  proc setRotation*(rotation: jint): Builder
  proc setTaskSize*(size: Point): Builder
  proc setContentInsets*(contentInsets: Rect): Builder
  proc setLetterboxInsets*(letterboxInsets: Rect): Builder
  proc setIsRealSnapshot*(realSnapshot: jboolean): Builder
  proc setWindowingMode*(windowingMode: jint): Builder
  proc setAppearance*(appearance: jint): Builder
  proc setIsTranslucent*(isTranslucent: jboolean): Builder
  proc setHasImeSurface*(hasImeSurface: jboolean): Builder
  proc setUiMode*(uiMode: jint): Builder
  proc getPixelFormat*(): jint
  proc setPixelFormat*(pixelFormat: jint): Builder
  proc build*(): TaskSnapshot

jclass android.window.Builder* of JVMObject:
  proc setId*(id: jlong): Builder
  proc setCaptureTime*(captureTime: jlong): Builder
  proc setTopActivityComponent*(name: ComponentName): Builder
  proc setSnapshot*(buffer: HardwareBuffer): Builder
  proc setColorSpace*(colorSpace: ColorSpace): Builder
  proc setOrientation*(orientation: jint): Builder
  proc setRotation*(rotation: jint): Builder
  proc setTaskSize*(size: Point): Builder
  proc setContentInsets*(contentInsets: Rect): Builder
  proc setLetterboxInsets*(letterboxInsets: Rect): Builder
  proc setIsRealSnapshot*(realSnapshot: jboolean): Builder
  proc setWindowingMode*(windowingMode: jint): Builder
  proc setAppearance*(appearance: jint): Builder
  proc setIsTranslucent*(isTranslucent: jboolean): Builder
  proc setHasImeSurface*(hasImeSurface: jboolean): Builder
  proc setUiMode*(uiMode: jint): Builder
  proc getPixelFormat*(): jint
  proc setPixelFormat*(pixelFormat: jint): Builder
  proc build*(): TaskSnapshot

