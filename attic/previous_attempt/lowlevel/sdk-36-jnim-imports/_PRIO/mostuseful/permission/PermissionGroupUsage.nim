import jnim

jclass android.permission.PermissionGroupUsage* of JVMObject:
  proc getPackageName*(): string
  proc getUid*(): jint
  proc getLastAccessTimeMillis*(): jlong
  proc getPermissionGroupName*(): string
  proc isActive*(): jboolean
  proc isPhoneCall*(): jboolean
  proc getAttributionTag*(): CharSequence
  proc getAttributionLabel*(): CharSequence
  proc getProxyLabel*(): CharSequence
  proc getPersistentDeviceId*(): string
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[PermissionGroupUsage] {.`static`.}

