import jnim

jclass android.timezone.TelephonyLookup* of JVMObject:
  proc getInstance*(): TelephonyLookup {.`static`.}
  proc getTelephonyNetworkFinder*(): TelephonyNetworkFinder

