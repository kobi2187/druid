import jnim

jclass android.view.ViewCredentialHandler* of JVMObject:
  proc getRequest*(): GetCredentialRequest
  proc getCallback*(): OutcomeReceiver[GetCredentialResponse, GetCredentialException]

