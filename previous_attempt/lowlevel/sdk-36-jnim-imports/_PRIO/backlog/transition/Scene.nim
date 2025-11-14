import jnim

jclass android.transition.Scene* of JVMObject:
  proc getSceneForLayout*(sceneRoot: ViewGroup, layoutId: jint, context: Context): Scene {.`static`.}
  proc getSceneRoot*(): ViewGroup
  proc exit*()
  proc enter*()
  proc getCurrentScene*(sceneRoot: ViewGroup): Scene {.`static`.}
  proc setEnterAction*(action: Runnable)
  proc setExitAction*(action: Runnable)

