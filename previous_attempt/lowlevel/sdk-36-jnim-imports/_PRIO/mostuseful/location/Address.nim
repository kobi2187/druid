import jnim

jclass android.location.Address* of JVMObject:
  proc getLocale*(): Locale
  proc getMaxAddressLineIndex*(): jint
  proc getAddressLine*(index: jint): string
  proc setAddressLine*(index: jint, line: string)
  proc getFeatureName*(): string
  proc setFeatureName*(featureName: string)
  proc getAdminArea*(): string
  proc setAdminArea*(adminArea: string)
  proc getSubAdminArea*(): string
  proc setSubAdminArea*(subAdminArea: string)
  proc getLocality*(): string
  proc setLocality*(locality: string)
  proc getSubLocality*(): string
  proc setSubLocality*(sublocality: string)
  proc getThoroughfare*(): string
  proc setThoroughfare*(thoroughfare: string)
  proc getSubThoroughfare*(): string
  proc setSubThoroughfare*(subthoroughfare: string)
  proc getPremises*(): string
  proc setPremises*(premises: string)
  proc getPostalCode*(): string
  proc setPostalCode*(postalCode: string)
  proc getCountryCode*(): string
  proc setCountryCode*(countryCode: string)
  proc getCountryName*(): string
  proc setCountryName*(countryName: string)
  proc hasLatitude*(): jboolean
  proc getLatitude*(): jdouble
  proc setLatitude*(latitude: jdouble)
  proc clearLatitude*()
  proc hasLongitude*(): jboolean
  proc getLongitude*(): jdouble
  proc setLongitude*(longitude: jdouble)
  proc clearLongitude*()
  proc getPhone*(): string
  proc setPhone*(phone: string)
  proc getUrl*(): string
  proc setUrl*(Url: string)
  proc getExtras*(): Bundle
  proc setExtras*(extras: Bundle)
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[Address] {.`static`.}

