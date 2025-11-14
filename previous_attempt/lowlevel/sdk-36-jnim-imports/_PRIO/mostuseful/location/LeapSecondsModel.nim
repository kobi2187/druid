import jnim

jclass android.location.LeapSecondsModel* of JVMObject:
  proc getLeapSeconds*(): jint
  proc getLeapSecondsFuture*(): jint
  proc getWeekNumberLeapSecondsFuture*(): jint
  proc getDayNumberLeapSecondsFuture*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[LeapSecondsModel] {.`static`.}

jclass android.location.LeapSecondsModel.Builder* of JVMObject:
  proc setLeapSeconds*(leapSeconds: jint): Builder
  proc setLeapSecondsFuture*(leapSecondsFuture: jint): Builder
  proc setWeekNumberLeapSecondsFuture*(weekNumberLeapSecondsFuture: jint): Builder
  proc setDayNumberLeapSecondsFuture*(dayNumberLeapSecondsFuture: jint): Builder
  proc build*(): LeapSecondsModel

jclass android.location.Builder* of JVMObject:
  proc setLeapSeconds*(leapSeconds: jint): Builder
  proc setLeapSecondsFuture*(leapSecondsFuture: jint): Builder
  proc setWeekNumberLeapSecondsFuture*(weekNumberLeapSecondsFuture: jint): Builder
  proc setDayNumberLeapSecondsFuture*(dayNumberLeapSecondsFuture: jint): Builder
  proc build*(): LeapSecondsModel

