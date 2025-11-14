import jnim

jclass android.security.CredentialManagementApp* of JVMObject:
  proc getPackageName*(): string
  proc getAuthenticationPolicy*(): AppUriAuthenticationPolicy
  proc setAuthenticationPolicy*(authenticationPolicy: AppUriAuthenticationPolicy)
  proc readFromXml*(parser: XmlPullParser): CredentialManagementApp {.`static`.}
  proc writeToXml*(output:XmlSerializer)

