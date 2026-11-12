import jnim

jclass android.location.GnssMeasurementCorrections* of JVMObject:
  proc getLatitudeDegrees*(): jdouble
  proc getLongitudeDegrees*(): jdouble
  proc getAltitudeMeters*(): jdouble
  proc getHorizontalPositionUncertaintyMeters*(): jdouble
  proc getVerticalPositionUncertaintyMeters*(): jdouble
  proc getToaGpsNanosecondsOfWeek*(): jlong
  proc getSingleSatelliteCorrectionList*(): List[GnssSingleSatCorrection]
  proc hasEnvironmentBearing*(): jboolean
  proc getEnvironmentBearingDegrees*(): jfloat
  proc getEnvironmentBearingUncertaintyDegrees*(): jfloat
  proc describeContents*(): jint
  proc toString*(): string
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CREATOR*: Creator[GnssMeasurementCorrections] {.`static`.}

jclass android.location.GnssMeasurementCorrections.Builder* of JVMObject:
  proc setLatitudeDegrees*(latitudeDegrees: jdouble): Builder
  proc setLongitudeDegrees*(longitudeDegrees: jdouble): Builder
  proc setAltitudeMeters*(altitudeMeters: jdouble): Builder
  proc setHorizontalPositionUncertaintyMeters*(horizontalPositionUncertaintyMeters: jdouble): Builder
  proc setVerticalPositionUncertaintyMeters*(verticalPositionUncertaintyMeters: jdouble): Builder
  proc setToaGpsNanosecondsOfWeek*(toaGpsNanosecondsOfWeek: jlong): Builder
  proc setSingleSatelliteCorrectionList*(singleSatCorrectionList: List[GnssSingleSatCorrection]): Builder
  proc setEnvironmentBearingDegrees*(environmentBearingDegrees: jfloat): Builder
  proc setEnvironmentBearingUncertaintyDegrees*(environmentBearingUncertaintyDegrees: jfloat): Builder
  proc build*(): GnssMeasurementCorrections

jclass android.location.Builder* of JVMObject:
  proc setLatitudeDegrees*(latitudeDegrees: jdouble): Builder
  proc setLongitudeDegrees*(longitudeDegrees: jdouble): Builder
  proc setAltitudeMeters*(altitudeMeters: jdouble): Builder
  proc setHorizontalPositionUncertaintyMeters*(horizontalPositionUncertaintyMeters: jdouble): Builder
  proc setVerticalPositionUncertaintyMeters*(verticalPositionUncertaintyMeters: jdouble): Builder
  proc setToaGpsNanosecondsOfWeek*(toaGpsNanosecondsOfWeek: jlong): Builder
  proc setSingleSatelliteCorrectionList*(singleSatCorrectionList: List[GnssSingleSatCorrection]): Builder
  proc setEnvironmentBearingDegrees*(environmentBearingDegrees: jfloat): Builder
  proc setEnvironmentBearingUncertaintyDegrees*(environmentBearingUncertaintyDegrees: jfloat): Builder
  proc build*(): GnssMeasurementCorrections

