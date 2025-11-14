import jnim

jclass android.location.TimeModel* of JVMObject:
  proc getToGnss*(): jint
  proc getA0*(): jdouble
  proc getA1*(): jdouble
  proc getTimeOfWeek*(): jint
  proc getWeekNumber*(): jint
  proc describeContents*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[TimeModel] {.`static`.}

jclass android.location.TimeModel.Builder* of JVMObject:
  proc setToGnss*(toGnss: jint): Builder
  proc setA0*(a0: jdouble): Builder
  proc setA1*(a1: jdouble): Builder
  proc setTimeOfWeek*(timeOfWeek: jint): Builder
  proc setWeekNumber*(weekNumber: jint): Builder
  proc build*(): TimeModel

jclass android.location.Builder* of JVMObject:
  proc setToGnss*(toGnss: jint): Builder
  proc setA0*(a0: jdouble): Builder
  proc setA1*(a1: jdouble): Builder
  proc setTimeOfWeek*(timeOfWeek: jint): Builder
  proc setWeekNumber*(weekNumber: jint): Builder
  proc build*(): TimeModel

