import jnim

jclass android.database.BulkCursorDescriptor* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  CREATOR*: Parcelable.Creator[BulkCursorDescriptor] {.`static`.}
  cursor*: IBulkCursor
  columnNames*: string
  wantsAllOnMoveCalls*: jboolean
  count*: jint
  window*: CursorWindow

