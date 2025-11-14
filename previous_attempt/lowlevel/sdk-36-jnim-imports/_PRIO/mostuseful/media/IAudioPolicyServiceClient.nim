import jnim

jclass android.media.IAudioPolicyServiceClient* of IInterface:
  proc onAudioVolumeGroupChanged*(group: jint, flags: jint)
  proc onAudioPortListUpdate*()
  proc onAudioPatchListUpdate*()
  proc onDynamicPolicyMixStateUpdate*(regId: string, state: jint)
  proc onRecordingConfigurationUpdate*(event: jint, clientInfo: android.media.RecordClientInfo, clientConfig: android.media.audio.common.AudioConfigBase, clientEffects: seq[android.media.EffectDescriptor], deviceConfig: android.media.audio.common.AudioConfigBase, effects: seq[android.media.EffectDescriptor], patchHandle: jint, source: jint)
  proc onRoutingUpdated*()
  proc onVolumeRangeInitRequest*()
  DESCRIPTOR*: string {.`static`.}

jclass android.media.IAudioPolicyServiceClient.Default* of JVMObject:
  proc onAudioVolumeGroupChanged*(group: jint, flags: jint)
  proc onAudioPortListUpdate*()
  proc onAudioPatchListUpdate*()
  proc onDynamicPolicyMixStateUpdate*(regId: string, state: jint)
  proc onRecordingConfigurationUpdate*(event: jint, clientInfo: android.media.RecordClientInfo, clientConfig: android.media.audio.common.AudioConfigBase, clientEffects: seq[android.media.EffectDescriptor], deviceConfig: android.media.audio.common.AudioConfigBase, effects: seq[android.media.EffectDescriptor], patchHandle: jint, source: jint)
  proc onRoutingUpdated*()
  proc onVolumeRangeInitRequest*()
  proc asBinder*(): android.os.IBinder

jclass android.media.IAudioPolicyServiceClient.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.IAudioPolicyServiceClient {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc onAudioVolumeGroupChanged*(group: jint, flags: jint)
  proc onAudioPortListUpdate*()
  proc onAudioPatchListUpdate*()
  proc onDynamicPolicyMixStateUpdate*(regId: string, state: jint)
  proc onRecordingConfigurationUpdate*(event: jint, clientInfo: android.media.RecordClientInfo, clientConfig: android.media.audio.common.AudioConfigBase, clientEffects: seq[android.media.EffectDescriptor], deviceConfig: android.media.audio.common.AudioConfigBase, effects: seq[android.media.EffectDescriptor], patchHandle: jint, source: jint)
  proc onRoutingUpdated*()
  proc onVolumeRangeInitRequest*()
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.IAudioPolicyServiceClient {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

