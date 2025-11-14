import jnim

jclass android.app.UiAutomation* of JVMObject:
  proc connect*()
  proc connect*(flags: jint)
  proc connectWithTimeout*(flags: jint, timeoutMillis: jlong)
  proc getFlags*(): jint
  proc disconnect*()
  proc getConnectionId*(): jint
  proc isDestroyed*(): jboolean
  proc setOnAccessibilityEventListener*(listener: OnAccessibilityEventListener)
  proc destroy*()
  proc clearCache*(): jboolean
  proc isNodeInCache*(node: AccessibilityNodeInfo): jboolean
  proc getCache*(): AccessibilityCache
  proc adoptShellPermissionIdentity*()
  proc adoptShellPermissionIdentity*(permissions: string)
  proc dropShellPermissionIdentity*()
  proc getAdoptedShellPermissions*(): Set[string]
  proc addOverridePermissionState*(uid: jint, permission: string, result: jint)
  proc removeOverridePermissionState*(uid: jint, permission: string)
  proc clearOverridePermissionStates*(uid: jint)
  proc clearAllOverridePermissionStates*()
  proc performGlobalAction*(action: jint): jboolean
  proc findFocus*(focus: jint): AccessibilityNodeInfo
  proc getServiceInfo*(): AccessibilityServiceInfo
  proc setServiceInfo*(info: AccessibilityServiceInfo)
  proc getWindows*(): List[AccessibilityWindowInfo]
  proc getWindowsOnAllDisplays*(): SparseArray[List[AccessibilityWindowInfo]]
  proc getRootInActiveWindow*(): AccessibilityNodeInfo
  proc getRootInActiveWindow*(prefetchingStrategy: jint): AccessibilityNodeInfo
  proc injectInputEvent*(event: InputEvent, sync: jboolean): jboolean
  proc injectInputEvent*(event: InputEvent, sync: jboolean, waitForAnimations: jboolean): jboolean
  proc injectInputEventToInputFilter*(event: InputEvent)
  proc setAnimationScale*(scale: jfloat)
  proc syncInputTransactions*()
  proc syncInputTransactions*(waitForAnimations: jboolean)
  proc setRotation*(rotation: jint): jboolean
  proc executeAndWaitForEvent*(command: Runnable, filter: AccessibilityEventFilter, timeoutMillis: jlong): AccessibilityEvent
  proc waitForIdle*(idleTimeoutMillis: jlong, globalTimeoutMillis: jlong)
  proc takeScreenshot*(): Bitmap
  proc takeScreenshot*(window: Window): Bitmap
  proc setRunAsMonkey*(enable: jboolean)
  proc clearWindowContentFrameStats*(windowId: jint): jboolean
  proc getWindowContentFrameStats*(windowId: jint): WindowContentFrameStats
  proc clearWindowAnimationFrameStats*()
  proc getWindowAnimationFrameStats*(): WindowAnimationFrameStats
  proc grantRuntimePermission*(packageName: string, permission: string)
  proc grantRuntimePermission*(packageName: string, permission: string, userHandle: UserHandle): jboolean
  proc grantRuntimePermissionAsUser*(packageName: string, permission: string, userHandle: UserHandle)
  proc revokeRuntimePermission*(packageName: string, permission: string)
  proc revokeRuntimePermission*(packageName: string, permission: string, userHandle: UserHandle): jboolean
  proc revokeRuntimePermissionAsUser*(packageName: string, permission: string, userHandle: UserHandle)
  proc executeShellCommand*(command: string): ParcelFileDescriptor
  proc executeShellCommandRw*(command: string): seq[ParcelFileDescriptor]
  proc executeShellCommandRwe*(command: string): seq[ParcelFileDescriptor]
  proc getDisplayId*(): jint
  proc toString*(): string
  ROTATION_UNFREEZE*: jint {.`static`.}
  ROTATION_FREEZE_CURRENT*: jint {.`static`.}
  ROTATION_FREEZE_0*: jint {.`static`.}
  ROTATION_FREEZE_90*: jint {.`static`.}
  ROTATION_FREEZE_180*: jint {.`static`.}
  ROTATION_FREEZE_270*: jint {.`static`.}
  FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES*: jint {.`static`.}
  FLAG_DONT_USE_ACCESSIBILITY*: jint {.`static`.}
  FLAG_NOT_ACCESSIBILITY_TOOL*: jint {.`static`.}
  ALL_PERMISSIONS*: Set[string] {.`static`.}

jclass android.app.UiAutomation.OnAccessibilityEventListener* of JVMObject:
  proc onAccessibilityEvent*(event: AccessibilityEvent)

jclass android.app.UiAutomation.AccessibilityEventFilter* of JVMObject:
  proc accept*(event: AccessibilityEvent): jboolean

jclass android.app.OnAccessibilityEventListener* of JVMObject:
  proc onAccessibilityEvent*(event: AccessibilityEvent)

jclass android.app.AccessibilityEventFilter* of JVMObject:
  proc accept*(event: AccessibilityEvent): jboolean

