# identity.nim - Identity management and authentication

import android, options

type
  BiometricPromptInfo* = object
    title*: string
    subtitle*: Option[string]
    description*: Option[string]
    negativeButtonText*: string
    
  CredentialType* = enum
    Password, PIN, Pattern
    
  AuthMethod* = enum
    Biometric, Credential, DeviceCredential, WebToken
    
  AuthResult* = enum
    Success, Failure, Help, Error
    
  IntentType* = enum
    GET_CONTENT, OPEN_DOCUMENT, CREATE_DOCUMENT
    
  SystemActivity* = enum
    Settings, WifiSettings, BluetoothSettings,
    LocationSettings, SecuritySettings, DeviceAdminSettings
    
  IdentityManager* = ref object of Manager
    biometricPrompt: pointer  # JNI reference
    keyguardManager: pointer  # JNI reference
    accountManager: pointer   # JNI reference
    activity: Option[Activity]

# Constructor
proc newIdentityManager*(context: Context, activity: Option[Activity] = none(Activity)): IdentityManager
  ## Creates a new identity manager
  ## Activity required for authentication flows

# Device authentication
proc isDeviceSecure*(m: IdentityManager): bool
  ## Checks if device is secured with screen lock
  ## API 26+: Uses KeyguardManager.isDeviceSecure
  
proc isKeyguardLocked*(m: IdentityManager): bool
  ## Checks if keyguard is currently locked
  ## API 26+: Uses KeyguardManager.isKeyguardLocked
  
proc isBiometricAvailable*(m: IdentityManager): bool
  ## Checks if biometric is available
  ## API 28+: Uses BiometricManager.canAuthenticate
  ## API 26-27: Uses FingerprintManager.isHardwareDetected
  
proc authenticateWithBiometric*(m: IdentityManager,
                              promptInfo: BiometricPromptInfo,
                              callback: proc(result: AuthResult, message: string)): bool
  ## Authenticates with biometric
  ## API 28+: Uses BiometricPrompt
  ## API 26-27: Uses FingerprintManager
  ## Requires USE_BIOMETRIC permission
  
proc authenticateWithCredential*(m: IdentityManager,
                               title: string,
                               description: string,
                               callback: proc(success: bool)): bool
  ## Authenticates with device credential
  ## API 26+: Uses KeyguardManager.createConfirmDeviceCredentialIntent
  ## Requires activity

# System intents
proc startSystemActivity*(m: IdentityManager, activity: SystemActivity): bool
  ## Starts system settings activity
  ## API 26+: Uses appropriate Settings intent
  
proc startIntentForResult*(m: IdentityManager,
                         intentType: IntentType,
                         mimeType: string,
                         callback: proc(resultCode: int, data: Option[string])): bool
  ## Starts intent for result
  ## API 26+: Uses appropriate Intent
  ## Requires activity
  
proc startAppDetailsSettings*(m: IdentityManager): bool
  ## Opens app details in system settings
  ## API 26+: Uses Settings.ACTION_APPLICATION_DETAILS_SETTINGS
  
proc openUrl*(m: IdentityManager, url: string): bool
  ## Opens URL in browser
  ## API 26+: Uses Intent.ACTION_VIEW
  
proc openAppInStore*(m: IdentityManager, packageName: Option[string] = none(string)): bool
  ## Opens app in Google Play Store
  ## API 26+: Uses Intent.ACTION_VIEW with market:// URI

# Account management
proc getAccountTypes*(m: IdentityManager): seq[string]
  ## Gets available account types
  ## API 26+: Uses AccountManager.getAccountTypes
  ## Requires GET_ACCOUNTS permission
  
proc getAccounts*(m: IdentityManager, accountType: Option[string] = none(string)): seq[string]
  ## Gets account names
  ## API 26+: Uses AccountManager.getAccounts
  ## Requires GET_ACCOUNTS permission
  
proc hasAccount*(m: IdentityManager, accountType: string): bool
  ## Checks if account type exists
  ## API 26+: Uses AccountManager.getAccountsByType
  ## Requires GET_ACCOUNTS permission