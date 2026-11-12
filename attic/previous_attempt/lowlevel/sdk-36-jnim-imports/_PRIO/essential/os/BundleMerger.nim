import jnim

jclass android.os.BundleMerger* of JVMObject:
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc setDefaultMergeStrategy*(strategy: jint)
  proc setMergeStrategy*(key: string, strategy: jint)
  proc getMergeStrategy*(key: string): jint
  proc asBinaryOperator*(): BinaryOperator[Bundle]
  proc merge*(first: Bundle, last: Bundle): Bundle
  proc merge*(strategy: jint, first: JObject, last: JObject): JObject {.`static`.}
  STRATEGY_REJECT*: jint {.`static`.}
  STRATEGY_FIRST*: jint {.`static`.}
  STRATEGY_LAST*: jint {.`static`.}
  STRATEGY_COMPARABLE_MIN*: jint {.`static`.}
  STRATEGY_COMPARABLE_MAX*: jint {.`static`.}
  STRATEGY_NUMBER_ADD*: jint {.`static`.}
  STRATEGY_NUMBER_INCREMENT_FIRST*: jint {.`static`.}
  STRATEGY_NUMBER_INCREMENT_FIRST_AND_ADD*: jint {.`static`.}
  STRATEGY_BOOLEAN_AND*: jint {.`static`.}
  STRATEGY_BOOLEAN_OR*: jint {.`static`.}
  STRATEGY_ARRAY_APPEND*: jint {.`static`.}
  STRATEGY_ARRAY_UNION*: jint {.`static`.}
  STRATEGY_ARRAY_LIST_APPEND*: jint {.`static`.}
  STRATEGY_STRING_APPEND*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[BundleMerger] {.`static`.}

