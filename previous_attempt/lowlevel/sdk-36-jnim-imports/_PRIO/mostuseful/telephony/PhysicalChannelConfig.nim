import jnim

jclass android.telephony.PhysicalChannelConfig* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getCellBandwidthDownlinkKhz*(): jint
  proc getCellBandwidthUplinkKhz*(): jint
  proc getContextIds*(): seq[jint]
  proc getFrequencyRange*(): jint
  proc getDownlinkChannelNumber*(): jint
  proc getUplinkChannelNumber*(): jint
  proc getBand*(): jint
  proc getDownlinkFrequencyKhz*(): jint
  proc getUplinkFrequencyKhz*(): jint
  proc getPhysicalCellId*(): jint
  proc getNetworkType*(): jint
  proc getConnectionStatus*(): jint
  proc createLocationInfoSanitizedCopy*(): PhysicalChannelConfig
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CONNECTION_PRIMARY_SERVING*: jint {.`static`.}
  CONNECTION_SECONDARY_SERVING*: jint {.`static`.}
  CONNECTION_UNKNOWN*: jint {.`static`.}
  CHANNEL_NUMBER_UNKNOWN*: jint {.`static`.}
  PHYSICAL_CELL_ID_UNKNOWN*: jint {.`static`.}
  PHYSICAL_CELL_ID_MAXIMUM_VALUE*: jint {.`static`.}
  CELL_BANDWIDTH_UNKNOWN*: jint {.`static`.}
  FREQUENCY_UNKNOWN*: jint {.`static`.}
  BAND_UNKNOWN*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[PhysicalChannelConfig] {.`static`.}

jclass android.telephony.PhysicalChannelConfig.Builder* of JVMObject:
  proc build*(): PhysicalChannelConfig
  proc setNetworkType*(networkType: jint): Builder
  proc setFrequencyRange*(frequencyRange: jint): Builder
  proc setDownlinkChannelNumber*(downlinkChannelNumber: jint): Builder
  proc setUplinkChannelNumber*(uplinkChannelNumber: jint): Builder
  proc setCellBandwidthDownlinkKhz*(cellBandwidthDownlinkKhz: jint): Builder
  proc setCellBandwidthUplinkKhz*(cellBandwidthUplinkKhz: jint): Builder
  proc setCellConnectionStatus*(connectionStatus: jint): Builder
  proc setContextIds*(contextIds: seq[jint]): Builder
  proc setPhysicalCellId*(physicalCellId: jint): Builder
  proc setBand*(band: jint): Builder

jclass android.telephony.Builder* of JVMObject:
  proc build*(): PhysicalChannelConfig
  proc setNetworkType*(networkType: jint): Builder
  proc setFrequencyRange*(frequencyRange: jint): Builder
  proc setDownlinkChannelNumber*(downlinkChannelNumber: jint): Builder
  proc setUplinkChannelNumber*(uplinkChannelNumber: jint): Builder
  proc setCellBandwidthDownlinkKhz*(cellBandwidthDownlinkKhz: jint): Builder
  proc setCellBandwidthUplinkKhz*(cellBandwidthUplinkKhz: jint): Builder
  proc setCellConnectionStatus*(connectionStatus: jint): Builder
  proc setContextIds*(contextIds: seq[jint]): Builder
  proc setPhysicalCellId*(physicalCellId: jint): Builder
  proc setBand*(band: jint): Builder

