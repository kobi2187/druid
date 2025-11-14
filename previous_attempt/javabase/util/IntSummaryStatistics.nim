import jnim

jclass java.util.IntSummaryStatistics* of JVMObject:
  proc accept*(value: jint)
  proc combine*(other: IntSummaryStatistics)
  proc getCount*(): jlong
  proc getSum*(): jlong
  proc getMin*(): jint
  proc getMax*(): jint
  proc getAverage*(): jdouble
  proc toString*(): string

