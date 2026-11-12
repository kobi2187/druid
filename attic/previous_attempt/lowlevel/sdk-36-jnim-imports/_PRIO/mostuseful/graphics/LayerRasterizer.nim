import jnim

jclass android.graphics.LayerRasterizer* of Rasterizer:
  proc addLayer*(paint: Paint, dx: jfloat, dy: jfloat)
  proc addLayer*(paint: Paint)

