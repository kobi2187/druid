import jnim

jclass android.util.HashedStringCache* of JVMObject:
  proc getInstance*(): HashedStringCache {.`static`.}
  proc hashString*(context: Context, tag: string, clearText: string, saltExpirationDays: jint): HashResult

jclass android.util.HashResult* of JVMObject:
  hashedString*: string
  saltGeneration*: jint

