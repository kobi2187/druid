import jnim

jclass android.location.UtcModel* of JVMObject:
  proc getA0*(): jdouble
  proc getA1*(): jdouble
  proc getTimeOfWeek*(): jint
  proc getWeekNumber*(): jint
  proc describeContents*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[UtcModel] {.`static`.}

jclass android.location.UtcModel.Builder* of JVMObject:
  proc setA0*(a0: jdouble): Builder
  proc setA1*(a1: jdouble): Builder
  proc setTimeOfWeek*(timeOfWeek: jint): Builder
  proc setWeekNumber*(weekNumber: jint): Builder
  proc build*(): UtcModel

jclass android.location.Builder* of JVMObject:
  proc setA0*(a0: jdouble): Builder
  proc setA1*(a1: jdouble): Builder
  proc setTimeOfWeek*(timeOfWeek: jint): Builder
  proc setWeekNumber*(weekNumber: jint): Builder
  proc build*(): UtcModel

