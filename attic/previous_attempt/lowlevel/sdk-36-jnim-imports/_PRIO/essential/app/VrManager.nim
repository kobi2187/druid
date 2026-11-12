import jnim

jclass android.app.VrManager* of JVMObject:
  proc registerVrStateCallback*(executor: Executor, callback: VrStateCallback)
  proc unregisterVrStateCallback*(callback: VrStateCallback)
  proc isVrModeEnabled*(): jboolean
  proc isPersistentVrModeEnabled*(): jboolean
  proc setPersistentVrModeEnabled*(enabled: jboolean)
  proc setVr2dDisplayProperties*(vr2dDisplayProp: Vr2dDisplayProperties)
  proc setAndBindVrCompositor*(componentName: ComponentName)
  proc setStandbyEnabled*(standby: jboolean)
  proc setVrInputMethod*(componentName: ComponentName)
  proc getVr2dDisplayId*(): jint

