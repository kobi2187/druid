import jnim

jclass android.preference.VolumePreference* of SeekBarDialogPreference:
  proc setStreamType*(streamType: jint)
  proc onKey*(v: View, keyCode: jint, event: KeyEvent): jboolean
  proc onActivityStop*()
  proc onSampleStarting*(volumizer: SeekBarVolumizer)
  proc onProgressChanged*(seekBar: SeekBar, progress: jint, fromTouch: jboolean)
  proc onMuted*(muted: jboolean, zenMuted: jboolean)
  proc onStartTrackingTouch*(sbv: SeekBarVolumizer)

jclass android.preference.VolumeStore* of JVMObject:
  volume*: jint
  originalVolume*: jint

