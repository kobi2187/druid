import jnim

jclass android.timezone.TelephonyNetworkFinder* of JVMObject:
  proc findNetworkByMccMnc*(mcc: string, mnc: string): TelephonyNetwork
  proc findCountriesByMcc*(mcc: string): MobileCountries

