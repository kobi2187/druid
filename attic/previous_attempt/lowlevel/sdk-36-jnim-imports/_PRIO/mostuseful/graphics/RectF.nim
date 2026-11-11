import jnim

jclass android.graphics.RectF* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc toShortString*(): string
  proc toShortString*(sb: StringBuilder): string
  proc printShortString*(pw: PrintWriter)
  proc isEmpty*(): jboolean
  proc width*(): jfloat
  proc height*(): jfloat
  proc centerX*(): jfloat
  proc centerY*(): jfloat
  proc setEmpty*()
  proc set*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat)
  proc set*(src: RectF)
  proc set*(src: Rect)
  proc offset*(dx: jfloat, dy: jfloat)
  proc offsetTo*(newLeft: jfloat, newTop: jfloat)
  proc inset*(dx: jfloat, dy: jfloat)
  proc contains*(x: jfloat, y: jfloat): jboolean
  proc contains*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat): jboolean
  proc contains*(r: RectF): jboolean
  proc intersect*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat): jboolean
  proc intersect*(r: RectF): jboolean
  proc setIntersect*(a: RectF, b: RectF): jboolean
  proc intersects*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat): jboolean
  proc intersects*(a: RectF, b: RectF): jboolean {.`static`.}
  proc round*(dst: Rect)
  proc roundOut*(dst: Rect)
  proc union*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat)
  proc union*(r: RectF)
  proc union*(x: jfloat, y: jfloat)
  proc sort*()
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  proc scale*(scale: jfloat)
  left*: jfloat
  top*: jfloat
  right*: jfloat
  bottom*: jfloat
  CREATOR*: Parcelable.Creator[RectF] {.`static`.}

