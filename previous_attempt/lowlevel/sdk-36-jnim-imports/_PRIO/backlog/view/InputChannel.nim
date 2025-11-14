import jnim

jclass android.view.InputChannel* of JVMObject:
  proc openInputChannelPair*(name: string): seq[InputChannel] {.`static`.}
  proc getName*(): string
  proc dispose*()
  proc release*()
  proc copyTo*(outParameter: InputChannel)
  proc dup*(): InputChannel
  proc describeContents*(): jint
  proc readFromParcel*(in: Parcel)
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  proc getToken*(): IBinder
  CREATOR*: Parcelable.Creator[InputChannel] {.`static`.}

