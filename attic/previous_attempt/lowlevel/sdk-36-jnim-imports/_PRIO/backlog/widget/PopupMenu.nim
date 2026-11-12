import jnim

jclass android.widget.PopupMenu* of JVMObject:
  proc setGravity*(gravity: jint)
  proc getGravity*(): jint
  proc getDragToOpenListener*(): OnTouchListener
  proc getMenu*(): Menu
  proc getMenuInflater*(): MenuInflater
  proc inflate*(menuRes: jint)
  proc show*()
  proc dismiss*()
  proc setOnMenuItemClickListener*(listener: OnMenuItemClickListener)
  proc setOnDismissListener*(listener: OnDismissListener)
  proc setForceShowIcon*(forceShowIcon: jboolean)
  proc getMenuListView*(): ListView


