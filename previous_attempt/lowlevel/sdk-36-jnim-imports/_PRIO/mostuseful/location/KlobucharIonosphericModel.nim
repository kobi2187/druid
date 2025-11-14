import jnim

jclass android.location.KlobucharIonosphericModel* of JVMObject:
  proc getAlpha0*(): jdouble
  proc getAlpha1*(): jdouble
  proc getAlpha2*(): jdouble
  proc getAlpha3*(): jdouble
  proc getBeta0*(): jdouble
  proc getBeta1*(): jdouble
  proc getBeta2*(): jdouble
  proc getBeta3*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[KlobucharIonosphericModel] {.`static`.}

jclass android.location.KlobucharIonosphericModel.Builder* of JVMObject:
  proc setAlpha0*(alpha0: jdouble): Builder
  proc setAlpha1*(alpha1: jdouble): Builder
  proc setAlpha2*(alpha2: jdouble): Builder
  proc setAlpha3*(alpha3: jdouble): Builder
  proc setBeta0*(beta0: jdouble): Builder
  proc setBeta1*(beta1: jdouble): Builder
  proc setBeta2*(beta2: jdouble): Builder
  proc setBeta3*(beta3: jdouble): Builder
  proc build*(): KlobucharIonosphericModel

jclass android.location.Builder* of JVMObject:
  proc setAlpha0*(alpha0: jdouble): Builder
  proc setAlpha1*(alpha1: jdouble): Builder
  proc setAlpha2*(alpha2: jdouble): Builder
  proc setAlpha3*(alpha3: jdouble): Builder
  proc setBeta0*(beta0: jdouble): Builder
  proc setBeta1*(beta1: jdouble): Builder
  proc setBeta2*(beta2: jdouble): Builder
  proc setBeta3*(beta3: jdouble): Builder
  proc build*(): KlobucharIonosphericModel

