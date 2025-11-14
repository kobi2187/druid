import jnim

jclass android.hardware.ConsumerIrManager* of JVMObject:
  proc hasIrEmitter*(): jboolean
  proc transmit*(carrierFrequency: jint, pattern: seq[jint])
  proc getCarrierFrequencies*(): seq[CarrierFrequencyRange]

jclass android.hardware.ConsumerIrManager.CarrierFrequencyRange* of JVMObject:
  proc getMinFrequency*(): jint
  proc getMaxFrequency*(): jint

jclass android.hardware.CarrierFrequencyRange* of JVMObject:
  proc getMinFrequency*(): jint
  proc getMaxFrequency*(): jint

