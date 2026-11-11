import jnim

jclass android.telecom.CallStreamingService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc onCallStreamingStarted*(call: StreamingCall)
  proc onCallStreamingStopped*()
  proc onCallStreamingStateChanged*(state: jint)
  SERVICE_INTERFACE*: string {.`static`.}
  STREAMING_FAILED_UNKNOWN*: jint {.`static`.}
  STREAMING_FAILED_ALREADY_STREAMING*: jint {.`static`.}
  STREAMING_FAILED_NO_SENDER*: jint {.`static`.}
  STREAMING_FAILED_SENDER_BINDING_ERROR*: jint {.`static`.}

