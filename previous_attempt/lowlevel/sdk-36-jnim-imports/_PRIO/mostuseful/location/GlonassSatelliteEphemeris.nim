import jnim

jclass android.location.GlonassSatelliteEphemeris* of JVMObject:
  proc getSlotNumber*(): jint
  proc getHealthState*(): jint
  proc getFrameTimeSeconds*(): jdouble
  proc getAgeInDays*(): jint
  proc getUpdateIntervalMinutes*(): jint
  proc isUpdateIntervalOdd*(): jboolean
  proc isGlonassM*(): jboolean
  proc getSatelliteClockModel*(): GlonassSatelliteClockModel
  proc getSatelliteOrbitModel*(): GlonassSatelliteOrbitModel
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  HEALTH_STATUS_HEALTHY*: jint {.`static`.}
  HEALTH_STATUS_UNHEALTHY*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[GlonassSatelliteEphemeris] {.`static`.}

jclass android.location.GlonassSatelliteEphemeris.Builder* of JVMObject:
  proc setSlotNumber*(slotNumber: jint): Builder
  proc setHealthState*(healthState: jint): Builder
  proc setFrameTimeSeconds*(frameTimeSeconds: jdouble): Builder
  proc setAgeInDays*(ageInDays: jint): Builder
  proc setSatelliteClockModel*(satelliteClockModel: GlonassSatelliteClockModel): Builder
  proc setSatelliteOrbitModel*(satelliteOrbitModel: GlonassSatelliteOrbitModel): Builder
  proc setUpdateIntervalMinutes*(updateIntervalMinutes: jint): Builder
  proc setUpdateIntervalOdd*(isUpdateIntervalOdd: jboolean): Builder
  proc setGlonassM*(isGlonassM: jboolean): Builder
  proc build*(): GlonassSatelliteEphemeris

jclass android.location.GlonassSatelliteEphemeris.GlonassSatelliteClockModel* of JVMObject:
  proc getTimeOfClockSeconds*(): jlong
  proc getClockBias*(): jdouble
  proc getFrequencyBias*(): jdouble
  proc getFrequencyChannelNumber*(): jint
  proc getGroupDelayDiffSeconds*(): jdouble
  proc isGroupDelayDiffSecondsAvailable*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.GlonassSatelliteEphemeris.GlonassSatelliteOrbitModel* of JVMObject:
  proc getX*(): jdouble
  proc getXDot*(): jdouble
  proc getXAccel*(): jdouble
  proc getY*(): jdouble
  proc getYDot*(): jdouble
  proc getYAccel*(): jdouble
  proc getZ*(): jdouble
  proc getZDot*(): jdouble
  proc getZAccel*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.Builder* of JVMObject:
  proc setSlotNumber*(slotNumber: jint): Builder
  proc setHealthState*(healthState: jint): Builder
  proc setFrameTimeSeconds*(frameTimeSeconds: jdouble): Builder
  proc setAgeInDays*(ageInDays: jint): Builder
  proc setSatelliteClockModel*(satelliteClockModel: GlonassSatelliteClockModel): Builder
  proc setSatelliteOrbitModel*(satelliteOrbitModel: GlonassSatelliteOrbitModel): Builder
  proc setUpdateIntervalMinutes*(updateIntervalMinutes: jint): Builder
  proc setUpdateIntervalOdd*(isUpdateIntervalOdd: jboolean): Builder
  proc setGlonassM*(isGlonassM: jboolean): Builder
  proc build*(): GlonassSatelliteEphemeris

jclass android.location.GlonassSatelliteClockModel* of JVMObject:
  proc getTimeOfClockSeconds*(): jlong
  proc getClockBias*(): jdouble
  proc getFrequencyBias*(): jdouble
  proc getFrequencyChannelNumber*(): jint
  proc getGroupDelayDiffSeconds*(): jdouble
  proc isGroupDelayDiffSecondsAvailable*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[GlonassSatelliteClockModel] {.`static`.}

jclass android.location.GlonassSatelliteClockModel.Builder* of JVMObject:
  proc setTimeOfClockSeconds*(timeOfClockSeconds: jlong): Builder
  proc setClockBias*(clockBias: jdouble): Builder
  proc setFrequencyBias*(frequencyBias: jdouble): Builder
  proc setFrequencyChannelNumber*(frequencyChannelNumber: jint): Builder
  proc setGroupDelayDiffSeconds*(groupDelayDiffSeconds: jdouble): Builder
  proc setGroupDelayDiffSecondsAvailable*(isGroupDelayDiffSecondsAvailable: jboolean): Builder
  proc build*(): GlonassSatelliteClockModel

jclass android.location.Builder* of JVMObject:
  proc setTimeOfClockSeconds*(timeOfClockSeconds: jlong): Builder
  proc setClockBias*(clockBias: jdouble): Builder
  proc setFrequencyBias*(frequencyBias: jdouble): Builder
  proc setFrequencyChannelNumber*(frequencyChannelNumber: jint): Builder
  proc setGroupDelayDiffSeconds*(groupDelayDiffSeconds: jdouble): Builder
  proc setGroupDelayDiffSecondsAvailable*(isGroupDelayDiffSecondsAvailable: jboolean): Builder
  proc build*(): GlonassSatelliteClockModel

jclass android.location.GlonassSatelliteOrbitModel* of JVMObject:
  proc getX*(): jdouble
  proc getXDot*(): jdouble
  proc getXAccel*(): jdouble
  proc getY*(): jdouble
  proc getYDot*(): jdouble
  proc getYAccel*(): jdouble
  proc getZ*(): jdouble
  proc getZDot*(): jdouble
  proc getZAccel*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[GlonassSatelliteOrbitModel] {.`static`.}

jclass android.location.GlonassSatelliteOrbitModel.Builder* of JVMObject:
  proc setX*(x: jdouble): Builder
  proc setXDot*(xDot: jdouble): Builder
  proc setXAccel*(xAccel: jdouble): Builder
  proc setY*(y: jdouble): Builder
  proc setYDot*(yDot: jdouble): Builder
  proc setYAccel*(yAccel: jdouble): Builder
  proc setZ*(z: jdouble): Builder
  proc setZDot*(zDot: jdouble): Builder
  proc setZAccel*(zAccel: jdouble): Builder
  proc build*(): GlonassSatelliteOrbitModel

jclass android.location.Builder* of JVMObject:
  proc setX*(x: jdouble): Builder
  proc setXDot*(xDot: jdouble): Builder
  proc setXAccel*(xAccel: jdouble): Builder
  proc setY*(y: jdouble): Builder
  proc setYDot*(yDot: jdouble): Builder
  proc setYAccel*(yAccel: jdouble): Builder
  proc setZ*(z: jdouble): Builder
  proc setZDot*(zDot: jdouble): Builder
  proc setZAccel*(zAccel: jdouble): Builder
  proc build*(): GlonassSatelliteOrbitModel

