import jnim

jclass android.os.SystemVibratorManager* of VibratorManager:
  proc getVibratorIds*(): seq[jint]
  proc hasCapabilities*(capabilities: jint): jboolean
  proc getVibrator*(vibratorId: jint): Vibrator
  proc getDefaultVibrator*(): Vibrator
  proc setAlwaysOnEffect*(uid: jint, opPkg: string, alwaysOnId: jint, effect: CombinedVibration, attributes: VibrationAttributes): jboolean
  proc vibrate*(uid: jint, opPkg: string, effect: CombinedVibration, reason: string, attributes: VibrationAttributes)
  proc performHapticFeedback*(constant: jint, reason: string, flags: jint, privFlags: jint)
  proc performHapticFeedbackForInputDevice*(constant: jint, inputDeviceId: jint, inputSource: jint, reason: string, flags: jint, privFlags: jint)
  proc cancel*()
  proc cancel*(usageFilter: jint)
  proc startVendorSession*(vibratorIds: seq[jint], attrs: VibrationAttributes, reason: string, cancellationSignal: CancellationSignal, executor: Executor, callback: VendorVibrationSession.Callback)

