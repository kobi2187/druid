import jnim

jclass java.util.StringJoiner* of JVMObject:
  proc setEmptyValue*(emptyValue: CharSequence): StringJoiner
  proc toString*(): string
  proc add*(newElement: CharSequence): StringJoiner
  proc merge*(other: StringJoiner): StringJoiner
  proc length*(): jint

