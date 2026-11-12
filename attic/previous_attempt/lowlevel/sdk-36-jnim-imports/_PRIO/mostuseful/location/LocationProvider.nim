import jnim

jclass android.location.LocationProvider* of JVMObject:
  proc getName*(): string
  proc meetsCriteria*(criteria: Criteria): jboolean
  proc propertiesMeetCriteria*(name: string, properties: ProviderProperties, criteria: Criteria): jboolean {.`static`.}
  proc requiresNetwork*(): jboolean
  proc requiresSatellite*(): jboolean
  proc requiresCell*(): jboolean
  proc hasMonetaryCost*(): jboolean
  proc supportsAltitude*(): jboolean
  proc supportsSpeed*(): jboolean
  proc supportsBearing*(): jboolean
  proc getPowerRequirement*(): jint
  proc getAccuracy*(): jint
  OUT_OF_SERVICE*: jint {.`static`.}
  TEMPORARILY_UNAVAILABLE*: jint {.`static`.}
  AVAILABLE*: jint {.`static`.}

