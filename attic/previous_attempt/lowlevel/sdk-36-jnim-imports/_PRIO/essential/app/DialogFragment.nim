import jnim

jclass android.app.DialogFragment* of Fragment:
  proc setStyle*(style: jint, theme: jint)
  proc show*(manager: FragmentManager, tag: string)
  proc showAllowingStateLoss*(manager: FragmentManager, tag: string)
  proc show*(transaction: FragmentTransaction, tag: string): jint
  proc dismiss*()
  proc dismissAllowingStateLoss*()
  proc getDialog*(): Dialog
  proc getTheme*(): jint
  proc setCancelable*(cancelable: jboolean)
  proc isCancelable*(): jboolean
  proc setShowsDialog*(showsDialog: jboolean)
  proc getShowsDialog*(): jboolean
  proc onAttach*(context: Context)
  proc onDetach*()
  proc onCreate*(savedInstanceState: Bundle)
  proc onGetLayoutInflater*(savedInstanceState: Bundle): LayoutInflater
  proc onCreateDialog*(savedInstanceState: Bundle): Dialog
  proc onCancel*(dialog: DialogInterface)
  proc onDismiss*(dialog: DialogInterface)
  proc onActivityCreated*(savedInstanceState: Bundle)
  proc onStart*()
  proc onSaveInstanceState*(outState: Bundle)
  proc onStop*()
  proc onDestroyView*()
  proc dump*(prefix: string, fd: FileDescriptor, writer: PrintWriter, args: seq[string])
  STYLE_NORMAL*: jint {.`static`.}
  STYLE_NO_TITLE*: jint {.`static`.}
  STYLE_NO_FRAME*: jint {.`static`.}
  STYLE_NO_INPUT*: jint {.`static`.}

