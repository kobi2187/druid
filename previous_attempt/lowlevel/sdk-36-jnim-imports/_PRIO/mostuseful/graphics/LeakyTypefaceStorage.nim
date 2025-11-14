import jnim

jclass android.graphics.LeakyTypefaceStorage* of JVMObject:
  proc writeTypefaceToParcel*(typeface: Typeface, parcel: Parcel) {.`static`.}
  proc readTypefaceFromParcel*(parcel: Parcel): Typeface {.`static`.}

