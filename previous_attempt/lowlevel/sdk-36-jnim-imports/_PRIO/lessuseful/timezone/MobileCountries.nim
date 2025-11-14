import jnim

jclass android.timezone.MobileCountries* of JVMObject:
  proc getMcc*(): string
  proc getCountryIsoCodes*(): Set[string]
  proc getDefaultCountryIsoCode*(): string
  proc toString*(): string

