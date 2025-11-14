import jnim

jclass android.uwb.RangingReport* of JVMObject:
  proc getMeasurements*(): List[RangingMeasurement]
  proc getRangingReportMetadata*(): PersistableBundle
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[RangingReport] {.`static`.}

jclass android.uwb.RangingReport.Builder* of JVMObject:
  proc addMeasurement*(rangingMeasurement: RangingMeasurement): Builder
  proc addMeasurements*(rangingMeasurements: List[RangingMeasurement]): Builder
  proc addRangingReportMetadata*(rangingReportMetadata: PersistableBundle): Builder
  proc build*(): RangingReport

jclass android.uwb.Builder* of JVMObject:
  proc addMeasurement*(rangingMeasurement: RangingMeasurement): Builder
  proc addMeasurements*(rangingMeasurements: List[RangingMeasurement]): Builder
  proc addRangingReportMetadata*(rangingReportMetadata: PersistableBundle): Builder
  proc build*(): RangingReport

