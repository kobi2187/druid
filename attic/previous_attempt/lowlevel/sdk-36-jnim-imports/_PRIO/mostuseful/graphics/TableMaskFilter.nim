import jnim

jclass android.graphics.TableMaskFilter* of MaskFilter:
  proc CreateClipTable*(min: jint, max: jint): TableMaskFilter {.`static`.}
  proc CreateGammaTable*(gamma: jfloat): TableMaskFilter {.`static`.}

