import jnim

jclass android.accounts.GrantCredentialsPermissionActivity* of Activity:
  proc onClick*(v: View)
  proc setAccountAuthenticatorResult*(result: Bundle)
  proc finish*()
  EXTRAS_ACCOUNT*: string {.`static`.}
  EXTRAS_AUTH_TOKEN_TYPE*: string {.`static`.}
  EXTRAS_RESPONSE*: string {.`static`.}
  EXTRAS_REQUESTING_UID*: string {.`static`.}

