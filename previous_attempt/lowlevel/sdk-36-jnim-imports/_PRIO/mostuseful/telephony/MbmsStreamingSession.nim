import jnim

jclass android.telephony.MbmsStreamingSession* of JVMObject:
  proc create*(context: Context, executor: Executor, subscriptionId: jint, callback: MbmsStreamingSessionCallback): MbmsStreamingSession {.`static`.}
  proc create*(context: Context, executor: Executor, callback: MbmsStreamingSessionCallback): MbmsStreamingSession {.`static`.}
  proc close*()
  proc requestUpdateStreamingServices*(serviceClassList: List[string])
  proc startStreaming*(serviceInfo: StreamingServiceInfo, executor: Executor, callback: StreamingServiceCallback): StreamingService
  proc onStreamingServiceStopped*(service: StreamingService)
  MBMS_STREAMING_SERVICE_ACTION*: string {.`static`.}
  MBMS_STREAMING_SERVICE_OVERRIDE_METADATA*: string {.`static`.}

