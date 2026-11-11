import jnim

jclass android.app.FragmentTransaction* of JVMObject:
  proc add*(fragment: Fragment, tag: string): FragmentTransaction
  proc add*(containerViewId: jint, fragment: Fragment): FragmentTransaction
  proc add*(containerViewId: jint, fragment: Fragment, tag: string): FragmentTransaction
  proc replace*(containerViewId: jint, fragment: Fragment): FragmentTransaction
  proc replace*(containerViewId: jint, fragment: Fragment, tag: string): FragmentTransaction
  proc remove*(fragment: Fragment): FragmentTransaction
  proc hide*(fragment: Fragment): FragmentTransaction
  proc show*(fragment: Fragment): FragmentTransaction
  proc detach*(fragment: Fragment): FragmentTransaction
  proc attach*(fragment: Fragment): FragmentTransaction
  proc setPrimaryNavigationFragment*(fragment: Fragment): FragmentTransaction
  proc isEmpty*(): jboolean
  proc setCustomAnimations*(enter: jint, exit: jint): FragmentTransaction
  proc setCustomAnimations*(enter: jint, exit: jint, popEnter: jint, popExit: jint): FragmentTransaction
  proc setTransition*(transit: jint): FragmentTransaction
  proc addSharedElement*(sharedElement: View, name: string): FragmentTransaction
  proc setTransitionStyle*(styleRes: jint): FragmentTransaction
  proc addToBackStack*(name: string): FragmentTransaction
  proc isAddToBackStackAllowed*(): jboolean
  proc disallowAddToBackStack*(): FragmentTransaction
  proc setBreadCrumbTitle*(res: jint): FragmentTransaction
  proc setBreadCrumbTitle*(text: CharSequence): FragmentTransaction
  proc setBreadCrumbShortTitle*(res: jint): FragmentTransaction
  proc setBreadCrumbShortTitle*(text: CharSequence): FragmentTransaction
  proc setReorderingAllowed*(reorderingAllowed: jboolean): FragmentTransaction
  proc runOnCommit*(runnable: Runnable): FragmentTransaction
  proc commit*(): jint
  proc commitAllowingStateLoss*(): jint
  proc commitNow*()
  proc commitNowAllowingStateLoss*()
  TRANSIT_ENTER_MASK*: jint {.`static`.}
  TRANSIT_EXIT_MASK*: jint {.`static`.}
  TRANSIT_UNSET*: jint {.`static`.}
  TRANSIT_NONE*: jint {.`static`.}
  TRANSIT_FRAGMENT_OPEN*: jint {.`static`.}
  TRANSIT_FRAGMENT_CLOSE*: jint {.`static`.}
  TRANSIT_FRAGMENT_FADE*: jint {.`static`.}

