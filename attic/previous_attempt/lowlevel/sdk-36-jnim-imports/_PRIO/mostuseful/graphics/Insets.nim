import jnim

jclass android.graphics.Insets* of JVMObject:
  proc of*(left: jint, top: jint, right: jint, bottom: jint): Insets {.`static`.}
  proc of*(r: Rect): Insets {.`static`.}
  proc toRect*(): Rect
  proc add*(a: Insets, b: Insets): Insets {.`static`.}
  proc subtract*(a: Insets, b: Insets): Insets {.`static`.}
  proc max*(a: Insets, b: Insets): Insets {.`static`.}
  proc min*(a: Insets, b: Insets): Insets {.`static`.}
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  NONE*: Insets {.`static`.}
  left*: jint
  top*: jint
  right*: jint
  bottom*: jint
  CREATOR*: Parcelable.Creator[Insets] {.`static`.}

