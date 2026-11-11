import jnim

jclass android.view.InsetsFrameProvider* of JVMObject:
  proc getId*(): jint
  proc getIndex*(): jint
  proc getType*(): jint
  proc setSource*(source: jint): InsetsFrameProvider
  proc getSource*(): jint
  proc setFlags*(flags: jint): InsetsFrameProvider
  proc setFlags*(flags: jint, mask: jint): InsetsFrameProvider
  proc getFlags*(): jint
  proc hasFlags*(mask: jint): jboolean
  proc setInsetsSize*(insetsSize: Insets): InsetsFrameProvider
  proc getInsetsSize*(): Insets
  proc setArbitraryRectangle*(rect: Rect): InsetsFrameProvider
  proc getArbitraryRectangle*(): Rect
  proc setInsetsSizeOverrides*(insetsSizeOverrides: seq[InsetsSizeOverride]): InsetsFrameProvider
  proc getInsetsSizeOverrides*(): seq[InsetsSizeOverride]
  proc setMinimalInsetsSizeInDisplayCutoutSafe*(minimalInsetsSizeInDisplayCutoutSafe: Insets): InsetsFrameProvider
  proc getMinimalInsetsSizeInDisplayCutoutSafe*(): Insets
  proc setBoundingRects*(boundingRects: seq[Rect]): InsetsFrameProvider
  proc getBoundingRects*(): seq[Rect]
  proc describeContents*(): jint
  proc toString*(): string
  proc writeToParcel*(output:Parcel, flags: jint)
  proc idEquals*(o: InsetsFrameProvider): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  SOURCE_DISPLAY*: jint {.`static`.}
  SOURCE_CONTAINER_BOUNDS*: jint {.`static`.}
  SOURCE_FRAME*: jint {.`static`.}
  SOURCE_ARBITRARY_RECTANGLE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[InsetsFrameProvider] {.`static`.}

jclass android.view.InsetsFrameProvider.InsetsSizeOverride* of JVMObject:
  proc getWindowType*(): jint
  proc getInsetsSize*(): Insets
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  proc hashCode*(): jint

jclass android.view.InsetsSizeOverride* of JVMObject:
  proc getWindowType*(): jint
  proc getInsetsSize*(): Insets
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  proc hashCode*(): jint
  CREATOR*: Creator[InsetsSizeOverride] {.`static`.}

