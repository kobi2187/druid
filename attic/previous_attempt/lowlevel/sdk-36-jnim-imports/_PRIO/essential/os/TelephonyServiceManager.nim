import jnim

jclass android.os.TelephonyServiceManager* of JVMObject:
  proc getTelephonyServiceRegisterer*(): ServiceRegisterer
  proc getTelephonyImsServiceRegisterer*(): ServiceRegisterer
  proc getTelephonyRcsMessageServiceRegisterer*(): ServiceRegisterer
  proc getSubscriptionServiceRegisterer*(): ServiceRegisterer
  proc getPhoneSubServiceRegisterer*(): ServiceRegisterer
  proc getOpportunisticNetworkServiceRegisterer*(): ServiceRegisterer
  proc getCarrierConfigServiceRegisterer*(): ServiceRegisterer
  proc getSmsServiceRegisterer*(): ServiceRegisterer
  proc getEuiccControllerService*(): ServiceRegisterer
  proc getEuiccCardControllerServiceRegisterer*(): ServiceRegisterer
  proc getIccPhoneBookServiceRegisterer*(): ServiceRegisterer

jclass android.os.TelephonyServiceManager.ServiceRegisterer* of JVMObject:
  proc register*(service: IBinder)
  proc get*(): IBinder
  proc getOrThrow*(): IBinder
  proc tryGet*(): IBinder

jclass android.os.ServiceRegisterer* of JVMObject:
  proc register*(service: IBinder)
  proc get*(): IBinder
  proc getOrThrow*(): IBinder
  proc tryGet*(): IBinder

jclass android.os.ServiceNotFoundException* of ServiceNotFoundException:

