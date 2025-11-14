import jnim

jclass android.media.ISpatializer* of IInterface:
  proc release*()
  proc getSupportedLevels*(): seq[jbyte]
  proc setLevel*(level: jbyte)
  proc getLevel*(): jbyte
  proc isHeadTrackingSupported*(): jboolean
  proc getSupportedHeadTrackingModes*(): seq[jbyte]
  proc setDesiredHeadTrackingMode*(mode: jbyte)
  proc getActualHeadTrackingMode*(): jbyte
  proc recenterHeadTracker*()
  proc setGlobalTransform*(screenToStage: seq[jfloat])
  proc setHeadSensor*(sensorHandle: jint)
  proc setScreenSensor*(sensorHandle: jint)
  proc setDisplayOrientation*(physicalToLogicalAngle: jfloat)
  proc setHingeAngle*(hingeAngle: jfloat)
  proc setFoldState*(folded: jboolean)
  proc getSupportedModes*(): seq[jbyte]
  proc registerHeadTrackingCallback*(callback: android.media.ISpatializerHeadTrackingCallback)
  proc setParameter*(key: jint, value: seq[jbyte])
  proc getParameter*(key: jint, value: seq[jbyte])
  proc getOutput*(): jint
  proc getSpatializedChannelMasks*(): seq[jint]
  DESCRIPTOR*: string {.`static`.}

jclass android.media.ISpatializer.Default* of JVMObject:
  proc release*()
  proc getSupportedLevels*(): seq[jbyte]
  proc setLevel*(level: jbyte)
  proc getLevel*(): jbyte
  proc isHeadTrackingSupported*(): jboolean
  proc getSupportedHeadTrackingModes*(): seq[jbyte]
  proc setDesiredHeadTrackingMode*(mode: jbyte)
  proc getActualHeadTrackingMode*(): jbyte
  proc recenterHeadTracker*()
  proc setGlobalTransform*(screenToStage: seq[jfloat])
  proc setHeadSensor*(sensorHandle: jint)
  proc setScreenSensor*(sensorHandle: jint)
  proc setDisplayOrientation*(physicalToLogicalAngle: jfloat)
  proc setHingeAngle*(hingeAngle: jfloat)
  proc setFoldState*(folded: jboolean)
  proc getSupportedModes*(): seq[jbyte]
  proc registerHeadTrackingCallback*(callback: android.media.ISpatializerHeadTrackingCallback)
  proc setParameter*(key: jint, value: seq[jbyte])
  proc getParameter*(key: jint, value: seq[jbyte])
  proc getOutput*(): jint
  proc getSpatializedChannelMasks*(): seq[jint]
  proc asBinder*(): android.os.IBinder

jclass android.media.ISpatializer.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.ISpatializer {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc release*()
  proc getSupportedLevels*(): seq[jbyte]
  proc setLevel*(level: jbyte)
  proc getLevel*(): jbyte
  proc isHeadTrackingSupported*(): jboolean
  proc getSupportedHeadTrackingModes*(): seq[jbyte]
  proc setDesiredHeadTrackingMode*(mode: jbyte)
  proc getActualHeadTrackingMode*(): jbyte
  proc recenterHeadTracker*()
  proc setGlobalTransform*(screenToStage: seq[jfloat])
  proc setHeadSensor*(sensorHandle: jint)
  proc setScreenSensor*(sensorHandle: jint)
  proc setDisplayOrientation*(physicalToLogicalAngle: jfloat)
  proc setHingeAngle*(hingeAngle: jfloat)
  proc setFoldState*(folded: jboolean)
  proc getSupportedModes*(): seq[jbyte]
  proc registerHeadTrackingCallback*(callback: android.media.ISpatializerHeadTrackingCallback)
  proc setParameter*(key: jint, value: seq[jbyte])
  proc getParameter*(key: jint, value: seq[jbyte])
  proc getOutput*(): jint
  proc getSpatializedChannelMasks*(): seq[jint]
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.ISpatializer {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

