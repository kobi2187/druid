import jnim

jclass android.view.DragAndDropPermissions* of JVMObject:
  proc obtain*(dragEvent: DragEvent): DragAndDropPermissions {.`static`.}
  proc take*(activityToken: IBinder): jboolean
  proc takeTransient*(): jboolean
  proc release*()
  proc describeContents*(): jint
  proc writeToParcel*(destination: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[DragAndDropPermissions] {.`static`.}

