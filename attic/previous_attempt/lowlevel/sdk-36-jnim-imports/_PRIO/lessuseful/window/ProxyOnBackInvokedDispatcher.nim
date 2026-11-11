import jnim

jclass android.window.ProxyOnBackInvokedDispatcher* of JVMObject:
  proc registerOnBackInvokedCallback*(priority: jint, callback: OnBackInvokedCallback)
  proc registerSystemOnBackInvokedCallback*(callback: OnBackInvokedCallback)
  proc unregisterOnBackInvokedCallback*(callback: OnBackInvokedCallback)
  proc reset*()
  proc setActualDispatcher*(actualDispatcher: OnBackInvokedDispatcher)
  proc setImeOnBackInvokedDispatcher*(imeDispatcher: ImeOnBackInvokedDispatcher)

