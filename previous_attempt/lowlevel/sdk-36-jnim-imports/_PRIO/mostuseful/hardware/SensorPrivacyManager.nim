import jnim

jclass android.hardware.SensorPrivacyManager* of JVMObject:
  proc getInstance*(context: Context): SensorPrivacyManager {.`static`.}
  proc getInstance*(context: Context, service: ISensorPrivacyManager): SensorPrivacyManager {.`static`.}
  proc supportsSensorToggle*(sensor: jint): jboolean
  proc supportsSensorToggle*(toggleType: jint, sensor: jint): jboolean
  proc addSensorPrivacyListener*(sensor: jint, listener: OnSensorPrivacyChangedListener)
  proc addSensorPrivacyListener*(sensor: jint, userId: jint, listener: OnSensorPrivacyChangedListener)
  proc addSensorPrivacyListener*(sensor: jint, executor: Executor, listener: OnSensorPrivacyChangedListener)
  proc addSensorPrivacyListener*(listener: OnSensorPrivacyChangedListener)
  proc addSensorPrivacyListener*(executor: Executor, listener: OnSensorPrivacyChangedListener)
  proc removeSensorPrivacyListener*(sensor: jint, listener: OnSensorPrivacyChangedListener)
  proc removeSensorPrivacyListener*(listener: OnSensorPrivacyChangedListener)
  proc isSensorPrivacyEnabled*(sensor: jint): jboolean
  proc isSensorPrivacyEnabled*(toggleType: jint, sensor: jint): jboolean
  proc areAnySensorPrivacyTogglesEnabled*(sensor: jint): jboolean
  proc getSensorPrivacyState*(toggleType: jint, sensor: jint): jint
  proc isCameraPrivacyEnabled*(packageName: string): jboolean
  proc getCameraPrivacyAllowlist*(): List[string]
  proc setCameraPrivacyAllowlist*(allowlist: List[string])
  proc setSensorPrivacy*(sensor: jint, enable: jboolean)
  proc setSensorPrivacyState*(sensor: jint, state: jint)
  proc setSensorPrivacy*(source: jint, sensor: jint, enable: jboolean)
  proc setSensorPrivacy*(source: jint, sensor: jint, enable: jboolean, userId: jint)
  proc setSensorPrivacyState*(source: jint, sensor: jint, state: jint)
  proc setSensorPrivacyForProfileGroup*(source: jint, sensor: jint, enable: jboolean)
  proc setSensorPrivacyForProfileGroup*(source: jint, sensor: jint, enable: jboolean, userId: jint)
  proc setSensorPrivacyStateForProfileGroup*(source: jint, sensor: jint, state: jint)
  proc suppressSensorPrivacyReminders*(sensor: jint, suppress: jboolean)
  proc suppressSensorPrivacyReminders*(sensor: jint, suppress: jboolean, userId: jint)
  proc requiresAuthentication*(): jboolean
  proc showSensorUseDialog*(sensor: jint)
  proc setAllSensorPrivacy*(enable: jboolean)
  proc addAllSensorPrivacyListener*(listener: OnAllSensorPrivacyChangedListener)
  proc removeAllSensorPrivacyListener*(listener: OnAllSensorPrivacyChangedListener)
  proc isAllSensorPrivacyEnabled*(): jboolean
  EXTRA_SENSOR*: string {.`static`.}
  EXTRA_NOTIFICATION_ID*: string {.`static`.}
  EXTRA_ALL_SENSORS*: string {.`static`.}
  EXTRA_TOGGLE_TYPE*: string {.`static`.}
  TOGGLE_TYPE_SOFTWARE*: jint {.`static`.}
  TOGGLE_TYPE_HARDWARE*: jint {.`static`.}

jclass android.hardware.Sensors* of JVMObject:
  MICROPHONE*: jint {.`static`.}
  CAMERA*: jint {.`static`.}

jclass android.hardware.Sources* of JVMObject:
  QS_TILE*: jint {.`static`.}
  SETTINGS*: jint {.`static`.}
  DIALOG*: jint {.`static`.}
  SHELL*: jint {.`static`.}
  OTHER*: jint {.`static`.}
  SAFETY_CENTER*: jint {.`static`.}

jclass android.hardware.StateTypes* of JVMObject:
  ENABLED*: jint {.`static`.}
  DISABLED*: jint {.`static`.}
  ENABLED_EXCEPT_ALLOWLISTED_APPS*: jint {.`static`.}


