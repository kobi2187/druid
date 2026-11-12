import jnim

jclass android.location.Geocoder* of JVMObject:
  proc isPresent*(): jboolean {.`static`.}
  proc getFromLocation*(latitude: jdouble, longitude: jdouble, maxResults: jint): List[Address]
  proc getFromLocation*(latitude: jdouble, longitude: jdouble, maxResults: jint, listener: GeocodeListener)
  proc getFromLocationName*(locationName: string, maxResults: jint): List[Address]
  proc getFromLocationName*(locationName: string, maxResults: jint, listener: GeocodeListener)
  proc getFromLocationName*(locationName: string, maxResults: jint, lowerLeftLatitude: jdouble, lowerLeftLongitude: jdouble, upperRightLatitude: jdouble, upperRightLongitude: jdouble): List[Address]
  proc getFromLocationName*(locationName: string, maxResults: jint, lowerLeftLatitude: jdouble, lowerLeftLongitude: jdouble, upperRightLatitude: jdouble, upperRightLongitude: jdouble, listener: GeocodeListener)

