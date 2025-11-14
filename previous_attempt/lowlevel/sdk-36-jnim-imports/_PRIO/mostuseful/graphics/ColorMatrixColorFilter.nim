import jnim

jclass android.graphics.ColorMatrixColorFilter* of ColorFilter:
  proc getColorMatrix*(colorMatrix: ColorMatrix)
  proc setColorMatrix*(matrix: ColorMatrix)
  proc setColorMatrixArray*(array: seq[jfloat])

