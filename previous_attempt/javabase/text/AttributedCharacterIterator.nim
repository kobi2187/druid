import jnim

jclass java.text.AttributedCharacterIterator* of CharacterIterator:
  proc getRunStart*(): jint
  proc getRunStart*(attribute: Attribute): jint
  proc getRunStart*(attributes: Set[? extends Attribute]): jint
  proc getRunLimit*(): jint
  proc getRunLimit*(attribute: Attribute): jint
  proc getRunLimit*(attributes: Set[? extends Attribute]): jint
  proc getAttributes*(): Map[Attribute, JObject]
  proc getAttribute*(attribute: Attribute): JObject
  proc getAllAttributeKeys*(): Set[Attribute]

jclass java.text.AttributedCharacterIterator.Attribute* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass java.text.Attribute* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  LANGUAGE*: Attribute {.`static`.}
  READING*: Attribute {.`static`.}
  INPUT_METHOD_SEGMENT*: Attribute {.`static`.}

