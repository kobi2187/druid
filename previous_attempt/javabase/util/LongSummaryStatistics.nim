import jnim

jclass java.util.LongSummaryStatistics* of JVMObject:
  proc accept*(value: jint)
  proc accept*(value: jlong)
  proc combine*(other: LongSummaryStatistics)
  proc getCount*(): jlong
  proc getSum*(): jlong
  proc getMin*(): jlong
  proc getMax*(): jlong
  proc getAverage*(): jdouble
  proc toString*(): string

