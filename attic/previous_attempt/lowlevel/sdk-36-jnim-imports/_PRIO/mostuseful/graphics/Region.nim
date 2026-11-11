import jnim

jclass android.graphics.Region* of JVMObject:
  proc setEmpty*()
  proc set*(region: Region): jboolean
  proc set*(r: Rect): jboolean
  proc set*(left: jint, top: jint, right: jint, bottom: jint): jboolean
  proc setPath*(path: Path, clip: Region): jboolean
  proc isEmpty*(): jboolean
  proc isRect*(): jboolean
  proc isComplex*(): jboolean
  proc getBounds*(): Rect
  proc getBounds*(r: Rect): jboolean
  proc getBoundaryPath*(): Path
  proc getBoundaryPath*(path: Path): jboolean
  proc contains*(x: jint, y: jint): jboolean
  proc quickContains*(r: Rect): jboolean
  proc quickContains*(left: jint, top: jint, right: jint, bottom: jint): jboolean
  proc quickReject*(r: Rect): jboolean
  proc quickReject*(left: jint, top: jint, right: jint, bottom: jint): jboolean
  proc quickReject*(rgn: Region): jboolean
  proc translate*(dx: jint, dy: jint)
  proc translate*(dx: jint, dy: jint, dst: Region)
  proc scale*(scale: jfloat)
  proc scale*(scale: jfloat, dst: Region)
  proc union*(r: Rect): jboolean
  proc op*(r: Rect, op: Op): jboolean
  proc op*(left: jint, top: jint, right: jint, bottom: jint, op: Op): jboolean
  proc op*(region: Region, op: Op): jboolean
  proc op*(rect: Rect, region: Region, op: Op): jboolean
  proc op*(region1: Region, region2: Region, op: Op): jboolean
  proc toString*(): string
  proc obtain*(): Region {.`static`.}
  proc obtain*(other: Region): Region {.`static`.}
  proc recycle*()
  proc describeContents*(): jint
  proc writeToParcel*(p: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  mNativeRegion*: jlong
  CREATOR*: Parcelable.Creator[Region] {.`static`.}

