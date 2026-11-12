import jnim

jclass android.view.ThreadedRenderer* of HardwareRenderer:
  proc enableForegroundTrimming*() {.`static`.}
  proc initForSystemProcess*() {.`static`.}
  proc create*(context: Context, translucent: jboolean, name: string): ThreadedRenderer {.`static`.}
  proc destroy*()
  proc setSurface*(surface: Surface)
  proc rendererOwnsSurfaceControlOpacity*(): jboolean
  proc setSurfaceControlOpaque*(opaque: jboolean): jboolean
  proc setSurfaceControl*(surfaceControl: SurfaceControl, blastBufferQueue: BLASTBufferQueue)
  proc notifyCallbackPending*()
  proc notifyExpensiveFrame*()
  proc handleDumpGfxInfo*(fd: FileDescriptor, args: seq[string]) {.`static`.}
  proc loadSystemProperties*(): jboolean
  proc getRootNode*(): RenderNode
  PROFILE_PROPERTY*: string {.`static`.}
  PROFILE_PROPERTY_VISUALIZE_BARS*: string {.`static`.}
  DEBUG_DIRTY_REGIONS_PROPERTY*: string {.`static`.}
  DEBUG_SHOW_LAYERS_UPDATES_PROPERTY*: string {.`static`.}
  DEBUG_OVERDRAW_PROPERTY*: string {.`static`.}
  OVERDRAW_PROPERTY_SHOW*: string {.`static`.}
  DEBUG_SHOW_NON_RECTANGULAR_CLIP_PROPERTY*: string {.`static`.}
  DEBUG_FPS_DIVISOR*: string {.`static`.}
  DEBUG_FORCE_DARK*: string {.`static`.}
  EGL_CONTEXT_PRIORITY_REALTIME_NV*: jint {.`static`.}
  EGL_CONTEXT_PRIORITY_HIGH_IMG*: jint {.`static`.}
  EGL_CONTEXT_PRIORITY_MEDIUM_IMG*: jint {.`static`.}
  EGL_CONTEXT_PRIORITY_LOW_IMG*: jint {.`static`.}
  sRendererEnabled*: jboolean {.`static`.}

jclass android.view.ThreadedRenderer.SimpleRenderer* of JVMObject:
  proc setLightCenter*(display: Display, windowLeft: jint, windowTop: jint)
  proc getRootNode*(): RenderNode
  proc draw*(callback: FrameDrawingCallback)

jclass android.view.SimpleRenderer* of HardwareRenderer:
  proc setLightCenter*(display: Display, windowLeft: jint, windowTop: jint)
  proc getRootNode*(): RenderNode
  proc draw*(callback: FrameDrawingCallback)

