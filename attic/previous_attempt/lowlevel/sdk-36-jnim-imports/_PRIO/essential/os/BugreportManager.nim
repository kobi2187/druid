import jnim

jclass android.os.BugreportManager* of JVMObject:
  proc preDumpUiData*()
  proc startBugreport*(bugreportFd: ParcelFileDescriptor, screenshotFd: ParcelFileDescriptor, params: BugreportParams, executor: Executor, callback: BugreportCallback)
  proc retrieveBugreport*(bugreportFile: string, bugreportFd: ParcelFileDescriptor, executor: Executor, callback: BugreportCallback)
  proc startConnectivityBugreport*(bugreportFd: ParcelFileDescriptor, executor: Executor, callback: BugreportCallback)
  proc cancelBugreport*()
  proc requestBugreport*(params: BugreportParams, shareTitle: CharSequence, shareDescription: CharSequence)

jclass android.os.BugreportManager.BugreportCallback* of JVMObject:
  proc onProgress*(progress: jfloat)
  proc onError*(errorCode: jint)
  proc onFinished*()
  proc onFinished*(bugreportFile: string)
  proc onEarlyReportFinished*()

jclass android.os.BugreportCallback* of JVMObject:
  proc onProgress*(progress: jfloat)
  proc onError*(errorCode: jint)
  proc onFinished*()
  proc onFinished*(bugreportFile: string)
  proc onEarlyReportFinished*()
  BUGREPORT_ERROR_INVALID_INPUT*: jint {.`static`.}
  BUGREPORT_ERROR_RUNTIME*: jint {.`static`.}
  BUGREPORT_ERROR_USER_DENIED_CONSENT*: jint {.`static`.}
  BUGREPORT_ERROR_USER_CONSENT_TIMED_OUT*: jint {.`static`.}
  BUGREPORT_ERROR_ANOTHER_REPORT_IN_PROGRESS*: jint {.`static`.}
  BUGREPORT_ERROR_NO_BUGREPORT_TO_RETRIEVE*: jint {.`static`.}

