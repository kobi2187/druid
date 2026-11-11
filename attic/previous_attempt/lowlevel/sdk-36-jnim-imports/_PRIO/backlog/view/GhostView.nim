import jnim

jclass android.view.GhostView* of View:
  proc setMatrix*(matrix: Matrix)
  proc setVisibility*(visibility: jint)
  proc calculateMatrix*(view: View, host: ViewGroup, matrix: Matrix) {.`static`.}
  proc addGhost*(view: View, viewGroup: ViewGroup, matrix: Matrix): GhostView {.`static`.}
  proc addGhost*(view: View, viewGroup: ViewGroup): GhostView {.`static`.}
  proc removeGhost*(view: View) {.`static`.}
  proc getGhost*(view: View): GhostView {.`static`.}

