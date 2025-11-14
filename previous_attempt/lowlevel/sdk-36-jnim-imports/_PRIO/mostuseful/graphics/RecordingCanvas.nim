import jnim

jclass android.graphics.RecordingCanvas* of BaseRecordingCanvas:
  proc setDensity*(density: jint)
  proc isHardwareAccelerated*(): jboolean
  proc setBitmap*(bitmap: Bitmap)
  proc isOpaque*(): jboolean
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getMaximumBitmapWidth*(): jint
  proc getMaximumBitmapHeight*(): jint
  proc enableZ*()
  proc disableZ*()
  proc drawWebViewFunctor*(functor: jint)
  proc drawRenderNode*(renderNode: RenderNode)
  proc drawTextureLayer*(layer: TextureLayer)
  proc drawCircle*(cx: CanvasProperty[Float], cy: CanvasProperty[Float], radius: CanvasProperty[Float], paint: CanvasProperty[Paint])
  proc drawRipple*(cx: CanvasProperty[Float], cy: CanvasProperty[Float], radius: CanvasProperty[Float], paint: CanvasProperty[Paint], progress: CanvasProperty[Float], turbulencePhase: CanvasProperty[Float], color: jint, shader: RuntimeShader)
  proc drawRoundRect*(left: CanvasProperty[Float], top: CanvasProperty[Float], right: CanvasProperty[Float], bottom: CanvasProperty[Float], rx: CanvasProperty[Float], ry: CanvasProperty[Float], paint: CanvasProperty[Paint])
  MAX_BITMAP_SIZE*: jint {.`static`.}
  mNode*: RenderNode

