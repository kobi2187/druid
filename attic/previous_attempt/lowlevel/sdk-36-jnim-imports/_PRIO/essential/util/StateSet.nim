import jnim

jclass android.util.StateSet* of JVMObject:
  proc get*(mask: jint): seq[jint] {.`static`.}
  proc isWildCard*(stateSetOrSpec: seq[jint]): jboolean {.`static`.}
  proc stateSetMatches*(stateSpec: seq[jint], stateSet: seq[jint]): jboolean {.`static`.}
  proc stateSetMatches*(stateSpec: seq[jint], state: jint): jboolean {.`static`.}
  proc containsAttribute*(stateSpecs: seq[seq[jint]], attr: jint): jboolean {.`static`.}
  proc trimStateSet*(states: seq[jint], newSize: jint): seq[jint] {.`static`.}
  proc dump*(states: seq[jint]): string {.`static`.}
  VIEW_STATE_WINDOW_FOCUSED*: jint {.`static`.}
  VIEW_STATE_SELECTED*: jint {.`static`.}
  VIEW_STATE_FOCUSED*: jint {.`static`.}
  VIEW_STATE_ENABLED*: jint {.`static`.}
  VIEW_STATE_PRESSED*: jint {.`static`.}
  VIEW_STATE_ACTIVATED*: jint {.`static`.}
  VIEW_STATE_ACCELERATED*: jint {.`static`.}
  VIEW_STATE_HOVERED*: jint {.`static`.}
  VIEW_STATE_DRAG_CAN_ACCEPT*: jint {.`static`.}
  VIEW_STATE_DRAG_HOVERED*: jint {.`static`.}
  WILD_CARD*: jint {.`static`.}
  NOTHING*: jint {.`static`.}

