import jnim

jclass android.util.DayOfMonthCursor* of MonthDisplayHelper:
  proc getSelectedRow*(): jint
  proc getSelectedColumn*(): jint
  proc setSelectedRowColumn*(row: jint, col: jint)
  proc getSelectedDayOfMonth*(): jint
  proc getSelectedMonthOffset*(): jint
  proc setSelectedDayOfMonth*(dayOfMonth: jint)
  proc isSelected*(row: jint, column: jint): jboolean
  proc up*(): jboolean
  proc down*(): jboolean
  proc left*(): jboolean
  proc right*(): jboolean

