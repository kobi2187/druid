import jnim

jclass android.media.SubtitleTrack* of JVMObject:
  proc getFormat*(): MediaFormat
  proc onData*(data: seq[jbyte], eos: jboolean, runID: jlong)
  proc getRenderingWidget*(): RenderingWidget
  proc updateView*(activeCues: Vector[Cue])
  proc onTimedEvent*(timeUs: jlong)
  proc onSeek*(timeUs: jlong)
  proc onStop*()
  proc show*()
  proc hide*()
  proc setTimeProvider*(timeProvider: MediaTimeProvider)
  proc setRunDiscardTimeMs*(runID: jlong, timeMs: jlong)
  proc getTrackType*(): jint
  DEBUG*: jboolean

jclass android.media.SubtitleTrack.Cue* of JVMObject:
  proc onTime*(timeMs: jlong)

jclass android.media.SubtitleTrack.RenderingWidget* of JVMObject:
  proc setOnChangedListener*(callback: OnChangedListener)
  proc setSize*(width: jint, height: jint)
  proc setVisible*(visible: jboolean)
  proc draw*(c: Canvas)
  proc onAttachedToWindow*()
  proc onDetachedFromWindow*()

jclass android.media.Cue* of JVMObject:
  proc onTime*(timeMs: jlong)
  mStartTimeMs*: jlong
  mEndTimeMs*: jlong
  mInnerTimesMs*: jlong
  mRunID*: jlong
  mNextInRun*: Cue

jclass android.media.RenderingWidget* of JVMObject:
  proc setOnChangedListener*(callback: OnChangedListener)
  proc setSize*(width: jint, height: jint)
  proc setVisible*(visible: jboolean)
  proc draw*(c: Canvas)
  proc onAttachedToWindow*()
  proc onDetachedFromWindow*()

jclass android.media.RenderingWidget.OnChangedListener* of JVMObject:
  proc onChanged*(renderingWidget: RenderingWidget)

jclass android.media.OnChangedListener* of JVMObject:
  proc onChanged*(renderingWidget: RenderingWidget)

