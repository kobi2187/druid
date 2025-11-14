import jnim

jclass android.view.EventLogTags* of JVMObject:
  proc writeImfImeAnimStart*(token: string, animationType: jint, alpha: jfloat, currentInsets: string, shownInsets: string, hiddenInsets: string) {.`static`.}
  proc writeImfImeAnimFinish*(token: string, animationType: jint, alpha: jfloat, shown: jint, insets: string) {.`static`.}
  proc writeImfImeAnimCancel*(token: string, animationType: jint, pendingInsets: string) {.`static`.}
  proc writeImfImeRemoteAnimStart*(token: string, displayid: jint, direction: jint, alpha: jfloat, starty: jfloat, endy: jfloat, leash: string, insets: string, surfacePosition: string, imeFrame: string) {.`static`.}
  proc writeImfImeRemoteAnimEnd*(token: string, displayid: jint, direction: jint, endy: jfloat, leash: string, insets: string, surfacePosition: string, imeFrame: string) {.`static`.}
  proc writeImfImeRemoteAnimCancel*(token: string, displayid: jint, insets: string) {.`static`.}
  proc writeViewEnqueueInputEvent*(eventtype: string, action: string) {.`static`.}
  proc writeViewrootDrawEvent*(window: string, event: string) {.`static`.}
  proc writeSurfaceviewLayout*(window: string, format: jint, width: jint, height: jint, z: jint, sizefrom: string, attached: jint, lifecyclestrategy: jint, viewvisible: jint) {.`static`.}
  proc writeSurfaceviewCallback*(window: string, callback: string) {.`static`.}
  IMF_IME_ANIM_START*: jint {.`static`.}
  IMF_IME_ANIM_FINISH*: jint {.`static`.}
  IMF_IME_ANIM_CANCEL*: jint {.`static`.}
  IMF_IME_REMOTE_ANIM_START*: jint {.`static`.}
  IMF_IME_REMOTE_ANIM_END*: jint {.`static`.}
  IMF_IME_REMOTE_ANIM_CANCEL*: jint {.`static`.}
  VIEW_ENQUEUE_INPUT_EVENT*: jint {.`static`.}
  VIEWROOT_DRAW_EVENT*: jint {.`static`.}
  SURFACEVIEW_LAYOUT*: jint {.`static`.}
  SURFACEVIEW_CALLBACK*: jint {.`static`.}

