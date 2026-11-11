import jnim

jclass android.media.Utils* of JVMObject:
  proc sortDistinctRanges*(ranges: Range[T]) {.`static`.}
  proc intersectSortedDistinctRanges*(one: Range[T], another: Range[T]): Range[T] {.`static`.}
  proc binarySearchDistinctRanges*(ranges: Range[T], value: T): jint {.`static`.}
  proc getUniqueExternalFile*(context: Context, subdirectory: string, fileName: string, mimeType: string): File {.`static`.}
  proc anonymizeBluetoothAddress*(address: string): string {.`static`.}
  proc anonymizeBluetoothAddress*(deviceType: jint, address: string): string {.`static`.}
  proc isRingtoneVibrationSettingsSupported*(context: Context): jboolean {.`static`.}
  proc hasVibration*(ringtoneUri: Uri): jboolean {.`static`.}
  proc getVibrationUri*(ringtoneUri: Uri): Uri {.`static`.}
  proc parseVibrationEffect*(vibrator: Vibrator, vibrationUri: Uri): VibrationEffect {.`static`.}
  VIBRATION_URI_PARAM*: string {.`static`.}
  SYNCHRONIZED_VIBRATION*: string {.`static`.}

jclass android.media.Utils.ListenerList* of JVMObject:
  proc add*(key: JObject, executor: Executor, listener: Listener[V])
  proc remove*(key: JObject)
  proc notify*(eventCode: jint, info: V)

jclass android.media.ListenerList* of JVMObject:
  proc add*(key: JObject, executor: Executor, listener: Listener[V])
  proc remove*(key: JObject)
  proc notify*(eventCode: jint, info: V)

