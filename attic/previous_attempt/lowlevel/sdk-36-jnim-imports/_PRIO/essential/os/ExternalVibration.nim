import jnim

jclass android.os.ExternalVibration* of JVMObject:
  proc getUid*(): jint
  proc getPackage*(): string
  proc getAudioAttributes*(): AudioAttributes
  proc getToken*(): IBinder
  proc getVibrationAttributes*(): VibrationAttributes
  proc mute*(): jboolean
  proc unmute*(): jboolean
  proc linkToDeath*(recipient: IBinder.DeathRecipient)
  proc unlinkToDeath*(recipient: IBinder.DeathRecipient)
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[ExternalVibration] {.`static`.}

