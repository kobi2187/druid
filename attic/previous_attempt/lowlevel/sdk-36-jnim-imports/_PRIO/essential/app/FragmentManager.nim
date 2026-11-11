import jnim

jclass android.app.FragmentManager* of JVMObject:
  proc beginTransaction*(): FragmentTransaction
  proc openTransaction*(): FragmentTransaction
  proc executePendingTransactions*(): jboolean
  proc findFragmentById*(id: jint): Fragment
  proc findFragmentByTag*(tag: string): Fragment
  proc popBackStack*()
  proc popBackStackImmediate*(): jboolean
  proc popBackStack*(name: string, flags: jint)
  proc popBackStackImmediate*(name: string, flags: jint): jboolean
  proc popBackStack*(id: jint, flags: jint)
  proc popBackStackImmediate*(id: jint, flags: jint): jboolean
  proc getBackStackEntryCount*(): jint
  proc getBackStackEntryAt*(index: jint): BackStackEntry
  proc addOnBackStackChangedListener*(listener: OnBackStackChangedListener)
  proc removeOnBackStackChangedListener*(listener: OnBackStackChangedListener)
  proc putFragment*(bundle: Bundle, key: string, fragment: Fragment)
  proc getFragment*(bundle: Bundle, key: string): Fragment
  proc getFragments*(): List[Fragment]
  proc saveFragmentInstanceState*(f: Fragment): Fragment.SavedState
  proc isDestroyed*(): jboolean
  proc registerFragmentLifecycleCallbacks*(cb: FragmentLifecycleCallbacks, recursive: jboolean)
  proc unregisterFragmentLifecycleCallbacks*(cb: FragmentLifecycleCallbacks)
  proc getPrimaryNavigationFragment*(): Fragment
  proc dump*(prefix: string, fd: FileDescriptor, writer: PrintWriter, args: seq[string])
  proc enableDebugLogging*(enabled: jboolean) {.`static`.}
  proc invalidateOptionsMenu*()
  proc isStateSaved*(): jboolean
  POP_BACK_STACK_INCLUSIVE*: jint {.`static`.}

jclass android.app.FragmentManager.BackStackEntry* of JVMObject:
  proc getId*(): jint
  proc getName*(): string
  proc getBreadCrumbTitleRes*(): jint
  proc getBreadCrumbShortTitleRes*(): jint
  proc getBreadCrumbTitle*(): CharSequence
  proc getBreadCrumbShortTitle*(): CharSequence

jclass android.app.FragmentManager.OnBackStackChangedListener* of JVMObject:
  proc onBackStackChanged*()

jclass android.app.FragmentManager.FragmentLifecycleCallbacks* of JVMObject:
  proc onFragmentPreAttached*(fm: FragmentManager, f: Fragment, context: Context)
  proc onFragmentAttached*(fm: FragmentManager, f: Fragment, context: Context)
  proc onFragmentPreCreated*(fm: FragmentManager, f: Fragment, savedInstanceState: Bundle)
  proc onFragmentCreated*(fm: FragmentManager, f: Fragment, savedInstanceState: Bundle)
  proc onFragmentActivityCreated*(fm: FragmentManager, f: Fragment, savedInstanceState: Bundle)
  proc onFragmentViewCreated*(fm: FragmentManager, f: Fragment, v: View, savedInstanceState: Bundle)
  proc onFragmentStarted*(fm: FragmentManager, f: Fragment)
  proc onFragmentResumed*(fm: FragmentManager, f: Fragment)
  proc onFragmentPaused*(fm: FragmentManager, f: Fragment)
  proc onFragmentStopped*(fm: FragmentManager, f: Fragment)
  proc onFragmentSaveInstanceState*(fm: FragmentManager, f: Fragment, outState: Bundle)
  proc onFragmentViewDestroyed*(fm: FragmentManager, f: Fragment)
  proc onFragmentDestroyed*(fm: FragmentManager, f: Fragment)
  proc onFragmentDetached*(fm: FragmentManager, f: Fragment)

jclass android.app.BackStackEntry* of JVMObject:
  proc getId*(): jint
  proc getName*(): string
  proc getBreadCrumbTitleRes*(): jint
  proc getBreadCrumbShortTitleRes*(): jint
  proc getBreadCrumbTitle*(): CharSequence
  proc getBreadCrumbShortTitle*(): CharSequence

jclass android.app.OnBackStackChangedListener* of JVMObject:
  proc onBackStackChanged*()

jclass android.app.FragmentLifecycleCallbacks* of JVMObject:
  proc onFragmentPreAttached*(fm: FragmentManager, f: Fragment, context: Context)
  proc onFragmentAttached*(fm: FragmentManager, f: Fragment, context: Context)
  proc onFragmentPreCreated*(fm: FragmentManager, f: Fragment, savedInstanceState: Bundle)
  proc onFragmentCreated*(fm: FragmentManager, f: Fragment, savedInstanceState: Bundle)
  proc onFragmentActivityCreated*(fm: FragmentManager, f: Fragment, savedInstanceState: Bundle)
  proc onFragmentViewCreated*(fm: FragmentManager, f: Fragment, v: View, savedInstanceState: Bundle)
  proc onFragmentStarted*(fm: FragmentManager, f: Fragment)
  proc onFragmentResumed*(fm: FragmentManager, f: Fragment)
  proc onFragmentPaused*(fm: FragmentManager, f: Fragment)
  proc onFragmentStopped*(fm: FragmentManager, f: Fragment)
  proc onFragmentSaveInstanceState*(fm: FragmentManager, f: Fragment, outState: Bundle)
  proc onFragmentViewDestroyed*(fm: FragmentManager, f: Fragment)
  proc onFragmentDestroyed*(fm: FragmentManager, f: Fragment)
  proc onFragmentDetached*(fm: FragmentManager, f: Fragment)

