import jnim

jclass android.app.FragmentController* of JVMObject:
  proc createController*(callbacks: FragmentHostCallback[?]): FragmentController {.`static`.}
  proc getFragmentManager*(): FragmentManager
  proc getLoaderManager*(): LoaderManager
  proc findFragmentByWho*(who: string): Fragment
  proc attachHost*(parent: Fragment)
  proc onCreateView*(parent: View, name: string, context: Context, attrs: AttributeSet): View
  proc noteStateNotSaved*()
  proc saveAllState*(): Parcelable
  proc restoreAllState*(state: Parcelable, nonConfigList: List[Fragment])
  proc restoreAllState*(state: Parcelable, nonConfig: FragmentManagerNonConfig)
  proc retainNonConfig*(): List[Fragment]
  proc retainNestedNonConfig*(): FragmentManagerNonConfig
  proc dispatchCreate*()
  proc dispatchActivityCreated*()
  proc dispatchStart*()
  proc dispatchResume*()
  proc dispatchPause*()
  proc dispatchStop*()
  proc dispatchDestroyView*()
  proc dispatchDestroy*()
  proc dispatchMultiWindowModeChanged*(isInMultiWindowMode: jboolean)
  proc dispatchMultiWindowModeChanged*(isInMultiWindowMode: jboolean, newConfig: Configuration)
  proc dispatchPictureInPictureModeChanged*(isInPictureInPictureMode: jboolean)
  proc dispatchPictureInPictureModeChanged*(isInPictureInPictureMode: jboolean, newConfig: Configuration)
  proc dispatchConfigurationChanged*(newConfig: Configuration)
  proc dispatchLowMemory*()
  proc dispatchTrimMemory*(level: jint)
  proc dispatchCreateOptionsMenu*(menu: Menu, inflater: MenuInflater): jboolean
  proc dispatchPrepareOptionsMenu*(menu: Menu): jboolean
  proc dispatchOptionsItemSelected*(item: MenuItem): jboolean
  proc dispatchContextItemSelected*(item: MenuItem): jboolean
  proc dispatchOptionsMenuClosed*(menu: Menu)
  proc execPendingActions*(): jboolean
  proc doLoaderStart*()
  proc doLoaderStop*(retain: jboolean)
  proc doLoaderDestroy*()
  proc reportLoaderStart*()
  proc retainLoaderNonConfig*(): ArrayMap[string, LoaderManager]
  proc restoreLoaderNonConfig*(loaderManagers: ArrayMap[string, LoaderManager])
  proc dumpLoaders*(prefix: string, fd: FileDescriptor, writer: PrintWriter, args: seq[string])

