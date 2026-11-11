import jnim

jclass android.location.GpsMeasurementsEvent* of JVMObject:
  proc getClock*(): GpsClock
  proc getMeasurements*(): Collection[GpsMeasurement]
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  STATUS_NOT_SUPPORTED*: jint {.`static`.}
  STATUS_READY*: jint {.`static`.}
  STATUS_GPS_LOCATION_DISABLED*: jint {.`static`.}
  CREATOR*: Creator[GpsMeasurementsEvent] {.`static`.}

