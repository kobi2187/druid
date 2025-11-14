import jnim

jclass android.accounts.AbstractAccountAuthenticator* of JVMObject:
  proc getIBinder*(): IBinder
  proc editProperties*(response: AccountAuthenticatorResponse, accountType: string): Bundle
  proc addAccount*(response: AccountAuthenticatorResponse, accountType: string, authTokenType: string, requiredFeatures: seq[string], options: Bundle): Bundle
  proc confirmCredentials*(response: AccountAuthenticatorResponse, account: Account, options: Bundle): Bundle
  proc getAuthToken*(response: AccountAuthenticatorResponse, account: Account, authTokenType: string, options: Bundle): Bundle
  proc getAuthTokenLabel*(authTokenType: string): string
  proc updateCredentials*(response: AccountAuthenticatorResponse, account: Account, authTokenType: string, options: Bundle): Bundle
  proc hasFeatures*(response: AccountAuthenticatorResponse, account: Account, features: seq[string]): Bundle
  proc getAccountRemovalAllowed*(response: AccountAuthenticatorResponse, account: Account): Bundle
  proc getAccountCredentialsForCloning*(response: AccountAuthenticatorResponse, account: Account): Bundle
  proc addAccountFromCredentials*(response: AccountAuthenticatorResponse, account: Account, accountCredentials: Bundle): Bundle
  proc startAddAccountSession*(response: AccountAuthenticatorResponse, accountType: string, authTokenType: string, requiredFeatures: seq[string], options: Bundle): Bundle
  proc startUpdateCredentialsSession*(response: AccountAuthenticatorResponse, account: Account, authTokenType: string, options: Bundle): Bundle
  proc finishSession*(response: AccountAuthenticatorResponse, accountType: string, sessionBundle: Bundle): Bundle
  proc isCredentialsUpdateSuggested*(response: AccountAuthenticatorResponse, account: Account, statusToken: string): Bundle
  KEY_CUSTOM_TOKEN_EXPIRY*: string {.`static`.}

