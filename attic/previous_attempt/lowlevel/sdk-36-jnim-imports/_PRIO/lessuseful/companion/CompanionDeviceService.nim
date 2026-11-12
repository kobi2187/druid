import jnim

jclass android.companion.CompanionDeviceService* of Service:
  proc onDeviceAppeared*(address: string)
  proc onDeviceDisappeared*(address: string)
  proc onMessageDispatchedFromSystem*(messageId: jint, associationId: jint, message: seq[jbyte])
  proc dispatchMessageToSystem*(messageId: jint, associationId: jint, message: seq[jbyte])
  proc attachSystemDataTransport*(associationId: jint, in: InputStream, output:OutputStream)
  proc detachSystemDataTransport*(associationId: jint)
  proc onDeviceAppeared*(associationInfo: AssociationInfo)
  proc onDeviceDisappeared*(associationInfo: AssociationInfo)
  proc onDevicePresenceEvent*(event: DevicePresenceEvent)
  proc onBind*(intent: Intent): IBinder
  proc onBindCompanionDeviceService*(intent: Intent)
  SERVICE_INTERFACE*: string {.`static`.}

