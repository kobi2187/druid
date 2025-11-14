import jnim

jclass android.graphics.MeshSpecification* of JVMObject:
  proc make*(attributes: seq[Attribute], vertexStride: jint, varyings: seq[Varying], vertexShader: string, fragmentShader: string): MeshSpecification {.`static`.}
  proc make*(attributes: seq[Attribute], vertexStride: jint, varyings: seq[Varying], vertexShader: string, fragmentShader: string, colorSpace: ColorSpace): MeshSpecification {.`static`.}
  proc make*(attributes: seq[Attribute], vertexStride: jint, varyings: seq[Varying], vertexShader: string, fragmentShader: string, colorSpace: ColorSpace, alphaType: jint): MeshSpecification {.`static`.}
  ALPHA_TYPE_UNKNOWN*: jint {.`static`.}
  ALPHA_TYPE_OPAQUE*: jint {.`static`.}
  ALPHA_TYPE_PREMULTIPLIED*: jint {.`static`.}
  ALPHA_TYPE_UNPREMULTIPLIED*: jint {.`static`.}
  TYPE_FLOAT*: jint {.`static`.}
  TYPE_FLOAT2*: jint {.`static`.}
  TYPE_FLOAT3*: jint {.`static`.}
  TYPE_FLOAT4*: jint {.`static`.}
  TYPE_UBYTE4*: jint {.`static`.}

jclass android.graphics.MeshSpecification.Attribute* of JVMObject:
  proc getType*(): jint
  proc getOffset*(): jint
  proc getName*(): string
  proc toString*(): string

jclass android.graphics.MeshSpecification.Varying* of JVMObject:
  proc getType*(): jint
  proc getName*(): string
  proc toString*(): string

jclass android.graphics.Attribute* of JVMObject:
  proc getType*(): jint
  proc getOffset*(): jint
  proc getName*(): string
  proc toString*(): string

jclass android.graphics.Varying* of JVMObject:
  proc getType*(): jint
  proc getName*(): string
  proc toString*(): string

