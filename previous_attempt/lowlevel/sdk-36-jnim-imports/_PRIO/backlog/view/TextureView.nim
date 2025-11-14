import jnim

jclass android.view.TextureView* of View:
  proc isOpaque*(): jboolean
  proc setOpaque*(opaque: jboolean)
  proc setLayerType*(layerType: jint, paint: Paint)
  proc setLayerPaint*(paint: Paint)
  proc getLayerType*(): jint
  proc buildLayer*()
  proc setForeground*(foreground: Drawable)
  proc setBackgroundDrawable*(background: Drawable)
  proc draw*(canvas: Canvas)
  proc setTransform*(transform: Matrix)
  proc getTransform*(transform: Matrix): Matrix
  proc getBitmap*(): Bitmap
  proc getBitmap*(width: jint, height: jint): Bitmap
  proc getBitmap*(bitmap: Bitmap): Bitmap
  proc isAvailable*(): jboolean
  proc lockCanvas*(): Canvas
  proc lockCanvas*(dirty: Rect): Canvas
  proc unlockCanvasAndPost*(canvas: Canvas)
  proc getSurfaceTexture*(): SurfaceTexture
  proc setSurfaceTexture*(surfaceTexture: SurfaceTexture)
  proc getSurfaceTextureListener*(): SurfaceTextureListener
  proc setSurfaceTextureListener*(listener: SurfaceTextureListener)
  proc getAccessibilityClassName*(): CharSequence

