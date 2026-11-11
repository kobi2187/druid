import jnim

jclass java.util.DoubleSummaryStatistics* of JVMObject:
  proc accept*(value: jdouble)
  proc combine*(other: DoubleSummaryStatistics)
  proc getCount*(): jlong
  proc getSum*(): jdouble
  proc getMin*(): jdouble
  proc getMax*(): jdouble
  proc getAverage*(): jdouble
  proc toString*(): string

