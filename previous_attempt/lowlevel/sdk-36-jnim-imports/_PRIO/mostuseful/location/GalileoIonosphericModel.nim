import jnim

jclass android.location.GalileoIonosphericModel* of JVMObject:
  proc getAi0*(): jdouble
  proc getAi1*(): jdouble
  proc getAi2*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[GalileoIonosphericModel] {.`static`.}

jclass android.location.GalileoIonosphericModel.Builder* of JVMObject:
  proc setAi0*(ai0: jdouble): Builder
  proc setAi1*(ai1: jdouble): Builder
  proc setAi2*(ai2: jdouble): Builder
  proc build*(): GalileoIonosphericModel

jclass android.location.Builder* of JVMObject:
  proc setAi0*(ai0: jdouble): Builder
  proc setAi1*(ai1: jdouble): Builder
  proc setAi2*(ai2: jdouble): Builder
  proc build*(): GalileoIonosphericModel

