import jnim

jclass android.view.AbsSavedState* of JVMObject:
  proc getSuperState*(): Parcelable
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  EMPTY_STATE*: AbsSavedState {.`static`.}
  CREATOR*: Parcelable.Creator[AbsSavedState] {.`static`.}

