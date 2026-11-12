import jnim

jclass android.view.AccessibilityInteractionController* of JVMObject:
  proc findAccessibilityNodeInfoByAccessibilityIdClientThread*(accessibilityNodeId: jlong, interactiveRegion: Region, interactionId: jint, callback: IAccessibilityInteractionConnectionCallback, flags: jint, interrogatingPid: jint, interrogatingTid: jlong, spec: MagnificationSpec, matrixValues: seq[jfloat], arguments: Bundle)
  proc findAccessibilityNodeInfosByViewIdClientThread*(accessibilityNodeId: jlong, viewId: string, interactiveRegion: Region, interactionId: jint, callback: IAccessibilityInteractionConnectionCallback, flags: jint, interrogatingPid: jint, interrogatingTid: jlong, spec: MagnificationSpec, matrixValues: seq[jfloat])
  proc findAccessibilityNodeInfosByTextClientThread*(accessibilityNodeId: jlong, text: string, interactiveRegion: Region, interactionId: jint, callback: IAccessibilityInteractionConnectionCallback, flags: jint, interrogatingPid: jint, interrogatingTid: jlong, spec: MagnificationSpec, matrixValues: seq[jfloat])
  proc takeScreenshotOfWindowClientThread*(interactionId: jint, listener: ScreenCapture.ScreenCaptureListener, callback: IAccessibilityInteractionConnectionCallback)
  proc getWindowSurfaceInfoClientThread*(callback: IWindowSurfaceInfoCallback)
  proc findFocusClientThread*(accessibilityNodeId: jlong, focusType: jint, interactiveRegion: Region, interactionId: jint, callback: IAccessibilityInteractionConnectionCallback, flags: jint, interrogatingPid: jint, interrogatingTid: jlong, spec: MagnificationSpec, matrixValues: seq[jfloat])
  proc focusSearchClientThread*(accessibilityNodeId: jlong, direction: jint, interactiveRegion: Region, interactionId: jint, callback: IAccessibilityInteractionConnectionCallback, flags: jint, interrogatingPid: jint, interrogatingTid: jlong, spec: MagnificationSpec, matrixValues: seq[jfloat])
  proc performAccessibilityActionClientThread*(accessibilityNodeId: jlong, action: jint, arguments: Bundle, interactionId: jint, callback: IAccessibilityInteractionConnectionCallback, flags: jint, interrogatingPid: jint, interrogatingTid: jlong)
  proc clearAccessibilityFocusClientThread*()
  proc notifyOutsideTouchClientThread*()
  proc destroy*()
  proc attachAccessibilityOverlayToWindowClientThread*(sc: SurfaceControl, interactionId: jint, callback: IAccessibilityInteractionConnectionCallback)

