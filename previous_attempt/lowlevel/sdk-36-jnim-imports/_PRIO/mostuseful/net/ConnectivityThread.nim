import jnim

jclass android.net.ConnectivityThread* of HandlerThread:
  proc get*(): ConnectivityThread {.`static`.}
  proc getInstanceLooper*(): Looper {.`static`.}

