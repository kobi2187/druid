import jnim

jclass android.gesture.GestureLibraries* of JVMObject:
  proc fromFile*(path: string): GestureLibrary {.`static`.}
  proc fromFile*(path: File): GestureLibrary {.`static`.}
  proc fromFileDescriptor*(pfd: ParcelFileDescriptor): GestureLibrary {.`static`.}
  proc fromPrivateFile*(context: Context, name: string): GestureLibrary {.`static`.}
  proc fromRawResource*(context: Context, resourceId: jint): GestureLibrary {.`static`.}

