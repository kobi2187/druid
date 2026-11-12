import jnim

jclass android.app.Fragment* of JVMObject:
  proc instantiate*(context: Context, fname: string): Fragment {.`static`.}
  proc instantiate*(context: Context, fname: string, args: Bundle): Fragment {.`static`.}
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc getId*(): jint
  proc getTag*(): string
  proc setArguments*(args: Bundle)
  proc getArguments*(): Bundle
  proc isStateSaved*(): jboolean
  proc setInitialSavedState*(state: SavedState)
  proc setTargetFragment*(fragment: Fragment, requestCode: jint)
  proc getTargetFragment*(): Fragment
  proc getTargetRequestCode*(): jint
  proc getContext*(): Context
  proc getActivity*(): Activity
  proc getHost*(): JObject
  proc getResources*(): Resources
  proc getText*(resId: jint): CharSequence
  proc getString*(resId: jint): string
  proc getString*(resId: jint, formatArgs: JObject): string
  proc getFragmentManager*(): FragmentManager
  proc getChildFragmentManager*(): FragmentManager
  proc getParentFragment*(): Fragment
  proc isAdded*(): jboolean
  proc isDetached*(): jboolean
  proc isRemoving*(): jboolean
  proc isInLayout*(): jboolean
  proc isResumed*(): jboolean
  proc isVisible*(): jboolean
  proc isHidden*(): jboolean
  proc onHiddenChanged*(hidden: jboolean)
  proc setRetainInstance*(retain: jboolean)
  proc getRetainInstance*(): jboolean
  proc setHasOptionsMenu*(hasMenu: jboolean)
  proc setMenuVisibility*(menuVisible: jboolean)
  proc setUserVisibleHint*(isVisibleToUser: jboolean)
  proc getUserVisibleHint*(): jboolean
  proc getLoaderManager*(): LoaderManager
  proc startActivity*(intent: Intent)
  proc startActivity*(intent: Intent, options: Bundle)
  proc startActivityForResult*(intent: Intent, requestCode: jint)
  proc startActivityForResult*(intent: Intent, requestCode: jint, options: Bundle)
  proc startActivityForResultAsUser*(intent: Intent, requestCode: jint, options: Bundle, user: UserHandle)
  proc startIntentSenderForResult*(intent: IntentSender, requestCode: jint, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint, options: Bundle)
  proc onActivityResult*(requestCode: jint, resultCode: jint, data: Intent)
  proc requestPermissions*(permissions: seq[string], requestCode: jint)
  proc onRequestPermissionsResult*(requestCode: jint, permissions: seq[string], grantResults: seq[jint])
  proc shouldShowRequestPermissionRationale*(permission: string): jboolean
  proc onGetLayoutInflater*(savedInstanceState: Bundle): LayoutInflater
  proc getLayoutInflater*(): LayoutInflater
  proc onInflate*(attrs: AttributeSet, savedInstanceState: Bundle)
  proc onInflate*(context: Context, attrs: AttributeSet, savedInstanceState: Bundle)
  proc onInflate*(activity: Activity, attrs: AttributeSet, savedInstanceState: Bundle)
  proc onAttachFragment*(childFragment: Fragment)
  proc onAttach*(context: Context)
  proc onAttach*(activity: Activity)
  proc onCreateAnimator*(transit: jint, enter: jboolean, nextAnim: jint): Animator
  proc onCreate*(savedInstanceState: Bundle)
  proc onCreateView*(inflater: LayoutInflater, container: ViewGroup, savedInstanceState: Bundle): View
  proc onViewCreated*(view: View, savedInstanceState: Bundle)
  proc getView*(): View
  proc onActivityCreated*(savedInstanceState: Bundle)
  proc onViewStateRestored*(savedInstanceState: Bundle)
  proc onStart*()
  proc onResume*()
  proc onSaveInstanceState*(outState: Bundle)
  proc onMultiWindowModeChanged*(isInMultiWindowMode: jboolean, newConfig: Configuration)
  proc onMultiWindowModeChanged*(isInMultiWindowMode: jboolean)
  proc onPictureInPictureModeChanged*(isInPictureInPictureMode: jboolean, newConfig: Configuration)
  proc onPictureInPictureModeChanged*(isInPictureInPictureMode: jboolean)
  proc onConfigurationChanged*(newConfig: Configuration)
  proc onPause*()
  proc onStop*()
  proc onLowMemory*()
  proc onTrimMemory*(level: jint)
  proc onDestroyView*()
  proc onDestroy*()
  proc onDetach*()
  proc onCreateOptionsMenu*(menu: Menu, inflater: MenuInflater)
  proc onPrepareOptionsMenu*(menu: Menu)
  proc onDestroyOptionsMenu*()
  proc onOptionsItemSelected*(item: MenuItem): jboolean
  proc onOptionsMenuClosed*(menu: Menu)
  proc onCreateContextMenu*(menu: ContextMenu, v: View, menuInfo: ContextMenuInfo)
  proc registerForContextMenu*(view: View)
  proc unregisterForContextMenu*(view: View)
  proc onContextItemSelected*(item: MenuItem): jboolean
  proc setEnterSharedElementCallback*(callback: SharedElementCallback)
  proc setExitSharedElementCallback*(callback: SharedElementCallback)
  proc setEnterTransition*(transition: Transition)
  proc getEnterTransition*(): Transition
  proc setReturnTransition*(transition: Transition)
  proc getReturnTransition*(): Transition
  proc setExitTransition*(transition: Transition)
  proc getExitTransition*(): Transition
  proc setReenterTransition*(transition: Transition)
  proc getReenterTransition*(): Transition
  proc setSharedElementEnterTransition*(transition: Transition)
  proc getSharedElementEnterTransition*(): Transition
  proc setSharedElementReturnTransition*(transition: Transition)
  proc getSharedElementReturnTransition*(): Transition
  proc setAllowEnterTransitionOverlap*(allow: jboolean)
  proc getAllowEnterTransitionOverlap*(): jboolean
  proc setAllowReturnTransitionOverlap*(allow: jboolean)
  proc getAllowReturnTransitionOverlap*(): jboolean
  proc postponeEnterTransition*()
  proc startPostponedEnterTransition*()
  proc dump*(prefix: string, fd: FileDescriptor, writer: PrintWriter, args: seq[string])

jclass android.app.Fragment.SavedState* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.app.SavedState* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.ClassLoaderCreator[SavedState] {.`static`.}

jclass android.app.InstantiationException* of AndroidRuntimeException:

