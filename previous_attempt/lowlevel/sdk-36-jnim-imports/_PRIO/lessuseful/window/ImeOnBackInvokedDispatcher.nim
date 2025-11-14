import jnim

jclass android.window.ImeOnBackInvokedDispatcher* of JVMObject:
  proc updateReceivingDispatcher*(dispatcher: WindowOnBackInvokedDispatcher)
  proc registerOnBackInvokedCallback*(priority: jint, callback: OnBackInvokedCallback)
  proc unregisterOnBackInvokedCallback*(callback: OnBackInvokedCallback)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc preliminaryClear*()
  proc undoPreliminaryClear*()
  proc clear*()
  proc switchRootView*(previous: ViewRootImpl, current: ViewRootImpl)
  CREATOR*: Parcelable.Creator[ImeOnBackInvokedDispatcher] {.`static`.}

jclass android.window.ImeOnBackInvokedDispatcher.ImeOnBackInvokedCallback* of JVMObject:
  proc onBackStarted*(backEvent: BackEvent)
  proc onBackProgressed*(backEvent: BackEvent)
  proc onBackInvoked*()
  proc onBackCancelled*()
  proc toString*(): string

jclass android.window.ImeOnBackInvokedCallback* of JVMObject:
  proc onBackStarted*(backEvent: BackEvent)
  proc onBackProgressed*(backEvent: BackEvent)
  proc onBackInvoked*()
  proc onBackCancelled*()
  proc toString*(): string

jclass android.window.DefaultImeOnBackAnimationCallback* of ImeOnBackInvokedCallback:

