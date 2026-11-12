import jnim

jclass android.location.Location* of JVMObject:
  proc set*(location: Location)
  proc reset*()
  proc distanceTo*(dest: Location): jfloat
  proc bearingTo*(dest: Location): jfloat
  proc getProvider*(): string
  proc setProvider*(provider: string)
  proc getTime*(): jlong
  proc setTime*(timeMs: jlong)
  proc getElapsedRealtimeNanos*(): jlong
  proc getElapsedRealtimeMillis*(): jlong
  proc getElapsedRealtimeAgeMillis*(): jlong
  proc getElapsedRealtimeAgeMillis*(referenceRealtimeMs: jlong): jlong
  proc setElapsedRealtimeNanos*(elapsedRealtimeNs: jlong)
  proc getElapsedRealtimeUncertaintyNanos*(): jdouble
  proc setElapsedRealtimeUncertaintyNanos*(elapsedRealtimeUncertaintyNs: jdouble)
  proc hasElapsedRealtimeUncertaintyNanos*(): jboolean
  proc removeElapsedRealtimeUncertaintyNanos*()
  proc getLatitude*(): jdouble
  proc setLatitude*(latitudeDegrees: jdouble)
  proc getLongitude*(): jdouble
  proc setLongitude*(longitudeDegrees: jdouble)
  proc getAccuracy*(): jfloat
  proc setAccuracy*(horizontalAccuracyMeters: jfloat)
  proc hasAccuracy*(): jboolean
  proc removeAccuracy*()
  proc getAltitude*(): jdouble
  proc setAltitude*(altitudeMeters: jdouble)
  proc hasAltitude*(): jboolean
  proc removeAltitude*()
  proc getVerticalAccuracyMeters*(): jfloat
  proc setVerticalAccuracyMeters*(altitudeAccuracyMeters: jfloat)
  proc hasVerticalAccuracy*(): jboolean
  proc removeVerticalAccuracy*()
  proc getSpeed*(): jfloat
  proc setSpeed*(speedMetersPerSecond: jfloat)
  proc hasSpeed*(): jboolean
  proc removeSpeed*()
  proc getSpeedAccuracyMetersPerSecond*(): jfloat
  proc setSpeedAccuracyMetersPerSecond*(speedAccuracyMeterPerSecond: jfloat)
  proc hasSpeedAccuracy*(): jboolean
  proc removeSpeedAccuracy*()
  proc getBearing*(): jfloat
  proc setBearing*(bearingDegrees: jfloat)
  proc hasBearing*(): jboolean
  proc removeBearing*()
  proc getBearingAccuracyDegrees*(): jfloat
  proc setBearingAccuracyDegrees*(bearingAccuracyDegrees: jfloat)
  proc hasBearingAccuracy*(): jboolean
  proc removeBearingAccuracy*()
  proc getMslAltitudeMeters*(): jdouble
  proc setMslAltitudeMeters*(mslAltitudeMeters: jdouble)
  proc hasMslAltitude*(): jboolean
  proc removeMslAltitude*()
  proc getMslAltitudeAccuracyMeters*(): jfloat
  proc setMslAltitudeAccuracyMeters*(mslAltitudeAccuracyMeters: jfloat)
  proc hasMslAltitudeAccuracy*(): jboolean
  proc removeMslAltitudeAccuracy*()
  proc isFromMockProvider*(): jboolean
  proc setIsFromMockProvider*(isFromMockProvider: jboolean)
  proc isMock*(): jboolean
  proc setMock*(mock: jboolean)
  proc getExtras*(): Bundle
  proc setExtras*(extras: Bundle)
  proc isComplete*(): jboolean
  proc makeComplete*()
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc dump*(pw: Printer, prefix: string)
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc convert*(coordinate: jdouble, outputType: jint): string {.`static`.}
  proc convert*(coordinate: string): jdouble {.`static`.}
  proc distanceBetween*(startLatitude: jdouble, startLongitude: jdouble, endLatitude: jdouble, endLongitude: jdouble, results: seq[jfloat]) {.`static`.}
  FORMAT_DEGREES*: jint {.`static`.}
  FORMAT_MINUTES*: jint {.`static`.}
  FORMAT_SECONDS*: jint {.`static`.}
  EXTRA_NO_GPS_LOCATION*: string {.`static`.}
  CREATOR*: Parcelable.Creator[Location] {.`static`.}

