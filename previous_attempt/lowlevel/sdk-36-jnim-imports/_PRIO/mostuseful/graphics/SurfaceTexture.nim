import jnim

jclass android.graphics.SurfaceTexture* of JVMObject:
  proc setOnFrameAvailableListener*(listener: OnFrameAvailableListener)
  proc setOnFrameAvailableListener*(listener: OnFrameAvailableListener, handler: Handler)
  proc setOnSetFrameRateListener*(listener: OnSetFrameRateListener, handler: Handler)
  proc setDefaultBufferSize*(width: jint, height: jint)
  proc updateTexImage*()
  proc releaseTexImage*()
  proc detachFromGLContext*()
  proc attachToGLContext*(texName: jint)
  proc getTransformMatrix*(mtx: seq[jfloat])
  proc getTimestamp*(): jlong
  proc getDataSpace*(): jint
  proc release*()
  proc isReleased*(): jboolean
  proc isSingleBuffered*(): jboolean



jclass android.graphics.OutOfResourcesException* of Exception:

