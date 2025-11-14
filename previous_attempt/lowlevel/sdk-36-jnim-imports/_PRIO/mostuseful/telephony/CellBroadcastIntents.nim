import jnim

jclass android.telephony.CellBroadcastIntents* of JVMObject:
  proc sendSmsCbReceivedBroadcast*(context: Context, user: UserHandle, smsCbMessage: SmsCbMessage, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, slotIndex: jint) {.`static`.}
  ACTION_AREA_INFO_UPDATED*: string {.`static`.}

