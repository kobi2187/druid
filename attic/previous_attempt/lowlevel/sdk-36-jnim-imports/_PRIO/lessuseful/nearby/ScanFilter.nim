import jnim

jclass android.nearby.ScanFilter* of JVMObject:
  proc createFromParcel*(in: Parcel): ScanFilter {.`static`.}
  proc getType*(): jint
  proc getMaxPathLoss*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

