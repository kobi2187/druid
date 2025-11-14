import jnim

jclass android.telephony.AccessNetworkConstants* of JVMObject:
  proc transportTypeToString*(transportType: jint): string {.`static`.}
  TRANSPORT_TYPE_INVALID*: jint {.`static`.}
  TRANSPORT_TYPE_WWAN*: jint {.`static`.}
  TRANSPORT_TYPE_WLAN*: jint {.`static`.}

jclass android.telephony.AccessNetworkConstants.AccessNetworkType* of JVMObject:
  proc toString*(type: jint): string {.`static`.}
  proc fromString*(str: string): jint {.`static`.}

jclass android.telephony.AccessNetworkConstants.NgranBands* of JVMObject:
  proc getFrequencyRangeGroup*(band: jint): jint {.`static`.}

jclass android.telephony.AccessNetworkType* of JVMObject:
  proc toString*(type: jint): string {.`static`.}
  proc fromString*(str: string): jint {.`static`.}
  UNKNOWN*: jint {.`static`.}
  GERAN*: jint {.`static`.}
  UTRAN*: jint {.`static`.}
  EUTRAN*: jint {.`static`.}
  CDMA2000*: jint {.`static`.}
  IWLAN*: jint {.`static`.}
  NGRAN*: jint {.`static`.}

jclass android.telephony.GeranBand* of JVMObject:
  BAND_T380*: jint {.`static`.}
  BAND_T410*: jint {.`static`.}
  BAND_450*: jint {.`static`.}
  BAND_480*: jint {.`static`.}
  BAND_710*: jint {.`static`.}
  BAND_750*: jint {.`static`.}
  BAND_T810*: jint {.`static`.}
  BAND_850*: jint {.`static`.}
  BAND_P900*: jint {.`static`.}
  BAND_E900*: jint {.`static`.}
  BAND_R900*: jint {.`static`.}
  BAND_DCS1800*: jint {.`static`.}
  BAND_PCS1900*: jint {.`static`.}
  BAND_ER900*: jint {.`static`.}

jclass android.telephony.UtranBand* of JVMObject:
  BAND_1*: jint {.`static`.}
  BAND_2*: jint {.`static`.}
  BAND_3*: jint {.`static`.}
  BAND_4*: jint {.`static`.}
  BAND_5*: jint {.`static`.}
  BAND_6*: jint {.`static`.}
  BAND_7*: jint {.`static`.}
  BAND_8*: jint {.`static`.}
  BAND_9*: jint {.`static`.}
  BAND_10*: jint {.`static`.}
  BAND_11*: jint {.`static`.}
  BAND_12*: jint {.`static`.}
  BAND_13*: jint {.`static`.}
  BAND_14*: jint {.`static`.}
  BAND_19*: jint {.`static`.}
  BAND_20*: jint {.`static`.}
  BAND_21*: jint {.`static`.}
  BAND_22*: jint {.`static`.}
  BAND_25*: jint {.`static`.}
  BAND_26*: jint {.`static`.}
  BAND_A*: jint {.`static`.}
  BAND_B*: jint {.`static`.}
  BAND_C*: jint {.`static`.}
  BAND_D*: jint {.`static`.}
  BAND_E*: jint {.`static`.}
  BAND_F*: jint {.`static`.}

jclass android.telephony.EutranBand* of JVMObject:
  BAND_1*: jint {.`static`.}
  BAND_2*: jint {.`static`.}
  BAND_3*: jint {.`static`.}
  BAND_4*: jint {.`static`.}
  BAND_5*: jint {.`static`.}
  BAND_6*: jint {.`static`.}
  BAND_7*: jint {.`static`.}
  BAND_8*: jint {.`static`.}
  BAND_9*: jint {.`static`.}
  BAND_10*: jint {.`static`.}
  BAND_11*: jint {.`static`.}
  BAND_12*: jint {.`static`.}
  BAND_13*: jint {.`static`.}
  BAND_14*: jint {.`static`.}
  BAND_17*: jint {.`static`.}
  BAND_18*: jint {.`static`.}
  BAND_19*: jint {.`static`.}
  BAND_20*: jint {.`static`.}
  BAND_21*: jint {.`static`.}
  BAND_22*: jint {.`static`.}
  BAND_23*: jint {.`static`.}
  BAND_24*: jint {.`static`.}
  BAND_25*: jint {.`static`.}
  BAND_26*: jint {.`static`.}
  BAND_27*: jint {.`static`.}
  BAND_28*: jint {.`static`.}
  BAND_30*: jint {.`static`.}
  BAND_31*: jint {.`static`.}
  BAND_33*: jint {.`static`.}
  BAND_34*: jint {.`static`.}
  BAND_35*: jint {.`static`.}
  BAND_36*: jint {.`static`.}
  BAND_37*: jint {.`static`.}
  BAND_38*: jint {.`static`.}
  BAND_39*: jint {.`static`.}
  BAND_40*: jint {.`static`.}
  BAND_41*: jint {.`static`.}
  BAND_42*: jint {.`static`.}
  BAND_43*: jint {.`static`.}
  BAND_44*: jint {.`static`.}
  BAND_45*: jint {.`static`.}
  BAND_46*: jint {.`static`.}
  BAND_47*: jint {.`static`.}
  BAND_48*: jint {.`static`.}
  BAND_49*: jint {.`static`.}
  BAND_50*: jint {.`static`.}
  BAND_51*: jint {.`static`.}
  BAND_52*: jint {.`static`.}
  BAND_53*: jint {.`static`.}
  BAND_65*: jint {.`static`.}
  BAND_66*: jint {.`static`.}
  BAND_68*: jint {.`static`.}
  BAND_70*: jint {.`static`.}
  BAND_71*: jint {.`static`.}
  BAND_72*: jint {.`static`.}
  BAND_73*: jint {.`static`.}
  BAND_74*: jint {.`static`.}
  BAND_85*: jint {.`static`.}
  BAND_87*: jint {.`static`.}
  BAND_88*: jint {.`static`.}

jclass android.telephony.CdmaBands* of JVMObject:
  BAND_0*: jint {.`static`.}
  BAND_1*: jint {.`static`.}
  BAND_2*: jint {.`static`.}
  BAND_3*: jint {.`static`.}
  BAND_4*: jint {.`static`.}
  BAND_5*: jint {.`static`.}
  BAND_6*: jint {.`static`.}
  BAND_7*: jint {.`static`.}
  BAND_8*: jint {.`static`.}
  BAND_9*: jint {.`static`.}
  BAND_10*: jint {.`static`.}
  BAND_11*: jint {.`static`.}
  BAND_12*: jint {.`static`.}
  BAND_13*: jint {.`static`.}
  BAND_14*: jint {.`static`.}
  BAND_15*: jint {.`static`.}
  BAND_16*: jint {.`static`.}
  BAND_17*: jint {.`static`.}
  BAND_18*: jint {.`static`.}
  BAND_19*: jint {.`static`.}
  BAND_20*: jint {.`static`.}
  BAND_21*: jint {.`static`.}

jclass android.telephony.NgranBands* of JVMObject:
  proc getFrequencyRangeGroup*(band: jint): jint {.`static`.}
  BAND_1*: jint {.`static`.}
  BAND_2*: jint {.`static`.}
  BAND_3*: jint {.`static`.}
  BAND_5*: jint {.`static`.}
  BAND_7*: jint {.`static`.}
  BAND_8*: jint {.`static`.}
  BAND_12*: jint {.`static`.}
  BAND_14*: jint {.`static`.}
  BAND_18*: jint {.`static`.}
  BAND_20*: jint {.`static`.}
  BAND_25*: jint {.`static`.}
  BAND_26*: jint {.`static`.}
  BAND_28*: jint {.`static`.}
  BAND_29*: jint {.`static`.}
  BAND_30*: jint {.`static`.}
  BAND_34*: jint {.`static`.}
  BAND_38*: jint {.`static`.}
  BAND_39*: jint {.`static`.}
  BAND_40*: jint {.`static`.}
  BAND_41*: jint {.`static`.}
  BAND_46*: jint {.`static`.}
  BAND_48*: jint {.`static`.}
  BAND_50*: jint {.`static`.}
  BAND_51*: jint {.`static`.}
  BAND_53*: jint {.`static`.}
  BAND_65*: jint {.`static`.}
  BAND_66*: jint {.`static`.}
  BAND_70*: jint {.`static`.}
  BAND_71*: jint {.`static`.}
  BAND_74*: jint {.`static`.}
  BAND_75*: jint {.`static`.}
  BAND_76*: jint {.`static`.}
  BAND_77*: jint {.`static`.}
  BAND_78*: jint {.`static`.}
  BAND_79*: jint {.`static`.}
  BAND_80*: jint {.`static`.}
  BAND_81*: jint {.`static`.}
  BAND_82*: jint {.`static`.}
  BAND_83*: jint {.`static`.}
  BAND_84*: jint {.`static`.}
  BAND_86*: jint {.`static`.}
  BAND_89*: jint {.`static`.}
  BAND_90*: jint {.`static`.}
  BAND_91*: jint {.`static`.}
  BAND_92*: jint {.`static`.}
  BAND_93*: jint {.`static`.}
  BAND_94*: jint {.`static`.}
  BAND_95*: jint {.`static`.}
  BAND_96*: jint {.`static`.}
  BAND_257*: jint {.`static`.}
  BAND_258*: jint {.`static`.}
  BAND_260*: jint {.`static`.}
  BAND_261*: jint {.`static`.}
  FREQUENCY_RANGE_GROUP_UNKNOWN*: jint {.`static`.}
  FREQUENCY_RANGE_GROUP_1*: jint {.`static`.}
  FREQUENCY_RANGE_GROUP_2*: jint {.`static`.}

