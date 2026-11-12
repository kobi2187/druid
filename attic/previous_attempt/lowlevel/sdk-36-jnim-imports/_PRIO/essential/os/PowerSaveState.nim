import jnim

jclass android.os.PowerSaveState* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  batterySaverEnabled*: jboolean
  globalBatterySaverEnabled*: jboolean
  locationMode*: jint
  soundTriggerMode*: jint
  brightnessFactor*: jfloat
  CREATOR*: Parcelable.Creator[PowerSaveState] {.`static`.}

jclass android.os.PowerSaveState.Builder* of JVMObject:
  proc setBatterySaverEnabled*(enabled: jboolean): Builder
  proc setGlobalBatterySaverEnabled*(enabled: jboolean): Builder
  proc setSoundTriggerMode*(mode: jint): Builder
  proc setLocationMode*(mode: jint): Builder
  proc setBrightnessFactor*(factor: jfloat): Builder
  proc build*(): PowerSaveState

jclass android.os.Builder* of JVMObject:
  proc setBatterySaverEnabled*(enabled: jboolean): Builder
  proc setGlobalBatterySaverEnabled*(enabled: jboolean): Builder
  proc setSoundTriggerMode*(mode: jint): Builder
  proc setLocationMode*(mode: jint): Builder
  proc setBrightnessFactor*(factor: jfloat): Builder
  proc build*(): PowerSaveState

