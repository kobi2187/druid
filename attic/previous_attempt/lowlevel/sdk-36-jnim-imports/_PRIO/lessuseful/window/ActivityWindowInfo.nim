import jnim

jclass android.window.ActivityWindowInfo* of JVMObject:
  proc set*(info: ActivityWindowInfo)
  proc set*(isEmbedded: jboolean, taskBounds: Rect, taskFragmentBounds: Rect)
  proc isEmbedded*(): jboolean
  proc getTaskBounds*(): Rect
  proc getTaskFragmentBounds*(): Rect
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc getActivityWindowInfo*(activity: Activity): ActivityWindowInfo {.`static`.}
  CREATOR*: Creator[ActivityWindowInfo] {.`static`.}

