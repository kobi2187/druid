import jnim

jclass android.hardware.SensorPrivacyManagerInternal* of JVMObject:
  proc isSensorPrivacyEnabled*(userId: jint, sensor: jint): jboolean
  proc addSensorPrivacyListener*(userId: jint, sensor: jint, listener: OnSensorPrivacyChangedListener)
  proc addSensorPrivacyListenerForAllUsers*(sensor: jint, listener: OnUserSensorPrivacyChangedListener)
  proc setPhysicalToggleSensorPrivacy*(userId: jint, sensor: jint, enable: jboolean)


