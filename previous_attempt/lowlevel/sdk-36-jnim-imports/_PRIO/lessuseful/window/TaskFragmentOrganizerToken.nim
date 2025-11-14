import jnim

jclass android.window.TaskFragmentOrganizerToken* of JVMObject:
  proc asBinder*(): IBinder
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc hashCode*(): jint
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  CREATOR*: Creator[TaskFragmentOrganizerToken] {.`static`.}

