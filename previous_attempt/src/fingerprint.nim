# fingerprint.nim - Fingerprint authentication

import android, options

type
  FingerprintAuthResult* = enum
    Success, Failure, Help, Error
    
  AuthenticationReason* = enum
    None, SystemUpgrade, Timeout, LockOut, Reset
    
  FingerprintStatus* = enum
    NotAvailable, NotEnrolled, Available, TooManyAttempts
    
  FingerprintPromptInfo* = object
    title*: string
    subtitle*: Option[string]
    description*: Option[string]
    negativeButtonText*: string
    
  FingerprintCallback* = proc(result: FingerprintAuthResult, message: string)
    
  FingerprintManager* = ref object of Manager
    callbacks: Table[string, FingerprintCallback]
    lastErrorCode: int
    lastErrorMessage: string
    fingerprintManager: pointer  # JNI reference

# Constructor
proc newFingerprintManager*(context: Context): FingerprintManager
  ## Creates a new fingerprint manager

# Fingerprint availability
proc isHardwareDetected*(m: FingerprintManager): bool
  ## Checks if fingerprint hardware is present
  ## API 28+: Uses BiometricManager.canAuthenticate
  ## API 26-27: Uses FingerprintManager.isHardwareDetected
  
proc getStatus*(m: FingerprintManager): FingerprintStatus
  ## Gets fingerprint status
  ## API 28+: Uses BiometricManager.canAuthenticate
  ## API 26-27: Uses FingerprintManager methods
  
proc hasEnrolledFingerprints*(m: FingerprintManager): bool
  ## Checks if fingerprints are enrolled
  ## API 28+: Uses BiometricManager.canAuthenticate
  ## API 26-27: Uses FingerprintManager.hasEnrolledFingerprints

# Authentication
proc authenticate*(m: FingerprintManager, 
                 promptInfo: FingerprintPromptInfo,
                 callback: FingerprintCallback): string
  ## Starts fingerprint authentication
  ## Returns authentication ID
  ## API 28+: Uses BiometricPrompt
  ## API 26-27: Uses FingerprintManager.authenticate
  ## Requires USE_FINGERPRINT permission
  
proc cancelAuthentication*(m: FingerprintManager, authId: string): bool
  ## Cancels authentication in progress
  ## API 28+: Uses BiometricPrompt.cancelAuthentication
  ## API 26-27: Uses FingerprintManager.cancel

# Error handling
proc getLastErrorCode*(m: FingerprintManager): int
  ## Gets last error code
  
proc getLastErrorMessage*(m: FingerprintManager): string
  ## Gets last error message

# Utility functions
proc showEnrollmentSettings*(m: FingerprintManager): bool
  ## Shows fingerprint enrollment settings
  ## API 26+: Uses Intent with Settings.ACTION_FINGERPRINT_ENROLL