import jnim

jclass android.os.BatteryProperty* of JVMObject:
  proc getLong*(): jlong
  proc getString*(): string
  proc setLong*(val: jlong)
  proc setString*(val: string)
  proc readFromParcel*(p: Parcel)
  proc writeToParcel*(p: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[BatteryProperty] {.`static`.}

