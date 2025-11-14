import jnim

jclass android.credentials.CredentialProviderInfo* of JVMObject:
  proc hasCapability*(credentialType: string): jboolean
  proc getServiceInfo*(): ServiceInfo
  proc isSystemProvider*(): jboolean
  proc getServiceIcon*(context: Context): Drawable
  proc getLabel*(context: Context): CharSequence
  proc getCapabilities*(): List[string]
  proc isEnabled*(): jboolean
  proc isPrimary*(): jboolean
  proc getSettingsSubtitle*(): CharSequence
  proc getSettingsActivity*(): CharSequence
  proc getComponentName*(): ComponentName
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Parcelable.Creator[CredentialProviderInfo] {.`static`.}

jclass android.credentials.CredentialProviderInfo.Builder* of JVMObject:
  proc setSystemProvider*(isSystemProvider: jboolean): Builder
  proc setOverrideLabel*(overrideLabel: CharSequence): Builder
  proc setSettingsSubtitle*(settingsSubtitle: CharSequence): Builder
  proc setSettingsActivity*(settingsActivity: CharSequence): Builder
  proc addCapabilities*(capabilities: List[string]): Builder
  proc setEnabled*(isEnabled: jboolean): Builder
  proc setPrimary*(isPrimary: jboolean): Builder
  proc build*(): CredentialProviderInfo

jclass android.credentials.Builder* of JVMObject:
  proc setSystemProvider*(isSystemProvider: jboolean): Builder
  proc setOverrideLabel*(overrideLabel: CharSequence): Builder
  proc setSettingsSubtitle*(settingsSubtitle: CharSequence): Builder
  proc setSettingsActivity*(settingsActivity: CharSequence): Builder
  proc addCapabilities*(capabilities: List[string]): Builder
  proc setEnabled*(isEnabled: jboolean): Builder
  proc setPrimary*(isPrimary: jboolean): Builder
  proc build*(): CredentialProviderInfo

