import jnim

jclass android.timezone.CountryTimeZones* of JVMObject:
  proc matchesCountryCode*(countryIso: string): jboolean
  proc getDefaultTimeZoneId*(): string
  proc getDefaultTimeZone*(): TimeZone
  proc isDefaultTimeZoneBoosted*(): jboolean
  proc hasUtcZone*(whenMillis: jlong): jboolean
  proc lookupByOffsetWithBias*(whenMillis: jlong, bias: TimeZone, totalOffsetMillis: jint, isDst: jboolean): OffsetResult
  proc lookupByOffsetWithBias*(whenMillis: jlong, bias: TimeZone, totalOffsetMillis: jint): OffsetResult
  proc getEffectiveTimeZoneMappingsAt*(whenMillis: jlong): List[TimeZoneMapping]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.timezone.CountryTimeZones.TimeZoneMapping* of JVMObject:
  proc getTimeZoneId*(): string
  proc getTimeZone*(): TimeZone
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.timezone.CountryTimeZones.OffsetResult* of JVMObject:
  proc getTimeZone*(): TimeZone
  proc isOnlyMatch*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.timezone.TimeZoneMapping* of JVMObject:
  proc getTimeZoneId*(): string
  proc getTimeZone*(): TimeZone
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.timezone.OffsetResult* of JVMObject:
  proc getTimeZone*(): TimeZone
  proc isOnlyMatch*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

