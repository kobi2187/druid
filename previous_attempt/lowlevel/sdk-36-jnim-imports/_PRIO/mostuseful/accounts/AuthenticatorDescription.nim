import jnim

jclass android.accounts.AuthenticatorDescription* of JVMObject:
  proc newKey*(type: string): AuthenticatorDescription {.`static`.}
  proc describeContents*(): jint
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  typ*: string
  labelId*: jint
  iconId*: jint
  smallIconId*: jint
  accountPreferencesId*: jint
  packageName*: string
  customTokens*: jboolean
  CREATOR*: Creator[AuthenticatorDescription] {.`static`.}

