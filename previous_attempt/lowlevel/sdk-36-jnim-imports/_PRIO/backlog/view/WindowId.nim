import jnim

jclass android.view.WindowId* of JVMObject:
  proc isFocused*(): jboolean
  proc registerFocusObserver*(observer: FocusObserver)
  proc unregisterFocusObserver*(observer: FocusObserver)
  proc equals*(otherObj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getTarget*(): IWindowId
  CREATOR*: Parcelable.Creator[WindowId] {.`static`.}

jclass android.view.WindowId.FocusObserver* of JVMObject:
  proc onFocusGained*(token: WindowId)
  proc onFocusLost*(token: WindowId)

jclass android.view.FocusObserver* of JVMObject:
  proc onFocusGained*(token: WindowId)
  proc onFocusLost*(token: WindowId)

