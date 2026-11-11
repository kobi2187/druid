import jnim

jclass android.location.GnssMeasurementsEvent* of JVMObject:
  proc getClock*(): GnssClock
  proc getMeasurements*(): Collection[GnssMeasurement]
  proc getGnssAutomaticGainControls*(): Collection[GnssAutomaticGainControl]
  proc isFullTracking*(): jboolean
  proc hasIsFullTracking*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GnssMeasurementsEvent] {.`static`.}

jclass android.location.GnssMeasurementsEvent.Callback* of JVMObject:
  proc onGnssMeasurementsReceived*(eventArgs: GnssMeasurementsEvent)
  proc onStatusChanged*(status: jint)

jclass android.location.GnssMeasurementsEvent.Builder* of JVMObject:
  proc setClock*(clock: GnssClock): Builder
  proc setMeasurements*(measurements: GnssMeasurement): Builder
  proc setMeasurements*(measurements: Collection[GnssMeasurement]): Builder
  proc setGnssAutomaticGainControls*(agcs: GnssAutomaticGainControl): Builder
  proc setGnssAutomaticGainControls*(agcs: Collection[GnssAutomaticGainControl]): Builder
  proc setIsFullTracking*(isFullTracking: jboolean): Builder
  proc clearIsFullTracking*(): Builder
  proc build*(): GnssMeasurementsEvent

jclass android.location.Callback* of JVMObject:
  proc onGnssMeasurementsReceived*(eventArgs: GnssMeasurementsEvent)
  proc onStatusChanged*(status: jint)
  STATUS_NOT_SUPPORTED*: jint {.`static`.}
  STATUS_READY*: jint {.`static`.}
  STATUS_LOCATION_DISABLED*: jint {.`static`.}
  STATUS_NOT_ALLOWED*: jint {.`static`.}

jclass android.location.Builder* of JVMObject:
  proc setClock*(clock: GnssClock): Builder
  proc setMeasurements*(measurements: GnssMeasurement): Builder
  proc setMeasurements*(measurements: Collection[GnssMeasurement]): Builder
  proc setGnssAutomaticGainControls*(agcs: GnssAutomaticGainControl): Builder
  proc setGnssAutomaticGainControls*(agcs: Collection[GnssAutomaticGainControl]): Builder
  proc setIsFullTracking*(isFullTracking: jboolean): Builder
  proc clearIsFullTracking*(): Builder
  proc build*(): GnssMeasurementsEvent

