import jnim

jclass android.graphics.Rect* of JVMObject:
  proc copyOrNull*(r: Rect): Rect {.`static`.}
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc toShortString*(): string
  proc toShortString*(sb: StringBuilder): string
  proc flattenToString*(): string
  proc unflattenFromString*(str: string): Rect {.`static`.}
  proc printShortString*(pw: PrintWriter)
  proc dumpDebug*(protoOutputStream: ProtoOutputStream, fieldId: jlong)
  proc readFromProto*(proto: ProtoInputStream, fieldId: jlong)
  proc isEmpty*(): jboolean
  proc isValid*(): jboolean
  proc width*(): jint
  proc height*(): jint
  proc centerX*(): jint
  proc centerY*(): jint
  proc exactCenterX*(): jfloat
  proc exactCenterY*(): jfloat
  proc setEmpty*()
  proc set*(left: jint, top: jint, right: jint, bottom: jint)
  proc set*(src: Rect)
  proc offset*(dx: jint, dy: jint)
  proc offsetTo*(newLeft: jint, newTop: jint)
  proc inset*(dx: jint, dy: jint)
  proc inset*(insets: Rect)
  proc inset*(insets: Insets)
  proc inset*(left: jint, top: jint, right: jint, bottom: jint)
  proc contains*(x: jint, y: jint): jboolean
  proc contains*(left: jint, top: jint, right: jint, bottom: jint): jboolean
  proc contains*(r: Rect): jboolean
  proc intersect*(left: jint, top: jint, right: jint, bottom: jint): jboolean
  proc intersect*(r: Rect): jboolean
  proc intersectUnchecked*(other: Rect)
  proc setIntersect*(a: Rect, b: Rect): jboolean
  proc intersects*(left: jint, top: jint, right: jint, bottom: jint): jboolean
  proc intersects*(a: Rect, b: Rect): jboolean {.`static`.}
  proc union*(left: jint, top: jint, right: jint, bottom: jint)
  proc union*(r: Rect)
  proc union*(x: jint, y: jint)
  proc sort*()
  proc splitVertically*(splits: Rect)
  proc splitHorizontally*(outSplits: Rect)
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  proc scale*(scale: jfloat)
  left*: jint
  top*: jint
  right*: jint
  bottom*: jint
  CREATOR*: Parcelable.Creator[Rect] {.`static`.}

