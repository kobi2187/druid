import jnim

jclass android.graphics.Point* of JVMObject:
  proc set*(x: jint, y: jint)
  proc set*(src: Point)
  proc negate*()
  proc offset*(dx: jint, dy: jint)
  proc equals*(x: jint, y: jint): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc flattenToString*(): string
  proc unflattenFromString*(s: string): Point {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  x*: jint
  y*: jint
  CREATOR*: Parcelable.Creator[Point] {.`static`.}

