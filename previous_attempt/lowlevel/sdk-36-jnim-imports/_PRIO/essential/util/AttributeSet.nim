import jnim

jclass android.util.AttributeSet* of JVMObject:
  proc getAttributeCount*(): jint
  proc getAttributeName*(index: jint): string
  proc getAttributeValue*(index: jint): string
  proc getAttributeValue*(namespace: string, name: string): string
  proc getPositionDescription*(): string
  proc getAttributeNameResource*(index: jint): jint
  proc getAttributeListValue*(namespace: string, attribute: string, options: seq[string], defaultValue: jint): jint
  proc getAttributeBooleanValue*(namespace: string, attribute: string, defaultValue: jboolean): jboolean
  proc getAttributeResourceValue*(namespace: string, attribute: string, defaultValue: jint): jint
  proc getAttributeIntValue*(namespace: string, attribute: string, defaultValue: jint): jint
  proc getAttributeUnsignedIntValue*(namespace: string, attribute: string, defaultValue: jint): jint
  proc getAttributeFloatValue*(namespace: string, attribute: string, defaultValue: jfloat): jfloat
  proc getAttributeListValue*(index: jint, options: seq[string], defaultValue: jint): jint
  proc getAttributeBooleanValue*(index: jint, defaultValue: jboolean): jboolean
  proc getAttributeResourceValue*(index: jint, defaultValue: jint): jint
  proc getAttributeIntValue*(index: jint, defaultValue: jint): jint
  proc getAttributeUnsignedIntValue*(index: jint, defaultValue: jint): jint
  proc getAttributeFloatValue*(index: jint, defaultValue: jfloat): jfloat
  proc getIdAttribute*(): string
  proc getClassAttribute*(): string
  proc getIdAttributeResourceValue*(defaultValue: jint): jint
  proc getStyleAttribute*(): jint

