import jnim

jclass android.util.SizeF* of JVMObject:
  proc getWidth*(): jfloat
  proc getHeight*(): jfloat
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc parseSizeF*(string: string): SizeF {.`static`.}
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Creator[SizeF] {.`static`.}

