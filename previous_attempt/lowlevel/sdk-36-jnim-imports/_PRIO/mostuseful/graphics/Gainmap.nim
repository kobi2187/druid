import jnim

jclass android.graphics.Gainmap* of JVMObject:
  proc asShared*(): Gainmap
  proc getGainmapContents*(): Bitmap
  proc setGainmapContents*(bitmap: Bitmap)
  proc setRatioMin*(r: jfloat, g: jfloat, b: jfloat)
  proc getRatioMin*(): seq[jfloat]
  proc setRatioMax*(r: jfloat, g: jfloat, b: jfloat)
  proc getRatioMax*(): seq[jfloat]
  proc setGamma*(r: jfloat, g: jfloat, b: jfloat)
  proc getGamma*(): seq[jfloat]
  proc setEpsilonSdr*(r: jfloat, g: jfloat, b: jfloat)
  proc getEpsilonSdr*(): seq[jfloat]
  proc setEpsilonHdr*(r: jfloat, g: jfloat, b: jfloat)
  proc getEpsilonHdr*(): seq[jfloat]
  proc setDisplayRatioForFullHdr*(max: jfloat)
  proc getDisplayRatioForFullHdr*(): jfloat
  proc setMinDisplayRatioForHdrTransition*(min: jfloat)
  proc getMinDisplayRatioForHdrTransition*(): jfloat
  proc setAlternativeImagePrimaries*(colorSpace: ColorSpace)
  proc getAlternativeImagePrimaries*(): ColorSpace
  proc setGainmapDirection*(direction: jint)
  proc getGainmapDirection*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  GAINMAP_DIRECTION_SDR_TO_HDR*: jint {.`static`.}
  GAINMAP_DIRECTION_HDR_TO_SDR*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[Gainmap] {.`static`.}

