import jnim

jclass android.widget.ForwardingListener* of JVMObject:
  proc getPopup*(): ShowableListMenu
  proc onTouch*(v: View, event: MotionEvent): jboolean
  proc onViewAttachedToWindow*(v: View)
  proc onViewDetachedFromWindow*(v: View)

