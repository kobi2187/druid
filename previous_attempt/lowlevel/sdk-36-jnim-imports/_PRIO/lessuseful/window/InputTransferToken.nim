import jnim

jclass android.window.InputTransferToken* of JVMObject:
  proc getToken*(): IBinder
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  mNativeObject*: jlong
  CREATOR*: Creator[InputTransferToken] {.`static`.}

