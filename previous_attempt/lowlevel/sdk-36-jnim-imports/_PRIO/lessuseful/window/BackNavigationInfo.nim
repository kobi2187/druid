import jnim

jclass android.window.BackNavigationInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getType*(): jint
  proc getOnBackInvokedCallback*(): IOnBackInvokedCallback
  proc isPrepareRemoteAnimation*(): jboolean
  proc isAnimationCallback*(): jboolean
  proc getLetterboxColor*(): jint
  proc getTouchableRegion*(): Rect
  proc isAppProgressGenerationAllowed*(): jboolean
  proc getFocusedTaskId*(): jint
  proc disableAppProgressGenerationAllowed*()
  proc onBackNavigationFinished*(triggerBack: jboolean)
  proc getCustomAnimationInfo*(): CustomAnimationInfo
  proc describeContents*(): jint
  proc toString*(): string
  proc typeToString*(type: jint): string {.`static`.}
  TYPE_UNDEFINED*: jint {.`static`.}
  TYPE_DIALOG_CLOSE*: jint {.`static`.}
  TYPE_RETURN_TO_HOME*: jint {.`static`.}
  TYPE_CROSS_ACTIVITY*: jint {.`static`.}
  TYPE_CROSS_TASK*: jint {.`static`.}
  TYPE_CALLBACK*: jint {.`static`.}
  KEY_NAVIGATION_FINISHED*: string {.`static`.}
  KEY_GESTURE_FINISHED*: string {.`static`.}
  KEY_TOUCH_GESTURE_TRANSFERRED*: string {.`static`.}
  CREATOR*: Creator[BackNavigationInfo] {.`static`.}

jclass android.window.BackNavigationInfo.CustomAnimationInfo* of JVMObject:
  proc getPackageName*(): string
  proc getWindowAnimations*(): jint
  proc getCustomExitAnim*(): jint
  proc getCustomEnterAnim*(): jint
  proc getCustomBackground*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.window.BackNavigationInfo.Builder* of JVMObject:
  proc setType*(type: jint): Builder
  proc setOnBackNavigationDone*(onBackNavigationDone: RemoteCallback): Builder
  proc setOnBackInvokedCallback*(onBackInvokedCallback: IOnBackInvokedCallback): Builder
  proc setPrepareRemoteAnimation*(prepareRemoteAnimation: jboolean): Builder
  proc setWindowAnimations*(packageName: string, windowAnimations: jint): Builder
  proc setCustomAnimation*(packageName: string, enterResId: jint, exitResId: jint, backgroundColor: jint): Builder
  proc setAnimationCallback*(isAnimationCallback: jboolean): Builder
  proc setLetterboxColor*(color: jint): Builder
  proc setTouchableRegion*(rect: Rect): Builder
  proc setAppProgressAllowed*(allowed: jboolean): Builder
  proc setFocusedTaskId*(focusedTaskId: jint): Builder
  proc build*(): BackNavigationInfo

jclass android.window.CustomAnimationInfo* of JVMObject:
  proc getPackageName*(): string
  proc getWindowAnimations*(): jint
  proc getCustomExitAnim*(): jint
  proc getCustomEnterAnim*(): jint
  proc getCustomBackground*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[CustomAnimationInfo] {.`static`.}

jclass android.window.Builder* of JVMObject:
  proc setType*(type: jint): Builder
  proc setOnBackNavigationDone*(onBackNavigationDone: RemoteCallback): Builder
  proc setOnBackInvokedCallback*(onBackInvokedCallback: IOnBackInvokedCallback): Builder
  proc setPrepareRemoteAnimation*(prepareRemoteAnimation: jboolean): Builder
  proc setWindowAnimations*(packageName: string, windowAnimations: jint): Builder
  proc setCustomAnimation*(packageName: string, enterResId: jint, exitResId: jint, backgroundColor: jint): Builder
  proc setAnimationCallback*(isAnimationCallback: jboolean): Builder
  proc setLetterboxColor*(color: jint): Builder
  proc setTouchableRegion*(rect: Rect): Builder
  proc setAppProgressAllowed*(allowed: jboolean): Builder
  proc setFocusedTaskId*(focusedTaskId: jint): Builder
  proc build*(): BackNavigationInfo

