import jnim

jclass android.os.NullVibrator* of Vibrator:
  proc getInstance*(): NullVibrator {.`static`.}
  proc hasVibrator*(): jboolean
  proc isVibrating*(): jboolean
  proc hasAmplitudeControl*(): jboolean
  proc vibrate*(uid: jint, opPkg: string, effect: VibrationEffect, reason: string, attributes: VibrationAttributes)
  proc cancel*()
  proc cancel*(usageFilter: jint)

