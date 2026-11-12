import jnim

jclass java.util.StringTokenizer* of JVMObject:
  proc hasMoreTokens*(): jboolean
  proc nextToken*(): string
  proc nextToken*(delim: string): string
  proc hasMoreElements*(): jboolean
  proc nextElement*(): JObject
  proc countTokens*(): jint

