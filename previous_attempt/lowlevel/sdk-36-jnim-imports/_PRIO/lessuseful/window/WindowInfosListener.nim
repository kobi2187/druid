import jnim

jclass android.window.WindowInfosListener* of JVMObject:
  proc onWindowInfosChanged*(windowHandles: seq[InputWindowHandle], displayInfos: seq[DisplayInfo])
  proc register*(): Pair[seq[InputWindowHandle], seq[DisplayInfo]]
  proc unregister*()

jclass android.window.WindowInfosListener.DisplayInfo* of JVMObject:
  proc toString*(): string

jclass android.window.DisplayInfo* of JVMObject:
  proc toString*(): string
  mDisplayId*: jint
  mLogicalSize*: Size
  mTransform*: Matrix

