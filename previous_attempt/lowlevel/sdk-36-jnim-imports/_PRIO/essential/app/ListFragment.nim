import jnim

jclass android.app.ListFragment* of Fragment:
  proc onCreateView*(inflater: LayoutInflater, container: ViewGroup, savedInstanceState: Bundle): View
  proc onViewCreated*(view: View, savedInstanceState: Bundle)
  proc onDestroyView*()
  proc onListItemClick*(l: ListView, v: View, position: jint, id: jlong)
  proc setListAdapter*(adapter: ListAdapter)
  proc setSelection*(position: jint)
  proc getSelectedItemPosition*(): jint
  proc getSelectedItemId*(): jlong
  proc getListView*(): ListView
  proc setEmptyText*(text: CharSequence)
  proc setListShown*(shown: jboolean)
  proc setListShownNoAnimation*(shown: jboolean)
  proc getListAdapter*(): ListAdapter

