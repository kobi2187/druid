import jnim

jclass android.location.CountryDetector* of JVMObject:
  proc detectCountry*(): Country
  proc addCountryListener*(listener: CountryListener, looper: Looper)
  proc removeCountryListener*(listener: CountryListener)
  proc registerCountryDetectorCallback*(executor: Executor, consumer: Consumer[Country])
  proc unregisterCountryDetectorCallback*(consumer: Consumer[Country])

