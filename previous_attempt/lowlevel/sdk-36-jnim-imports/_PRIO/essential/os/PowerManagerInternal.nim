import jnim

jclass android.os.PowerManagerInternal* of JVMObject:
  proc wakefulnessToString*(wakefulness: jint): string {.`static`.}
  proc wakefulnessToProtoEnum*(wakefulness: jint): jint {.`static`.}
  proc isInteractive*(wakefulness: jint): jboolean {.`static`.}
  proc setUserActivityTimeoutOverrideFromWindowManager*(timeoutMillis: jlong)
  proc setUserInactiveOverrideFromWindowManager*()
  proc setMaximumScreenOffTimeoutFromDeviceAdmin*(userId: jint, timeMs: jlong)
  proc setDozeOverrideFromDreamManager*(screenState: jint, reason: jint, screenBrightnessFloat: jfloat, screenBrightnessInt: jint, useNormalBrightnessForDoze: jboolean)
  proc setDrawWakeLockOverrideFromSidekick*(keepState: jboolean)
  proc getLowPowerState*(serviceType: jint): PowerSaveState
  proc registerLowPowerModeObserver*(listener: LowPowerModeListener)
  proc registerLowPowerModeObserver*(serviceType: jint, listener: Consumer[PowerSaveState])
  proc setDeviceIdleMode*(enabled: jboolean): jboolean
  proc setLightDeviceIdleMode*(enabled: jboolean): jboolean
  proc setDeviceIdleWhitelist*(appids: seq[jint])
  proc setDeviceIdleTempWhitelist*(appids: seq[jint])
  proc setLowPowerStandbyAllowlist*(uids: seq[jint])
  proc setLowPowerStandbyActive*(active: jboolean)
  proc startUidChanges*()
  proc finishUidChanges*()
  proc updateUidProcState*(uid: jint, procState: jint)
  proc uidGone*(uid: jint)
  proc uidActive*(uid: jint)
  proc uidIdle*(uid: jint)
  proc setPowerBoost*(boost: jint, durationMs: jint)
  proc setPowerMode*(mode: jint, enabled: jboolean)
  proc wasDeviceIdleFor*(ms: jlong): jboolean
  proc getLastWakeup*(): PowerManager.WakeData
  proc getLastGoToSleep*(): PowerManager.SleepData
  proc interceptPowerKeyDown*(event: KeyEvent): jboolean
  proc nap*(eventTime: jlong, allowWake: jboolean)
  proc isAmbientDisplaySuppressed*(): jboolean
  proc setDevicePostured*(isPostured: jboolean)
  proc updateSettings*()
  WAKEFULNESS_ASLEEP*: jint {.`static`.}
  WAKEFULNESS_AWAKE*: jint {.`static`.}
  WAKEFULNESS_DREAMING*: jint {.`static`.}
  WAKEFULNESS_DOZING*: jint {.`static`.}
  BOOST_INTERACTION*: jint {.`static`.}
  BOOST_DISPLAY_UPDATE_IMMINENT*: jint {.`static`.}
  MODE_DOUBLE_TAP_TO_WAKE*: jint {.`static`.}
  MODE_LOW_POWER*: jint {.`static`.}
  MODE_SUSTAINED_PERFORMANCE*: jint {.`static`.}
  MODE_FIXED_PERFORMANCE*: jint {.`static`.}
  MODE_VR*: jint {.`static`.}
  MODE_LAUNCH*: jint {.`static`.}
  MODE_EXPENSIVE_RENDERING*: jint {.`static`.}
  MODE_INTERACTIVE*: jint {.`static`.}
  MODE_DEVICE_IDLE*: jint {.`static`.}
  MODE_DISPLAY_INACTIVE*: jint {.`static`.}
  MODE_DISPLAY_CHANGE*: jint {.`static`.}

