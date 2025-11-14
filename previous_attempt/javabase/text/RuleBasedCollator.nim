import jnim

jclass java.text.RuleBasedCollator* of Collator:
  proc getRules*(): string
  proc getCollationElementIterator*(source: string): CollationElementIterator
  proc getCollationElementIterator*(source: CharacterIterator): CollationElementIterator
  proc compare*(source: string, target: string): jint
  proc getCollationKey*(source: string): CollationKey
  proc clone*(): JObject
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint

