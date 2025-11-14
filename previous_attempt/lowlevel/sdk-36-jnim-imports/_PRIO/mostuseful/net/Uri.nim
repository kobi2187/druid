import jnim

jclass android.net.Uri* of JVMObject:
  proc isHierarchical*(): jboolean
  proc isOpaque*(): jboolean
  proc isRelative*(): jboolean
  proc isAbsolute*(): jboolean
  proc getScheme*(): string
  proc getSchemeSpecificPart*(): string
  proc getEncodedSchemeSpecificPart*(): string
  proc getAuthority*(): string
  proc getEncodedAuthority*(): string
  proc getUserInfo*(): string
  proc getEncodedUserInfo*(): string
  proc getHost*(): string
  proc getPort*(): jint
  proc getPath*(): string
  proc getEncodedPath*(): string
  proc getQuery*(): string
  proc getEncodedQuery*(): string
  proc getFragment*(): string
  proc getEncodedFragment*(): string
  proc getPathSegments*(): List[string]
  proc getLastPathSegment*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc compareTo*(other: Uri): jint
  proc toString*(): string
  proc toSafeString*(): string
  proc buildUpon*(): Builder
  proc parse*(uriString: string): Uri {.`static`.}
  proc fromFile*(file: File): Uri {.`static`.}
  proc fromParts*(scheme: string, ssp: string, fragment: string): Uri {.`static`.}
  proc getQueryParameterNames*(): Set[string]
  proc getQueryParameters*(key: string): List[string]
  proc getQueryParameter*(key: string): string
  proc getBooleanQueryParameter*(key: string, defaultValue: jboolean): jboolean
  proc normalizeScheme*(): Uri
  proc writeToParcel*(output:Parcel, uri: Uri) {.`static`.}
  proc encode*(s: string): string {.`static`.}
  proc encode*(s: string, allow: string): string {.`static`.}
  proc encodeIfNotEncoded*(value: string, allow: string): string {.`static`.}
  proc decode*(s: string): string {.`static`.}
  proc decodeIfNeeded*(value: string): string {.`static`.}
  proc withAppendedPath*(baseUri: Uri, pathSegment: string): Uri {.`static`.}
  proc getCanonicalUri*(): Uri
  proc checkFileUriExposed*(location: string)
  proc checkContentUriWithoutPermission*(location: string, flags: jint)
  proc isPathPrefixMatch*(prefix: Uri): jboolean
  EMPTY*: Uri {.`static`.}
  CREATOR*: Parcelable.Creator[Uri] {.`static`.}

jclass android.net.Uri.Builder* of JVMObject:
  proc scheme*(scheme: string): Builder
  proc opaquePart*(opaquePart: string): Builder
  proc encodedOpaquePart*(opaquePart: string): Builder
  proc authority*(authority: string): Builder
  proc encodedAuthority*(authority: string): Builder
  proc path*(path: string): Builder
  proc encodedPath*(path: string): Builder
  proc appendPath*(newSegment: string): Builder
  proc appendEncodedPath*(newSegment: string): Builder
  proc query*(query: string): Builder
  proc encodedQuery*(query: string): Builder
  proc fragment*(fragment: string): Builder
  proc encodedFragment*(fragment: string): Builder
  proc appendQueryParameter*(key: string, value: string): Builder
  proc clearQuery*(): Builder
  proc build*(): Uri
  proc toString*(): string

jclass android.net.Builder* of JVMObject:
  proc scheme*(scheme: string): Builder
  proc opaquePart*(opaquePart: string): Builder
  proc encodedOpaquePart*(opaquePart: string): Builder
  proc authority*(authority: string): Builder
  proc encodedAuthority*(authority: string): Builder
  proc path*(path: string): Builder
  proc encodedPath*(path: string): Builder
  proc appendPath*(newSegment: string): Builder
  proc appendEncodedPath*(newSegment: string): Builder
  proc query*(query: string): Builder
  proc encodedQuery*(query: string): Builder
  proc fragment*(fragment: string): Builder
  proc encodedFragment*(fragment: string): Builder
  proc appendQueryParameter*(key: string, value: string): Builder
  proc clearQuery*(): Builder
  proc build*(): Uri
  proc toString*(): string

