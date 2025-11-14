import jnim

jclass android.net.QosCallbackConnection* of Stub:
  proc getCallback*(): QosCallback
  proc onQosEpsBearerSessionAvailable*(session: QosSession, attributes: EpsBearerQosSessionAttributes)
  proc onNrQosSessionAvailable*(session: QosSession, attributes: NrQosSessionAttributes)
  proc onQosSessionLost*(session: QosSession)
  proc onError*(errorType: jint)
  proc stopReceivingMessages*()

