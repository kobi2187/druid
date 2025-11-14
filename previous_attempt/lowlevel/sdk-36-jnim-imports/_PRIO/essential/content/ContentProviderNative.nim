import jnim

jclass android.content.ContentProviderNative* of Binder:
  proc asInterface*(obj: IBinder): IContentProvider {.`static`.}
  proc getProviderName*(): string
  proc onTransact*(code: jint, data: Parcel, reply: Parcel, flags: jint): jboolean
  proc asBinder*(): IBinder

