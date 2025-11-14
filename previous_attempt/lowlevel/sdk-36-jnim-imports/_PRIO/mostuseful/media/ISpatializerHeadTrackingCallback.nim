import jnim

jclass android.media.ISpatializerHeadTrackingCallback* of IInterface:
  proc onHeadTrackingModeChanged*(mode: jbyte)
  proc onHeadToSoundStagePoseUpdated*(headToStage: seq[jfloat])
  DESCRIPTOR*: string {.`static`.}

jclass android.media.ISpatializerHeadTrackingCallback.Default* of JVMObject:
  proc onHeadTrackingModeChanged*(mode: jbyte)
  proc onHeadToSoundStagePoseUpdated*(headToStage: seq[jfloat])
  proc asBinder*(): android.os.IBinder

jclass android.media.ISpatializerHeadTrackingCallback.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.ISpatializerHeadTrackingCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc onHeadTrackingModeChanged*(mode: jbyte)
  proc onHeadToSoundStagePoseUpdated*(headToStage: seq[jfloat])
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.ISpatializerHeadTrackingCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

