import jnim

jclass android.ranging.RangingSessionManager* of Stub:
  proc registerOobSendDataListener*()
  proc onOpened*(session: SessionHandle)
  proc onOpenFailed*(session: SessionHandle, reason: jint)
  proc onStarted*(session: SessionHandle, peer: RangingDevice, technology: jint)
  proc onResults*(session: SessionHandle, peer: RangingDevice, data: RangingData)
  proc onStopped*(session: SessionHandle, peer: RangingDevice, technology: jint)
  proc onClosed*(session: SessionHandle, reason: jint)
  proc oobDataReceived*(oobHandle: OobHandle, data: seq[jbyte])
  proc deviceOobReconnected*(oobHandle: OobHandle)
  proc deviceOobDisconnected*(oobHandle: OobHandle)
  proc deviceOobClosed*(oobHandle: OobHandle)

