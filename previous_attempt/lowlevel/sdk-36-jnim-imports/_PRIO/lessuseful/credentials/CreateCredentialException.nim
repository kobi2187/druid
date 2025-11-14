import jnim

jclass android.credentials.CreateCredentialException* of Exception:
  proc getType*(): string
  TYPE_UNKNOWN*: string {.`static`.}
  TYPE_NO_CREATE_OPTIONS*: string {.`static`.}
  TYPE_USER_CANCELED*: string {.`static`.}
  TYPE_INTERRUPTED*: string {.`static`.}

