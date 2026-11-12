import jnim

jclass android.widget.CalendarView* of FrameLayout:
  proc setShownWeekCount*(count: jint)
  proc getShownWeekCount*(): jint
  proc setSelectedWeekBackgroundColor*(color: jint)
  proc getSelectedWeekBackgroundColor*(): jint
  proc setFocusedMonthDateColor*(color: jint)
  proc getFocusedMonthDateColor*(): jint
  proc setUnfocusedMonthDateColor*(color: jint)
  proc getUnfocusedMonthDateColor*(): jint
  proc setWeekNumberColor*(color: jint)
  proc getWeekNumberColor*(): jint
  proc setWeekSeparatorLineColor*(color: jint)
  proc getWeekSeparatorLineColor*(): jint
  proc setSelectedDateVerticalBar*(resourceId: jint)
  proc setSelectedDateVerticalBar*(drawable: Drawable)
  proc getSelectedDateVerticalBar*(): Drawable
  proc setWeekDayTextAppearance*(resourceId: jint)
  proc getWeekDayTextAppearance*(): jint
  proc setDateTextAppearance*(resourceId: jint)
  proc getDateTextAppearance*(): jint
  proc getMinDate*(): jlong
  proc setMinDate*(minDate: jlong)
  proc getMaxDate*(): jlong
  proc setMaxDate*(maxDate: jlong)
  proc setShowWeekNumber*(showWeekNumber: jboolean)
  proc getShowWeekNumber*(): jboolean
  proc getFirstDayOfWeek*(): jint
  proc setFirstDayOfWeek*(firstDayOfWeek: jint)
  proc setOnDateChangeListener*(listener: OnDateChangeListener)
  proc getDate*(): jlong
  proc setDate*(date: jlong)
  proc setDate*(date: jlong, animate: jboolean, center: jboolean)
  proc getBoundsForDate*(date: jlong, outBounds: Rect): jboolean
  proc getAccessibilityClassName*(): CharSequence
  proc parseDate*(date: string, outDate: Calendar): jboolean {.`static`.}

