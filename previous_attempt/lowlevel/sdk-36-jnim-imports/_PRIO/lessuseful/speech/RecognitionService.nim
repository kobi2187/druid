import jnim

jclass android.speech.RecognitionService* of Service:
  proc onCheckRecognitionSupport*(recognizerIntent: Intent, supportCallback: SupportCallback)
  proc onCheckRecognitionSupport*(recognizerIntent: Intent, attributionSource: AttributionSource, supportCallback: SupportCallback)
  proc onTriggerModelDownload*(recognizerIntent: Intent)
  proc onTriggerModelDownload*(recognizerIntent: Intent, attributionSource: AttributionSource)
  proc onTriggerModelDownload*(recognizerIntent: Intent, attributionSource: AttributionSource, listener: ModelDownloadListener)
  proc createContext*(contextParams: ContextParams): Context
  proc onBind*(intent: Intent): IBinder
  proc onBindInternal*()
  proc onDestroy*()
  proc getMaxConcurrentSessionsCount*(): jint
  SERVICE_INTERFACE*: string {.`static`.}
  SERVICE_META_DATA*: string {.`static`.}

jclass android.speech.RecognitionService.Callback* of JVMObject:
  proc beginningOfSpeech*()
  proc bufferReceived*(buffer: seq[jbyte])
  proc endOfSpeech*()
  proc error*(error: jint)
  proc partialResults*(partialResults: Bundle)
  proc readyForSpeech*(params: Bundle)
  proc results*(results: Bundle)
  proc rmsChanged*(rmsdB: jfloat)
  proc segmentResults*(results: Bundle)
  proc endOfSegmentedSession*()
  proc languageDetection*(results: Bundle)
  proc getCallingUid*(): jint
  proc getCallingAttributionSource*(): AttributionSource

jclass android.speech.RecognitionService.SupportCallback* of JVMObject:
  proc onSupportResult*(recognitionSupport: RecognitionSupport)
  proc onError*(errorCode: jint)

jclass android.speech.Callback* of JVMObject:
  proc beginningOfSpeech*()
  proc bufferReceived*(buffer: seq[jbyte])
  proc endOfSpeech*()
  proc error*(error: jint)
  proc partialResults*(partialResults: Bundle)
  proc readyForSpeech*(params: Bundle)
  proc results*(results: Bundle)
  proc rmsChanged*(rmsdB: jfloat)
  proc segmentResults*(results: Bundle)
  proc endOfSegmentedSession*()
  proc languageDetection*(results: Bundle)
  proc getCallingUid*(): jint
  proc getCallingAttributionSource*(): AttributionSource

jclass android.speech.SupportCallback* of JVMObject:
  proc onSupportResult*(recognitionSupport: RecognitionSupport)
  proc onError*(errorCode: jint)

