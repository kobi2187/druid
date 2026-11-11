import jnim

jclass android.os.Vibrator* of JVMObject:
  proc getInfo*(): VibratorInfo
  proc getDefaultVibrationIntensity*(usage: jint): jint
  proc getId*(): jint
  proc hasVibrator*(): jboolean
  proc hasAmplitudeControl*(): jboolean
  proc hasFrequencyControl*(): jboolean
  proc areVibrationFeaturesSupported*(effect: VibrationEffect): jboolean
  proc areVendorEffectsSupported*(): jboolean
  proc areVendorSessionsSupported*(): jboolean
  proc hasExternalControl*(): jboolean
  proc getResonantFrequency*(): jfloat
  proc getQFactor*(): jfloat
  proc getFrequencyProfileLegacy*(): VibratorFrequencyProfileLegacy
  proc getFrequencyProfile*(): VibratorFrequencyProfile
  proc getHapticChannelMaximumAmplitude*(): jfloat
  proc areEnvelopeEffectsSupported*(): jboolean
  proc getEnvelopeEffectInfo*(): VibratorEnvelopeEffectInfo
  proc setAlwaysOnEffect*(alwaysOnId: jint, effect: VibrationEffect, attributes: VibrationAttributes): jboolean
  proc setAlwaysOnEffect*(uid: jint, opPkg: string, alwaysOnId: jint, effect: VibrationEffect, attributes: VibrationAttributes): jboolean
  proc vibrate*(milliseconds: jlong)
  proc vibrate*(milliseconds: jlong, attributes: AudioAttributes)
  proc vibrate*(pattern: seq[jlong], repeat: jint)
  proc vibrate*(pattern: seq[jlong], repeat: jint, attributes: AudioAttributes)
  proc vibrate*(vibe: VibrationEffect)
  proc vibrate*(vibe: VibrationEffect, attributes: AudioAttributes)
  proc vibrate*(vibe: VibrationEffect, attributes: VibrationAttributes)
  proc vibrate*(vibe: VibrationEffect, attributes: VibrationAttributes, reason: string)
  proc vibrate*(uid: jint, opPkg: string, vibe: VibrationEffect, reason: string, attributes: VibrationAttributes)
  proc performHapticFeedback*(constant: jint, reason: string, flags: jint, privFlags: jint)
  proc performHapticFeedbackForInputDevice*(constant: jint, inputDeviceId: jint, inputSource: jint, reason: string, flags: jint, privFlags: jint)
  proc areEffectsSupported*(effectIds: jint): seq[jint]
  proc areAllEffectsSupported*(effectIds: jint): jint
  proc arePrimitivesSupported*(primitiveIds: jint): seq[jboolean]
  proc areAllPrimitivesSupported*(primitiveIds: jint): jboolean
  proc getPrimitiveDurations*(primitiveIds: jint): seq[jint]
  proc cancel*()
  proc cancel*(usageFilter: jint)
  proc isVibrating*(): jboolean
  proc addVibratorStateListener*(listener: OnVibratorStateChangedListener)
  proc addVibratorStateListener*(executor: Executor, listener: OnVibratorStateChangedListener)
  proc removeVibratorStateListener*(listener: OnVibratorStateChangedListener)
  proc startVendorSession*(attrs: VibrationAttributes, reason: string, cancellationSignal: CancellationSignal, executor: Executor, callback: VendorVibrationSession.Callback)
  VIBRATION_INTENSITY_OFF*: jint {.`static`.}
  VIBRATION_INTENSITY_LOW*: jint {.`static`.}
  VIBRATION_INTENSITY_MEDIUM*: jint {.`static`.}
  VIBRATION_INTENSITY_HIGH*: jint {.`static`.}
  VIBRATION_EFFECT_SUPPORT_UNKNOWN*: jint {.`static`.}
  VIBRATION_EFFECT_SUPPORT_YES*: jint {.`static`.}
  VIBRATION_EFFECT_SUPPORT_NO*: jint {.`static`.}

