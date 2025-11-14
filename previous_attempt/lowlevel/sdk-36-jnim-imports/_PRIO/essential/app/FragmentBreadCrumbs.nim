import jnim

jclass android.app.FragmentBreadCrumbs* of ViewGroup:
  proc setActivity*(a: Activity)
  proc setMaxVisible*(visibleCrumbs: jint)
  proc setParentTitle*(title: CharSequence, shortTitle: CharSequence, listener: OnClickListener)
  proc setOnBreadCrumbClickListener*(listener: OnBreadCrumbClickListener)
  proc setTitle*(title: CharSequence, shortTitle: CharSequence)
  proc onBackStackChanged*()

jclass android.app.FragmentBreadCrumbs.OnBreadCrumbClickListener* of JVMObject:
  proc onBreadCrumbClick*(backStack: BackStackEntry, flags: jint): jboolean

jclass android.app.OnBreadCrumbClickListener* of JVMObject:
  proc onBreadCrumbClick*(backStack: BackStackEntry, flags: jint): jboolean

