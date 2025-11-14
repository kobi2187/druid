## BiometricManager - Fingerprint and Face Authentication
##
## Provides biometric authentication using Android's BiometricPrompt API.
##
## Android Background:
##   - BiometricPrompt (API 28+): Modern unified API for all biometrics
##   - FingerprintManager (deprecated): Old API for fingerprint only
##   - Supports: Fingerprint, Face, Iris (device-dependent)
##   - Security levels: Strong (hardware-backed), Weak (software)
##
## Druid's Approach:
##   - BiometricPrompt for modern devices
##   - Simple API for common use cases
##   - Crypto object integration (optional)
##
## Usage:
##   var bm = biometricManager()
##
##   # Check availability
##   if bm.canAuthenticate():
##     echo "Biometrics available"
##
##   # Simple authentication
##   bm.authenticate(
##     title = "Unlock App",
##     subtitle = "Use fingerprint to unlock",
##     onSuccess = proc() =
##       echo "Authenticated!"
##     ,
##     onError = proc(error: string) =
##       echo "Auth failed: ", error
##   )

import jnim
import options
import ../../../core
import ../../../common

# JNI bindings for BiometricPrompt
jnimport:
  import android.content.Context
  import androidx.biometric.BiometricManager as JBM
  import androidx.biometric.BiometricPrompt as JBP
  import androidx.fragment.app.FragmentActivity

type
  BiometricAuthenticator* = enum
    ## Types of biometric authenticators
    baFingerprint = "fingerprint"
    baFace = "face"
    baIris = "iris"
    baAny = "any"  # Accept any available

  BiometricStrength* = enum
    ## Authentication strength levels
    bsStrong = "strong"  # Class 3: Hardware-backed (recommended)
    bsWeak = "weak"      # Class 2: Software

  AuthenticationStatus* = enum
    ## Authentication result status
    asSuccess = "success"
    asError = "error"
    asFailed = "failed"      # Authentication failed (wrong finger, etc.)
    asCancelled = "cancelled"  # User cancelled
    asTimeout = "timeout"

  BiometricCapability* = object
    ## Device biometric capabilities
    hasFingerprint*: bool
    hasFace*: bool
    hasIris*: bool
    isHardwareBacked*: bool
    hasEnrolled*: bool  # User has enrolled biometrics

  SdkBiometricManager* = ref object
    ## Manager for biometric authentication
    biometricManager: Option[JObject]
    isAvailable: bool

#
# Initialization
#

proc newSdkBiometricManager*(): SdkBiometricManager =
  result = SdkBiometricManager(
    isAvailable: false
  )

  # Check if BiometricManager is available (AndroidX)
  try:
    let ctx = getContext()
    # BiometricManager is part of AndroidX biometric library
    # App needs to include: implementation "androidx.biometric:biometric:1.2.0"

    # TODO: Get BiometricManager instance
    # val biometricManager = BiometricManager.from(context)
    # This requires proper AndroidX JNI bindings

    echo "Warning: BiometricManager requires AndroidX biometric library"
    echo "  Add to build.gradle: implementation 'androidx.biometric:biometric:1.2.0'"

    result.isAvailable = false
  except:
    echo "BiometricManager not available: ", getCurrentExceptionMsg()

#
# Capability Detection
#

proc canAuthenticate*(bm: SdkBiometricManager,
                     strength: BiometricStrength = bsStrong): bool =
  ## Check if biometric authentication is available
  ##
  ## Args:
  ##   strength: Required authentication strength
  ##
  ## Returns:
  ##   true if biometrics available and user has enrolled

  if not bm.isAvailable:
    return false

  # TODO: Check BiometricManager.canAuthenticate()
  # val result = biometricManager.canAuthenticate(
  #   BiometricManager.Authenticators.BIOMETRIC_STRONG
  # )
  # return result == BiometricManager.BIOMETRIC_SUCCESS

  echo "TODO: Implement canAuthenticate() using AndroidX BiometricManager"
  return false

proc getBiometricCapabilities*(bm: SdkBiometricManager): BiometricCapability =
  ## Get detailed biometric capabilities

  # TODO: Query device capabilities
  # This requires PackageManager.hasSystemFeature() checks
  # - FEATURE_FINGERPRINT
  # - FEATURE_FACE
  # - FEATURE_IRIS

  echo "TODO: Implement capability detection"
  result = BiometricCapability()

proc hasEnrolledBiometrics*(bm: SdkBiometricManager): bool =
  ## Check if user has enrolled biometrics

  # TODO: Check BiometricManager.canAuthenticate() result
  # BIOMETRIC_SUCCESS means enrolled
  # BIOMETRIC_ERROR_NONE_ENROLLED means no biometrics enrolled

  return false

#
# Authentication
#

proc authenticate*(bm: SdkBiometricManager,
                  title: string,
                  subtitle: string = "",
                  description: string = "",
                  negativeButtonText: string = "Cancel",
                  onSuccess: proc(),
                  onError: proc(error: string),
                  onFailed: proc() = nil) =
  ## Show biometric authentication prompt
  ##
  ## Args:
  ##   title: Prompt title
  ##   subtitle: Optional subtitle
  ##   description: Optional description
  ##   negativeButtonText: Text for cancel button
  ##   onSuccess: Called when authentication succeeds
  ##   onError: Called when error occurs (no hardware, etc.)
  ##   onFailed: Called when authentication fails (wrong finger)
  ##
  ## ⚠️ Requires:
  ##   - AndroidX biometric library
  ##   - FragmentActivity context
  ##   - Callback bridge for BiometricPrompt.AuthenticationCallback

  if not bm.canAuthenticate():
    onError("Biometric authentication not available")
    return

  # TODO: Show BiometricPrompt
  #
  # Steps:
  # 1. Get FragmentActivity (need Activity reference)
  # 2. Create Executor for callbacks
  # 3. Create BiometricPrompt.PromptInfo
  # 4. Create BiometricPrompt.AuthenticationCallback
  # 5. Show prompt
  #
  # Example Kotlin code:
  # ```
  # val promptInfo = BiometricPrompt.PromptInfo.Builder()
  #     .setTitle(title)
  #     .setSubtitle(subtitle)
  #     .setDescription(description)
  #     .setNegativeButtonText(negativeButtonText)
  #     .build()
  #
  # val biometricPrompt = BiometricPrompt(activity, executor,
  #     object : BiometricPrompt.AuthenticationCallback() {
  #         override fun onAuthenticationSucceeded(result: BiometricPrompt.AuthenticationResult) {
  #             // Call Nim onSuccess callback
  #         }
  #         override fun onAuthenticationError(errorCode: Int, errString: CharSequence) {
  #             // Call Nim onError callback
  #         }
  #         override fun onAuthenticationFailed() {
  #             // Call Nim onFailed callback
  #         }
  #     })
  #
  # biometricPrompt.authenticate(promptInfo)
  # ```

  echo "Warning: authenticate() requires BiometricPrompt implementation"
  echo "  Title: ", title
  echo "  Subtitle: ", subtitle
  onError("Not implemented - requires AndroidX BiometricPrompt + callbacks")

#
# Crypto Object Authentication (Advanced)
#

proc authenticateWithCrypto*(bm: SdkBiometricManager,
                            title: string,
                            cryptoObject: JObject,  # BiometricPrompt.CryptoObject
                            onSuccess: proc(cryptoObject: JObject),
                            onError: proc(error: string)) =
  ## Authenticate with crypto object
  ##
  ## Used for biometric-bound keys:
  ## - Signature verification
  ## - Data encryption/decryption
  ## - Key unwrapping
  ##
  ## The crypto object is only usable after successful authentication

  # TODO: Implement BiometricPrompt.authenticate(cryptoObject)
  # This is for advanced scenarios where authentication unlocks a crypto key

  echo "Warning: authenticateWithCrypto() requires BiometricPrompt + CryptoObject"
  onError("Not implemented")

#
# Permission and Settings
#

proc needsBiometricPermission*(bm: SdkBiometricManager): bool =
  ## Check if USE_BIOMETRIC permission is needed
  ##
  ## Note: USE_BIOMETRIC is normal permission (granted automatically)
  ## but needs to be in manifest

  # BiometricPrompt doesn't need runtime permission request
  # Just needs <uses-permission android:name="android.permission.USE_BIOMETRIC" />
  return false

proc openBiometricSettings*() =
  ## Open system biometric enrollment settings
  ##
  ## Allows user to enroll fingerprint/face

  # TODO: Start Settings activity
  # Intent(Settings.ACTION_BIOMETRIC_ENROLL)

  echo "TODO: Open biometric settings via Intent"

#
# Error Codes
#

type
  BiometricError* = enum
    ## BiometricPrompt error codes
    beHardwareUnavailable = "hardware_unavailable"
    beUnableToProcess = "unable_to_process"
    beTimeout = "timeout"
    beNoSpace = "no_space"
    beCancelled = "cancelled"
    beNoEnrolled = "no_enrolled"
    beHardwareNotPresent = "hardware_not_present"
    beNegativeButton = "negative_button"
    beUserCancelled = "user_cancelled"

proc errorCodeToString(code: int): string =
  ## Convert BiometricPrompt error code to string
  case code:
  of 1: return "hardware_unavailable"
  of 2: return "unable_to_process"
  of 3: return "timeout"
  of 4: return "no_space"
  of 5: return "cancelled"
  of 7: return "user_cancelled"
  of 11: return "no_enrolled"
  of 12: return "hardware_not_present"
  of 13: return "negative_button"
  else: return "unknown_error"

#
# Debugging
#

proc debugPrintBiometricInfo*(bm: SdkBiometricManager): string =
  ## Get debug representation of biometric manager state
  result = "BiometricManager - Status:\n"
  result &= "  Available: " & $bm.isAvailable & "\n"
  result &= "  Can Authenticate: " & $bm.canAuthenticate() & "\n"
  result &= "  Has Enrolled: " & $bm.hasEnrolledBiometrics() & "\n"

  let caps = bm.getBiometricCapabilities()
  result &= "  Capabilities:\n"
  result &= "    Fingerprint: " & $caps.hasFingerprint & "\n"
  result &= "    Face: " & $caps.hasFace & "\n"
  result &= "    Iris: " & $caps.hasIris & "\n"
  result &= "    Hardware-Backed: " & $caps.isHardwareBacked & "\n"

#
# Implementation Notes & TODOs
#
# CRITICAL DEPENDENCIES:
#   1. AndroidX Biometric Library:
#      implementation "androidx.biometric:biometric:1.2.0"
#
#   2. FragmentActivity:
#      BiometricPrompt requires FragmentActivity, not just Activity
#      Need Activity reference from LifecycleManager or core
#
#   3. Callback Bridge:
#      BiometricPrompt.AuthenticationCallback needs Java→Nim callbacks
#      Similar to other callback-based APIs
#
# WHAT WORKS NOW:
#   - ✅ API structure complete
#   - ✅ Capability detection designed
#   - ❌ Authentication requires full AndroidX integration
#
# IMPLEMENTATION APPROACH:
#   Option 1: Full Nim Integration (complex)
#     - Implement AuthenticationCallback in Java/Kotlin
#     - Call back to Nim via exported functions
#     - Manage callback lifecycle
#
#   Option 2: Hybrid Approach (simpler)
#     - Implement BiometricPrompt helper in Java/Kotlin
#     - Export simple functions: show(), dismiss()
#     - Use simple callback IDs for routing
#
#   Option 3: Intent-Based (limited)
#     - Use CONFIRM_DEVICE_CREDENTIAL intent
#     - Less control but simpler
#     - No AndroidX dependency
#
# CURRENT STATUS:
#   - API designed and documented
#   - Requires AndroidX library + callback bridge
#   - Structure ready for implementation
#
# SECURITY NOTES:
#   - BiometricPrompt enforces security automatically
#   - Crypto objects can be bound to authentication
#   - Hardware-backed keys never leave secure hardware
#   - Use BIOMETRIC_STRONG for sensitive operations
#
# FUTURE ENHANCEMENTS:
#   - Crypto object integration (for key operations)
#   - Custom UI (via BiometricPrompt theming)
#   - Passive authentication (device unlock state)
#   - Fallback to device credential (PIN/pattern/password)
#

#
# Runtime Integration
#

proc sdkBiometricManager*(runtime: AndroidRuntime): SdkBiometricManager =
  ## Get or create the SdkBiometricManager instance
  ## Lazy initialization pattern
  if runtime.sdkBiometricManager.isNone:
    runtime.sdkBiometricManager = some(newSdkBiometricManager())
  return runtime.sdkBiometricManager.get()

# Convenience global accessor
proc biometricManager*(): SdkBiometricManager =
  ## Global accessor for SdkBiometricManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Usage:
  ##   if biometricManager().canAuthenticate():
  ##     biometricManager().authenticate(
  ##       title = "Unlock",
  ##       onSuccess = proc() = echo "OK",
  ##       onError = proc(e: string) = echo e
  ##     )
  return runtime().sdkBiometricManager()
