import jnim

jclass android.view.ViewStructure* of JVMObject:
  proc setId*(id: jint, packageName: string, typeName: string, entryName: string)
  proc setDimens*(left: jint, top: jint, scrollX: jint, scrollY: jint, width: jint, height: jint)
  proc setTransformation*(matrix: Matrix)
  proc setElevation*(elevation: jfloat)
  proc setAlpha*(alpha: jfloat)
  proc setVisibility*(visibility: jint)
  proc setAssistBlocked*(state: jboolean)
  proc setEnabled*(state: jboolean)
  proc setClickable*(state: jboolean)
  proc setLongClickable*(state: jboolean)
  proc setContextClickable*(state: jboolean)
  proc setFocusable*(state: jboolean)
  proc setFocused*(state: jboolean)
  proc setAccessibilityFocused*(state: jboolean)
  proc setCheckable*(state: jboolean)
  proc setChecked*(state: jboolean)
  proc setSelected*(state: jboolean)
  proc setActivated*(state: jboolean)
  proc setOpaque*(opaque: jboolean)
  proc setClassName*(className: string)
  proc setContentDescription*(contentDescription: CharSequence)
  proc setText*(text: CharSequence)
  proc setText*(text: CharSequence, selectionStart: jint, selectionEnd: jint)
  proc setTextStyle*(size: jfloat, fgColor: jint, bgColor: jint, style: jint)
  proc setTextLines*(charOffsets: seq[jint], baselines: seq[jint])
  proc setTextIdEntry*(entryName: string)
  proc setHint*(hint: CharSequence)
  proc setHintIdEntry*(entryName: string)
  proc getText*(): CharSequence
  proc getTextSelectionStart*(): jint
  proc getTextSelectionEnd*(): jint
  proc getHint*(): CharSequence
  proc getExtras*(): Bundle
  proc hasExtras*(): jboolean
  proc setChildCount*(num: jint)
  proc addChildCount*(num: jint): jint
  proc getChildCount*(): jint
  proc newChild*(index: jint): ViewStructure
  proc asyncNewChild*(index: jint): ViewStructure
  proc getPendingCredentialRequest*(): GetCredentialRequest
  proc getPendingCredentialCallback*(): OutcomeReceiver[GetCredentialResponse, GetCredentialException]
  proc getAutofillId*(): AutofillId
  proc setAutofillId*(id: AutofillId)
  proc setAutofillId*(parentId: AutofillId, virtualId: jint)
  proc setAutofillType*(type: jint)
  proc setAutofillHints*(hint: seq[string])
  proc setAutofillValue*(value: AutofillValue)
  proc setAutofillOptions*(options: seq[CharSequence])
  proc setImportantForAutofill*(mode: jint)
  proc setIsCredential*(isCredential: jboolean)
  proc setReceiveContentMimeTypes*(mimeTypes: seq[string])
  proc setInputType*(inputType: jint)
  proc setDataIsSensitive*(sensitive: jboolean)
  proc setMinTextEms*(minEms: jint)
  proc setMaxTextEms*(maxEms: jint)
  proc setMaxTextLength*(maxLength: jint)
  proc asyncCommit*()
  proc getTempRect*(): Rect
  proc setWebDomain*(domain: string)
  proc setLocaleList*(localeList: LocaleList)
  proc newHtmlInfoBuilder*(tagName: string): HtmlInfo.Builder
  proc setHtmlInfo*(htmlInfo: HtmlInfo)
  proc setPendingCredentialRequest*(request: GetCredentialRequest, callback: OutcomeReceiver[GetCredentialResponse, GetCredentialException])
  proc clearCredentialManagerRequest*()
  EXTRA_ACTIVE_CHILDREN_IDS*: string {.`static`.}
  EXTRA_FIRST_ACTIVE_POSITION*: string {.`static`.}
  EXTRA_CONTAINS_SECURE_LAYERS*: string {.`static`.}
  EXTRA_VIRTUAL_STRUCTURE_TYPE*: string {.`static`.}
  EXTRA_VIRTUAL_STRUCTURE_VERSION_NUMBER*: string {.`static`.}

jclass android.view.ViewStructure.HtmlInfo* of JVMObject:
  proc getTag*(): string
  proc getAttributes*(): List[Pair<String, String>]

jclass android.view.HtmlInfo* of JVMObject:
  proc getTag*(): string
  proc getAttributes*(): List[Pair<String, String>]

jclass android.view.HtmlInfo.Builder* of JVMObject:
  proc addAttribute*(name: string, value: string): Builder
  proc build*(): HtmlInfo

jclass android.view.Builder* of JVMObject:
  proc addAttribute*(name: string, value: string): Builder
  proc build*(): HtmlInfo

