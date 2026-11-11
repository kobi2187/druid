import jnim

jclass android.net.OemNetworkPreferences* of JVMObject:
  proc isEmpty*(): jboolean
  proc getNetworkPreferences*(): Map[string, Integer]
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc oemNetworkPreferenceToString*(value: jint): string {.`static`.}
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  OEM_NETWORK_PREFERENCE_TEST_ONLY*: jint {.`static`.}
  OEM_NETWORK_PREFERENCE_TEST*: jint {.`static`.}
  OEM_NETWORK_PREFERENCE_UNINITIALIZED*: jint {.`static`.}
  OEM_NETWORK_PREFERENCE_OEM_PAID*: jint {.`static`.}
  OEM_NETWORK_PREFERENCE_OEM_PAID_NO_FALLBACK*: jint {.`static`.}
  OEM_NETWORK_PREFERENCE_OEM_PAID_ONLY*: jint {.`static`.}
  OEM_NETWORK_PREFERENCE_OEM_PRIVATE_ONLY*: jint {.`static`.}
  OEM_NETWORK_PREFERENCE_MAX*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[OemNetworkPreferences] {.`static`.}

jclass android.net.OemNetworkPreferences.Builder* of JVMObject:
  proc addNetworkPreference*(packageName: string, preference: jint): Builder
  proc clearNetworkPreference*(packageName: string): Builder
  proc build*(): OemNetworkPreferences

jclass android.net.Builder* of JVMObject:
  proc addNetworkPreference*(packageName: string, preference: jint): Builder
  proc clearNetworkPreference*(packageName: string): Builder
  proc build*(): OemNetworkPreferences

