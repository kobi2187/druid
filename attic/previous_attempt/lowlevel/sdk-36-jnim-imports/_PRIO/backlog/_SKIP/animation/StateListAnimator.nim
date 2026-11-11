import jnim

jclass android.animation.StateListAnimator* of JVMObject:
  proc addState*(specs: seq[jint], animator: Animator)
  proc getRunningAnimator*(): Animator
  proc getTarget*(): View
  proc setTarget*(view: View)
  proc clone*(): StateListAnimator
  proc setState*(state: seq[jint])
  proc getTuples*(): ArrayList[Tuple]
  proc jumpToCurrentState*()
  proc getChangingConfigurations*(): jint
  proc setChangingConfigurations*(configs: jint)
  proc appendChangingConfigurations*(configs: jint)
  proc createConstantState*(): ConstantState[StateListAnimator]

jclass android.animation.StateListAnimator.Tuple* of JVMObject:
  proc getSpecs*(): seq[jint]
  proc getAnimator*(): Animator

jclass android.animation.Tuple* of JVMObject:
  proc getSpecs*(): seq[jint]
  proc getAnimator*(): Animator

