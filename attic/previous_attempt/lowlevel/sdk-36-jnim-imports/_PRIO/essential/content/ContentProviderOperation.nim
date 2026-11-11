import jnim

jclass android.content.ContentProviderOperation* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc newInsert*(uri: Uri): Builder {.`static`.}
  proc newUpdate*(uri: Uri): Builder {.`static`.}
  proc newDelete*(uri: Uri): Builder {.`static`.}
  proc newAssertQuery*(uri: Uri): Builder {.`static`.}
  proc newCall*(uri: Uri, method: string, arg: string): Builder {.`static`.}
  proc getUri*(): Uri
  proc isYieldAllowed*(): jboolean
  proc isExceptionAllowed*(): jboolean
  proc getType*(): jint
  proc isInsert*(): jboolean
  proc isDelete*(): jboolean
  proc isUpdate*(): jboolean
  proc isAssertQuery*(): jboolean
  proc isCall*(): jboolean
  proc isWriteOperation*(): jboolean
  proc isReadOperation*(): jboolean
  proc apply*(provider: ContentProvider, backRefs: seq[ContentProviderResult], numBackRefs: jint): ContentProviderResult
  proc resolveValueBackReferences*(backRefs: seq[ContentProviderResult], numBackRefs: jint): ContentValues
  proc resolveExtrasBackReferences*(backRefs: seq[ContentProviderResult], numBackRefs: jint): Bundle
  proc resolveSelectionArgsBackReferences*(backRefs: seq[ContentProviderResult], numBackRefs: jint): seq[string]
  proc typeToString*(type: jint): string {.`static`.}
  proc toString*(): string
  proc describeContents*(): jint
  TYPE_INSERT*: jint {.`static`.}
  TYPE_UPDATE*: jint {.`static`.}
  TYPE_DELETE*: jint {.`static`.}
  TYPE_ASSERT*: jint {.`static`.}
  TYPE_CALL*: jint {.`static`.}
  CREATOR*: Creator[ContentProviderOperation] {.`static`.}

jclass android.content.ContentProviderOperation.BackReference* of JVMObject:
  proc resolve*(backRefs: seq[ContentProviderResult], numBackRefs: jint): JObject
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.content.ContentProviderOperation.Builder* of JVMObject:
  proc build*(): ContentProviderOperation
  proc withValues*(values: ContentValues): Builder
  proc withValue*(key: string, value: JObject): Builder
  proc withValueBackReferences*(backReferences: ContentValues): Builder
  proc withValueBackReference*(key: string, fromIndex: jint): Builder
  proc withValueBackReference*(key: string, fromIndex: jint, fromKey: string): Builder
  proc withExtras*(extras: Bundle): Builder
  proc withExtra*(key: string, value: JObject): Builder
  proc withExtraBackReference*(key: string, fromIndex: jint): Builder
  proc withExtraBackReference*(key: string, fromIndex: jint, fromKey: string): Builder
  proc withSelection*(selection: string, selectionArgs: seq[string]): Builder
  proc withSelectionBackReference*(index: jint, fromIndex: jint): Builder
  proc withSelectionBackReference*(index: jint, fromIndex: jint, fromKey: string): Builder
  proc withExpectedCount*(count: jint): Builder
  proc withYieldAllowed*(yieldAllowed: jboolean): Builder
  proc withExceptionAllowed*(exceptionAllowed: jboolean): Builder
  proc withFailureAllowed*(failureAllowed: jboolean): Builder

jclass android.content.BackReference* of JVMObject:
  proc resolve*(backRefs: seq[ContentProviderResult], numBackRefs: jint): JObject
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Creator[BackReference] {.`static`.}

jclass android.content.Builder* of JVMObject:
  proc build*(): ContentProviderOperation
  proc withValues*(values: ContentValues): Builder
  proc withValue*(key: string, value: JObject): Builder
  proc withValueBackReferences*(backReferences: ContentValues): Builder
  proc withValueBackReference*(key: string, fromIndex: jint): Builder
  proc withValueBackReference*(key: string, fromIndex: jint, fromKey: string): Builder
  proc withExtras*(extras: Bundle): Builder
  proc withExtra*(key: string, value: JObject): Builder
  proc withExtraBackReference*(key: string, fromIndex: jint): Builder
  proc withExtraBackReference*(key: string, fromIndex: jint, fromKey: string): Builder
  proc withSelection*(selection: string, selectionArgs: seq[string]): Builder
  proc withSelectionBackReference*(index: jint, fromIndex: jint): Builder
  proc withSelectionBackReference*(index: jint, fromIndex: jint, fromKey: string): Builder
  proc withExpectedCount*(count: jint): Builder
  proc withYieldAllowed*(yieldAllowed: jboolean): Builder
  proc withExceptionAllowed*(exceptionAllowed: jboolean): Builder
  proc withFailureAllowed*(failureAllowed: jboolean): Builder

