import jnim

jclass android.bluetooth.BluetoothQualityReport* of JVMObject:
  proc getQualityReportId*(): jint
  proc qualityReportIdToString*(id: jint): string {.`static`.}
  proc getRemoteAddress*(): string
  proc getLmpVersion*(): jint
  proc getLmpSubVersion*(): jint
  proc getManufacturerId*(): jint
  proc getRemoteName*(): string
  proc getBluetoothClass*(): BluetoothClass
  proc getBqrCommon*(): BqrCommon
  proc getBqrEvent*(): Parcelable
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  QUALITY_REPORT_ID_MONITOR*: jint {.`static`.}
  QUALITY_REPORT_ID_APPROACH_LSTO*: jint {.`static`.}
  QUALITY_REPORT_ID_A2DP_CHOPPY*: jint {.`static`.}
  QUALITY_REPORT_ID_SCO_CHOPPY*: jint {.`static`.}
  QUALITY_REPORT_ID_ENERGY_MONITOR*: jint {.`static`.}
  QUALITY_REPORT_ID_CONN_FAIL*: jint {.`static`.}
  QUALITY_REPORT_ID_RF_STATS*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[BluetoothQualityReport] {.`static`.}

jclass android.bluetooth.BluetoothQualityReport.Builder* of JVMObject:
  proc setRemoteAddress*(remoteAddr: string): Builder
  proc setLmpVersion*(lmpVer: jint): Builder
  proc setLmpSubVersion*(lmpSubVer: jint): Builder
  proc setManufacturerId*(manufacturerId: jint): Builder
  proc setRemoteName*(remoteName: string): Builder
  proc setBluetoothClass*(bluetoothClass: BluetoothClass): Builder
  proc build*(): BluetoothQualityReport

jclass android.bluetooth.BluetoothQualityReport.BqrCommon* of JVMObject:
  proc getPacketType*(): jint
  proc packetTypeToString*(packetType: jint): string {.`static`.}
  proc getConnectionHandle*(): jint
  proc getConnectionRole*(): jint
  proc connectionRoleToString*(connectionRole: jint): string {.`static`.}
  proc getTxPowerLevel*(): jint
  proc getRssi*(): jint
  proc getSnr*(): jint
  proc getUnusedAfhChannelCount*(): jint
  proc getAfhSelectUnidealChannelCount*(): jint
  proc getLsto*(): jint
  proc getPiconetClock*(): jlong
  proc getRetransmissionCount*(): jlong
  proc getNoRxCount*(): jlong
  proc getNakCount*(): jlong
  proc getLastTxAckTimestamp*(): jlong
  proc getFlowOffCount*(): jlong
  proc getLastFlowOnTimestamp*(): jlong
  proc getOverflowCount*(): jlong
  proc getUnderflowCount*(): jlong
  proc getCalFailedItemCount*(): jint
  proc getTxTotalPackets*(): jlong
  proc getTxUnackPackets*(): jlong
  proc getTxFlushPackets*(): jlong
  proc getTxLastSubeventPackets*(): jlong
  proc getCrcErrorPackets*(): jlong
  proc getRxDupPackets*(): jlong
  proc getRxUnRecvPackets*(): jlong
  proc getCoexInfoMask*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.bluetooth.BluetoothQualityReport.BqrVsLsto* of JVMObject:
  proc getConnState*(): jint
  proc connStateToString*(connectionState: jint): string {.`static`.}
  proc getBasebandStats*(): jlong
  proc getSlotsUsed*(): jlong
  proc getCxmDenials*(): jint
  proc getTxSkipped*(): jint
  proc getRfLoss*(): jint
  proc getNativeClock*(): jlong
  proc getLastTxAckTimestamp*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.bluetooth.BluetoothQualityReport.BqrVsA2dpChoppy* of JVMObject:
  proc getArrivalTime*(): jlong
  proc getScheduleTime*(): jlong
  proc getGlitchCount*(): jint
  proc getTxCxmDenials*(): jint
  proc getRxCxmDenials*(): jint
  proc getAclTxQueueLength*(): jint
  proc getLinkQuality*(): jint
  proc linkQualityToString*(linkQuality: jint): string {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.bluetooth.BluetoothQualityReport.BqrVsScoChoppy* of JVMObject:
  proc getGlitchCount*(): jint
  proc getIntervalEsco*(): jint
  proc getWindowEsco*(): jint
  proc getAirFormat*(): jint
  proc airFormatToString*(airFormat: jint): string {.`static`.}
  proc getInstanceCount*(): jint
  proc getTxCxmDenials*(): jint
  proc getRxCxmDenials*(): jint
  proc getTxAbortCount*(): jint
  proc getLateDispatch*(): jint
  proc getMicIntrMiss*(): jint
  proc getLpaIntrMiss*(): jint
  proc getSprIntrMiss*(): jint
  proc getPlcFillCount*(): jint
  proc getPlcDiscardCount*(): jint
  proc getMissedInstanceCount*(): jint
  proc getTxRetransmitSlotCount*(): jint
  proc getRxRetransmitSlotCount*(): jint
  proc getGoodRxFrameCount*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.bluetooth.BluetoothQualityReport.BqrConnectFail* of JVMObject:
  proc getFailReason*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc connectFailIdToString*(id: jint): string {.`static`.}
  proc toString*(): string

jclass android.bluetooth.BluetoothQualityReport.BqrEnergyMonitor* of JVMObject:
  proc getAverageCurrentConsumptionMicroamps*(): jint
  proc getIdleStateTotalTimeMillis*(): jlong
  proc getIdleStateEnterCount*(): jlong
  proc getActiveStateTotalTimeMillis*(): jlong
  proc getActiveStateEnterCount*(): jlong
  proc getBredrTxTotalTimeMillis*(): jlong
  proc getBredrTxStateEnterCount*(): jlong
  proc getBredrAverageTxPowerLeveldBm*(): jint
  proc getBredrRxTotalTimeMillis*(): jlong
  proc getBredrRxStateEnterCount*(): jlong
  proc getLeTsTotalTimeMillis*(): jlong
  proc getLeTxStateEnterCount*(): jlong
  proc getLeAverageTxPowerLeveldBm*(): jint
  proc getLeRxTotalTimeMillis*(): jlong
  proc getLeRxStateEnterCount*(): jlong
  proc getPowerDataTotalTimeMillis*(): jlong
  proc getRxSingleChainActiveDurationMillis*(): jlong
  proc getRxDualChainActiveDurationMillis*(): jlong
  proc getTxInternalPaSingleChainActiveDurationMillis*(): jlong
  proc getTxInternalPaDualChainActiveDurationMillis*(): jlong
  proc getTxExternalPaSingleChainActiveDurationMillis*(): jlong
  proc getTxExternalPaDualChainActiveDurationMillis*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.bluetooth.BluetoothQualityReport.BqrRfStats* of JVMObject:
  proc getExtensionInfo*(): jint
  proc getPerformanceDurationMillis*(): jlong
  proc getTxPowerInternalPaBeamformingCount*(): jlong
  proc getTxPowerExternalPaBeamformingCount*(): jlong
  proc getTxPowerInternalPaDiversityCount*(): jlong
  proc getTxPowerExternalPaDiversityCount*(): jlong
  proc getPacketsWithRssiAboveMinus50dBm*(): jlong
  proc getPacketsWithRssi50To55dBm*(): jlong
  proc getPacketsWithRssi55To60dBm*(): jlong
  proc getPacketsWithRssi60To65dBm*(): jlong
  proc getPacketsWithRssi65To70dBm*(): jlong
  proc getPacketsWithRssi70To75dBm*(): jlong
  proc getPacketsWithRssi75To80dBm*(): jlong
  proc getPacketsWithRssi80To85dBm*(): jlong
  proc getPacketsWithRssi85To90dBm*(): jlong
  proc getPacketsWithRssiBelowMinus90dBm*(): jlong
  proc getPacketsWithRssiDeltaBelow2dBm*(): jlong
  proc getPacketsWithRssiDelta2To5dBm*(): jlong
  proc getPacketsWithRssiDelta5To8dBm*(): jlong
  proc getPacketsWithRssiDelta8To11dBm*(): jlong
  proc getPacketsWithRssiDeltaAbove11dBm*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.bluetooth.Builder* of JVMObject:
  proc setRemoteAddress*(remoteAddr: string): Builder
  proc setLmpVersion*(lmpVer: jint): Builder
  proc setLmpSubVersion*(lmpSubVer: jint): Builder
  proc setManufacturerId*(manufacturerId: jint): Builder
  proc setRemoteName*(remoteName: string): Builder
  proc setBluetoothClass*(bluetoothClass: BluetoothClass): Builder
  proc build*(): BluetoothQualityReport

jclass android.bluetooth.BqrCommon* of JVMObject:
  proc getPacketType*(): jint
  proc packetTypeToString*(packetType: jint): string {.`static`.}
  proc getConnectionHandle*(): jint
  proc getConnectionRole*(): jint
  proc connectionRoleToString*(connectionRole: jint): string {.`static`.}
  proc getTxPowerLevel*(): jint
  proc getRssi*(): jint
  proc getSnr*(): jint
  proc getUnusedAfhChannelCount*(): jint
  proc getAfhSelectUnidealChannelCount*(): jint
  proc getLsto*(): jint
  proc getPiconetClock*(): jlong
  proc getRetransmissionCount*(): jlong
  proc getNoRxCount*(): jlong
  proc getNakCount*(): jlong
  proc getLastTxAckTimestamp*(): jlong
  proc getFlowOffCount*(): jlong
  proc getLastFlowOnTimestamp*(): jlong
  proc getOverflowCount*(): jlong
  proc getUnderflowCount*(): jlong
  proc getCalFailedItemCount*(): jint
  proc getTxTotalPackets*(): jlong
  proc getTxUnackPackets*(): jlong
  proc getTxFlushPackets*(): jlong
  proc getTxLastSubeventPackets*(): jlong
  proc getCrcErrorPackets*(): jlong
  proc getRxDupPackets*(): jlong
  proc getRxUnRecvPackets*(): jlong
  proc getCoexInfoMask*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CONNECTION_ROLE_CENTRAL*: jint {.`static`.}
  CONNECTION_ROLE_PERIPHERAL*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[BqrCommon] {.`static`.}

jclass android.bluetooth.BqrVsLsto* of JVMObject:
  proc getConnState*(): jint
  proc connStateToString*(connectionState: jint): string {.`static`.}
  proc getBasebandStats*(): jlong
  proc getSlotsUsed*(): jlong
  proc getCxmDenials*(): jint
  proc getTxSkipped*(): jint
  proc getRfLoss*(): jint
  proc getNativeClock*(): jlong
  proc getLastTxAckTimestamp*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[BqrVsLsto] {.`static`.}

jclass android.bluetooth.BqrVsA2dpChoppy* of JVMObject:
  proc getArrivalTime*(): jlong
  proc getScheduleTime*(): jlong
  proc getGlitchCount*(): jint
  proc getTxCxmDenials*(): jint
  proc getRxCxmDenials*(): jint
  proc getAclTxQueueLength*(): jint
  proc getLinkQuality*(): jint
  proc linkQualityToString*(linkQuality: jint): string {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[BqrVsA2dpChoppy] {.`static`.}

jclass android.bluetooth.BqrVsScoChoppy* of JVMObject:
  proc getGlitchCount*(): jint
  proc getIntervalEsco*(): jint
  proc getWindowEsco*(): jint
  proc getAirFormat*(): jint
  proc airFormatToString*(airFormat: jint): string {.`static`.}
  proc getInstanceCount*(): jint
  proc getTxCxmDenials*(): jint
  proc getRxCxmDenials*(): jint
  proc getTxAbortCount*(): jint
  proc getLateDispatch*(): jint
  proc getMicIntrMiss*(): jint
  proc getLpaIntrMiss*(): jint
  proc getSprIntrMiss*(): jint
  proc getPlcFillCount*(): jint
  proc getPlcDiscardCount*(): jint
  proc getMissedInstanceCount*(): jint
  proc getTxRetransmitSlotCount*(): jint
  proc getRxRetransmitSlotCount*(): jint
  proc getGoodRxFrameCount*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[BqrVsScoChoppy] {.`static`.}

jclass android.bluetooth.BqrConnectFail* of JVMObject:
  proc getFailReason*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc connectFailIdToString*(id: jint): string {.`static`.}
  proc toString*(): string
  CONNECT_FAIL_ID_NO_ERROR*: jint {.`static`.}
  CONNECT_FAIL_ID_PAGE_TIMEOUT*: jint {.`static`.}
  CONNECT_FAIL_ID_CONNECTION_TIMEOUT*: jint {.`static`.}
  CONNECT_FAIL_ID_ACL_ALREADY_EXIST*: jint {.`static`.}
  CONNECT_FAIL_ID_CONTROLLER_BUSY*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[BqrConnectFail] {.`static`.}

jclass android.bluetooth.BqrEnergyMonitor* of JVMObject:
  proc getAverageCurrentConsumptionMicroamps*(): jint
  proc getIdleStateTotalTimeMillis*(): jlong
  proc getIdleStateEnterCount*(): jlong
  proc getActiveStateTotalTimeMillis*(): jlong
  proc getActiveStateEnterCount*(): jlong
  proc getBredrTxTotalTimeMillis*(): jlong
  proc getBredrTxStateEnterCount*(): jlong
  proc getBredrAverageTxPowerLeveldBm*(): jint
  proc getBredrRxTotalTimeMillis*(): jlong
  proc getBredrRxStateEnterCount*(): jlong
  proc getLeTsTotalTimeMillis*(): jlong
  proc getLeTxStateEnterCount*(): jlong
  proc getLeAverageTxPowerLeveldBm*(): jint
  proc getLeRxTotalTimeMillis*(): jlong
  proc getLeRxStateEnterCount*(): jlong
  proc getPowerDataTotalTimeMillis*(): jlong
  proc getRxSingleChainActiveDurationMillis*(): jlong
  proc getRxDualChainActiveDurationMillis*(): jlong
  proc getTxInternalPaSingleChainActiveDurationMillis*(): jlong
  proc getTxInternalPaDualChainActiveDurationMillis*(): jlong
  proc getTxExternalPaSingleChainActiveDurationMillis*(): jlong
  proc getTxExternalPaDualChainActiveDurationMillis*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[BqrEnergyMonitor] {.`static`.}

jclass android.bluetooth.BqrRfStats* of JVMObject:
  proc getExtensionInfo*(): jint
  proc getPerformanceDurationMillis*(): jlong
  proc getTxPowerInternalPaBeamformingCount*(): jlong
  proc getTxPowerExternalPaBeamformingCount*(): jlong
  proc getTxPowerInternalPaDiversityCount*(): jlong
  proc getTxPowerExternalPaDiversityCount*(): jlong
  proc getPacketsWithRssiAboveMinus50dBm*(): jlong
  proc getPacketsWithRssi50To55dBm*(): jlong
  proc getPacketsWithRssi55To60dBm*(): jlong
  proc getPacketsWithRssi60To65dBm*(): jlong
  proc getPacketsWithRssi65To70dBm*(): jlong
  proc getPacketsWithRssi70To75dBm*(): jlong
  proc getPacketsWithRssi75To80dBm*(): jlong
  proc getPacketsWithRssi80To85dBm*(): jlong
  proc getPacketsWithRssi85To90dBm*(): jlong
  proc getPacketsWithRssiBelowMinus90dBm*(): jlong
  proc getPacketsWithRssiDeltaBelow2dBm*(): jlong
  proc getPacketsWithRssiDelta2To5dBm*(): jlong
  proc getPacketsWithRssiDelta5To8dBm*(): jlong
  proc getPacketsWithRssiDelta8To11dBm*(): jlong
  proc getPacketsWithRssiDeltaAbove11dBm*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[BqrRfStats] {.`static`.}

