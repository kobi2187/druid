import jnim

jclass android.view.ViewStub* of View:
  proc getInflatedId*(): jint
  proc setInflatedId*(inflatedId: jint)
  proc setInflatedIdAsync*(inflatedId: jint): Runnable
  proc getLayoutResource*(): jint
  proc setLayoutResource*(layoutResource: jint)
  proc setLayoutResourceAsync*(layoutResource: jint): Runnable
  proc setLayoutInflater*(inflater: LayoutInflater)
  proc getLayoutInflater*(): LayoutInflater
  proc draw*(canvas: Canvas)
  proc setVisibility*(visibility: jint)
  proc setVisibilityAsync*(visibility: jint): Runnable
  proc inflate*(): View
  proc setOnInflateListener*(inflateListener: OnInflateListener)

jclass android.view.ViewStub.ViewReplaceRunnable* of JVMObject:
  proc run*()


jclass android.view.ViewReplaceRunnable* of JVMObject:
  proc run*()
  view*: View

