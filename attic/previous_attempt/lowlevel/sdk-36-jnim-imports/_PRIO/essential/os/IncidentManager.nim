import jnim

jclass android.os.IncidentManager* of JVMObject:
  proc reportIncident*(args: IncidentReportArgs)
  proc requestAuthorization*(callingUid: jint, callingPackage: string, flags: jint, listener: AuthListener)
  proc requestAuthorization*(callingUid: jint, callingPackage: string, flags: jint, executor: Executor, listener: AuthListener)
  proc cancelAuthorization*(listener: AuthListener)
  proc getPendingReports*(): List[PendingReport]
  proc approveReport*(uri: Uri)
  proc denyReport*(uri: Uri)
  proc registerSection*(id: jint, name: string, executor: Executor, callback: DumpCallback)
  proc unregisterSection*(id: jint)
  proc getIncidentReportList*(receiverClass: string): List[Uri]
  proc getIncidentReport*(uri: Uri): IncidentReport
  proc deleteIncidentReports*(uri: Uri)
  URI_SCHEME*: string {.`static`.}
  URI_AUTHORITY*: string {.`static`.}
  URI_PATH*: string {.`static`.}
  URI_PARAM_ID*: string {.`static`.}
  URI_PARAM_REPORT_ID*: string {.`static`.}
  URI_PARAM_CALLING_PACKAGE*: string {.`static`.}
  URI_PARAM_TIMESTAMP*: string {.`static`.}
  URI_PARAM_FLAGS*: string {.`static`.}
  URI_PARAM_RECEIVER_CLASS*: string {.`static`.}
  FLAG_CONFIRMATION_DIALOG*: jint {.`static`.}
  FLAG_ALLOW_CONSENTLESS_BUGREPORT*: jint {.`static`.}
  PRIVACY_POLICY_LOCAL*: jint {.`static`.}
  PRIVACY_POLICY_EXPLICIT*: jint {.`static`.}
  PRIVACY_POLICY_AUTO*: jint {.`static`.}

jclass android.os.IncidentManager.PendingReport* of JVMObject:
  proc getRequestingPackage*(): string
  proc getFlags*(): jint
  proc getTimestamp*(): jlong
  proc getUri*(): Uri
  proc toString*(): string
  proc equals*(obj: JObject): jboolean

jclass android.os.IncidentManager.IncidentReport* of JVMObject:
  proc close*()
  proc getTimestamp*(): jlong
  proc getPrivacyPolicy*(): jlong
  proc getInputStream*(): InputStream
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)

jclass android.os.IncidentManager.AuthListener* of JVMObject:
  proc onReportApproved*()
  proc onReportDenied*()

jclass android.os.IncidentManager.DumpCallback* of JVMObject:
  proc onDumpSection*(id: jint, output:OutputStream)

jclass android.os.PendingReport* of JVMObject:
  proc getRequestingPackage*(): string
  proc getFlags*(): jint
  proc getTimestamp*(): jlong
  proc getUri*(): Uri
  proc toString*(): string
  proc equals*(obj: JObject): jboolean

jclass android.os.IncidentReport* of JVMObject:
  proc close*()
  proc getTimestamp*(): jlong
  proc getPrivacyPolicy*(): jlong
  proc getInputStream*(): InputStream
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[IncidentReport] {.`static`.}

jclass android.os.AuthListener* of JVMObject:
  proc onReportApproved*()
  proc onReportDenied*()

jclass android.os.DumpCallback* of JVMObject:
  proc onDumpSection*(id: jint, output:OutputStream)

