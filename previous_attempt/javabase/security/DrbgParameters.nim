import jnim

jclass java.security.DrbgParameters* of JVMObject:
  proc instantiation*(strength: jint, capability: Capability, personalizationString: seq[jbyte]): Instantiation {.`static`.}
  proc nextBytes*(strength: jint, predictionResistance: jboolean, additionalInput: seq[jbyte]): NextBytes {.`static`.}
  proc reseed*(predictionResistance: jboolean, additionalInput: seq[jbyte]): Reseed {.`static`.}

jclass java.security.DrbgParameters.Instantiation* of JVMObject:
  proc getStrength*(): jint
  proc getCapability*(): Capability
  proc getPersonalizationString*(): seq[jbyte]
  proc toString*(): string

jclass java.security.DrbgParameters.NextBytes* of JVMObject:
  proc getStrength*(): jint
  proc getPredictionResistance*(): jboolean
  proc getAdditionalInput*(): seq[jbyte]

jclass java.security.DrbgParameters.Reseed* of JVMObject:
  proc getPredictionResistance*(): jboolean
  proc getAdditionalInput*(): seq[jbyte]

jclass java.security.Instantiation* of JVMObject:
  proc getStrength*(): jint
  proc getCapability*(): Capability
  proc getPersonalizationString*(): seq[jbyte]
  proc toString*(): string

jclass java.security.NextBytes* of JVMObject:
  proc getStrength*(): jint
  proc getPredictionResistance*(): jboolean
  proc getAdditionalInput*(): seq[jbyte]

jclass java.security.Reseed* of JVMObject:
  proc getPredictionResistance*(): jboolean
  proc getAdditionalInput*(): seq[jbyte]

