import jnim

jclass android.view.ActionMode* of JVMObject:
  proc setTag*(tag: JObject)
  proc getTag*(): JObject
  proc setTitle*(title: CharSequence)
  proc setTitle*(resId: jint)
  proc setSubtitle*(subtitle: CharSequence)
  proc setSubtitle*(resId: jint)
  proc setTitleOptionalHint*(titleOptional: jboolean)
  proc getTitleOptionalHint*(): jboolean
  proc isTitleOptional*(): jboolean
  proc setCustomView*(view: View)
  proc setType*(type: jint)
  proc getType*(): jint
  proc invalidate*()
  proc invalidateContentRect*()
  proc hide*(duration: jlong)
  proc finish*()
  proc getMenu*(): Menu
  proc getTitle*(): CharSequence
  proc getSubtitle*(): CharSequence
  proc getCustomView*(): View
  proc getMenuInflater*(): MenuInflater
  proc onWindowFocusChanged*(hasWindowFocus: jboolean)
  proc isUiFocusable*(): jboolean
  TYPE_PRIMARY*: jint {.`static`.}
  TYPE_FLOATING*: jint {.`static`.}
  DEFAULT_HIDE_DURATION*: jint {.`static`.}

jclass android.view.ActionMode.Callback* of JVMObject:
  proc onCreateActionMode*(mode: ActionMode, menu: Menu): jboolean
  proc onPrepareActionMode*(mode: ActionMode, menu: Menu): jboolean
  proc onActionItemClicked*(mode: ActionMode, item: MenuItem): jboolean
  proc onDestroyActionMode*(mode: ActionMode)

jclass android.view.ActionMode.Callback2* of JVMObject:
  proc onGetContentRect*(mode: ActionMode, view: View, outRect: Rect)

jclass android.view.Callback* of JVMObject:
  proc onCreateActionMode*(mode: ActionMode, menu: Menu): jboolean
  proc onPrepareActionMode*(mode: ActionMode, menu: Menu): jboolean
  proc onActionItemClicked*(mode: ActionMode, item: MenuItem): jboolean
  proc onDestroyActionMode*(mode: ActionMode)

jclass android.view.Callback2* of JVMObject:
  proc onGetContentRect*(mode: ActionMode, view: View, outRect: Rect)

