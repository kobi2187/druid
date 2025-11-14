import jnim

jclass android.telephony.CellLocation* of JVMObject:
  proc requestLocationUpdate*() {.`static`.}
  proc newFromBundle*(bundle: Bundle): CellLocation {.`static`.}
  proc fillInNotifierBundle*(bundle: Bundle)
  proc isEmpty*(): jboolean
  proc setStateInvalid*()
  proc getEmpty*(): CellLocation {.`static`.}

