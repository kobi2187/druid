import jnim

jclass android.app.ApplicationErrorReport* of JVMObject:
  proc getErrorReportReceiver*(context: Context, packageName: string, appFlags: jint): ComponentName {.`static`.}
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  proc describeContents*(): jint
  proc dump*(pw: Printer, prefix: string)
  TYPE_NONE*: jint {.`static`.}
  TYPE_CRASH*: jint {.`static`.}
  TYPE_ANR*: jint {.`static`.}
  TYPE_BATTERY*: jint {.`static`.}
  TYPE_RUNNING_SERVICE*: jint {.`static`.}
  typ*: jint
  packageName*: string
  installerPackageName*: string
  processName*: string
  time*: jlong
  systemApp*: jboolean
  crashInfo*: CrashInfo
  anrInfo*: AnrInfo
  batteryInfo*: BatteryInfo
  runningServiceInfo*: RunningServiceInfo
  CREATOR*: Parcelable.Creator[ApplicationErrorReport] {.`static`.}

jclass android.app.ApplicationErrorReport.CrashInfo* of JVMObject:
  proc appendStackTrace*(tr: string)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: Printer, prefix: string)

jclass android.app.ApplicationErrorReport.ParcelableCrashInfo* of JVMObject:
  proc describeContents*(): jint

jclass android.app.ApplicationErrorReport.AnrInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: Printer, prefix: string)

jclass android.app.ApplicationErrorReport.BatteryInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: Printer, prefix: string)

jclass android.app.ApplicationErrorReport.RunningServiceInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: Printer, prefix: string)

jclass android.app.CrashInfo* of JVMObject:
  proc appendStackTrace*(tr: string)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: Printer, prefix: string)
  exceptionHandlerClassName*: string
  exceptionClassName*: string
  exceptionMessage*: string
  throwFileName*: string
  throwClassName*: string
  throwMethodName*: string
  throwLineNumber*: jint
  stackTrace*: string
  crashTag*: string

jclass android.app.ParcelableCrashInfo* of CrashInfo:
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[ParcelableCrashInfo] {.`static`.}

jclass android.app.AnrInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: Printer, prefix: string)
  activity*: string
  cause*: string
  info*: string

jclass android.app.BatteryInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: Printer, prefix: string)
  usagePercent*: jint
  durationMicros*: jlong
  usageDetails*: string
  checkinDetails*: string

jclass android.app.RunningServiceInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: Printer, prefix: string)
  durationMillis*: jlong
  serviceDetails*: string

