import jnim

jclass android.app.ListActivity* of Activity:
  proc onContentChanged*()
  proc setListAdapter*(adapter: ListAdapter)
  proc setSelection*(position: jint)
  proc getSelectedItemPosition*(): jint
  proc getSelectedItemId*(): jlong
  proc getListView*(): ListView
  proc getListAdapter*(): ListAdapter

