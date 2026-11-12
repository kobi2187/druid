import jnim

jclass android.preference.SeekBarVolumizer* of JVMObject:
  proc setSeekBar*(seekBar: SeekBar)
  proc handleMessage*(msg: Message): jboolean
  proc stop*()
  proc start*()
  proc revertVolume*()
  proc onProgressChanged*(seekBar: SeekBar, progress: jint, fromTouch: jboolean)
  proc onStartTrackingTouch*(seekBar: SeekBar)
  proc onStopTrackingTouch*(seekBar: SeekBar)
  proc isSamplePlaying*(): jboolean
  proc startSample*()
  proc stopSample*()
  proc getSeekBar*(): SeekBar
  proc changeVolumeBy*(amount: jint)
  proc muteVolume*()
  proc onSaveInstanceState*(volumeStore: VolumeStore)
  proc onRestoreInstanceState*(volumeStore: VolumeStore)

