import jnim

jclass android.database.BulkCursorNative* of Binder:
  proc asInterface*(obj: IBinder): IBulkCursor {.`static`.}
  proc onTransact*(code: jint, data: Parcel, reply: Parcel, flags: jint): jboolean
  proc asBinder*(): IBinder

