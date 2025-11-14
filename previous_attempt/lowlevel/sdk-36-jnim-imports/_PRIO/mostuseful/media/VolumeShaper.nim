import jnim

jclass android.media.VolumeShaper* of JVMObject:
  proc apply*(operation: Operation)
  proc replace*(configuration: Configuration, operation: Operation, join: jboolean)
  proc getVolume*(): jfloat
  proc close*()

jclass android.media.VolumeShaper.Configuration* of JVMObject:
  proc getMaximumCurvePoints*(): jint {.`static`.}
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toParcelable*(): VolumeShaperConfiguration
  proc fromParcelable*(parcelable: VolumeShaperConfiguration): Configuration {.`static`.}
  proc getType*(): jint
  proc getId*(): jint
  proc getInterpolatorType*(): jint
  proc getOptionFlags*(): jint
  proc getDuration*(): jlong
  proc getTimes*(): seq[jfloat]
  proc getVolumes*(): seq[jfloat]

jclass android.media.VolumeShaper.Operation* of JVMObject:
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toParcelable*(): VolumeShaperOperation
  proc fromParcelable*(parcelable: VolumeShaperOperation): Operation {.`static`.}

jclass android.media.VolumeShaper.State* of JVMObject:
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toParcelable*(): VolumeShaperState
  proc fromParcelable*(p: VolumeShaperState): State {.`static`.}
  proc getVolume*(): jfloat
  proc getXOffset*(): jfloat

jclass android.media.Configuration* of JVMObject:
  proc getMaximumCurvePoints*(): jint {.`static`.}
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toParcelable*(): VolumeShaperConfiguration
  proc fromParcelable*(parcelable: VolumeShaperConfiguration): Configuration {.`static`.}
  proc getType*(): jint
  proc getId*(): jint
  proc getInterpolatorType*(): jint
  proc getOptionFlags*(): jint
  proc getDuration*(): jlong
  proc getTimes*(): seq[jfloat]
  proc getVolumes*(): seq[jfloat]
  INTERPOLATOR_TYPE_STEP*: jint {.`static`.}
  INTERPOLATOR_TYPE_LINEAR*: jint {.`static`.}
  INTERPOLATOR_TYPE_CUBIC*: jint {.`static`.}
  INTERPOLATOR_TYPE_CUBIC_MONOTONIC*: jint {.`static`.}
  OPTION_FLAG_VOLUME_IN_DBFS*: jint {.`static`.}
  OPTION_FLAG_CLOCK_TIME*: jint {.`static`.}
  LINEAR_RAMP*: Configuration {.`static`.}
  CUBIC_RAMP*: Configuration {.`static`.}
  SINE_RAMP*: Configuration {.`static`.}
  SCURVE_RAMP*: Configuration {.`static`.}
  CREATOR*: Parcelable.Creator[VolumeShaper.Configuration] {.`static`.}

jclass android.media.Configuration.Builder* of JVMObject:
  proc setId*(id: jint): Builder
  proc setInterpolatorType*(interpolatorType: jint): Builder
  proc setOptionFlags*(optionFlags: jint): Builder
  proc setDuration*(durationMillis: jlong): Builder
  proc setCurve*(times: seq[jfloat], volumes: seq[jfloat]): Builder
  proc reflectTimes*(): Builder
  proc invertVolumes*(): Builder
  proc scaleToEndVolume*(volume: jfloat): Builder
  proc scaleToStartVolume*(volume: jfloat): Builder
  proc build*(): Configuration

jclass android.media.Builder* of JVMObject:
  proc setId*(id: jint): Builder
  proc setInterpolatorType*(interpolatorType: jint): Builder
  proc setOptionFlags*(optionFlags: jint): Builder
  proc setDuration*(durationMillis: jlong): Builder
  proc setCurve*(times: seq[jfloat], volumes: seq[jfloat]): Builder
  proc reflectTimes*(): Builder
  proc invertVolumes*(): Builder
  proc scaleToEndVolume*(volume: jfloat): Builder
  proc scaleToStartVolume*(volume: jfloat): Builder
  proc build*(): Configuration

jclass android.media.Operation* of JVMObject:
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toParcelable*(): VolumeShaperOperation
  proc fromParcelable*(parcelable: VolumeShaperOperation): Operation {.`static`.}
  PLAY*: Operation {.`static`.}
  REVERSE*: Operation {.`static`.}
  CREATOR*: Parcelable.Creator[VolumeShaper.Operation] {.`static`.}

jclass android.media.Operation.Builder* of JVMObject:
  proc replace*(id: jint, join: jboolean): Builder
  proc defer*(): Builder
  proc terminate*(): Builder
  proc reverse*(): Builder
  proc createIfNeeded*(): Builder
  proc setXOffset*(xOffset: jfloat): Builder
  proc build*(): Operation

jclass android.media.Builder* of JVMObject:
  proc replace*(id: jint, join: jboolean): Builder
  proc defer*(): Builder
  proc terminate*(): Builder
  proc reverse*(): Builder
  proc createIfNeeded*(): Builder
  proc setXOffset*(xOffset: jfloat): Builder
  proc build*(): Operation

jclass android.media.State* of JVMObject:
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toParcelable*(): VolumeShaperState
  proc fromParcelable*(p: VolumeShaperState): State {.`static`.}
  proc getVolume*(): jfloat
  proc getXOffset*(): jfloat
  CREATOR*: Parcelable.Creator[VolumeShaper.State] {.`static`.}

