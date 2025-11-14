import jnim

jclass android.location.CorrelationVector* of JVMObject:
  proc getSamplingWidthMeters*(): jdouble
  proc getSamplingStartMeters*(): jdouble
  proc getFrequencyOffsetMetersPerSecond*(): jdouble
  proc getMagnitude*(): seq[jint]
  proc describeContents*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(object: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Parcelable.Creator[CorrelationVector] {.`static`.}

jclass android.location.CorrelationVector.Builder* of JVMObject:
  proc setSamplingWidthMeters*(samplingWidthMeters: jdouble): Builder
  proc setSamplingStartMeters*(samplingStartMeters: jdouble): Builder
  proc setFrequencyOffsetMetersPerSecond*(frequencyOffsetMetersPerSecond: jdouble): Builder
  proc setMagnitude*(magnitude: seq[jint]): Builder
  proc build*(): CorrelationVector

jclass android.location.Builder* of JVMObject:
  proc setSamplingWidthMeters*(samplingWidthMeters: jdouble): Builder
  proc setSamplingStartMeters*(samplingStartMeters: jdouble): Builder
  proc setFrequencyOffsetMetersPerSecond*(frequencyOffsetMetersPerSecond: jdouble): Builder
  proc setMagnitude*(magnitude: seq[jint]): Builder
  proc build*(): CorrelationVector

