import jnim

jclass android.app.SearchDialog* of Dialog:
  proc show*(initialQuery: string, selectInitialQuery: jboolean, componentName: ComponentName, appSearchData: Bundle): jboolean
  proc onStart*()
  proc onStop*()
  proc setWorking*(working: jboolean)
  proc onSaveInstanceState*(): Bundle
  proc onRestoreInstanceState*(savedInstanceState: Bundle)
  proc onConfigurationChanged*()
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc hide*()
  proc launchQuerySearch*()
  proc setListSelection*(index: jint)
  proc onBackPressed*()

jclass android.app.SearchDialog.SearchBar* of JVMObject:
  proc startActionModeForChild*(child: View, callback: ActionMode.Callback, type: jint): ActionMode

jclass android.app.SearchBar* of LinearLayout:
  proc startActionModeForChild*(child: View, callback: ActionMode.Callback, type: jint): ActionMode

