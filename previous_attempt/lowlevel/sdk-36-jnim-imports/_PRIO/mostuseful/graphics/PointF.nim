import jnim

jclass android.graphics.PointF* of JVMObject:
  proc set*(x: jfloat, y: jfloat)
  proc set*(p: PointF)
  proc negate*()
  proc offset*(dx: jfloat, dy: jfloat)
  proc equals*(x: jfloat, y: jfloat): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc length*(): jfloat
  proc length*(x: jfloat, y: jfloat): jfloat {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  x*: jfloat
  y*: jfloat
  CREATOR*: Parcelable.Creator[PointF] {.`static`.}

