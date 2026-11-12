import jnim

jclass android.window.OnBackInvokedCallbackInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc isSystemCallback*(): jboolean
  proc getCallback*(): IOnBackInvokedCallback
  proc getPriority*(): jint
  proc isAnimationCallback*(): jboolean
  proc getOverrideBehavior*(): jint
  proc toString*(): string
  CREATOR*: Creator[OnBackInvokedCallbackInfo] {.`static`.}

