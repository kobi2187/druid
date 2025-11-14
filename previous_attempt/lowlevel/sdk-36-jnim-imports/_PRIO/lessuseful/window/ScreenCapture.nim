import jnim

jclass android.window.ScreenCapture* of JVMObject:
  proc captureDisplay*(captureArgs: DisplayCaptureArgs, captureListener: ScreenCaptureListener): jint {.`static`.}
  proc captureDisplay*(captureArgs: DisplayCaptureArgs): ScreenshotHardwareBuffer {.`static`.}
  proc captureLayers*(layer: SurfaceControl, sourceCrop: Rect, frameScale: jfloat): ScreenshotHardwareBuffer {.`static`.}
  proc captureLayers*(layer: SurfaceControl, sourceCrop: Rect, frameScale: jfloat, format: jint): ScreenshotHardwareBuffer {.`static`.}
  proc captureLayers*(captureArgs: LayerCaptureArgs): ScreenshotHardwareBuffer {.`static`.}
  proc captureLayersExcluding*(layer: SurfaceControl, sourceCrop: Rect, frameScale: jfloat, format: jint, exclude: seq[SurfaceControl]): ScreenshotHardwareBuffer {.`static`.}
  proc captureLayers*(captureArgs: LayerCaptureArgs, captureListener: ScreenCaptureListener): jint {.`static`.}
  proc createSyncCaptureListener*(): SynchronousScreenCaptureListener {.`static`.}

jclass android.window.ScreenCapture.ScreenshotHardwareBuffer* of JVMObject:
  proc getColorSpace*(): ColorSpace
  proc getHardwareBuffer*(): HardwareBuffer
  proc containsSecureLayers*(): jboolean
  proc containsHdrLayers*(): jboolean
  proc asBitmap*(): Bitmap

jclass android.window.ScreenCapture.CaptureArgs* of JVMObject:
  proc release*()
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.window.ScreenCapture.ScreenCaptureListener* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.window.ScreenCapture.SynchronousScreenCaptureListener* of JVMObject:
  proc getBuffer*(): ScreenshotHardwareBuffer

jclass android.window.ScreenshotHardwareBuffer* of JVMObject:
  proc getColorSpace*(): ColorSpace
  proc getHardwareBuffer*(): HardwareBuffer
  proc containsSecureLayers*(): jboolean
  proc containsHdrLayers*(): jboolean
  proc asBitmap*(): Bitmap

jclass android.window.CaptureArgs* of JVMObject:
  proc release*()
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  mPixelFormat*: jint
  mSourceCrop*: Rect
  mFrameScaleX*: jfloat
  mFrameScaleY*: jfloat
  mCaptureSecureLayers*: jboolean
  mAllowProtected*: jboolean
  mUid*: jlong
  mGrayscale*: jboolean
  mHintForSeamlessTransition*: jboolean
  CREATOR*: Parcelable.Creator[CaptureArgs] {.`static`.}

jclass android.window.CaptureArgs.Builder* of JVMObject:
  proc build*(): CaptureArgs
  proc setPixelFormat*(pixelFormat: jint): T
  proc setSourceCrop*(sourceCrop: Rect): T
  proc setFrameScale*(frameScale: jfloat): T
  proc setFrameScale*(frameScaleX: jfloat, frameScaleY: jfloat): T
  proc setCaptureSecureLayers*(captureSecureLayers: jboolean): T
  proc setAllowProtected*(allowProtected: jboolean): T
  proc setUid*(uid: jlong): T
  proc setGrayscale*(grayscale: jboolean): T
  proc setExcludeLayers*(excludeLayers: seq[SurfaceControl]): T
  proc setHintForSeamlessTransition*(hintForSeamlessTransition: jboolean): T

jclass android.window.Builder* of JVMObject:
  proc build*(): CaptureArgs
  proc setPixelFormat*(pixelFormat: jint): T
  proc setSourceCrop*(sourceCrop: Rect): T
  proc setFrameScale*(frameScale: jfloat): T
  proc setFrameScale*(frameScaleX: jfloat, frameScaleY: jfloat): T
  proc setCaptureSecureLayers*(captureSecureLayers: jboolean): T
  proc setAllowProtected*(allowProtected: jboolean): T
  proc setUid*(uid: jlong): T
  proc setGrayscale*(grayscale: jboolean): T
  proc setExcludeLayers*(excludeLayers: seq[SurfaceControl]): T
  proc setHintForSeamlessTransition*(hintForSeamlessTransition: jboolean): T

jclass android.window.DisplayCaptureArgs* of CaptureArgs:

jclass android.window.DisplayCaptureArgs.Builder* of JVMObject:
  proc build*(): DisplayCaptureArgs
  proc setDisplayToken*(displayToken: IBinder): Builder
  proc setSize*(width: jint, height: jint): Builder

jclass android.window.Builder* of Builder:
  proc build*(): DisplayCaptureArgs
  proc setDisplayToken*(displayToken: IBinder): Builder
  proc setSize*(width: jint, height: jint): Builder

jclass android.window.LayerCaptureArgs* of CaptureArgs:

jclass android.window.LayerCaptureArgs.Builder* of JVMObject:
  proc build*(): LayerCaptureArgs
  proc setLayer*(layer: SurfaceControl): Builder
  proc setChildrenOnly*(childrenOnly: jboolean): Builder

jclass android.window.Builder* of Builder:
  proc build*(): LayerCaptureArgs
  proc setLayer*(layer: SurfaceControl): Builder
  proc setChildrenOnly*(childrenOnly: jboolean): Builder

jclass android.window.ScreenCaptureListener* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[ScreenCaptureListener] {.`static`.}

jclass android.window.SynchronousScreenCaptureListener* of ScreenCaptureListener:
  proc getBuffer*(): ScreenshotHardwareBuffer

