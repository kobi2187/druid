import jnim

jclass android.federatedcompute.FederatedComputeManager* of JVMObject:
  proc schedule*(request: ScheduleFederatedComputeRequest, executor: Executor, callback: OutcomeReceiver[JObject, Exception])
  proc cancel*(ownerComponent: ComponentName, populationName: string, executor: Executor, callback: OutcomeReceiver[JObject, Exception])
  proc unbindFromService*()
  FEDERATED_COMPUTE_SERVICE*: string {.`static`.}

