import jnim

jclass android.widget.Toast* of JVMObject:
  proc show*()
  proc cancel*()
  proc setView*(view: View)
  proc getView*(): View
  proc setDuration*(duration: jint)
  proc getDuration*(): jint
  proc setMargin*(horizontalMargin: jfloat, verticalMargin: jfloat)
  proc getHorizontalMargin*(): jfloat
  proc getVerticalMargin*(): jfloat
  proc setGravity*(gravity: jint, xOffset: jint, yOffset: jint)
  proc getGravity*(): jint
  proc getXOffset*(): jint
  proc getYOffset*(): jint
  proc addCallback*(callback: Callback)
  proc removeCallback*(callback: Callback)
  proc getWindowParams*(): WindowManager.LayoutParams
  proc makeText*(context: Context, text: CharSequence, duration: jint): Toast {.`static`.}
  proc makeText*(context: Context, looper: Looper, text: CharSequence, duration: jint): Toast {.`static`.}
  proc makeCustomToastWithIcon*(context: Context, looper: Looper, text: CharSequence, duration: jint, icon: Drawable): Toast {.`static`.}
  proc makeText*(context: Context, resId: jint, duration: jint): Toast {.`static`.}
  proc setText*(resId: jint)
  proc setText*(s: CharSequence)
  proc getTn*(): TN
  LENGTH_SHORT*: jint {.`static`.}
  LENGTH_LONG*: jint {.`static`.}

jclass android.widget.Toast.TN* of JVMObject:
  proc show*(windowToken: IBinder)
  proc hide*()
  proc cancel*()
  proc handleShow*(windowToken: IBinder)
  proc handleHide*()
  proc getNextView*(): View

jclass android.widget.Toast.Callback* of JVMObject:
  proc onToastShown*()
  proc onToastHidden*()

jclass android.widget.TN* of Stub:
  proc show*(windowToken: IBinder)
  proc hide*()
  proc cancel*()
  proc handleShow*(windowToken: IBinder)
  proc handleHide*()
  proc getNextView*(): View

jclass android.widget.Callback* of JVMObject:
  proc onToastShown*()
  proc onToastHidden*()

