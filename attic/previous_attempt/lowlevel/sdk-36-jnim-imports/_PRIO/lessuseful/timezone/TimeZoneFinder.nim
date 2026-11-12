import jnim

jclass android.timezone.TimeZoneFinder* of JVMObject:
  proc getInstance*(): TimeZoneFinder {.`static`.}
  proc getIanaVersion*(): string
  proc lookupCountryTimeZones*(countryIso: string): CountryTimeZones

