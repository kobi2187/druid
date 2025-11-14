import jnim

jclass android.telephony.NetworkService* of Service:
  proc onCreateNetworkServiceProvider*(slotIndex: jint): NetworkServiceProvider
  proc onBind*(intent: Intent): IBinder
  proc onUnbind*(intent: Intent): jboolean
  proc onDestroy*()
  SERVICE_INTERFACE*: string {.`static`.}
  mBinder*: INetworkServiceWrapper

jclass android.telephony.NetworkService.NetworkServiceProvider* of JVMObject:
  proc getSlotIndex*(): jint
  proc requestNetworkRegistrationInfo*(domain: jint, callback: NetworkServiceCallback)
  proc notifyNetworkRegistrationInfoChanged*()
  proc close*()

jclass android.telephony.NetworkServiceProvider* of JVMObject:
  proc getSlotIndex*(): jint
  proc requestNetworkRegistrationInfo*(domain: jint, callback: NetworkServiceCallback)
  proc notifyNetworkRegistrationInfoChanged*()
  proc close*()

