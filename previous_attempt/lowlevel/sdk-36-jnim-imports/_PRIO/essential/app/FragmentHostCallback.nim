import jnim

jclass android.app.FragmentHostCallback* of FragmentContainer:
  proc onDump*(prefix: string, fd: FileDescriptor, writer: PrintWriter, args: seq[string])
  proc onShouldSaveFragmentState*(fragment: Fragment): jboolean
  proc onGetLayoutInflater*(): LayoutInflater
  proc onUseFragmentManagerInflaterFactory*(): jboolean
  proc onGetHost*(): E
  proc onInvalidateOptionsMenu*()
  proc onStartActivityFromFragment*(fragment: Fragment, intent: Intent, requestCode: jint, options: Bundle)
  proc onStartActivityAsUserFromFragment*(fragment: Fragment, intent: Intent, requestCode: jint, options: Bundle, userHandle: UserHandle)
  proc onStartIntentSenderFromFragment*(fragment: Fragment, intent: IntentSender, requestCode: jint, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint, options: Bundle)
  proc onRequestPermissionsFromFragment*(fragment: Fragment, permissions: seq[string], requestCode: jint)
  proc onHasWindowAnimations*(): jboolean
  proc onGetWindowAnimations*(): jint
  proc onAttachFragment*(fragment: Fragment)
  proc onFindViewById*(id: jint): T
  proc onHasView*(): jboolean

