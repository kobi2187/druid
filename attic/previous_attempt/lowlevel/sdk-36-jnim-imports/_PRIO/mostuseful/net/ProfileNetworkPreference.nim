import jnim

jclass android.net.ProfileNetworkPreference* of JVMObject:
  proc getPreference*(): jint
  proc getIncludedUids*(): seq[jint]
  proc getExcludedUids*(): seq[jint]
  proc getPreferenceEnterpriseId*(): jint
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Creator[ProfileNetworkPreference] {.`static`.}

jclass android.net.ProfileNetworkPreference.Builder* of JVMObject:
  proc setPreference*(preference: jint): Builder
  proc setIncludedUids*(uids: seq[jint]): Builder
  proc setExcludedUids*(uids: seq[jint]): Builder
  proc build*(): ProfileNetworkPreference
  proc setPreferenceEnterpriseId*(preferenceId: jint): Builder

jclass android.net.Builder* of JVMObject:
  proc setPreference*(preference: jint): Builder
  proc setIncludedUids*(uids: seq[jint]): Builder
  proc setExcludedUids*(uids: seq[jint]): Builder
  proc build*(): ProfileNetworkPreference
  proc setPreferenceEnterpriseId*(preferenceId: jint): Builder

