import jnim

jclass android.telecom.CallRedirectionService* of Service:
  proc onPlaceCall*(handle: Uri, initialPhoneAccount: PhoneAccountHandle, allowInteractiveResponse: jboolean)
  proc onRedirectionTimeout*()
  proc placeCallUnmodified*()
  proc redirectCall*(gatewayUri: Uri, targetPhoneAccount: PhoneAccountHandle, confirmFirst: jboolean)
  proc cancelCall*()
  proc onBind*(intent: Intent): IBinder
  proc onUnbind*(intent: Intent): jboolean
  SERVICE_INTERFACE*: string {.`static`.}

