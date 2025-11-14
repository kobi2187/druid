import jnim

jclass android.location.GpsStatus* of JVMObject:
  proc create*(gnssStatus: GnssStatus, timeToFirstFix: jint): GpsStatus {.`static`.}
  proc getTimeToFirstFix*(): jint
  proc getSatellites*(): Iterable[GpsSatellite]
  proc getMaxSatellites*(): jint
  GPS_EVENT_STARTED*: jint {.`static`.}
  GPS_EVENT_STOPPED*: jint {.`static`.}
  GPS_EVENT_FIRST_FIX*: jint {.`static`.}
  GPS_EVENT_SATELLITE_STATUS*: jint {.`static`.}


