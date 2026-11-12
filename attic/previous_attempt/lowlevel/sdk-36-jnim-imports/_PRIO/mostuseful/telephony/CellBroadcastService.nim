import jnim

jclass android.telephony.CellBroadcastService* of Service:
  proc onGsmCellBroadcastSms*(slotIndex: jint, message: seq[jbyte])
  proc onCdmaCellBroadcastSms*(slotIndex: jint, bearerData: seq[jbyte], serviceCategory: jint)
  proc onCdmaScpMessage*(slotIndex: jint, smsCbProgramData: List[CdmaSmsCbProgramData], originatingAddress: string, callback: Consumer[Bundle])
  proc getCellBroadcastAreaInfo*(slotIndex: jint): CharSequence
  proc onBind*(intent: Intent): IBinder
  CELL_BROADCAST_SERVICE_INTERFACE*: string {.`static`.}

jclass android.telephony.CellBroadcastService.ICellBroadcastServiceWrapper* of JVMObject:
  proc handleGsmCellBroadcastSms*(slotIndex: jint, message: seq[jbyte])
  proc handleCdmaCellBroadcastSms*(slotIndex: jint, bearerData: seq[jbyte], serviceCategory: jint)
  proc handleCdmaScpMessage*(slotIndex: jint, smsCbProgramData: List[CdmaSmsCbProgramData], originatingAddress: string, callback: RemoteCallback)
  proc getCellBroadcastAreaInfo*(slotIndex: jint): CharSequence
  proc dump*(fd: FileDescriptor, args: seq[string])

jclass android.telephony.ICellBroadcastServiceWrapper* of Stub:
  proc handleGsmCellBroadcastSms*(slotIndex: jint, message: seq[jbyte])
  proc handleCdmaCellBroadcastSms*(slotIndex: jint, bearerData: seq[jbyte], serviceCategory: jint)
  proc handleCdmaScpMessage*(slotIndex: jint, smsCbProgramData: List[CdmaSmsCbProgramData], originatingAddress: string, callback: RemoteCallback)
  proc getCellBroadcastAreaInfo*(slotIndex: jint): CharSequence
  proc dump*(fd: FileDescriptor, args: seq[string])

