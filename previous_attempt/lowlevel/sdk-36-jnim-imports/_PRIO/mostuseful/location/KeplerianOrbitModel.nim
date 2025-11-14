import jnim

jclass android.location.KeplerianOrbitModel* of JVMObject:
  proc getRootA*(): jdouble
  proc getEccentricity*(): jdouble
  proc getI0*(): jdouble
  proc getIDot*(): jdouble
  proc getOmega*(): jdouble
  proc getOmega0*(): jdouble
  proc getOmegaDot*(): jdouble
  proc getM0*(): jdouble
  proc getDeltaN*(): jdouble
  proc getSecondOrderHarmonicPerturbation*(): SecondOrderHarmonicPerturbation
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[KeplerianOrbitModel] {.`static`.}

jclass android.location.KeplerianOrbitModel.Builder* of JVMObject:
  proc setRootA*(rootA: jdouble): Builder
  proc setEccentricity*(eccentricity: jdouble): Builder
  proc setI0*(i0: jdouble): Builder
  proc setIDot*(iDot: jdouble): Builder
  proc setOmega*(omega: jdouble): Builder
  proc setOmega0*(omega0: jdouble): Builder
  proc setOmegaDot*(omegaDot: jdouble): Builder
  proc setM0*(m0: jdouble): Builder
  proc setDeltaN*(deltaN: jdouble): Builder
  proc setSecondOrderHarmonicPerturbation*(secondOrderHarmonicPerturbation: SecondOrderHarmonicPerturbation): Builder
  proc build*(): KeplerianOrbitModel

jclass android.location.KeplerianOrbitModel.SecondOrderHarmonicPerturbation* of JVMObject:
  proc getCic*(): jdouble
  proc getCis*(): jdouble
  proc getCrc*(): jdouble
  proc getCrs*(): jdouble
  proc getCuc*(): jdouble
  proc getCus*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.Builder* of JVMObject:
  proc setRootA*(rootA: jdouble): Builder
  proc setEccentricity*(eccentricity: jdouble): Builder
  proc setI0*(i0: jdouble): Builder
  proc setIDot*(iDot: jdouble): Builder
  proc setOmega*(omega: jdouble): Builder
  proc setOmega0*(omega0: jdouble): Builder
  proc setOmegaDot*(omegaDot: jdouble): Builder
  proc setM0*(m0: jdouble): Builder
  proc setDeltaN*(deltaN: jdouble): Builder
  proc setSecondOrderHarmonicPerturbation*(secondOrderHarmonicPerturbation: SecondOrderHarmonicPerturbation): Builder
  proc build*(): KeplerianOrbitModel

jclass android.location.SecondOrderHarmonicPerturbation* of JVMObject:
  proc getCic*(): jdouble
  proc getCis*(): jdouble
  proc getCrc*(): jdouble
  proc getCrs*(): jdouble
  proc getCuc*(): jdouble
  proc getCus*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[SecondOrderHarmonicPerturbation] {.`static`.}

jclass android.location.SecondOrderHarmonicPerturbation.Builder* of JVMObject:
  proc setCic*(cic: jdouble): Builder
  proc setCis*(cis: jdouble): Builder
  proc setCrc*(crc: jdouble): Builder
  proc setCrs*(crs: jdouble): Builder
  proc setCuc*(cuc: jdouble): Builder
  proc setCus*(cus: jdouble): Builder
  proc build*(): SecondOrderHarmonicPerturbation

jclass android.location.Builder* of JVMObject:
  proc setCic*(cic: jdouble): Builder
  proc setCis*(cis: jdouble): Builder
  proc setCrc*(crc: jdouble): Builder
  proc setCrs*(crs: jdouble): Builder
  proc setCuc*(cuc: jdouble): Builder
  proc setCus*(cus: jdouble): Builder
  proc build*(): SecondOrderHarmonicPerturbation

