import jnim

jclass android.ranging.RangingData* of JVMObject:
  proc getRangingTechnology*(): jint
  proc getDistance*(): RangingMeasurement
  proc getAzimuth*(): RangingMeasurement
  proc getElevation*(): RangingMeasurement
  proc hasRssi*(): jboolean
  proc getRssi*(): jint
  proc hasDelaySpread*(): jboolean
  proc getDelaySpreadMeters*(): jdouble
  proc hasDetectedAttackLevel*(): jboolean
  proc getDetectedAttackLevel*(): jbyte
  proc hasVelocity*(): jboolean
  proc getVelocityMetersPerSec*(): jdouble
  proc getTimestampMillis*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[RangingData] {.`static`.}

jclass android.ranging.RangingData.Builder* of JVMObject:
  proc setRangingTechnology*(rangingTechnology: jint): Builder
  proc setDistance*(distance: RangingMeasurement): Builder
  proc setAzimuth*(azimuth: RangingMeasurement): Builder
  proc setElevation*(elevation: RangingMeasurement): Builder
  proc setRssi*(rssi: jint): Builder
  proc setTimestampMillis*(timestamp: jlong): Builder
  proc setDelaySpreadMeters*(delaySpread: jdouble): Builder
  proc setDetectedAttackLevel*(detectedAttackLevel: jbyte): Builder
  proc setVelocityMetersPerSec*(velocity: jdouble): Builder
  proc build*(): RangingData

jclass android.ranging.Builder* of JVMObject:
  proc setRangingTechnology*(rangingTechnology: jint): Builder
  proc setDistance*(distance: RangingMeasurement): Builder
  proc setAzimuth*(azimuth: RangingMeasurement): Builder
  proc setElevation*(elevation: RangingMeasurement): Builder
  proc setRssi*(rssi: jint): Builder
  proc setTimestampMillis*(timestamp: jlong): Builder
  proc setDelaySpreadMeters*(delaySpread: jdouble): Builder
  proc setDetectedAttackLevel*(detectedAttackLevel: jbyte): Builder
  proc setVelocityMetersPerSec*(velocity: jdouble): Builder
  proc build*(): RangingData

