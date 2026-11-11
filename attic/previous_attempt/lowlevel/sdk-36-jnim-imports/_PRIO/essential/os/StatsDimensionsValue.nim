import jnim

jclass android.os.StatsDimensionsValue* of JVMObject:
  proc getField*(): jint
  proc getStringValue*(): string
  proc getIntValue*(): jint
  proc getLongValue*(): jlong
  proc getBooleanValue*(): jboolean
  proc getFloatValue*(): jfloat
  proc getTupleValueList*(): List[StatsDimensionsValue]
  proc getValueType*(): jint
  proc isValueType*(valueType: jint): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  STRING_VALUE_TYPE*: jint {.`static`.}
  INT_VALUE_TYPE*: jint {.`static`.}
  LONG_VALUE_TYPE*: jint {.`static`.}
  BOOLEAN_VALUE_TYPE*: jint {.`static`.}
  FLOAT_VALUE_TYPE*: jint {.`static`.}
  TUPLE_VALUE_TYPE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[StatsDimensionsValue] {.`static`.}

