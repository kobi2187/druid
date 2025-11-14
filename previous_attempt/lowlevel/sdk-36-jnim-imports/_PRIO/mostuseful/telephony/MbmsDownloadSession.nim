import jnim

jclass android.telephony.MbmsDownloadSession* of JVMObject:
  proc create*(context: Context, executor: Executor, callback: MbmsDownloadSessionCallback): MbmsDownloadSession {.`static`.}
  proc create*(context: Context, executor: Executor, subscriptionId: jint, callback: MbmsDownloadSessionCallback): MbmsDownloadSession {.`static`.}
  proc getMaximumServiceAnnouncementSize*(): jint {.`static`.}
  proc requestUpdateFileServices*(classList: List[string])
  proc addServiceAnnouncement*(contents: seq[jbyte])
  proc setTempFileRootDirectory*(tempFileRootDirectory: File)
  proc getTempFileRootDirectory*(): File
  proc download*(request: DownloadRequest)
  proc listPendingDownloads*(): List[DownloadRequest]
  proc addStatusListener*(request: DownloadRequest, executor: Executor, listener: DownloadStatusListener)
  proc removeStatusListener*(request: DownloadRequest, listener: DownloadStatusListener)
  proc addProgressListener*(request: DownloadRequest, executor: Executor, listener: DownloadProgressListener)
  proc removeProgressListener*(request: DownloadRequest, listener: DownloadProgressListener)
  proc cancelDownload*(downloadRequest: DownloadRequest)
  proc requestDownloadState*(downloadRequest: DownloadRequest, fileInfo: FileInfo)
  proc resetDownloadKnowledge*(downloadRequest: DownloadRequest)
  proc close*()
  MBMS_DOWNLOAD_SERVICE_ACTION*: string {.`static`.}
  MBMS_DOWNLOAD_SERVICE_OVERRIDE_METADATA*: string {.`static`.}
  EXTRA_MBMS_DOWNLOAD_RESULT*: string {.`static`.}
  EXTRA_MBMS_FILE_INFO*: string {.`static`.}
  EXTRA_MBMS_COMPLETED_FILE_URI*: string {.`static`.}
  EXTRA_MBMS_DOWNLOAD_REQUEST*: string {.`static`.}
  DEFAULT_TOP_LEVEL_TEMP_DIRECTORY*: string {.`static`.}
  RESULT_SUCCESSFUL*: jint {.`static`.}
  RESULT_CANCELLED*: jint {.`static`.}
  RESULT_EXPIRED*: jint {.`static`.}
  RESULT_IO_ERROR*: jint {.`static`.}
  RESULT_SERVICE_ID_NOT_DEFINED*: jint {.`static`.}
  RESULT_DOWNLOAD_FAILURE*: jint {.`static`.}
  RESULT_OUT_OF_STORAGE*: jint {.`static`.}
  RESULT_FILE_ROOT_UNREACHABLE*: jint {.`static`.}
  STATUS_UNKNOWN*: jint {.`static`.}
  STATUS_ACTIVELY_DOWNLOADING*: jint {.`static`.}
  STATUS_PENDING_DOWNLOAD*: jint {.`static`.}
  STATUS_PENDING_REPAIR*: jint {.`static`.}
  STATUS_PENDING_DOWNLOAD_WINDOW*: jint {.`static`.}

