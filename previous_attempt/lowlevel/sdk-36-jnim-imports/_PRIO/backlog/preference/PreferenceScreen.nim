import jnim

jclass android.preference.PreferenceScreen* of PreferenceGroup:
  proc setDialogFitsSystemWindows*(dialogFitsSystemWindows: jboolean)
  proc getRootAdapter*(): ListAdapter
  proc bind*(listView: ListView)
  proc onDismiss*(dialog: DialogInterface)
  proc getDialog*(): Dialog
  proc onItemClick*(parent: AdapterView, view: View, position: jint, id: jlong)

