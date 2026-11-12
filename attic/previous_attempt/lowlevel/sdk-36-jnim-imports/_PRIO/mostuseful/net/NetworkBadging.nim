import jnim

jclass android.net.NetworkBadging* of JVMObject:
  proc getWifiIcon*(signalLevel: jint, badging: jint, theme: Theme): Drawable {.`static`.}
  BADGING_NONE*: jint {.`static`.}
  BADGING_SD*: jint {.`static`.}
  BADGING_HD*: jint {.`static`.}
  BADGING_4K*: jint {.`static`.}

