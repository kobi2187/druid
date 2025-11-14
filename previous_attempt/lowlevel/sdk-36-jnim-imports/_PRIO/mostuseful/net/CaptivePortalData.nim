import jnim

jclass android.net.CaptivePortalData* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getRefreshTimeMillis*(): jlong
  proc getUserPortalUrl*(): Uri
  proc getVenueInfoUrl*(): Uri
  proc isSessionExtendable*(): jboolean
  proc getByteLimit*(): jlong
  proc getExpiryTimeMillis*(): jlong
  proc isCaptive*(): jboolean
  proc getVenueInfoUrlSource*(): jint
  proc getUserPortalUrlSource*(): jint
  proc getVenueFriendlyName*(): CharSequence
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  CAPTIVE_PORTAL_DATA_SOURCE_OTHER*: jint {.`static`.}
  CAPTIVE_PORTAL_DATA_SOURCE_PASSPOINT*: jint {.`static`.}
  CREATOR*: Creator[CaptivePortalData] {.`static`.}

jclass android.net.CaptivePortalData.Builder* of JVMObject:
  proc setRefreshTime*(refreshTime: jlong): Builder
  proc setUserPortalUrl*(userPortalUrl: Uri): Builder
  proc setUserPortalUrl*(userPortalUrl: Uri, source: jint): Builder
  proc setVenueInfoUrl*(venueInfoUrl: Uri): Builder
  proc setVenueInfoUrl*(venueInfoUrl: Uri, source: jint): Builder
  proc setSessionExtendable*(sessionExtendable: jboolean): Builder
  proc setBytesRemaining*(bytesRemaining: jlong): Builder
  proc setExpiryTime*(expiryTime: jlong): Builder
  proc setCaptive*(captive: jboolean): Builder
  proc setVenueFriendlyName*(venueFriendlyName: CharSequence): Builder
  proc build*(): CaptivePortalData

jclass android.net.Builder* of JVMObject:
  proc setRefreshTime*(refreshTime: jlong): Builder
  proc setUserPortalUrl*(userPortalUrl: Uri): Builder
  proc setUserPortalUrl*(userPortalUrl: Uri, source: jint): Builder
  proc setVenueInfoUrl*(venueInfoUrl: Uri): Builder
  proc setVenueInfoUrl*(venueInfoUrl: Uri, source: jint): Builder
  proc setSessionExtendable*(sessionExtendable: jboolean): Builder
  proc setBytesRemaining*(bytesRemaining: jlong): Builder
  proc setExpiryTime*(expiryTime: jlong): Builder
  proc setCaptive*(captive: jboolean): Builder
  proc setVenueFriendlyName*(venueFriendlyName: CharSequence): Builder
  proc build*(): CaptivePortalData

