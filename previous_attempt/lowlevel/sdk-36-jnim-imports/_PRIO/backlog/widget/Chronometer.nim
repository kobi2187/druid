import jnim

jclass android.widget.Chronometer* of TextView:
  proc setCountDown*(countDown: jboolean)
  proc isCountDown*(): jboolean
  proc isTheFinalCountDown*(): jboolean
  proc setBase*(base: jlong)
  proc getBase*(): jlong
  proc setFormat*(format: string)
  proc getFormat*(): string
  proc setOnChronometerTickListener*(listener: OnChronometerTickListener)
  proc getOnChronometerTickListener*(): OnChronometerTickListener
  proc start*()
  proc stop*()
  proc setStarted*(started: jboolean)
  proc getContentDescription*(): CharSequence
  proc getAccessibilityClassName*(): CharSequence

