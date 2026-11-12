import jnim

jclass android.app.ProgressDialog* of AlertDialog:
  proc show*(context: Context, title: CharSequence, message: CharSequence): ProgressDialog {.`static`.}
  proc show*(context: Context, title: CharSequence, message: CharSequence, indeterminate: jboolean): ProgressDialog {.`static`.}
  proc show*(context: Context, title: CharSequence, message: CharSequence, indeterminate: jboolean, cancelable: jboolean): ProgressDialog {.`static`.}
  proc show*(context: Context, title: CharSequence, message: CharSequence, indeterminate: jboolean, cancelable: jboolean, cancelListener: OnCancelListener): ProgressDialog {.`static`.}
  proc onStart*()
  proc setProgress*(value: jint)
  proc setSecondaryProgress*(secondaryProgress: jint)
  proc getProgress*(): jint
  proc getSecondaryProgress*(): jint
  proc getMax*(): jint
  proc setMax*(max: jint)
  proc incrementProgressBy*(diff: jint)
  proc incrementSecondaryProgressBy*(diff: jint)
  proc setProgressDrawable*(d: Drawable)
  proc setIndeterminateDrawable*(d: Drawable)
  proc setIndeterminate*(indeterminate: jboolean)
  proc isIndeterminate*(): jboolean
  proc setMessage*(message: CharSequence)
  proc setProgressStyle*(style: jint)
  proc setProgressNumberFormat*(format: string)
  proc setProgressPercentFormat*(format: NumberFormat)
  STYLE_SPINNER*: jint {.`static`.}
  STYLE_HORIZONTAL*: jint {.`static`.}

