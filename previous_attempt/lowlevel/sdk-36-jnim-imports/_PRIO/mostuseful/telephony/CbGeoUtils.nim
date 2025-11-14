import jnim

jclass android.telephony.CbGeoUtils* of JVMObject:
  proc parseGeometriesFromString*(str: string): List[Geometry] {.`static`.}
  proc encodeGeometriesToString*(geometries: List[Geometry]): string {.`static`.}
  proc parseLatLngFromString*(str: string): LatLng {.`static`.}
  proc sign*(value: jdouble): jint {.`static`.}
  EPS*: jdouble {.`static`.}
  EARTH_RADIUS_METER*: jint {.`static`.}
  GEO_FENCING_MAXIMUM_WAIT_TIME*: jint {.`static`.}
  GEOMETRY_TYPE_POLYGON*: jint {.`static`.}
  GEOMETRY_TYPE_CIRCLE*: jint {.`static`.}

jclass android.telephony.CbGeoUtils.LatLng* of JVMObject:
  proc subtract*(p: LatLng): LatLng
  proc distance*(p: LatLng): jdouble
  proc toString*(): string
  proc equals*(o: JObject): jboolean

jclass android.telephony.CbGeoUtils.Polygon* of JVMObject:
  proc getVertices*(): List[LatLng]
  proc contains*(latLng: LatLng): jboolean
  proc toString*(): string
  proc equals*(o: JObject): jboolean

jclass android.telephony.CbGeoUtils.Circle* of JVMObject:
  proc getCenter*(): LatLng
  proc getRadius*(): jdouble
  proc contains*(latLng: LatLng): jboolean
  proc toString*(): string
  proc equals*(o: JObject): jboolean


jclass android.telephony.LatLng* of JVMObject:
  proc subtract*(p: LatLng): LatLng
  proc distance*(p: LatLng): jdouble
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  lat*: jdouble
  lng*: jdouble

jclass android.telephony.Polygon* of JVMObject:
  proc getVertices*(): List[LatLng]
  proc contains*(latLng: LatLng): jboolean
  proc toString*(): string
  proc equals*(o: JObject): jboolean

jclass android.telephony.Circle* of JVMObject:
  proc getCenter*(): LatLng
  proc getRadius*(): jdouble
  proc contains*(latLng: LatLng): jboolean
  proc toString*(): string
  proc equals*(o: JObject): jboolean

