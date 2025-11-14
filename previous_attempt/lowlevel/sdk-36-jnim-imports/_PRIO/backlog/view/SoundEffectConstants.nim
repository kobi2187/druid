import jnim

jclass android.view.SoundEffectConstants* of JVMObject:
  proc getContantForFocusDirection*(direction: jint): jint {.`static`.}
  proc getConstantForFocusDirection*(direction: jint, repeating: jboolean): jint {.`static`.}
  proc isNavigationRepeat*(effectId: jint): jboolean {.`static`.}
  proc nextNavigationRepeatSoundEffectId*(): jint {.`static`.}
  CLICK*: jint {.`static`.}
  NAVIGATION_LEFT*: jint {.`static`.}
  NAVIGATION_UP*: jint {.`static`.}
  NAVIGATION_RIGHT*: jint {.`static`.}
  NAVIGATION_DOWN*: jint {.`static`.}
  NAVIGATION_REPEAT_LEFT*: jint {.`static`.}
  NAVIGATION_REPEAT_UP*: jint {.`static`.}
  NAVIGATION_REPEAT_RIGHT*: jint {.`static`.}
  NAVIGATION_REPEAT_DOWN*: jint {.`static`.}

