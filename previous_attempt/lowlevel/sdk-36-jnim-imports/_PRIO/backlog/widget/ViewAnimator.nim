import jnim

jclass android.widget.ViewAnimator* of FrameLayout:
  proc setDisplayedChild*(whichChild: jint)
  proc getDisplayedChild*(): jint
  proc showNext*()
  proc showPrevious*()
  proc addView*(child: View, index: jint, params: ViewGroup.LayoutParams)
  proc removeAllViews*()
  proc removeView*(view: View)
  proc removeViewAt*(index: jint)
  proc removeViewInLayout*(view: View)
  proc removeViews*(start: jint, count: jint)
  proc removeViewsInLayout*(start: jint, count: jint)
  proc getCurrentView*(): View
  proc getInAnimation*(): Animation
  proc setInAnimation*(inAnimation: Animation)
  proc getOutAnimation*(): Animation
  proc setOutAnimation*(outAnimation: Animation)
  proc setInAnimation*(context: Context, resourceID: jint)
  proc setOutAnimation*(context: Context, resourceID: jint)
  proc getAnimateFirstView*(): jboolean
  proc setAnimateFirstView*(animate: jboolean)
  proc getBaseline*(): jint
  proc getAccessibilityClassName*(): CharSequence

