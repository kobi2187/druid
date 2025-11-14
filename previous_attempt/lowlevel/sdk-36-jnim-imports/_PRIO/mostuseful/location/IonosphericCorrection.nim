import jnim

jclass android.location.IonosphericCorrection* of JVMObject:
  proc getCarrierFrequencyHz*(): jlong
  proc getIonosphericCorrection*(): GnssCorrectionComponent
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[IonosphericCorrection] {.`static`.}

