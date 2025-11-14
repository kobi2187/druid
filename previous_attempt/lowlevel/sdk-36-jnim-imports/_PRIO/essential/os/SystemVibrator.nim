import jnim

jclass android.os.SystemVibrator* of Vibrator:
  proc getInfo*(): VibratorInfo
  proc hasVibrator*(): jboolean
  proc isVibrating*(): jboolean
  proc addVibratorStateListener*(listener: OnVibratorStateChangedListener)
  proc addVibratorStateListener*(executor: Executor, listener: OnVibratorStateChangedListener)
  proc removeVibratorStateListener*(listener: OnVibratorStateChangedListener)
  proc hasAmplitudeControl*(): jboolean
  proc areVendorSessionsSupported*(): jboolean
  proc setAlwaysOnEffect*(uid: jint, opPkg: string, alwaysOnId: jint, effect: VibrationEffect, attrs: VibrationAttributes): jboolean
  proc vibrate*(uid: jint, opPkg: string, effect: VibrationEffect, reason: string, attributes: VibrationAttributes)
  proc performHapticFeedback*(constant: jint, reason: string, flags: jint, privFlags: jint)
  proc performHapticFeedbackForInputDevice*(constant: jint, inputDeviceId: jint, inputSource: jint, reason: string, flags: jint, privFlags: jint)
  proc cancel*()
  proc cancel*(usageFilter: jint)
  proc startVendorSession*(attrs: VibrationAttributes, reason: string, cancellationSignal: CancellationSignal, executor: Executor, callback: VendorVibrationSession.Callback)

jclass android.os.SystemVibrator.MultiVibratorStateListener* of JVMObject:
  proc hasRegisteredListeners*(): jboolean
  proc register*(vibratorManager: VibratorManager, vibratorIds: seq[jint])
  proc unregister*(vibratorManager: VibratorManager)
  proc onVibrating*(vibratorIdx: jint, vibrating: jboolean)

jclass android.os.MultiVibratorStateListener* of JVMObject:
  proc hasRegisteredListeners*(): jboolean
  proc register*(vibratorManager: VibratorManager, vibratorIds: seq[jint])
  proc unregister*(vibratorManager: VibratorManager)
  proc onVibrating*(vibratorIdx: jint, vibrating: jboolean)

