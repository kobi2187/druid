import jnim

jclass android.location.LocationResult* of JVMObject:
  proc create*(locations: List[Location]): LocationResult {.`static`.}
  proc create*(locations: Location): LocationResult {.`static`.}
  proc wrap*(locations: List[Location]): LocationResult {.`static`.}
  proc wrap*(locations: Location): LocationResult {.`static`.}
  proc validate*(): LocationResult
  proc getLastLocation*(): Location
  proc size*(): jint
  proc get*(i: jint): Location
  proc asList*(): List[Location]
  proc deepCopy*(): LocationResult
  proc asLastLocationResult*(): LocationResult
  proc filter*(predicate: Predicate[Location]): LocationResult
  proc map*(function: Function[Location, Location]): LocationResult
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Parcelable.Creator[LocationResult] {.`static`.}

jclass android.location.BadLocationException* of Exception:

