import jnim

jclass android.graphics.HardwareBufferRenderer* of JVMObject:
  proc setContentRoot*(content: RenderNode)
  proc obtainRenderRequest*(): RenderRequest
  proc isClosed*(): jboolean
  proc close*()
  proc setLightSourceGeometry*(lightX: jfloat, lightY: jfloat, lightZ: jfloat, lightRadius: jfloat)
  proc setLightSourceAlpha*(ambientShadowAlpha: jfloat, spotShadowAlpha: jfloat)

jclass android.graphics.HardwareBufferRenderer.RenderResult* of JVMObject:
  proc getFence*(): SyncFence
  proc getStatus*(): jint

jclass android.graphics.HardwareBufferRenderer.RenderRequest* of JVMObject:
  proc draw*(executor: Executor, renderCallback: Consumer[RenderResult])
  proc setColorSpace*(colorSpace: ColorSpace): RenderRequest
  proc setBufferTransform*(bufferTransform: jint): RenderRequest

jclass android.graphics.RenderResult* of JVMObject:
  proc getFence*(): SyncFence
  proc getStatus*(): jint
  SUCCESS*: jint {.`static`.}
  ERROR_UNKNOWN*: jint {.`static`.}

jclass android.graphics.RenderRequest* of JVMObject:
  proc draw*(executor: Executor, renderCallback: Consumer[RenderResult])
  proc setColorSpace*(colorSpace: ColorSpace): RenderRequest
  proc setBufferTransform*(bufferTransform: jint): RenderRequest

