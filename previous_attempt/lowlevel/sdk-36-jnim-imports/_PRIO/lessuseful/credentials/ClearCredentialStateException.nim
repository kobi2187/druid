import jnim

jclass android.credentials.ClearCredentialStateException* of Exception:
  proc getType*(): string
  TYPE_UNKNOWN*: string {.`static`.}

