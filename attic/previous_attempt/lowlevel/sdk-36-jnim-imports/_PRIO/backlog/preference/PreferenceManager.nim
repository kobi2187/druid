import jnim

jclass android.preference.PreferenceManager* of JVMObject:
  proc setPreferenceDataStore*(dataStore: PreferenceDataStore)
  proc getPreferenceDataStore*(): PreferenceDataStore
  proc inflateFromResource*(context: Context, resId: jint, rootPreferences: PreferenceScreen): PreferenceScreen
  proc createPreferenceScreen*(context: Context): PreferenceScreen
  proc getSharedPreferencesName*(): string
  proc setSharedPreferencesName*(sharedPreferencesName: string)
  proc getSharedPreferencesMode*(): jint
  proc setSharedPreferencesMode*(sharedPreferencesMode: jint)
  proc setStorageDefault*()
  proc setStorageDeviceProtected*()
  proc setStorageCredentialProtected*()
  proc isStorageDefault*(): jboolean
  proc isStorageDeviceProtected*(): jboolean
  proc isStorageCredentialProtected*(): jboolean
  proc getSharedPreferences*(): SharedPreferences
  proc getDefaultSharedPreferences*(context: Context): SharedPreferences {.`static`.}
  proc getDefaultSharedPreferencesName*(context: Context): string {.`static`.}
  proc findPreference*(key: CharSequence): Preference
  proc setDefaultValues*(context: Context, resId: jint, readAgain: jboolean) {.`static`.}
  proc setDefaultValues*(context: Context, sharedPreferencesName: string, sharedPreferencesMode: jint, resId: jint, readAgain: jboolean) {.`static`.}
  proc registerOnActivityStopListener*(listener: OnActivityStopListener)
  proc unregisterOnActivityStopListener*(listener: OnActivityStopListener)
  METADATA_KEY_PREFERENCES*: string {.`static`.}
  KEY_HAS_SET_DEFAULT_VALUES*: string {.`static`.}



