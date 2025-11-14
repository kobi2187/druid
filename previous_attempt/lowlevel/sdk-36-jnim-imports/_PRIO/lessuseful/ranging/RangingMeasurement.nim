import jnim

jclass android.ranging.RangingMeasurement* of JVMObject:
  proc getMeasurement*(): jdouble
  proc getConfidence*(): jint
  proc hasRawConfidence*(): jboolean
  proc getRawConfidence*(): jdouble
  proc hasError*(): jboolean
  proc getError*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CONFIDENCE_LOW*: jint {.`static`.}
  CONFIDENCE_MEDIUM*: jint {.`static`.}
  CONFIDENCE_HIGH*: jint {.`static`.}
  CREATOR*: Creator[RangingMeasurement] {.`static`.}

jclass android.ranging.RangingMeasurement.Builder* of JVMObject:
  proc setMeasurement*(measurement: jdouble): Builder
  proc setConfidence*(confidence: jint): Builder
  proc setRawConfidence*(confidence: jdouble): Builder
  proc setError*(error: jdouble): Builder
  proc build*(): RangingMeasurement

jclass android.ranging.Builder* of JVMObject:
  proc setMeasurement*(measurement: jdouble): Builder
  proc setConfidence*(confidence: jint): Builder
  proc setRawConfidence*(confidence: jdouble): Builder
  proc setError*(error: jdouble): Builder
  proc build*(): RangingMeasurement

