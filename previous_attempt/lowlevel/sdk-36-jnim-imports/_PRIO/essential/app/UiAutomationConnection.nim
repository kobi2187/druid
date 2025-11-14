import jnim

jclass android.app.UiAutomationConnection* of Stub:
  proc connect*(client: IAccessibilityServiceClient, flags: jint)
  proc disconnect*()
  proc injectInputEvent*(event: InputEvent, sync: jboolean, waitForAnimations: jboolean): jboolean
  proc injectInputEventToInputFilter*(event: InputEvent)
  proc syncInputTransactions*(waitForAnimations: jboolean)
  proc setRotation*(rotation: jint): jboolean
  proc takeScreenshot*(crop: Rect, listener: ScreenCapture.ScreenCaptureListener, displayId: jint): jboolean
  proc takeSurfaceControlScreenshot*(surfaceControl: SurfaceControl, listener: ScreenCapture.ScreenCaptureListener): jboolean
  proc clearWindowContentFrameStats*(windowId: jint): jboolean
  proc getWindowContentFrameStats*(windowId: jint): WindowContentFrameStats
  proc clearWindowAnimationFrameStats*()
  proc getWindowAnimationFrameStats*(): WindowAnimationFrameStats
  proc grantRuntimePermission*(packageName: string, permission: string, userId: jint)
  proc revokeRuntimePermission*(packageName: string, permission: string, userId: jint)
  proc adoptShellPermissionIdentity*(uid: jint, permissions: seq[string])
  proc dropShellPermissionIdentity*()
  proc getAdoptedShellPermissions*(): List[string]
  proc addOverridePermissionState*(uid: jint, permission: string, result: jint)
  proc removeOverridePermissionState*(uid: jint, permission: string)
  proc clearOverridePermissionStates*(uid: jint)
  proc clearAllOverridePermissionStates*()
  proc executeShellCommand*(command: string, sink: ParcelFileDescriptor, source: ParcelFileDescriptor)
  proc executeShellCommandWithStderr*(command: string, sink: ParcelFileDescriptor, source: ParcelFileDescriptor, stderrSink: ParcelFileDescriptor)
  proc executeShellCommandArrayWithStderr*(command: seq[string], sink: ParcelFileDescriptor, source: ParcelFileDescriptor, stderrSink: ParcelFileDescriptor)
  proc shutdown*()

jclass android.app.UiAutomationConnection.Repeater* of JVMObject:
  proc run*()

jclass android.app.Repeater* of JVMObject:
  proc run*()

