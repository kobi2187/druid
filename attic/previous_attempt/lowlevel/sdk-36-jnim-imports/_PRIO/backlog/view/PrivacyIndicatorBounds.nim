import jnim

jclass android.view.PrivacyIndicatorBounds* of JVMObject:
  proc updateStaticBounds*(staticPositions: seq[Rect]): PrivacyIndicatorBounds
  proc updateBoundsForRotation*(bounds: Rect, rotation: jint): PrivacyIndicatorBounds
  proc inset*(insetLeft: jint, insetTop: jint, insetRight: jint, insetBottom: jint): PrivacyIndicatorBounds
  proc rotate*(rotation: jint): PrivacyIndicatorBounds
  proc scale*(scale: jfloat): PrivacyIndicatorBounds
  proc getStaticPrivacyIndicatorBounds*(): Rect
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[PrivacyIndicatorBounds] {.`static`.}

