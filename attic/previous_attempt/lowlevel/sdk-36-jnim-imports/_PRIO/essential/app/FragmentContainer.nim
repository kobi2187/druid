import jnim

jclass android.app.FragmentContainer* of JVMObject:
  proc onFindViewById*(id: jint): T
  proc onHasView*(): jboolean
  proc instantiate*(context: Context, className: string, arguments: Bundle): Fragment

