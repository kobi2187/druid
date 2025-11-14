import jnim

jclass android.nearby.DataElement* of JVMObject:
  proc isIdentityDataType*(): jboolean
  proc isTestDeType*(type: jint): jboolean {.`static`.}
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getKey*(): jint
  proc getValue*(): seq[jbyte]
  CREATOR*: Creator[DataElement] {.`static`.}

