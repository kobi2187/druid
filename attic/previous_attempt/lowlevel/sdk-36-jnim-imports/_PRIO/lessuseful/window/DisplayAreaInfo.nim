import jnim

jclass android.window.DisplayAreaInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc describeContents*(): jint
  token*: WindowContainerToken
  configuration*: Configuration
  displayId*: jint
  featureId*: jint
  rootDisplayAreaId*: jint
  CREATOR*: Creator[DisplayAreaInfo] {.`static`.}

