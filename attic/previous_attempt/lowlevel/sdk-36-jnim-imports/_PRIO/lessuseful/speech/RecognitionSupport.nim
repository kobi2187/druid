import jnim

jclass android.speech.RecognitionSupport* of JVMObject:
  proc getInstalledOnDeviceLanguages*(): List[string]
  proc getPendingOnDeviceLanguages*(): List[string]
  proc getSupportedOnDeviceLanguages*(): List[string]
  proc getOnlineLanguages*(): List[string]
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[RecognitionSupport] {.`static`.}

jclass android.speech.RecognitionSupport.Builder* of JVMObject:
  proc setInstalledOnDeviceLanguages*(value: List[string]): Builder
  proc addInstalledOnDeviceLanguage*(value: string): Builder
  proc setPendingOnDeviceLanguages*(value: List[string]): Builder
  proc addPendingOnDeviceLanguage*(value: string): Builder
  proc setSupportedOnDeviceLanguages*(value: List[string]): Builder
  proc addSupportedOnDeviceLanguage*(value: string): Builder
  proc setOnlineLanguages*(value: List[string]): Builder
  proc addOnlineLanguage*(value: string): Builder
  proc build*(): RecognitionSupport

jclass android.speech.Builder* of JVMObject:
  proc setInstalledOnDeviceLanguages*(value: List[string]): Builder
  proc addInstalledOnDeviceLanguage*(value: string): Builder
  proc setPendingOnDeviceLanguages*(value: List[string]): Builder
  proc addPendingOnDeviceLanguage*(value: string): Builder
  proc setSupportedOnDeviceLanguages*(value: List[string]): Builder
  proc addSupportedOnDeviceLanguage*(value: string): Builder
  proc setOnlineLanguages*(value: List[string]): Builder
  proc addOnlineLanguage*(value: string): Builder
  proc build*(): RecognitionSupport

