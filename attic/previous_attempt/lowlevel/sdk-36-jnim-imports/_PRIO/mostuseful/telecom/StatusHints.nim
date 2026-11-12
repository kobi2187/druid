import jnim

jclass android.telecom.StatusHints* of JVMObject:
  proc setIcon*(icon: Icon)
  proc getPackageName*(): ComponentName
  proc getLabel*(): CharSequence
  proc getIconResId*(): jint
  proc getIcon*(context: Context): Drawable
  proc getIcon*(): Icon
  proc getExtras*(): Bundle
  proc describeContents*(): jint
  proc validateAccountIconUserBoundary*(icon: Icon, callingUserHandle: UserHandle): Icon {.`static`.}
  proc getUserIdFromAuthority*(auth: string, defaultUserId: jint): jint {.`static`.}
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Creator[StatusHints] {.`static`.}

