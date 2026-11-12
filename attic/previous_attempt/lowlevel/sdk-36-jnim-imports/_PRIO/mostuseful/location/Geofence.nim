import jnim

jclass android.location.Geofence* of JVMObject:
  proc createCircle*(latitude: jdouble, longitude: jdouble, radius: jfloat, expirationRealtimeMs: jlong): Geofence {.`static`.}
  proc getLatitude*(): jdouble
  proc getLongitude*(): jdouble
  proc getRadius*(): jfloat
  proc isExpired*(): jboolean
  proc isExpired*(referenceRealtimeMs: jlong): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Parcelable.Creator[Geofence] {.`static`.}

