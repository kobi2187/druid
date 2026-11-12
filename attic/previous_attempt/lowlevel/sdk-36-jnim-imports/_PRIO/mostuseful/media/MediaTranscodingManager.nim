import jnim

jclass android.media.MediaTranscodingManager* of JVMObject:
  proc enqueueRequest*(transcodingRequest: TranscodingRequest, listenerExecutor: Executor, listener: OnTranscodingFinishedListener): TranscodingSession

jclass android.media.MediaTranscodingManager.TranscodingRequest* of JVMObject:
  proc getType*(): jint
  proc getSourceUri*(): Uri
  proc getSourceFileDescriptor*(): ParcelFileDescriptor
  proc getClientUid*(): jint
  proc getClientPid*(): jint
  proc getDestinationUri*(): Uri
  proc getDestinationFileDescriptor*(): ParcelFileDescriptor
  proc getPriority*(): jint
  proc getTestConfig*(): TranscodingTestConfig

jclass android.media.MediaTranscodingManager.VideoTranscodingRequest* of JVMObject:
  proc getVideoTrackFormat*(): MediaFormat

jclass android.media.MediaTranscodingManager.TranscodingSession* of JVMObject:
  proc setOnProgressUpdateListener*(executor: Executor, listener: OnProgressUpdateListener)
  proc clearOnProgressUpdateListener*()
  proc getErrorCode*(): jint
  proc retry*(): jboolean
  proc cancel*()
  proc getProgress*(): jint
  proc getStatus*(): jint
  proc addClientUid*(uid: jint): jboolean
  proc getClientUids*(): List[Integer]
  proc getSessionId*(): jint
  proc getResult*(): jint
  proc toString*(): string


jclass android.media.TranscodingRequest* of JVMObject:
  proc getType*(): jint
  proc getSourceUri*(): Uri
  proc getSourceFileDescriptor*(): ParcelFileDescriptor
  proc getClientUid*(): jint
  proc getClientPid*(): jint
  proc getDestinationUri*(): Uri
  proc getDestinationFileDescriptor*(): ParcelFileDescriptor
  proc getPriority*(): jint
  proc getTestConfig*(): TranscodingTestConfig
  TRANSCODING_TYPE_UNKNOWN*: jint {.`static`.}
  TRANSCODING_TYPE_VIDEO*: jint {.`static`.}
  TRANSCODING_TYPE_IMAGE*: jint {.`static`.}
  PRIORITY_UNKNOWN*: jint {.`static`.}
  PRIORITY_REALTIME*: jint {.`static`.}
  PRIORITY_OFFLINE*: jint {.`static`.}

jclass android.media.TranscodingRequest.VideoFormatResolver* of JVMObject:
  proc shouldTranscode*(): jboolean
  proc resolveVideoFormat*(): MediaFormat
  proc resolveAudioFormat*(): MediaFormat

jclass android.media.VideoFormatResolver* of MediaFormatResolver:
  proc shouldTranscode*(): jboolean
  proc resolveVideoFormat*(): MediaFormat
  proc resolveAudioFormat*(): MediaFormat

jclass android.media.VideoTranscodingRequest* of TranscodingRequest:
  proc getVideoTrackFormat*(): MediaFormat

jclass android.media.VideoTranscodingRequest.Builder* of JVMObject:
  proc setClientUid*(uid: jint): Builder
  proc setClientPid*(pid: jint): Builder
  proc setSourceFileDescriptor*(fd: ParcelFileDescriptor): Builder
  proc setDestinationFileDescriptor*(fd: ParcelFileDescriptor): Builder
  proc build*(): VideoTranscodingRequest

jclass android.media.Builder* of Builder:
  proc setClientUid*(uid: jint): Builder
  proc setClientPid*(pid: jint): Builder
  proc setSourceFileDescriptor*(fd: ParcelFileDescriptor): Builder
  proc setDestinationFileDescriptor*(fd: ParcelFileDescriptor): Builder
  proc build*(): VideoTranscodingRequest

jclass android.media.TranscodingSession* of JVMObject:
  proc setOnProgressUpdateListener*(executor: Executor, listener: OnProgressUpdateListener)
  proc clearOnProgressUpdateListener*()
  proc getErrorCode*(): jint
  proc retry*(): jboolean
  proc cancel*()
  proc getProgress*(): jint
  proc getStatus*(): jint
  proc addClientUid*(uid: jint): jboolean
  proc getClientUids*(): List[Integer]
  proc getSessionId*(): jint
  proc getResult*(): jint
  proc toString*(): string
  STATUS_PENDING*: jint {.`static`.}
  STATUS_RUNNING*: jint {.`static`.}
  STATUS_FINISHED*: jint {.`static`.}
  STATUS_PAUSED*: jint {.`static`.}
  RESULT_NONE*: jint {.`static`.}
  RESULT_SUCCESS*: jint {.`static`.}
  RESULT_ERROR*: jint {.`static`.}
  RESULT_CANCELED*: jint {.`static`.}
  ERROR_NONE*: jint {.`static`.}
  ERROR_DROPPED_BY_SERVICE*: jint {.`static`.}
  ERROR_SERVICE_DIED*: jint {.`static`.}

