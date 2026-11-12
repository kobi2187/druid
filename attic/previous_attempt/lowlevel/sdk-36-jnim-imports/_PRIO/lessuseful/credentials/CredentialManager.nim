import jnim

jclass android.credentials.CredentialManager* of JVMObject:
  proc getCandidateCredentials*(request: GetCredentialRequest, callingPackage: string, cancellationSignal: CancellationSignal, executor: Executor, callback: OutcomeReceiver[GetCandidateCredentialsResponse, GetCandidateCredentialsException], clientCallback: IBinder)
  proc getCredential*(context: Context, request: GetCredentialRequest, cancellationSignal: CancellationSignal, executor: Executor, callback: OutcomeReceiver[GetCredentialResponse, GetCredentialException])
  proc getCredential*(context: Context, pendingGetCredentialHandle: PrepareGetCredentialResponse.PendingGetCredentialHandle, cancellationSignal: CancellationSignal, executor: Executor, callback: OutcomeReceiver[GetCredentialResponse, GetCredentialException])
  proc prepareGetCredential*(request: GetCredentialRequest, cancellationSignal: CancellationSignal, executor: Executor, callback: OutcomeReceiver[PrepareGetCredentialResponse, GetCredentialException])
  proc createCredential*(context: Context, request: CreateCredentialRequest, cancellationSignal: CancellationSignal, executor: Executor, callback: OutcomeReceiver[CreateCredentialResponse, CreateCredentialException])
  proc clearCredentialState*(request: ClearCredentialStateRequest, cancellationSignal: CancellationSignal, executor: Executor, callback: OutcomeReceiver[Void, ClearCredentialStateException])
  proc setEnabledProviders*(primaryProviders: List[string], providers: List[string], userId: jint, executor: Executor, callback: OutcomeReceiver[Void, SetEnabledProvidersException])
  proc isEnabledCredentialProviderService*(componentName: ComponentName): jboolean
  proc getCredentialProviderServicesForTesting*(providerFilter: jint): List[CredentialProviderInfo]
  proc getCredentialProviderServices*(userId: jint, providerFilter: jint): List[CredentialProviderInfo]
  proc isServiceEnabled*(context: Context): jboolean {.`static`.}
  proc isCredentialDescriptionApiEnabled*(context: Context): jboolean {.`static`.}
  proc registerCredentialDescription*(request: RegisterCredentialDescriptionRequest)
  proc unregisterCredentialDescription*(request: UnregisterCredentialDescriptionRequest)
  TAG*: string {.`static`.}
  PROVIDER_FILTER_ALL_PROVIDERS*: jint {.`static`.}
  PROVIDER_FILTER_SYSTEM_PROVIDERS_ONLY*: jint {.`static`.}
  PROVIDER_FILTER_USER_PROVIDERS_ONLY*: jint {.`static`.}
  PROVIDER_FILTER_USER_PROVIDERS_INCLUDING_HIDDEN*: jint {.`static`.}
  DEVICE_CONFIG_ENABLE_CREDENTIAL_MANAGER*: string {.`static`.}
  EXTRA_AUTOFILL_RESULT_RECEIVER*: string {.`static`.}

