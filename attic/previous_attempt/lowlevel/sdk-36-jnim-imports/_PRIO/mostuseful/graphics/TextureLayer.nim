import jnim

jclass android.graphics.TextureLayer* of JVMObject:
  proc setLayerPaint*(paint: Paint)
  proc close*()
  proc copyInto*(bitmap: Bitmap): jboolean
  proc prepare*(width: jint, height: jint, isOpaque: jboolean): jboolean
  proc setTransform*(matrix: Matrix)
  proc detachSurfaceTexture*()
  proc setSurfaceTexture*(surface: SurfaceTexture)
  proc updateSurfaceTexture*()

