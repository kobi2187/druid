import jnim

jclass android.graphics.RenderEffect* of JVMObject:
  proc createOffsetEffect*(offsetX: jfloat, offsetY: jfloat): RenderEffect {.`static`.}
  proc createOffsetEffect*(offsetX: jfloat, offsetY: jfloat, input: RenderEffect): RenderEffect {.`static`.}
  proc createBlurEffect*(radiusX: jfloat, radiusY: jfloat, inputEffect: RenderEffect, edgeTreatment: TileMode): RenderEffect {.`static`.}
  proc createBlurEffect*(radiusX: jfloat, radiusY: jfloat, edgeTreatment: TileMode): RenderEffect {.`static`.}
  proc createBitmapEffect*(bitmap: Bitmap): RenderEffect {.`static`.}
  proc createBitmapEffect*(bitmap: Bitmap, src: Rect, dst: Rect): RenderEffect {.`static`.}
  proc createColorFilterEffect*(colorFilter: ColorFilter, renderEffect: RenderEffect): RenderEffect {.`static`.}
  proc createColorFilterEffect*(colorFilter: ColorFilter): RenderEffect {.`static`.}
  proc createBlendModeEffect*(dst: RenderEffect, src: RenderEffect, blendMode: BlendMode): RenderEffect {.`static`.}
  proc createChainEffect*(outer: RenderEffect, inner: RenderEffect): RenderEffect {.`static`.}
  proc createShaderEffect*(shader: Shader): RenderEffect {.`static`.}
  proc createRuntimeShaderEffect*(shader: RuntimeShader, uniformShaderName: string): RenderEffect {.`static`.}

