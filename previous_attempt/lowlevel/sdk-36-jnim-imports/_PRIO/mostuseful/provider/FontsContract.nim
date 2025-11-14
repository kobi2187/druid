import jnim

jclass android.provider.FontsContract* of JVMObject:
  proc setApplicationContextForResources*(context: Context) {.`static`.}
  proc getFontSync*(request: FontRequest): Typeface {.`static`.}
  proc requestFonts*(context: Context, request: FontRequest, handler: Handler, cancellationSignal: CancellationSignal, callback: FontRequestCallback) {.`static`.}
  proc fetchFonts*(context: Context, cancellationSignal: CancellationSignal, request: FontRequest): FontFamilyResult {.`static`.}
  proc buildTypeface*(context: Context, cancellationSignal: CancellationSignal, fonts: seq[FontInfo]): Typeface {.`static`.}
  proc getProvider*(packageManager: PackageManager, request: FontRequest): ProviderInfo {.`static`.}
  proc getFontFromProvider*(context: Context, request: FontRequest, authority: string, cancellationSignal: CancellationSignal): seq[FontInfo] {.`static`.}

jclass android.provider.FontsContract.FontInfo* of JVMObject:
  proc getUri*(): Uri
  proc getTtcIndex*(): jint
  proc getAxes*(): seq[FontVariationAxis]
  proc getWeight*(): jint
  proc isItalic*(): jboolean
  proc getResultCode*(): jint

jclass android.provider.FontsContract.FontFamilyResult* of JVMObject:
  proc getStatusCode*(): jint
  proc getFonts*(): seq[FontInfo]

jclass android.provider.FontsContract.FontRequestCallback* of JVMObject:
  proc onTypefaceRetrieved*(typeface: Typeface)
  proc onTypefaceRequestFailed*(reason: jint)

jclass android.provider.Columns* of JVMObject:
  FILE_ID*: string {.`static`.}
  TTC_INDEX*: string {.`static`.}
  VARIATION_SETTINGS*: string {.`static`.}
  WEIGHT*: string {.`static`.}
  ITALIC*: string {.`static`.}
  RESULT_CODE*: string {.`static`.}
  RESULT_CODE_OK*: jint {.`static`.}
  RESULT_CODE_FONT_NOT_FOUND*: jint {.`static`.}
  RESULT_CODE_FONT_UNAVAILABLE*: jint {.`static`.}
  RESULT_CODE_MALFORMED_QUERY*: jint {.`static`.}

jclass android.provider.FontInfo* of JVMObject:
  proc getUri*(): Uri
  proc getTtcIndex*(): jint
  proc getAxes*(): seq[FontVariationAxis]
  proc getWeight*(): jint
  proc isItalic*(): jboolean
  proc getResultCode*(): jint

jclass android.provider.FontFamilyResult* of JVMObject:
  proc getStatusCode*(): jint
  proc getFonts*(): seq[FontInfo]
  STATUS_OK*: jint {.`static`.}
  STATUS_WRONG_CERTIFICATES*: jint {.`static`.}
  STATUS_UNEXPECTED_DATA_PROVIDED*: jint {.`static`.}
  STATUS_REJECTED*: jint {.`static`.}

jclass android.provider.FontRequestCallback* of JVMObject:
  proc onTypefaceRetrieved*(typeface: Typeface)
  proc onTypefaceRequestFailed*(reason: jint)
  FAIL_REASON_PROVIDER_NOT_FOUND*: jint {.`static`.}
  FAIL_REASON_WRONG_CERTIFICATES*: jint {.`static`.}
  FAIL_REASON_FONT_LOAD_ERROR*: jint {.`static`.}
  FAIL_REASON_FONT_NOT_FOUND*: jint {.`static`.}
  FAIL_REASON_FONT_UNAVAILABLE*: jint {.`static`.}
  FAIL_REASON_MALFORMED_QUERY*: jint {.`static`.}

