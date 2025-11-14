import jnim

jclass android.widget.RatingBar* of AbsSeekBar:
  proc setOnRatingBarChangeListener*(listener: OnRatingBarChangeListener)
  proc getOnRatingBarChangeListener*(): OnRatingBarChangeListener
  proc setIsIndicator*(isIndicator: jboolean)
  proc isIndicator*(): jboolean
  proc setNumStars*(numStars: jint)
  proc getNumStars*(): jint
  proc setRating*(rating: jfloat)
  proc getRating*(): jfloat
  proc setStepSize*(stepSize: jfloat)
  proc getStepSize*(): jfloat
  proc setMax*(max: jint)
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  PLURALS_RATING*: string {.`static`.}
  PLURALS_MAX*: string {.`static`.}

