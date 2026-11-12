import jnim

jclass android.view.InsetsState* of JVMObject:
  proc calculateInsets*(frame: Rect, ignoringVisibilityState: InsetsState, isScreenRound: jboolean, legacySoftInputMode: jint, legacyWindowFlags: jint, legacySystemUiFlags: jint, windowType: jint, activityType: jint, idSideMap: SparseIntArray): WindowInsets
  proc calculateInsets*(frame: Rect, types: jint, ignoreVisibility: jboolean): Insets
  proc calculateInsets*(frame: Rect, types: jint, requestedVisibleTypes: jint): Insets
  proc calculateVisibleInsets*(frame: Rect, windowType: jint, activityType: jint, softInputMode: jint, windowFlags: jint): Insets
  proc calculateUncontrollableInsetsFromFrame*(frame: Rect): jint
  proc getOrCreateSource*(id: jint, type: jint): InsetsSource
  proc peekSource*(id: jint): InsetsSource
  proc sourceIdAt*(index: jint): jint
  proc sourceAt*(index: jint): InsetsSource
  proc sourceSize*(): jint
  proc isSourceOrDefaultVisible*(id: jint, type: jint): jboolean
  proc setDisplayFrame*(frame: Rect)
  proc getDisplayFrame*(): Rect
  proc setDisplayCutout*(cutout: DisplayCutout)
  proc getDisplayCutout*(): DisplayCutout
  proc getDisplayCutoutSafe*(outBounds: Rect)
  proc setRoundedCorners*(roundedCorners: RoundedCorners)
  proc getRoundedCorners*(): RoundedCorners
  proc setRoundedCornerFrame*(frame: Rect)
  proc setPrivacyIndicatorBounds*(bounds: PrivacyIndicatorBounds)
  proc getPrivacyIndicatorBounds*(): PrivacyIndicatorBounds
  proc setDisplayShape*(displayShape: DisplayShape)
  proc getDisplayShape*(): DisplayShape
  proc removeSource*(id: jint)
  proc removeSourceAt*(index: jint)
  proc setSourceVisible*(id: jint, visible: jboolean)
  proc scale*(scale: jfloat)
  proc getSeq*(): jint
  proc setSeq*(seq: jint)
  proc set*(other: InsetsState)
  proc set*(other: InsetsState, copySources: jboolean)
  proc set*(other: InsetsState, types: jint)
  proc addSource*(source: InsetsSource)
  proc clearsCompatInsets*(windowType: jint, windowFlags: jint, activityType: jint, forceConsumingTypes: jint): jboolean {.`static`.}
  proc dump*(prefix: string, pw: PrintWriter)
  proc equals*(o: JObject): jboolean
  proc equals*(o: JObject, excludesCaptionBar: jboolean, excludesInvisibleIme: jboolean): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(in: Parcel): SparseArray[InsetsSource]
  proc toString*(): string
  proc traverse*(state1: InsetsState, state2: InsetsState, cb: OnTraverseCallbacks) {.`static`.}
  CREATOR*: Creator[InsetsState] {.`static`.}

