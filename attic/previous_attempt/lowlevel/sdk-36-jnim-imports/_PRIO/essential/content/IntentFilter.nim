import jnim

jclass android.content.IntentFilter* of JVMObject:
  proc create*(action: string, dataType: string): IntentFilter {.`static`.}
  proc toLongString*(): string
  proc setPriority*(priority: jint)
  proc getPriority*(): jint
  proc setOrder*(order: jint)
  proc getOrder*(): jint
  proc setAutoVerify*(autoVerify: jboolean)
  proc getAutoVerify*(): jboolean
  proc handleAllWebDataURI*(): jboolean
  proc handlesWebUris*(onlyWebSchemes: jboolean): jboolean
  proc needsVerification*(): jboolean
  proc isVerified*(): jboolean
  proc setVerified*(verified: jboolean)
  proc setVisibilityToInstantApp*(visibility: jint)
  proc getVisibilityToInstantApp*(): jint
  proc isVisibleToInstantApp*(): jboolean
  proc isExplicitlyVisibleToInstantApp*(): jboolean
  proc isImplicitlyVisibleToInstantApp*(): jboolean
  proc addAction*(action: string)
  proc countActions*(): jint
  proc safeCountActions*(): jint
  proc getAction*(index: jint): string
  proc hasAction*(action: string): jboolean
  proc matchAction*(action: string): jboolean
  proc actionsIterator*(): Iterator[string]
  proc addDataType*(type: string)
  proc addDynamicDataType*(type: string)
  proc clearDynamicDataTypes*()
  proc countStaticDataTypes*(): jint
  proc hasDataType*(type: string): jboolean
  proc hasExactDataType*(type: string): jboolean
  proc hasExactDynamicDataType*(type: string): jboolean
  proc hasExactStaticDataType*(type: string): jboolean
  proc countDataTypes*(): jint
  proc getDataType*(index: jint): string
  proc typesIterator*(): Iterator[string]
  proc dataTypes*(): List[string]
  proc addMimeGroup*(name: string)
  proc hasMimeGroup*(name: string): jboolean
  proc getMimeGroup*(index: jint): string
  proc countMimeGroups*(): jint
  proc mimeGroupsIterator*(): Iterator[string]
  proc addDataScheme*(scheme: string)
  proc countDataSchemes*(): jint
  proc getDataScheme*(index: jint): string
  proc hasDataScheme*(scheme: string): jboolean
  proc schemesIterator*(): Iterator[string]
  proc addDataSchemeSpecificPart*(ssp: string, type: jint)
  proc addDataSchemeSpecificPart*(ssp: PatternMatcher)
  proc countDataSchemeSpecificParts*(): jint
  proc getDataSchemeSpecificPart*(index: jint): PatternMatcher
  proc hasDataSchemeSpecificPart*(data: string): jboolean
  proc hasDataSchemeSpecificPart*(ssp: PatternMatcher): jboolean
  proc schemeSpecificPartsIterator*(): Iterator[PatternMatcher]
  proc addDataAuthority*(host: string, port: string)
  proc addDataAuthority*(ent: AuthorityEntry)
  proc countDataAuthorities*(): jint
  proc getDataAuthority*(index: jint): AuthorityEntry
  proc hasDataAuthority*(data: Uri): jboolean
  proc hasDataAuthority*(auth: AuthorityEntry): jboolean
  proc authoritiesIterator*(): Iterator[AuthorityEntry]
  proc addDataPath*(path: string, type: jint)
  proc addDataPath*(path: PatternMatcher)
  proc countDataPaths*(): jint
  proc getDataPath*(index: jint): PatternMatcher
  proc hasDataPath*(data: string): jboolean
  proc hasDataPath*(path: PatternMatcher): jboolean
  proc pathsIterator*(): Iterator[PatternMatcher]
  proc addUriRelativeFilterGroup*(group: UriRelativeFilterGroup)
  proc countUriRelativeFilterGroups*(): jint
  proc getUriRelativeFilterGroup*(index: jint): UriRelativeFilterGroup
  proc clearUriRelativeFilterGroups*()
  proc matchDataAuthority*(data: Uri): jint
  proc matchDataAuthority*(data: Uri, wildcardSupported: jboolean): jint
  proc matchData*(type: string, scheme: string, data: Uri): jint
  proc addCategory*(category: string)
  proc countCategories*(): jint
  proc getCategory*(index: jint): string
  proc hasCategory*(category: string): jboolean
  proc categoriesIterator*(): Iterator[string]
  proc matchCategories*(categories: Set[string]): string
  proc addExtra*(name: string, value: jint)
  proc getIntExtra*(name: string): jint
  proc addExtra*(name: string, value: seq[jint])
  proc getIntArrayExtra*(name: string): seq[jint]
  proc addExtra*(name: string, value: jlong)
  proc getLongExtra*(name: string): jlong
  proc addExtra*(name: string, value: seq[jlong])
  proc getLongArrayExtra*(name: string): seq[jlong]
  proc addExtra*(name: string, value: jdouble)
  proc getDoubleExtra*(name: string): jdouble
  proc addExtra*(name: string, value: seq[jdouble])
  proc getDoubleArrayExtra*(name: string): seq[jdouble]
  proc addExtra*(name: string, value: string)
  proc getStringExtra*(name: string): string
  proc addExtra*(name: string, value: seq[string])
  proc getStringArrayExtra*(name: string): seq[string]
  proc addExtra*(name: string, value: jboolean)
  proc getBooleanExtra*(name: string): jboolean
  proc addExtra*(name: string, value: seq[jboolean])
  proc getBooleanArrayExtra*(name: string): seq[jboolean]
  proc hasExtra*(name: string): jboolean
  proc setExtras*(extras: PersistableBundle)
  proc getExtras*(): PersistableBundle
  proc asPredicate*(): Predicate[Intent]
  proc asPredicateWithTypeResolution*(resolver: ContentResolver): Predicate[Intent]
  proc match*(resolver: ContentResolver, intent: Intent, resolve: jboolean, logTag: string): jint
  proc match*(action: string, type: string, scheme: string, data: Uri, categories: Set[string], logTag: string): jint
  proc match*(action: string, type: string, scheme: string, data: Uri, categories: Set[string], logTag: string, supportWildcards: jboolean, ignoreActions: Collection[string]): jint
  proc match*(action: string, type: string, scheme: string, data: Uri, categories: Set[string], logTag: string, supportWildcards: jboolean, ignoreActions: Collection[string], extras: Bundle): jint
  proc writeToXml*(serializer: XmlSerializer)
  proc readFromXml*(parser: XmlPullParser)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc dump*(du: Printer, prefix: string)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc debugCheck*(): jboolean
  proc checkDataPathAndSchemeSpecificParts*(): jboolean
  proc getHostsList*(): ArrayList[string]
  proc getHosts*(): seq[string]
  proc filterEquals*(f1: IntentFilter, f2: IntentFilter): jboolean {.`static`.}
  BLOCK_NULL_ACTION_INTENTS*: jlong {.`static`.}
  SYSTEM_HIGH_PRIORITY*: jint {.`static`.}
  SYSTEM_LOW_PRIORITY*: jint {.`static`.}
  MATCH_CATEGORY_MASK*: jint {.`static`.}
  MATCH_ADJUSTMENT_MASK*: jint {.`static`.}
  MATCH_ADJUSTMENT_NORMAL*: jint {.`static`.}
  MATCH_CATEGORY_EMPTY*: jint {.`static`.}
  MATCH_CATEGORY_SCHEME*: jint {.`static`.}
  MATCH_CATEGORY_HOST*: jint {.`static`.}
  MATCH_CATEGORY_PORT*: jint {.`static`.}
  MATCH_CATEGORY_PATH*: jint {.`static`.}
  MATCH_CATEGORY_SCHEME_SPECIFIC_PART*: jint {.`static`.}
  MATCH_CATEGORY_TYPE*: jint {.`static`.}
  NO_MATCH_TYPE*: jint {.`static`.}
  NO_MATCH_DATA*: jint {.`static`.}
  NO_MATCH_ACTION*: jint {.`static`.}
  NO_MATCH_CATEGORY*: jint {.`static`.}
  NO_MATCH_EXTRAS*: jint {.`static`.}
  SCHEME_HTTP*: string {.`static`.}
  SCHEME_HTTPS*: string {.`static`.}
  SCHEME_PACKAGE*: string {.`static`.}
  WILDCARD*: string {.`static`.}
  WILDCARD_PATH*: string {.`static`.}
  VISIBILITY_NONE*: jint {.`static`.}
  VISIBILITY_EXPLICIT*: jint {.`static`.}
  VISIBILITY_IMPLICIT*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[IntentFilter] {.`static`.}

jclass android.content.IntentFilter.AuthorityEntry* of JVMObject:
  proc getHost*(): string
  proc getPort*(): jint
  proc match*(other: AuthorityEntry): jboolean
  proc equals*(obj: JObject): jboolean
  proc match*(data: Uri): jint
  proc match*(data: Uri, wildcardSupported: jboolean): jint

jclass android.content.MalformedMimeTypeException* of AndroidException:

jclass android.content.AuthorityEntry* of JVMObject:
  proc getHost*(): string
  proc getPort*(): jint
  proc match*(other: AuthorityEntry): jboolean
  proc equals*(obj: JObject): jboolean
  proc match*(data: Uri): jint
  proc match*(data: Uri, wildcardSupported: jboolean): jint

