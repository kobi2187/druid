import jnim

jclass android.view.FocusFinder* of JVMObject:
  proc getInstance*(): FocusFinder {.`static`.}
  proc findNextFocus*(root: ViewGroup, focused: View, direction: jint): View
  proc findNextFocusFromRect*(root: ViewGroup, focusedRect: Rect, direction: jint): View
  proc findNextKeyboardNavigationCluster*(root: View, currentCluster: View, direction: jint): View
  proc findNearestTouchable*(root: ViewGroup, x: jint, y: jint, direction: jint, deltas: seq[jint]): View
  proc sort*(views: seq[View], start: jint, end: jint, root: ViewGroup, isRtl: jboolean) {.`static`.}

