import jnim

jclass android.app.RemoteAction* of JVMObject:
  proc setEnabled*(enabled: jboolean)
  proc isEnabled*(): jboolean
  proc setShouldShowIcon*(shouldShowIcon: jboolean)
  proc shouldShowIcon*(): jboolean
  proc getIcon*(): Icon
  proc getTitle*(): CharSequence
  proc getContentDescription*(): CharSequence
  proc getActionIntent*(): PendingIntent
  proc clone*(): RemoteAction
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc dump*(prefix: string, pw: PrintWriter)
  CREATOR*: Parcelable.Creator[RemoteAction] {.`static`.}

