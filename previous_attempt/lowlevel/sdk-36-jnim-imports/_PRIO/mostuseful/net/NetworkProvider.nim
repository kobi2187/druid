import jnim

jclass android.net.NetworkProvider* of JVMObject:
  proc getMessenger*(): Messenger
  proc getName*(): string
  proc getProviderId*(): jint
  proc setProviderId*(providerId: jint)
  proc onNetworkRequested*(request: NetworkRequest, score: jint, providerId: jint)
  proc onNetworkRequestWithdrawn*(request: NetworkRequest)
  proc declareNetworkRequestUnfulfillable*(request: NetworkRequest)
  proc registerNetworkOffer*(score: NetworkScore, caps: NetworkCapabilities, executor: Executor, callback: NetworkOfferCallback)
  proc unregisterNetworkOffer*(callback: NetworkOfferCallback)
  ID_NONE*: jint {.`static`.}
  FIRST_PROVIDER_ID*: jint {.`static`.}
  CMD_REQUEST_NETWORK*: jint {.`static`.}
  CMD_CANCEL_REQUEST*: jint {.`static`.}

