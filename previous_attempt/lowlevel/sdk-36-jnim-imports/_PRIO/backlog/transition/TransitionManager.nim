import jnim

jclass android.transition.TransitionManager* of JVMObject:
  proc setDefaultTransition*(transition: Transition)
  proc getDefaultTransition*(): Transition {.`static`.}
  proc setTransition*(scene: Scene, transition: Transition)
  proc setTransition*(fromScene: Scene, toScene: Scene, transition: Transition)
  proc getTransition*(scene: Scene): Transition
  proc transitionTo*(scene: Scene)
  proc go*(scene: Scene) {.`static`.}
  proc go*(scene: Scene, transition: Transition) {.`static`.}
  proc beginDelayedTransition*(sceneRoot: ViewGroup) {.`static`.}
  proc beginDelayedTransition*(sceneRoot: ViewGroup, transition: Transition) {.`static`.}
  proc endTransitions*(sceneRoot: ViewGroup) {.`static`.}

