import jnim

jclass android.text.Annotation* of JVMObject:
  proc getSpanTypeId*(): jint
  proc getSpanTypeIdInternal*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc writeToParcelInternal*(dest: Parcel, flags: jint)
  proc getKey*(): string
  proc getValue*(): string

