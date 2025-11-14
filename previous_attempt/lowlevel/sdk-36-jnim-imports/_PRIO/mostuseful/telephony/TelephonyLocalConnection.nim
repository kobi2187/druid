import jnim

jclass android.telephony.TelephonyLocalConnection* of JVMObject:
  proc getCallComposerServerUrlForHandle*(subscriptionId: jint, uuid: UUID): string {.`static`.}
  proc setInstance*(impl: ConnectionImpl) {.`static`.}

