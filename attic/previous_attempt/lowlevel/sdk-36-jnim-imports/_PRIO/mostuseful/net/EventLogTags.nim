import jnim

jclass android.net.EventLogTags* of JVMObject:
  proc writeNtpSuccess*(server: string, rtt: jlong, offset: jlong) {.`static`.}
  proc writeNtpFailure*(server: string, msg: string) {.`static`.}
  NTP_SUCCESS*: jint {.`static`.}
  NTP_FAILURE*: jint {.`static`.}

