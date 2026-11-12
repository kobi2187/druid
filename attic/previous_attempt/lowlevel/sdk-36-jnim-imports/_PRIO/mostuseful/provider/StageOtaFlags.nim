import jnim

jclass android.provider.StageOtaFlags* of JVMObject:
  proc stageBooleanAconfigFlagsForBuild*(flags: Map[string, Boolean], buildId: string): jint {.`static`.}
  STATUS_STORAGE_NOT_ENABLED*: jint {.`static`.}
  STATUS_STAGE_SUCCESS*: jint {.`static`.}

