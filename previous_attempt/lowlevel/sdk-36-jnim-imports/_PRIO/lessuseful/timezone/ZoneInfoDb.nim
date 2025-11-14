import jnim

jclass android.timezone.ZoneInfoDb* of JVMObject:
  proc getInstance*(): ZoneInfoDb {.`static`.}
  proc getVersion*(): string

