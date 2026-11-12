import jnim

jclass android.os.BatterySaverPolicyConfig* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc getAdjustBrightnessFactor*(): jfloat
  proc getAdvertiseIsEnabled*(): jboolean
  proc getDeferFullBackup*(): jboolean
  proc getDeferKeyValueBackup*(): jboolean
  proc getDeviceSpecificSettings*(): Map[string, string]
  proc getDisableAnimation*(): jboolean
  proc getDisableAod*(): jboolean
  proc getDisableLaunchBoost*(): jboolean
  proc getDisableOptionalSensors*(): jboolean
  proc getSoundTriggerMode*(): jint
  proc getDisableSoundTrigger*(): jboolean
  proc getDisableVibration*(): jboolean
  proc getEnableAdjustBrightness*(): jboolean
  proc getEnableDataSaver*(): jboolean
  proc getEnableFirewall*(): jboolean
  proc getEnableNightMode*(): jboolean
  proc getEnableQuickDoze*(): jboolean
  proc getForceAllAppsStandby*(): jboolean
  proc getForceBackgroundCheck*(): jboolean
  proc getLocationMode*(): jint
  CREATOR*: Creator[BatterySaverPolicyConfig] {.`static`.}

jclass android.os.BatterySaverPolicyConfig.Builder* of JVMObject:
  proc setAdjustBrightnessFactor*(adjustBrightnessFactor: jfloat): Builder
  proc setAdvertiseIsEnabled*(advertiseIsEnabled: jboolean): Builder
  proc setDeferFullBackup*(deferFullBackup: jboolean): Builder
  proc setDeferKeyValueBackup*(deferKeyValueBackup: jboolean): Builder
  proc addDeviceSpecificSetting*(key: string, value: string): Builder
  proc setDisableAnimation*(disableAnimation: jboolean): Builder
  proc setDisableAod*(disableAod: jboolean): Builder
  proc setDisableLaunchBoost*(disableLaunchBoost: jboolean): Builder
  proc setDisableOptionalSensors*(disableOptionalSensors: jboolean): Builder
  proc setDisableSoundTrigger*(disableSoundTrigger: jboolean): Builder
  proc setSoundTriggerMode*(soundTriggerMode: jint): Builder
  proc setDisableVibration*(disableVibration: jboolean): Builder
  proc setEnableAdjustBrightness*(enableAdjustBrightness: jboolean): Builder
  proc setEnableDataSaver*(enableDataSaver: jboolean): Builder
  proc setEnableFirewall*(enableFirewall: jboolean): Builder
  proc setEnableNightMode*(enableNightMode: jboolean): Builder
  proc setEnableQuickDoze*(enableQuickDoze: jboolean): Builder
  proc setForceAllAppsStandby*(forceAllAppsStandby: jboolean): Builder
  proc setForceBackgroundCheck*(forceBackgroundCheck: jboolean): Builder
  proc setLocationMode*(locationMode: jint): Builder
  proc build*(): BatterySaverPolicyConfig

jclass android.os.Builder* of JVMObject:
  proc setAdjustBrightnessFactor*(adjustBrightnessFactor: jfloat): Builder
  proc setAdvertiseIsEnabled*(advertiseIsEnabled: jboolean): Builder
  proc setDeferFullBackup*(deferFullBackup: jboolean): Builder
  proc setDeferKeyValueBackup*(deferKeyValueBackup: jboolean): Builder
  proc addDeviceSpecificSetting*(key: string, value: string): Builder
  proc setDisableAnimation*(disableAnimation: jboolean): Builder
  proc setDisableAod*(disableAod: jboolean): Builder
  proc setDisableLaunchBoost*(disableLaunchBoost: jboolean): Builder
  proc setDisableOptionalSensors*(disableOptionalSensors: jboolean): Builder
  proc setDisableSoundTrigger*(disableSoundTrigger: jboolean): Builder
  proc setSoundTriggerMode*(soundTriggerMode: jint): Builder
  proc setDisableVibration*(disableVibration: jboolean): Builder
  proc setEnableAdjustBrightness*(enableAdjustBrightness: jboolean): Builder
  proc setEnableDataSaver*(enableDataSaver: jboolean): Builder
  proc setEnableFirewall*(enableFirewall: jboolean): Builder
  proc setEnableNightMode*(enableNightMode: jboolean): Builder
  proc setEnableQuickDoze*(enableQuickDoze: jboolean): Builder
  proc setForceAllAppsStandby*(forceAllAppsStandby: jboolean): Builder
  proc setForceBackgroundCheck*(forceBackgroundCheck: jboolean): Builder
  proc setLocationMode*(locationMode: jint): Builder
  proc build*(): BatterySaverPolicyConfig

