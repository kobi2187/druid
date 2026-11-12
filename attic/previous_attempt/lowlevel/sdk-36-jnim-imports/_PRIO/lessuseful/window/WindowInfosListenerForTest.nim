import jnim

jclass android.window.WindowInfosListenerForTest* of JVMObject:
  proc addWindowInfosListener*(consumer: Consumer[List[WindowInfo]])
  proc addWindowInfosListener*(consumer: BiConsumer[List[WindowInfo], List[DisplayInfo]])
  proc removeWindowInfosListener*(consumer: Consumer[List[WindowInfo]])
  proc removeWindowInfosListener*(consumer: BiConsumer[List[WindowInfo], List[DisplayInfo]])

jclass android.window.WindowInfosListenerForTest.WindowInfo* of JVMObject:
  proc toString*(): string

jclass android.window.WindowInfosListenerForTest.DisplayInfo* of JVMObject:
  proc toString*(): string

jclass android.window.WindowInfo* of JVMObject:
  proc toString*(): string
  windowToken*: IBinder
  name*: string
  displayId*: jint
  bounds*: Rect
  isTrustedOverlay*: jboolean
  isVisible*: jboolean
  transform*: Matrix
  isTouchable*: jboolean
  isFocusable*: jboolean
  isDuplicateTouchToWallpaper*: jboolean
  isWatchOutsideTouch*: jboolean

jclass android.window.DisplayInfo* of JVMObject:
  proc toString*(): string
  displayId*: jint
  transform*: Matrix

