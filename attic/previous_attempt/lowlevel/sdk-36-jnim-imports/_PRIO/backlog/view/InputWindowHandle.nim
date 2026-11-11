import jnim

jclass android.view.InputWindowHandle* of JVMObject:
  proc toString*(): string
  proc replaceTouchableRegionWithCrop*(bounds: SurfaceControl)
  proc setTouchableRegionCrop*(bounds: SurfaceControl)
  proc setTouchableRegion*(rect: Rect)
  proc setWindowToken*(iwindow: IBinder)
  proc getWindowToken*(): IBinder
  proc setInputConfig*(inputConfig: jint, value: jboolean)
  proc setTrustedOverlay*(t: SurfaceControl.Transaction, sc: SurfaceControl, isTrusted: jboolean)
  inputApplicationHandle*: InputApplicationHandle
  token*: IBinder
  name*: string
  layoutParamsFlags*: jint
  layoutParamsType*: jint
  dispatchingTimeoutMillis*: jlong
  frame*: Rect
  contentSize*: Size
  surfaceInset*: jint
  scaleFactor*: jfloat
  touchableRegion*: Region
  inputConfig*: jint
  touchOcclusionMode*: jint
  ownerPid*: jint
  ownerUid*: jint
  packageName*: string
  displayId*: jint
  touchableRegionSurfaceControl*: WeakReference[SurfaceControl]
  replaceTouchableRegionWithCrop*: jboolean
  transform*: Matrix
  alpha*: jfloat
  canOccludePresentation*: jboolean
  focusTransferTarget*: IBinder

