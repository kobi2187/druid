import jnim

jclass android.app.PictureInPictureParams* of JVMObject:
  proc copyOnlySet*(otherArgs: PictureInPictureParams)
  proc getAspectRatioFloat*(): jfloat
  proc getAspectRatio*(): Rational
  proc hasSetAspectRatio*(): jboolean
  proc getExpandedAspectRatioFloat*(): jfloat
  proc getExpandedAspectRatio*(): Rational
  proc hasSetExpandedAspectRatio*(): jboolean
  proc getActions*(): List[RemoteAction]
  proc hasSetActions*(): jboolean
  proc getCloseAction*(): RemoteAction
  proc hasSetCloseAction*(): jboolean
  proc truncateActions*(size: jint)
  proc getSourceRectHint*(): Rect
  proc hasSourceBoundsHint*(): jboolean
  proc isAutoEnterEnabled*(): jboolean
  proc isSeamlessResizeEnabled*(): jboolean
  proc hasSetTitle*(): jboolean
  proc getTitle*(): CharSequence
  proc hasSetSubtitle*(): jboolean
  proc getSubtitle*(): CharSequence
  proc isLaunchIntoPip*(): jboolean
  proc empty*(): jboolean
  proc isSameAspectRatio*(bounds: Rect, aspectRatio: Rational): jboolean {.`static`.}
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[PictureInPictureParams] {.`static`.}

jclass android.app.PictureInPictureParams.Builder* of JVMObject:
  proc setAspectRatio*(aspectRatio: Rational): Builder
  proc setExpandedAspectRatio*(expandedAspectRatio: Rational): Builder
  proc setActions*(actions: List[RemoteAction]): Builder
  proc setCloseAction*(action: RemoteAction): Builder
  proc setSourceRectHint*(launchBounds: Rect): Builder
  proc setAutoEnterEnabled*(autoEnterEnabled: jboolean): Builder
  proc setSeamlessResizeEnabled*(seamlessResizeEnabled: jboolean): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setSubtitle*(subtitle: CharSequence): Builder
  proc build*(): PictureInPictureParams

jclass android.app.Builder* of JVMObject:
  proc setAspectRatio*(aspectRatio: Rational): Builder
  proc setExpandedAspectRatio*(expandedAspectRatio: Rational): Builder
  proc setActions*(actions: List[RemoteAction]): Builder
  proc setCloseAction*(action: RemoteAction): Builder
  proc setSourceRectHint*(launchBounds: Rect): Builder
  proc setAutoEnterEnabled*(autoEnterEnabled: jboolean): Builder
  proc setSeamlessResizeEnabled*(seamlessResizeEnabled: jboolean): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setSubtitle*(subtitle: CharSequence): Builder
  proc build*(): PictureInPictureParams

