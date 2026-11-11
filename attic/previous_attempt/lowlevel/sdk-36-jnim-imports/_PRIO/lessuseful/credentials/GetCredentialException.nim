import jnim

jclass android.credentials.GetCredentialException* of Exception:
  proc getType*(): string
  TYPE_UNKNOWN*: string {.`static`.}
  TYPE_NO_CREDENTIAL*: string {.`static`.}
  TYPE_USER_CANCELED*: string {.`static`.}
  TYPE_INTERRUPTED*: string {.`static`.}

