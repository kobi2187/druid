import jnim

jclass android.graphics.HardwareRenderer* of JVMObject:
  proc destroy*()
  proc setName*(name: string)
  proc setLightSourceGeometry*(lightX: jfloat, lightY: jfloat, lightZ: jfloat, lightRadius: jfloat)
  proc setLightSourceAlpha*(ambientShadowAlpha: jfloat, spotShadowAlpha: jfloat)
  proc setContentRoot*(content: RenderNode)
  proc setSurface*(surface: Surface)
  proc setSurface*(surface: Surface, discardBuffer: jboolean)
  proc setSurfaceControl*(surfaceControl: SurfaceControl, blastBufferQueue: BLASTBufferQueue)
  proc createRenderRequest*(): FrameRenderRequest
  proc syncAndDrawFrame*(frameInfo: FrameInfo): jint
  proc pause*(): jboolean
  proc setStopped*(stopped: jboolean)
  proc stop*()
  proc start*()
  proc clearContent*()
  proc setForceDark*(type: jint): jboolean
  proc allocateBuffers*()
  proc notifyFramePending*()
  proc setOpaque*(opaque: jboolean)
  proc isOpaque*(): jboolean
  proc setFrameCommitCallback*(callback: FrameCommitCallback)
  proc setFrameCompleteCallback*(callback: FrameCompleteCallback)
  proc addObserver*(observer: HardwareRendererObserver)
  proc addObserver*(nativeObserver: jlong)
  proc removeObserver*(observer: HardwareRendererObserver)
  proc removeObserver*(nativeObserver: jlong)
  proc setColorMode*(colorMode: jint): jfloat
  proc setColorMode*(colorMode: jint, whitePoint: jfloat)
  proc setTargetHdrSdrRatio*(ratio: jfloat)
  proc fence*()
  proc registerAnimatingRenderNode*(animator: RenderNode)
  proc registerVectorDrawableAnimator*(animator: NativeVectorDrawableAnimator)
  proc stopDrawing*()
  proc createTextureLayer*(): TextureLayer
  proc detachSurfaceTexture*(hardwareLayer: jlong)
  proc buildLayer*(node: RenderNode)
  proc copyLayerInto*(layer: TextureLayer, bitmap: Bitmap): jboolean
  proc pushLayerUpdate*(layer: TextureLayer)
  proc onLayerDestroyed*(layer: TextureLayer)
  proc setFrameCallback*(callback: FrameDrawingCallback)
  proc addRenderNode*(node: RenderNode, placeFront: jboolean)
  proc removeRenderNode*(node: RenderNode)
  proc drawRenderNode*(node: RenderNode)
  proc loadSystemProperties*(): jboolean
  proc dumpGlobalProfileInfo*(fd: FileDescriptor, dumpFlags: jint) {.`static`.}
  proc dumpProfileInfo*(fd: FileDescriptor, dumpFlags: jint)
  proc setContentDrawBounds*(left: jint, top: jint, right: jint, bottom: jint)
  proc forceDrawNextFrame*()
  proc setPictureCaptureCallback*(callback: PictureCapturedCallback)
  proc notifyCallbackPending*()
  proc notifyExpensiveFrame*()
  proc setFPSDivisor*(divisor: jint) {.`static`.}
  proc setContextPriority*(priority: jint) {.`static`.}
  proc setHighContrastText*(highContrastText: jboolean) {.`static`.}
  proc setIsolatedProcess*(isIsolated: jboolean) {.`static`.}
  proc sendDeviceConfigurationForDebugging*(config: Configuration) {.`static`.}
  proc setDebuggingEnabled*(enable: jboolean) {.`static`.}
  proc copySurfaceInto*(surface: Surface, copyRequest: CopyRequest) {.`static`.}
  proc createHardwareBitmap*(node: RenderNode, width: jint, height: jint): Bitmap {.`static`.}
  proc trimMemory*(level: jint) {.`static`.}
  proc trimCaches*(level: jint) {.`static`.}
  proc overrideProperty*(name: string, value: string) {.`static`.}
  proc setupDiskCache*(cacheDir: File) {.`static`.}
  proc setPackageName*(packageName: string) {.`static`.}
  proc setContextForInit*(context: Context) {.`static`.}
  proc setIsSystemOrPersistent*() {.`static`.}
  proc isDrawingEnabled*(): jboolean {.`static`.}
  proc setDrawingEnabled*(drawingEnabled: jboolean) {.`static`.}
  proc setRtAnimationsEnabled*(enabled: jboolean) {.`static`.}
  proc disableVsync*() {.`static`.}
  proc preload*() {.`static`.}
  proc preInitBufferAllocator*() {.`static`.}
  SYNC_OK*: jint {.`static`.}
  SYNC_REDRAW_REQUESTED*: jint {.`static`.}
  SYNC_LOST_SURFACE_REWARD_IF_FOUND*: jint {.`static`.}
  SYNC_CONTEXT_IS_STOPPED*: jint {.`static`.}
  SYNC_FRAME_DROPPED*: jint {.`static`.}
  FLAG_DUMP_FRAMESTATS*: jint {.`static`.}
  FLAG_DUMP_RESET*: jint {.`static`.}
  FLAG_DUMP_ALL*: jint {.`static`.}
  CACHE_TRIM_ALL*: jint {.`static`.}
  CACHE_TRIM_FONT*: jint {.`static`.}
  CACHE_TRIM_RESOURCES*: jint {.`static`.}

jclass android.graphics.HardwareRenderer.FrameRenderRequest* of JVMObject:
  proc setFrameInfo*(info: FrameInfo)
  proc setVsyncTime*(vsyncTime: jlong): FrameRenderRequest
  proc setFrameCommitCallback*(executor: Executor, frameCommitCallback: Runnable): FrameRenderRequest
  proc setWaitForPresent*(shouldWait: jboolean): FrameRenderRequest
  proc syncAndDraw*(): jint

jclass android.graphics.HardwareRenderer.CopyRequest* of JVMObject:
  proc getDestinationBitmap*(srcWidth: jint, srcHeight: jint): jlong
  proc onCopyFinished*(result: jint)

jclass android.graphics.FrameRenderRequest* of JVMObject:
  proc setFrameInfo*(info: FrameInfo)
  proc setVsyncTime*(vsyncTime: jlong): FrameRenderRequest
  proc setFrameCommitCallback*(executor: Executor, frameCommitCallback: Runnable): FrameRenderRequest
  proc setWaitForPresent*(shouldWait: jboolean): FrameRenderRequest
  proc syncAndDraw*(): jint





jclass android.graphics.CopyRequest* of JVMObject:
  proc getDestinationBitmap*(srcWidth: jint, srcHeight: jint): jlong
  proc onCopyFinished*(result: jint)

