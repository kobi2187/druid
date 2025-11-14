## SDK Vibration Manager - Haptic feedback and vibration
##
## Uses Android SDK Vibrator API (Java)
##
## Provides:
## - Simple vibration (duration-based)
## - Vibration patterns with timing
## - Amplitude control (API 26+)
## - Vibrator availability checking

import ../../../core
import ../../../art  # For API level detection
import jnim
import options

jnimport:
  import android.content.Context
  import android.os.Vibrator
  import android.os.VibrationEffect

type
  VibrationIntensity* = enum
    ## Vibration intensity levels (API 26+)
    viDefault = -1    # System default
    viLight = 50      # Light vibration
    viMedium = 127    # Medium vibration
    viHard = 255      # Hard/strong vibration

  SdkVibrationManager* = ref object
    context: JObject
    vibrator: JObject
    apiLevel: int
    hasVibrator: Option[bool]
    hasAmplitudeControl: Option[bool]

proc init*(_: typedesc[SdkVibrationManager]): SdkVibrationManager =
  ## Initialize SdkVibrationManager
  result = SdkVibrationManager()
  result.context = getContext()
  result.apiLevel = detectApiLevel()

  # Get Vibrator system service
  let serviceName = "vibrator".toJString
  result.vibrator = result.context.getSystemService(serviceName)

proc checkHasVibrator*(vm: SdkVibrationManager): bool =
  ## Check if device has vibrator hardware
  ##
  ## Returns:
  ##   true if vibrator is available, false otherwise

  if vm.hasVibrator.isSome:
    return vm.hasVibrator.get()

  let has = vm.vibrator.call("hasVibrator").boolVal
  vm.hasVibrator = some(has)
  return has

proc checkHasAmplitudeControl*(vm: SdkVibrationManager): bool =
  ## Check if device supports amplitude control (API 26+)
  ##
  ## Returns:
  ##   true if amplitude control is supported, false otherwise

  if vm.hasAmplitudeControl.isSome:
    return vm.hasAmplitudeControl.get()

  if vm.apiLevel < 26:
    vm.hasAmplitudeControl = some(false)
    return false

  let has = vm.vibrator.call("hasAmplitudeControl").boolVal
  vm.hasAmplitudeControl = some(has)
  return has

proc vibrate*(vm: SdkVibrationManager, milliseconds: int) =
  ## Vibrate for a specified duration
  ##
  ## Args:
  ##   milliseconds: Duration in milliseconds
  ##
  ## Example:
  ##   vibration().vibrate(300)  # Vibrate for 300ms

  if not vm.checkHasVibrator():
    return  # No vibrator, silently ignore

  if vm.apiLevel >= 26:
    # Use VibrationEffect (API 26+)
    let effect = newJVMObject("android/os/VibrationEffect")
    let createdEffect = effect.callStatic("createOneShot",
      milliseconds.jlong,
      VibrationIntensity.viDefault.int.jint
    )
    vm.vibrator.call("vibrate", createdEffect)
  else:
    # Legacy vibrate (pre-API 26)
    vm.vibrator.call("vibrate", milliseconds.jlong)

proc vibrate*(vm: SdkVibrationManager, milliseconds: int, intensity: VibrationIntensity) =
  ## Vibrate with specific intensity (API 26+)
  ##
  ## Args:
  ##   milliseconds: Duration in milliseconds
  ##   intensity: Vibration intensity
  ##
  ## On API < 26, intensity is ignored
  ##
  ## Example:
  ##   vibration().vibrate(300, viHard)

  if not vm.checkHasVibrator():
    return

  if vm.apiLevel >= 26 and vm.checkHasAmplitudeControl():
    # Use VibrationEffect with amplitude
    let effect = newJVMObject("android/os/VibrationEffect")
    let createdEffect = effect.callStatic("createOneShot",
      milliseconds.jlong,
      intensity.int.jint
    )
    vm.vibrator.call("vibrate", createdEffect)
  else:
    # Fall back to simple vibration
    vm.vibrate(milliseconds)

proc vibratePattern*(vm: SdkVibrationManager, pattern: seq[int], repeat: int = -1) =
  ## Vibrate with a pattern of on/off timings
  ##
  ## Args:
  ##   pattern: Alternating durations of off/on in milliseconds
  ##            Example: @[0, 100, 200, 100] = wait 0ms, vibrate 100ms, pause 200ms, vibrate 100ms
  ##   repeat: Index to repeat from (-1 = no repeat, 0 = repeat all, 1+ = repeat from index)
  ##
  ## Example:
  ##   # Quick double vibration
  ##   vibration().vibratePattern(@[0, 100, 100, 100])

  if not vm.checkHasVibrator():
    return

  if pattern.len == 0:
    return

  # Convert pattern to jlong array
  let jPattern = newJArray[jlong](pattern.len)
  for i, dur in pattern:
    jPattern[i] = dur.jlong

  if vm.apiLevel >= 26:
    # Use VibrationEffect
    let effect = newJVMObject("android/os/VibrationEffect")
    let createdEffect = effect.callStatic("createWaveform",
      jPattern,
      repeat.jint
    )
    vm.vibrator.call("vibrate", createdEffect)
  else:
    # Legacy pattern vibration
    vm.vibrator.call("vibrate", jPattern, repeat.jint)

proc cancel*(vm: SdkVibrationManager) =
  ## Cancel any ongoing vibration

  if not vm.checkHasVibrator():
    return

  vm.vibrator.call("cancel")

# Lazy accessor for AndroidRuntime
proc sdkVibrationManager*(runtime: AndroidRuntime): SdkVibrationManager =
  ## Get or create SdkVibrationManager instance
  if runtime.sdkVibrationManager.isNone:
    runtime.sdkVibrationManager = some(SdkVibrationManager.init())
  return runtime.sdkVibrationManager.get()

# Convenience global accessor
proc vibration*(): SdkVibrationManager =
  ## Global accessor for SdkVibrationManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   vibration().vibrate(300)
  return runtime().sdkVibrationManager()
