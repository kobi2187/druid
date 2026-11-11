import jnim

jclass android.view.RoundedCorners* of JVMObject:
  proc fromResources*(res: Resources, displayUniqueId: string, physicalDisplayWidth: jint, physicalDisplayHeight: jint, displayWidth: jint, displayHeight: jint): RoundedCorners {.`static`.}
  proc fromRadii*(radii: Pair[Integer, Integer], displayWidth: jint, displayHeight: jint): RoundedCorners {.`static`.}
  proc getRoundedCornerRadius*(res: Resources, displayUniqueId: string): jint {.`static`.}
  proc getRoundedCornerTopRadius*(res: Resources, displayUniqueId: string): jint {.`static`.}
  proc getRoundedCornerBottomRadius*(res: Resources, displayUniqueId: string): jint {.`static`.}
  proc getRoundedCornerRadiusAdjustment*(res: Resources, displayUniqueId: string): jint {.`static`.}
  proc getRoundedCornerRadiusTopAdjustment*(res: Resources, displayUniqueId: string): jint {.`static`.}
  proc getRoundedCornerRadiusBottomAdjustment*(res: Resources, displayUniqueId: string): jint {.`static`.}
  proc getBuiltInDisplayIsRound*(res: Resources, displayUniqueId: string): jboolean {.`static`.}
  proc insetWithFrame*(frame: Rect, roundedCornerFrame: Rect): RoundedCorners
  proc inset*(insetLeft: jint, insetTop: jint, insetRight: jint, insetBottom: jint): RoundedCorners
  proc getRoundedCorner*(position: jint): RoundedCorner
  proc setRoundedCorner*(position: jint, roundedCorner: RoundedCorner)
  proc getAllRoundedCorners*(): seq[RoundedCorner]
  proc scale*(scale: jfloat): RoundedCorners
  proc rotate*(rotation: jint, initialDisplayWidth: jint, initialDisplayHeight: jint): RoundedCorners
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  NO_ROUNDED_CORNERS*: RoundedCorners {.`static`.}
  ROUNDED_CORNER_POSITION_LENGTH*: jint {.`static`.}
  mRoundedCorners*: RoundedCorner
  CREATOR*: Creator[RoundedCorners] {.`static`.}

