import jnim

jclass android.speech.SpeechRecognizer* of JVMObject:
  proc isRecognitionAvailable*(context: Context): jboolean {.`static`.}
  proc isOnDeviceRecognitionAvailable*(context: Context): jboolean {.`static`.}
  proc createSpeechRecognizer*(context: Context): SpeechRecognizer {.`static`.}
  proc createSpeechRecognizer*(context: Context, serviceComponent: ComponentName): SpeechRecognizer {.`static`.}
  proc createOnDeviceSpeechRecognizer*(context: Context): SpeechRecognizer {.`static`.}
  proc createOnDeviceTestingSpeechRecognizer*(context: Context): SpeechRecognizer {.`static`.}
  proc setRecognitionListener*(listener: RecognitionListener)
  proc startListening*(recognizerIntent: Intent)
  proc stopListening*()
  proc cancel*()
  proc checkRecognitionSupport*(recognizerIntent: Intent, executor: Executor, supportListener: RecognitionSupportCallback)
  proc triggerModelDownload*(recognizerIntent: Intent)
  proc triggerModelDownload*(recognizerIntent: Intent, executor: Executor, listener: ModelDownloadListener)
  proc setTemporaryOnDeviceRecognizer*(componentName: ComponentName)
  proc destroy*()
  RESULTS_RECOGNITION*: string {.`static`.}
  CONFIDENCE_SCORES*: string {.`static`.}
  RESULTS_ALTERNATIVES*: string {.`static`.}
  RECOGNITION_PARTS*: string {.`static`.}
  DETECTED_LANGUAGE*: string {.`static`.}
  LANGUAGE_DETECTION_CONFIDENCE_LEVEL*: string {.`static`.}
  LANGUAGE_DETECTION_CONFIDENCE_LEVEL_UNKNOWN*: jint {.`static`.}
  LANGUAGE_DETECTION_CONFIDENCE_LEVEL_NOT_CONFIDENT*: jint {.`static`.}
  LANGUAGE_DETECTION_CONFIDENCE_LEVEL_CONFIDENT*: jint {.`static`.}
  LANGUAGE_DETECTION_CONFIDENCE_LEVEL_HIGHLY_CONFIDENT*: jint {.`static`.}
  TOP_LOCALE_ALTERNATIVES*: string {.`static`.}
  LANGUAGE_SWITCH_RESULT*: string {.`static`.}
  LANGUAGE_SWITCH_RESULT_NOT_ATTEMPTED*: jint {.`static`.}
  LANGUAGE_SWITCH_RESULT_SUCCEEDED*: jint {.`static`.}
  LANGUAGE_SWITCH_RESULT_FAILED*: jint {.`static`.}
  LANGUAGE_SWITCH_RESULT_SKIPPED_NO_MODEL*: jint {.`static`.}
  ERROR_NETWORK_TIMEOUT*: jint {.`static`.}
  ERROR_NETWORK*: jint {.`static`.}
  ERROR_AUDIO*: jint {.`static`.}
  ERROR_SERVER*: jint {.`static`.}
  ERROR_CLIENT*: jint {.`static`.}
  ERROR_SPEECH_TIMEOUT*: jint {.`static`.}
  ERROR_NO_MATCH*: jint {.`static`.}
  ERROR_RECOGNIZER_BUSY*: jint {.`static`.}
  ERROR_INSUFFICIENT_PERMISSIONS*: jint {.`static`.}
  ERROR_TOO_MANY_REQUESTS*: jint {.`static`.}
  ERROR_SERVER_DISCONNECTED*: jint {.`static`.}
  ERROR_LANGUAGE_NOT_SUPPORTED*: jint {.`static`.}
  ERROR_LANGUAGE_UNAVAILABLE*: jint {.`static`.}
  ERROR_CANNOT_CHECK_SUPPORT*: jint {.`static`.}
  ERROR_CANNOT_LISTEN_TO_DOWNLOAD_EVENTS*: jint {.`static`.}

