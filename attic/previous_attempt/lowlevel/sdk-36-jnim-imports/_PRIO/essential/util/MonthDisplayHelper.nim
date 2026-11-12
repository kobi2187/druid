import jnim

jclass android.util.MonthDisplayHelper* of JVMObject:
  proc getYear*(): jint
  proc getMonth*(): jint
  proc getWeekStartDay*(): jint
  proc getFirstDayOfMonth*(): jint
  proc getNumberOfDaysInMonth*(): jint
  proc getOffset*(): jint
  proc getDigitsForRow*(row: jint): seq[jint]
  proc getDayAt*(row: jint, column: jint): jint
  proc getRowOf*(day: jint): jint
  proc getColumnOf*(day: jint): jint
  proc previousMonth*()
  proc nextMonth*()
  proc isWithinCurrentMonth*(row: jint, column: jint): jboolean

