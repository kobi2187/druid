import jnim

jclass android.widget.MediaController* of FrameLayout:
  proc onFinishInflate*()
  proc setMediaPlayer*(player: MediaPlayerControl)
  proc setAnchorView*(view: View)
  proc show*()
  proc show*(timeout: jint)
  proc isShowing*(): jboolean
  proc hide*()
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc onTrackballEvent*(ev: MotionEvent): jboolean
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc setEnabled*(enabled: jboolean)
  proc getAccessibilityClassName*(): CharSequence
  proc setPrevNextListeners*(next: View.OnClickListener, prev: View.OnClickListener)

