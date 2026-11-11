import jnim

jclass android.location.LocationRequest* of JVMObject:
  proc create*(): LocationRequest {.`static`.}
  proc createFromDeprecatedProvider*(provider: string, intervalMillis: jlong, minUpdateDistanceMeters: jfloat, singleShot: jboolean): LocationRequest {.`static`.}
  proc createFromDeprecatedCriteria*(criteria: Criteria, intervalMillis: jlong, minUpdateDistanceMeters: jfloat, singleShot: jboolean): LocationRequest {.`static`.}
  proc setProvider*(provider: string): LocationRequest
  proc getProvider*(): string
  proc setQuality*(quality: jint): LocationRequest
  proc getQuality*(): jint
  proc setInterval*(millis: jlong): LocationRequest
  proc getInterval*(): jlong
  proc getIntervalMillis*(): jlong
  proc setFastestInterval*(millis: jlong): LocationRequest
  proc getFastestInterval*(): jlong
  proc setExpireAt*(millis: jlong): LocationRequest
  proc getExpireAt*(): jlong
  proc setExpireIn*(millis: jlong): LocationRequest
  proc getExpireIn*(): jlong
  proc getDurationMillis*(): jlong
  proc getExpirationRealtimeMs*(startRealtimeMs: jlong): jlong
  proc setNumUpdates*(numUpdates: jint): LocationRequest
  proc getNumUpdates*(): jint
  proc getMaxUpdates*(): jint
  proc getMinUpdateIntervalMillis*(): jlong
  proc setSmallestDisplacement*(minDisplacementMeters: jfloat): LocationRequest
  proc getSmallestDisplacement*(): jfloat
  proc getMinUpdateDistanceMeters*(): jfloat
  proc getMaxUpdateDelayMillis*(): jlong
  proc setHideFromAppOps*(hiddenFromAppOps: jboolean)
  proc getHideFromAppOps*(): jboolean
  proc isHiddenFromAppOps*(): jboolean
  proc isAdasGnssBypass*(): jboolean
  proc setLocationSettingsIgnored*(locationSettingsIgnored: jboolean): LocationRequest
  proc isLocationSettingsIgnored*(): jboolean
  proc isBypass*(): jboolean
  proc setLowPowerMode*(enabled: jboolean): LocationRequest
  proc isLowPowerMode*(): jboolean
  proc isLowPower*(): jboolean
  proc setWorkSource*(workSource: WorkSource)
  proc getWorkSource*(): WorkSource
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  LOW_POWER_EXCEPTIONS*: jlong {.`static`.}
  PASSIVE_INTERVAL*: jlong {.`static`.}
  QUALITY_HIGH_ACCURACY*: jint {.`static`.}
  QUALITY_BALANCED_POWER_ACCURACY*: jint {.`static`.}
  QUALITY_LOW_POWER*: jint {.`static`.}
  ACCURACY_FINE*: jint {.`static`.}
  ACCURACY_BLOCK*: jint {.`static`.}
  ACCURACY_CITY*: jint {.`static`.}
  POWER_NONE*: jint {.`static`.}
  POWER_LOW*: jint {.`static`.}
  POWER_HIGH*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[LocationRequest] {.`static`.}

jclass android.location.LocationRequest.Builder* of JVMObject:
  proc setIntervalMillis*(intervalMillis: jlong): Builder
  proc setQuality*(quality: jint): Builder
  proc setQuality*(criteria: Criteria): Builder
  proc setDurationMillis*(durationMillis: jlong): Builder
  proc setMaxUpdates*(maxUpdates: jint): Builder
  proc setMinUpdateIntervalMillis*(minUpdateIntervalMillis: jlong): Builder
  proc clearMinUpdateIntervalMillis*(): Builder
  proc setMinUpdateDistanceMeters*(minUpdateDistanceMeters: jfloat): Builder
  proc setMaxUpdateDelayMillis*(maxUpdateDelayMillis: jlong): Builder
  proc setHiddenFromAppOps*(hiddenFromAppOps: jboolean): Builder
  proc setAdasGnssBypass*(adasGnssBypass: jboolean): Builder
  proc setLocationSettingsIgnored*(locationSettingsIgnored: jboolean): Builder
  proc setLowPower*(lowPower: jboolean): Builder
  proc setWorkSource*(workSource: WorkSource): Builder
  proc build*(): LocationRequest

jclass android.location.Builder* of JVMObject:
  proc setIntervalMillis*(intervalMillis: jlong): Builder
  proc setQuality*(quality: jint): Builder
  proc setQuality*(criteria: Criteria): Builder
  proc setDurationMillis*(durationMillis: jlong): Builder
  proc setMaxUpdates*(maxUpdates: jint): Builder
  proc setMinUpdateIntervalMillis*(minUpdateIntervalMillis: jlong): Builder
  proc clearMinUpdateIntervalMillis*(): Builder
  proc setMinUpdateDistanceMeters*(minUpdateDistanceMeters: jfloat): Builder
  proc setMaxUpdateDelayMillis*(maxUpdateDelayMillis: jlong): Builder
  proc setHiddenFromAppOps*(hiddenFromAppOps: jboolean): Builder
  proc setAdasGnssBypass*(adasGnssBypass: jboolean): Builder
  proc setLocationSettingsIgnored*(locationSettingsIgnored: jboolean): Builder
  proc setLowPower*(lowPower: jboolean): Builder
  proc setWorkSource*(workSource: WorkSource): Builder
  proc build*(): LocationRequest

