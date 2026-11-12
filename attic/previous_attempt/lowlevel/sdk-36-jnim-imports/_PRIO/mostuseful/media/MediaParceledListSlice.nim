import jnim

jclass android.media.MediaParceledListSlice* of BaseMediaParceledListSlice:
  proc emptyList*(): MediaParceledListSlice[T] {.`static`.}
  proc describeContents*(): jint
  CREATOR*: Parcelable.ClassLoaderCreator[MediaParceledListSlice] {.`static`.}

