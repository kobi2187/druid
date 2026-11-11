import jnim

jclass android.view.SurfaceControlViewHost* of JVMObject:
  proc getSurfacePackage*(): SurfacePackage
  proc getRootSurfaceControl*(): AttachedSurfaceControl
  proc setView*(view: View, width: jint, height: jint)
  proc setView*(view: View, attrs: WindowManager.LayoutParams)
  proc getView*(): View
  proc getWindowToken*(): IWindow
  proc getWindowlessWM*(): WindowlessWindowManager
  proc relayout*(attrs: WindowManager.LayoutParams, callback: WindowlessWindowManager.ResizeCompleteCallback)
  proc relayout*(attrs: WindowManager.LayoutParams)
  proc relayout*(width: jint, height: jint)
  proc release*()
  proc getInputTransferToken*(): InputTransferToken
  proc transferTouchGestureToHost*(): jboolean

jclass android.view.SurfaceControlViewHost.SurfacePackage* of JVMObject:
  proc getSurfaceControl*(): SurfaceControl
  proc getAccessibilityEmbeddedConnection*(): IAccessibilityEmbeddedConnection
  proc getRemoteInterface*(): ISurfaceControlViewHost
  proc notifyConfigurationChanged*(c: Configuration)
  proc notifyDetachedFromWindow*()
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc release*()
  proc getInputTransferToken*(): InputTransferToken
  proc toString*(): string

jclass android.view.SurfacePackage* of JVMObject:
  proc getSurfaceControl*(): SurfaceControl
  proc getAccessibilityEmbeddedConnection*(): IAccessibilityEmbeddedConnection
  proc getRemoteInterface*(): ISurfaceControlViewHost
  proc notifyConfigurationChanged*(c: Configuration)
  proc notifyDetachedFromWindow*()
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc release*()
  proc getInputTransferToken*(): InputTransferToken
  proc toString*(): string
  CREATOR*: Creator[SurfacePackage] {.`static`.}

