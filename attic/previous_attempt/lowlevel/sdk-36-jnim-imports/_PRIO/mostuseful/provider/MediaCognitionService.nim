import jnim

jclass android.provider.MediaCognitionService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc onProcessMedia*(requests: List[MediaCognitionProcessingRequest], cancellationSignal: CancellationSignal, callback: MediaCognitionProcessingCallback)
  proc onGetProcessingVersions*(callback: MediaCognitionGetVersionsCallback)
  TAG*: string {.`static`.}
  SERVICE_INTERFACE*: string {.`static`.}
  BIND_MEDIA_COGNITION_SERVICE*: string {.`static`.}

jclass android.provider.ProcessingTypes* of JVMObject:
  IMAGE_OCR_LATIN*: jint {.`static`.}
  IMAGE_LABEL*: jint {.`static`.}

