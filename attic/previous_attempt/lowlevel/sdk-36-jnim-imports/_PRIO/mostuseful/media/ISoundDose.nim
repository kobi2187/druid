import jnim

jclass android.media.ISoundDose* of IInterface:
  proc setOutputRs2UpperBound*(rs2Value: jfloat)
  proc resetCsd*(currentCsd: jfloat, records: seq[android.media.SoundDoseRecord])
  proc updateAttenuation*(attenuationDB: jfloat, device: jint)
  proc setCsdEnabled*(enabled: jboolean)
  proc initCachedAudioDeviceCategories*(audioDevices: seq[android.media.ISoundDose.AudioDeviceCategory])
  proc setAudioDeviceCategory*(audioDevice: android.media.ISoundDose.AudioDeviceCategory)
  proc getOutputRs2UpperBound*(): jfloat
  proc getCsd*(): jfloat
  proc isSoundDoseHalSupported*(): jboolean
  proc forceUseFrameworkMel*(useFrameworkMel: jboolean)
  proc forceComputeCsdOnAllDevices*(computeCsdOnAllDevices: jboolean)
  DESCRIPTOR*: string {.`static`.}

jclass android.media.ISoundDose.Default* of JVMObject:
  proc setOutputRs2UpperBound*(rs2Value: jfloat)
  proc resetCsd*(currentCsd: jfloat, records: seq[android.media.SoundDoseRecord])
  proc updateAttenuation*(attenuationDB: jfloat, device: jint)
  proc setCsdEnabled*(enabled: jboolean)
  proc initCachedAudioDeviceCategories*(audioDevices: seq[android.media.ISoundDose.AudioDeviceCategory])
  proc setAudioDeviceCategory*(audioDevice: android.media.ISoundDose.AudioDeviceCategory)
  proc getOutputRs2UpperBound*(): jfloat
  proc getCsd*(): jfloat
  proc isSoundDoseHalSupported*(): jboolean
  proc forceUseFrameworkMel*(useFrameworkMel: jboolean)
  proc forceComputeCsdOnAllDevices*(computeCsdOnAllDevices: jboolean)
  proc asBinder*(): android.os.IBinder

jclass android.media.ISoundDose.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.ISoundDose {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.ISoundDose.AudioDeviceCategory* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc toString*(): string
  proc describeContents*(): jint

jclass android.media.Default* of JVMObject:
  proc setOutputRs2UpperBound*(rs2Value: jfloat)
  proc resetCsd*(currentCsd: jfloat, records: seq[android.media.SoundDoseRecord])
  proc updateAttenuation*(attenuationDB: jfloat, device: jint)
  proc setCsdEnabled*(enabled: jboolean)
  proc initCachedAudioDeviceCategories*(audioDevices: seq[android.media.ISoundDose.AudioDeviceCategory])
  proc setAudioDeviceCategory*(audioDevice: android.media.ISoundDose.AudioDeviceCategory)
  proc getOutputRs2UpperBound*(): jfloat
  proc getCsd*(): jfloat
  proc isSoundDoseHalSupported*(): jboolean
  proc forceUseFrameworkMel*(useFrameworkMel: jboolean)
  proc forceComputeCsdOnAllDevices*(computeCsdOnAllDevices: jboolean)
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.ISoundDose {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.AudioDeviceCategory* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc toString*(): string
  proc describeContents*(): jint
  address*: string
  internalAudioType*: jint
  csdCompatible*: jboolean
  CREATOR*: android.os.Parcelable.Creator[AudioDeviceCategory] {.`static`.}

