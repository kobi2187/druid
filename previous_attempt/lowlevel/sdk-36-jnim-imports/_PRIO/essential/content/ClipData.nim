import jnim

jclass android.content.ClipData* of JVMObject:
  proc copyForTransferWithActivityInfo*(): ClipData
  proc willParcelWithActivityInfo*(): jboolean
  proc cloneOnlyUriItems*(): ClipData
  proc newPlainText*(label: CharSequence, text: CharSequence): ClipData {.`static`.}
  proc newHtmlText*(label: CharSequence, text: CharSequence, htmlText: string): ClipData {.`static`.}
  proc newIntent*(label: CharSequence, intent: Intent): ClipData {.`static`.}
  proc newUri*(resolver: ContentResolver, label: CharSequence, uri: Uri): ClipData {.`static`.}
  proc newRawUri*(label: CharSequence, uri: Uri): ClipData {.`static`.}
  proc getDescription*(): ClipDescription
  proc addItem*(item: Item)
  proc addItem*(resolver: ContentResolver, item: Item)
  proc getIcon*(): Bitmap
  proc getItemCount*(): jint
  proc getItemAt*(index: jint): Item
  proc setItemAt*(index: jint, item: Item)
  proc prepareToLeaveProcess*(leavingPackage: jboolean)
  proc prepareToLeaveProcess*(leavingPackage: jboolean, intentFlags: jint)
  proc prepareToLeaveProcess$ravenwood*(leavingPackage: jboolean, intentFlags: jint)
  proc prepareToEnterProcess*(source: AttributionSource)
  proc fixUris*(contentUserHint: jint)
  proc fixUrisLight*(contentUserHint: jint)
  proc toString*(): string
  proc toShortString*(b: StringBuilder, redactContent: jboolean)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc collectUris*(output:List[Uri])
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[ClipData] {.`static`.}

jclass android.content.ClipData.Item* of JVMObject:
  proc getText*(): CharSequence
  proc getHtmlText*(): string
  proc getIntent*(): Intent
  proc getIntentSender*(): IntentSender
  proc getUri*(): Uri
  proc getActivityInfo*(): ActivityInfo
  proc setActivityInfo*(info: ActivityInfo)
  proc getTextLinks*(): TextLinks
  proc setTextLinks*(textLinks: TextLinks)
  proc coerceToText*(context: Context): CharSequence
  proc coerceToStyledText*(context: Context): CharSequence
  proc coerceToHtmlText*(context: Context): string
  proc toString*(): string
  proc toShortString*(b: StringBuilder, redactContent: jboolean)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)

jclass android.content.Item* of JVMObject:
  proc getText*(): CharSequence
  proc getHtmlText*(): string
  proc getIntent*(): Intent
  proc getIntentSender*(): IntentSender
  proc getUri*(): Uri
  proc getActivityInfo*(): ActivityInfo
  proc setActivityInfo*(info: ActivityInfo)
  proc getTextLinks*(): TextLinks
  proc setTextLinks*(textLinks: TextLinks)
  proc coerceToText*(context: Context): CharSequence
  proc coerceToStyledText*(context: Context): CharSequence
  proc coerceToHtmlText*(context: Context): string
  proc toString*(): string
  proc toShortString*(b: StringBuilder, redactContent: jboolean)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)

jclass android.content.Item.Builder* of JVMObject:
  proc setText*(text: CharSequence): Builder
  proc setHtmlText*(htmlText: string): Builder
  proc setIntent*(intent: Intent): Builder
  proc setIntentSender*(intentSender: IntentSender): Builder
  proc setUri*(uri: Uri): Builder
  proc build*(): Item

jclass android.content.Builder* of JVMObject:
  proc setText*(text: CharSequence): Builder
  proc setHtmlText*(htmlText: string): Builder
  proc setIntent*(intent: Intent): Builder
  proc setIntentSender*(intentSender: IntentSender): Builder
  proc setUri*(uri: Uri): Builder
  proc build*(): Item

