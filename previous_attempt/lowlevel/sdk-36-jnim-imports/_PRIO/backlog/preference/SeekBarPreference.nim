import jnim

jclass android.preference.SeekBarPreference* of Preference:
  proc onKey*(v: View, keyCode: jint, event: KeyEvent): jboolean
  proc setMax*(max: jint)
  proc setProgress*(progress: jint)
  proc getProgress*(): jint
  proc onProgressChanged*(seekBar: SeekBar, progress: jint, fromUser: jboolean)
  proc onStartTrackingTouch*(seekBar: SeekBar)
  proc onStopTrackingTouch*(seekBar: SeekBar)

