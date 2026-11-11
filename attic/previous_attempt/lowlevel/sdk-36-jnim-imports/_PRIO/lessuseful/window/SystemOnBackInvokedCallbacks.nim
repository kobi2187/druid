import jnim

jclass android.window.SystemOnBackInvokedCallbacks* of JVMObject:
  proc moveTaskToBackCallback*(activity: Activity): OnBackInvokedCallback {.`static`.}
  proc finishAndRemoveTaskCallback*(activity: Activity): OnBackInvokedCallback {.`static`.}

