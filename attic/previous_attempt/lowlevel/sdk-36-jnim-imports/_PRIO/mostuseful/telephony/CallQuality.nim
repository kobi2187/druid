import jnim

jclass android.telephony.CallQuality* of JVMObject:
  proc getDownlinkCallQualityLevel*(): jint
  proc getUplinkCallQualityLevel*(): jint
  proc getCallDuration*(): jint
  proc getNumRtpPacketsTransmitted*(): jint
  proc getNumRtpPacketsReceived*(): jint
  proc getNumRtpPacketsTransmittedLost*(): jint
  proc getNumRtpPacketsNotReceived*(): jint
  proc getAverageRelativeJitter*(): jint
  proc getMaxRelativeJitter*(): jint
  proc getAverageRoundTripTime*(): jint
  proc isRtpInactivityDetected*(): jboolean
  proc isIncomingSilenceDetectedAtCallSetup*(): jboolean
  proc isOutgoingSilenceDetectedAtCallSetup*(): jboolean
  proc getNumVoiceFrames*(): jint
  proc getNumNoDataFrames*(): jint
  proc getNumDroppedRtpPackets*(): jint
  proc getMinPlayoutDelayMillis*(): jlong
  proc getMaxPlayoutDelayMillis*(): jlong
  proc getNumRtpSidPacketsReceived*(): jint
  proc getNumRtpDuplicatePackets*(): jint
  proc getCodecType*(): jint
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CALL_QUALITY_EXCELLENT*: jint {.`static`.}
  CALL_QUALITY_GOOD*: jint {.`static`.}
  CALL_QUALITY_FAIR*: jint {.`static`.}
  CALL_QUALITY_POOR*: jint {.`static`.}
  CALL_QUALITY_BAD*: jint {.`static`.}
  CALL_QUALITY_NOT_AVAILABLE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CallQuality] {.`static`.}

jclass android.telephony.CallQuality.Builder* of JVMObject:
  proc setDownlinkCallQualityLevel*(downlinkCallQualityLevel: jint): Builder
  proc setUplinkCallQualityLevel*(uplinkCallQualityLevel: jint): Builder
  proc setCallDurationMillis*(callDurationMillis: jint): Builder
  proc setNumRtpPacketsTransmitted*(numRtpPacketsTransmitted: jint): Builder
  proc setNumRtpPacketsReceived*(numRtpPacketsReceived: jint): Builder
  proc setNumRtpPacketsTransmittedLost*(numRtpPacketsTransmittedLost: jint): Builder
  proc setNumRtpPacketsNotReceived*(numRtpPacketsNotReceived: jint): Builder
  proc setAverageRelativeJitter*(averageRelativeJitter: jint): Builder
  proc setMaxRelativeJitter*(maxRelativeJitter: jint): Builder
  proc setAverageRoundTripTimeMillis*(averageRoundTripTimeMillis: jint): Builder
  proc setCodecType*(codecType: jint): Builder
  proc setRtpInactivityDetected*(rtpInactivityDetected: jboolean): Builder
  proc setIncomingSilenceDetectedAtCallSetup*(rxSilenceDetected: jboolean): Builder
  proc setOutgoingSilenceDetectedAtCallSetup*(txSilenceDetected: jboolean): Builder
  proc setNumVoiceFrames*(numVoiceFrames: jint): Builder
  proc setNumNoDataFrames*(numNoDataFrames: jint): Builder
  proc setNumDroppedRtpPackets*(numDroppedRtpPackets: jint): Builder
  proc setMinPlayoutDelayMillis*(minPlayoutDelayMillis: jlong): Builder
  proc setMaxPlayoutDelayMillis*(maxPlayoutDelayMillis: jlong): Builder
  proc setNumRtpSidPacketsReceived*(numRtpSidPacketsReceived: jint): Builder
  proc setNumRtpDuplicatePackets*(numRtpDuplicatePackets: jint): Builder
  proc build*(): CallQuality

jclass android.telephony.Builder* of JVMObject:
  proc setDownlinkCallQualityLevel*(downlinkCallQualityLevel: jint): Builder
  proc setUplinkCallQualityLevel*(uplinkCallQualityLevel: jint): Builder
  proc setCallDurationMillis*(callDurationMillis: jint): Builder
  proc setNumRtpPacketsTransmitted*(numRtpPacketsTransmitted: jint): Builder
  proc setNumRtpPacketsReceived*(numRtpPacketsReceived: jint): Builder
  proc setNumRtpPacketsTransmittedLost*(numRtpPacketsTransmittedLost: jint): Builder
  proc setNumRtpPacketsNotReceived*(numRtpPacketsNotReceived: jint): Builder
  proc setAverageRelativeJitter*(averageRelativeJitter: jint): Builder
  proc setMaxRelativeJitter*(maxRelativeJitter: jint): Builder
  proc setAverageRoundTripTimeMillis*(averageRoundTripTimeMillis: jint): Builder
  proc setCodecType*(codecType: jint): Builder
  proc setRtpInactivityDetected*(rtpInactivityDetected: jboolean): Builder
  proc setIncomingSilenceDetectedAtCallSetup*(rxSilenceDetected: jboolean): Builder
  proc setOutgoingSilenceDetectedAtCallSetup*(txSilenceDetected: jboolean): Builder
  proc setNumVoiceFrames*(numVoiceFrames: jint): Builder
  proc setNumNoDataFrames*(numNoDataFrames: jint): Builder
  proc setNumDroppedRtpPackets*(numDroppedRtpPackets: jint): Builder
  proc setMinPlayoutDelayMillis*(minPlayoutDelayMillis: jlong): Builder
  proc setMaxPlayoutDelayMillis*(maxPlayoutDelayMillis: jlong): Builder
  proc setNumRtpSidPacketsReceived*(numRtpSidPacketsReceived: jint): Builder
  proc setNumRtpDuplicatePackets*(numRtpDuplicatePackets: jint): Builder
  proc build*(): CallQuality

