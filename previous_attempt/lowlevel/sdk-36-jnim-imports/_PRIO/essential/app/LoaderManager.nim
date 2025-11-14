import jnim

jclass android.app.LoaderManager* of JVMObject:
  proc initLoader*(id: jint, args: Bundle, callback: LoaderManager.LoaderCallbacks[D]): Loader[D]
  proc restartLoader*(id: jint, args: Bundle, callback: LoaderManager.LoaderCallbacks[D]): Loader[D]
  proc destroyLoader*(id: jint)
  proc getLoader*(id: jint): Loader[D]
  proc dump*(prefix: string, fd: FileDescriptor, writer: PrintWriter, args: seq[string])
  proc enableDebugLogging*(enabled: jboolean) {.`static`.}
  proc getFragmentHostCallback*(): FragmentHostCallback

jclass android.app.LoaderManager.LoaderCallbacks* of JVMObject:
  proc onCreateLoader*(id: jint, args: Bundle): Loader[D]
  proc onLoadFinished*(loader: Loader[D], data: D)
  proc onLoaderReset*(loader: Loader[D])

jclass android.app.LoaderCallbacks* of JVMObject:
  proc onCreateLoader*(id: jint, args: Bundle): Loader[D]
  proc onLoadFinished*(loader: Loader[D], data: D)
  proc onLoaderReset*(loader: Loader[D])

