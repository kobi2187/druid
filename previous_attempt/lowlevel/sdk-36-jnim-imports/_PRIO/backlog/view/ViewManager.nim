import jnim

jclass android.view.ViewManager* of JVMObject:
  proc addView*(view: View, params: ViewGroup.LayoutParams)
  proc updateViewLayout*(view: View, params: ViewGroup.LayoutParams)
  proc removeView*(view: View)

