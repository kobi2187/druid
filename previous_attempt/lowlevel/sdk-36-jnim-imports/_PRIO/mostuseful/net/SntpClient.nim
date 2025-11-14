import jnim

jclass android.net.SntpClient* of JVMObject:
  proc requestTime*(host: string, port: jint, timeout: jint, network: Network): jboolean
  proc requestTime*(address: InetAddress, port: jint, timeout: jint, network: Network): jboolean
  proc calculateClockOffset*(clientRequestTimestamp: Timestamp64, serverReceiveTimestamp: Timestamp64, serverTransmitTimestamp: Timestamp64, clientResponseTimestamp: Timestamp64): Duration {.`static`.}
  proc requestTime*(host: string, timeout: jint): jboolean
  proc getClockOffset*(): jlong
  proc getNtpTime*(): jlong
  proc getNtpTimeReference*(): jlong
  proc getRoundTripTime*(): jlong
  proc getServerSocketAddress*(): InetSocketAddress
  STANDARD_NTP_PORT*: jint {.`static`.}

