import jnim

jclass android.app.Vr2dDisplayProperties* of JVMObject:
  proc hashCode*(): jint
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: PrintWriter, prefix: string)
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getDpi*(): jint
  proc getAddedFlags*(): jint
  proc getRemovedFlags*(): jint
  FLAG_VIRTUAL_DISPLAY_ENABLED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[Vr2dDisplayProperties] {.`static`.}

jclass android.app.Vr2dDisplayProperties.Builder* of JVMObject:
  proc setDimensions*(width: jint, height: jint, dpi: jint): Builder
  proc setEnabled*(enabled: jboolean): Builder
  proc addFlags*(flags: jint): Builder
  proc removeFlags*(flags: jint): Builder
  proc build*(): Vr2dDisplayProperties

jclass android.app.Builder* of JVMObject:
  proc setDimensions*(width: jint, height: jint, dpi: jint): Builder
  proc setEnabled*(enabled: jboolean): Builder
  proc addFlags*(flags: jint): Builder
  proc removeFlags*(flags: jint): Builder
  proc build*(): Vr2dDisplayProperties

