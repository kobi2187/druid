import jnim

jclass android.accounts.AccountManager* of JVMObject:
  proc sanitizeResult*(result: Bundle): Bundle {.`static`.}
  proc get*(context: Context): AccountManager {.`static`.}
  proc getPassword*(account: Account): string
  proc getUserData*(account: Account, key: string): string
  proc getAuthenticatorTypes*(): seq[AuthenticatorDescription]
  proc getAuthenticatorTypesAsUser*(userId: jint): seq[AuthenticatorDescription]
  proc getAccounts*(): seq[Account]
  proc getAccountsAsUser*(userId: jint): seq[Account]
  proc getAccountsForPackage*(packageName: string, uid: jint): seq[Account]
  proc getAccountsByTypeForPackage*(type: string, packageName: string): seq[Account]
  proc getAccountsByType*(type: string): seq[Account]
  proc getAccountsByTypeAsUser*(type: string, userHandle: UserHandle): seq[Account]
  proc updateAppPermission*(account: Account, authTokenType: string, uid: jint, value: jboolean)
  proc getAuthTokenLabel*(accountType: string, authTokenType: string, callback: AccountManagerCallback[string], handler: Handler): AccountManagerFuture[string]
  proc hasFeatures*(account: Account, features: seq[string], callback: AccountManagerCallback[Boolean], handler: Handler): AccountManagerFuture[Boolean]
  proc getAccountsByTypeAndFeatures*(type: string, features: seq[string], callback: AccountManagerCallback[seq[Account]], handler: Handler): AccountManagerFuture[seq[Account]]
  proc addAccountExplicitly*(account: Account, password: string, userdata: Bundle): jboolean
  proc addAccountExplicitly*(account: Account, password: string, extras: Bundle, visibility: Map[string, Integer]): jboolean
  proc getPackagesAndVisibilityForAccount*(account: Account): Map[string, Integer]
  proc getAccountsAndVisibilityForPackage*(packageName: string, accountType: string): Map[Account, Integer]
  proc setAccountVisibility*(account: Account, packageName: string, visibility: jint): jboolean
  proc getAccountVisibility*(account: Account, packageName: string): jint
  proc notifyAccountAuthenticated*(account: Account): jboolean
  proc renameAccount*(account: Account, newName: string, callback: AccountManagerCallback[Account], handler: Handler): AccountManagerFuture[Account]
  proc getPreviousName*(account: Account): string
  proc removeAccount*(account: Account, callback: AccountManagerCallback[Boolean], handler: Handler): AccountManagerFuture[Boolean]
  proc removeAccount*(account: Account, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc removeAccountAsUser*(account: Account, callback: AccountManagerCallback[Boolean], handler: Handler, userHandle: UserHandle): AccountManagerFuture[Boolean]
  proc removeAccountAsUser*(account: Account, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler, userHandle: UserHandle): AccountManagerFuture[Bundle]
  proc removeAccountExplicitly*(account: Account): jboolean
  proc invalidateAuthToken*(accountType: string, authToken: string)
  proc peekAuthToken*(account: Account, authTokenType: string): string
  proc setPassword*(account: Account, password: string)
  proc clearPassword*(account: Account)
  proc setUserData*(account: Account, key: string, value: string)
  proc setAuthToken*(account: Account, authTokenType: string, authToken: string)
  proc blockingGetAuthToken*(account: Account, authTokenType: string, notifyAuthFailure: jboolean): string
  proc getAuthToken*(account: Account, authTokenType: string, options: Bundle, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc getAuthToken*(account: Account, authTokenType: string, notifyAuthFailure: jboolean, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc getAuthToken*(account: Account, authTokenType: string, options: Bundle, notifyAuthFailure: jboolean, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc addAccount*(accountType: string, authTokenType: string, requiredFeatures: seq[string], addAccountOptions: Bundle, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc addAccountAsUser*(accountType: string, authTokenType: string, requiredFeatures: seq[string], addAccountOptions: Bundle, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler, userHandle: UserHandle): AccountManagerFuture[Bundle]
  proc addSharedAccountsFromParentUser*(parentUser: UserHandle, user: UserHandle)
  proc copyAccountToUser*(account: Account, fromUser: UserHandle, toUser: UserHandle, handler: Handler, callback: AccountManagerCallback[Boolean]): AccountManagerFuture[Boolean]
  proc confirmCredentials*(account: Account, options: Bundle, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc confirmCredentialsAsUser*(account: Account, options: Bundle, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler, userHandle: UserHandle): AccountManagerFuture[Bundle]
  proc updateCredentials*(account: Account, authTokenType: string, options: Bundle, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc editProperties*(accountType: string, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc someUserHasAccount*(account: Account): jboolean
  proc getAuthTokenByFeatures*(accountType: string, authTokenType: string, features: seq[string], activity: Activity, addAccountOptions: Bundle, getAuthTokenOptions: Bundle, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc newChooseAccountIntent*(selectedAccount: Account, allowableAccounts: ArrayList[Account], allowableAccountTypes: seq[string], alwaysPromptForAccount: jboolean, descriptionOverrideText: string, addAccountAuthTokenType: string, addAccountRequiredFeatures: seq[string], addAccountOptions: Bundle): Intent {.`static`.}
  proc newChooseAccountIntent*(selectedAccount: Account, allowableAccounts: List[Account], allowableAccountTypes: seq[string], descriptionOverrideText: string, addAccountAuthTokenType: string, addAccountRequiredFeatures: seq[string], addAccountOptions: Bundle): Intent {.`static`.}
  proc addOnAccountsUpdatedListener*(listener: OnAccountsUpdateListener, handler: Handler, updateImmediately: jboolean)
  proc addOnAccountsUpdatedListener*(listener: OnAccountsUpdateListener, handler: Handler, updateImmediately: jboolean, accountTypes: seq[string])
  proc removeOnAccountsUpdatedListener*(listener: OnAccountsUpdateListener)
  proc startAddAccountSession*(accountType: string, authTokenType: string, requiredFeatures: seq[string], options: Bundle, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc startUpdateCredentialsSession*(account: Account, authTokenType: string, options: Bundle, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc finishSession*(sessionBundle: Bundle, activity: Activity, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc finishSessionAsUser*(sessionBundle: Bundle, activity: Activity, userHandle: UserHandle, callback: AccountManagerCallback[Bundle], handler: Handler): AccountManagerFuture[Bundle]
  proc isCredentialsUpdateSuggested*(account: Account, statusToken: string, callback: AccountManagerCallback[Boolean], handler: Handler): AccountManagerFuture[Boolean]
  proc hasAccountAccess*(account: Account, packageName: string, userHandle: UserHandle): jboolean
  proc createRequestAccountAccessIntentSenderAsUser*(account: Account, packageName: string, userHandle: UserHandle): IntentSender
  proc invalidateLocalAccountsDataCaches*() {.`static`.}
  proc disableLocalAccountCaches*()
  proc invalidateLocalAccountUserDataCaches*() {.`static`.}
  proc disableLocalUserInfoCaches*()
  ERROR_CODE_REMOTE_EXCEPTION*: jint {.`static`.}
  ERROR_CODE_NETWORK_ERROR*: jint {.`static`.}
  ERROR_CODE_CANCELED*: jint {.`static`.}
  ERROR_CODE_INVALID_RESPONSE*: jint {.`static`.}
  ERROR_CODE_UNSUPPORTED_OPERATION*: jint {.`static`.}
  ERROR_CODE_BAD_ARGUMENTS*: jint {.`static`.}
  ERROR_CODE_BAD_REQUEST*: jint {.`static`.}
  ERROR_CODE_BAD_AUTHENTICATION*: jint {.`static`.}
  ERROR_CODE_USER_RESTRICTED*: jint {.`static`.}
  ERROR_CODE_MANAGEMENT_DISABLED_FOR_ACCOUNT_TYPE*: jint {.`static`.}
  KEY_ACCOUNT_NAME*: string {.`static`.}
  KEY_ACCOUNT_TYPE*: string {.`static`.}
  KEY_ACCOUNT_ACCESS_ID*: string {.`static`.}
  KEY_AUTHTOKEN*: string {.`static`.}
  KEY_INTENT*: string {.`static`.}
  KEY_PASSWORD*: string {.`static`.}
  KEY_ACCOUNTS*: string {.`static`.}
  KEY_ACCOUNT_AUTHENTICATOR_RESPONSE*: string {.`static`.}
  KEY_ACCOUNT_MANAGER_RESPONSE*: string {.`static`.}
  KEY_AUTHENTICATOR_TYPES*: string {.`static`.}
  KEY_AUTH_FAILED_MESSAGE*: string {.`static`.}
  KEY_AUTH_TOKEN_LABEL*: string {.`static`.}
  KEY_BOOLEAN_RESULT*: string {.`static`.}
  KEY_ERROR_CODE*: string {.`static`.}
  KEY_ERROR_MESSAGE*: string {.`static`.}
  KEY_USERDATA*: string {.`static`.}
  KEY_LAST_AUTHENTICATED_TIME*: string {.`static`.}
  KEY_CALLER_UID*: string {.`static`.}
  KEY_CALLER_PID*: string {.`static`.}
  KEY_ANDROID_PACKAGE_NAME*: string {.`static`.}
  KEY_NOTIFY_ON_FAILURE*: string {.`static`.}
  KEY_ACCOUNT_SESSION_BUNDLE*: string {.`static`.}
  KEY_ACCOUNT_STATUS_TOKEN*: string {.`static`.}
  ACTION_AUTHENTICATOR_INTENT*: string {.`static`.}
  AUTHENTICATOR_META_DATA_NAME*: string {.`static`.}
  AUTHENTICATOR_ATTRIBUTES_NAME*: string {.`static`.}
  VISIBILITY_UNDEFINED*: jint {.`static`.}
  VISIBILITY_VISIBLE*: jint {.`static`.}
  VISIBILITY_USER_MANAGED_VISIBLE*: jint {.`static`.}
  VISIBILITY_NOT_VISIBLE*: jint {.`static`.}
  VISIBILITY_USER_MANAGED_NOT_VISIBLE*: jint {.`static`.}
  ACCOUNT_ACCESS_TOKEN_TYPE*: string {.`static`.}
  CACHE_KEY_ACCOUNTS_DATA_PROPERTY*: string {.`static`.}
  CACHE_ACCOUNTS_DATA_SIZE*: jint {.`static`.}
  CACHE_KEY_USER_DATA_PROPERTY*: string {.`static`.}
  CACHE_USER_DATA_SIZE*: jint {.`static`.}
  LOGIN_ACCOUNTS_CHANGED_ACTION*: string {.`static`.}
  ACTION_ACCOUNT_REMOVED*: string {.`static`.}
  ACTION_VISIBLE_ACCOUNTS_CHANGED*: string {.`static`.}
  PACKAGE_NAME_KEY_LEGACY_VISIBLE*: string {.`static`.}
  PACKAGE_NAME_KEY_LEGACY_NOT_VISIBLE*: string {.`static`.}

