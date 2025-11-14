import jnim

jclass android.content.ContentValues* of JVMObject:
  proc equals*(object: JObject): jboolean
  proc getValues*(): ArrayMap[string, JObject]
  proc hashCode*(): jint
  proc put*(key: string, value: string)
  proc putAll*(other: ContentValues)
  proc put*(key: string, value: Byte)
  proc put*(key: string, value: Short)
  proc put*(key: string, value: Integer)
  proc put*(key: string, value: Long)
  proc put*(key: string, value: Float)
  proc put*(key: string, value: Double)
  proc put*(key: string, value: Boolean)
  proc put*(key: string, value: seq[jbyte])
  proc putNull*(key: string)
  proc putObject*(key: string, value: JObject)
  proc size*(): jint
  proc isEmpty*(): jboolean
  proc remove*(key: string)
  proc clear*()
  proc containsKey*(key: string): jboolean
  proc get*(key: string): JObject
  proc getAsString*(key: string): string
  proc getAsLong*(key: string): Long
  proc getAsInteger*(key: string): Integer
  proc getAsShort*(key: string): Short
  proc getAsByte*(key: string): Byte
  proc getAsDouble*(key: string): Double
  proc getAsFloat*(key: string): Float
  proc getAsBoolean*(key: string): Boolean
  proc getAsByteArray*(key: string): seq[jbyte]
  proc valueSet*(): Set[Map.Entry<String, Object>]
  proc keySet*(): Set[string]
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc putStringArrayList*(key: string, value: ArrayList[string])
  proc getStringArrayList*(key: string): ArrayList[string]
  proc toString*(): string
  proc isSupportedValue*(value: JObject): jboolean {.`static`.}
  TAG*: string {.`static`.}
  CREATOR*: Parcelable.Creator[ContentValues] {.`static`.}

