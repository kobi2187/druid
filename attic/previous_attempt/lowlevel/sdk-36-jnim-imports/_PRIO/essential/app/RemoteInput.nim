import jnim

jclass android.app.RemoteInput* of JVMObject:
  proc getResultKey*(): string
  proc getLabel*(): CharSequence
  proc getChoices*(): seq[CharSequence]
  proc getAllowedDataTypes*(): Set[string]
  proc isDataOnly*(): jboolean
  proc getAllowFreeFormInput*(): jboolean
  proc getEditChoicesBeforeSending*(): jint
  proc getExtras*(): Bundle
  proc getDataResultsFromIntent*(intent: Intent, remoteInputResultKey: string): Map[string, Uri] {.`static`.}
  proc getResultsFromIntent*(intent: Intent): Bundle {.`static`.}
  proc addResultsToIntent*(remoteInputs: seq[RemoteInput], intent: Intent, results: Bundle) {.`static`.}
  proc addDataResultToIntent*(remoteInput: RemoteInput, intent: Intent, results: Map[string, Uri]) {.`static`.}
  proc setResultsSource*(intent: Intent, source: jint) {.`static`.}
  proc getResultsSource*(intent: Intent): jint {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  RESULTS_CLIP_LABEL*: string {.`static`.}
  EXTRA_RESULTS_DATA*: string {.`static`.}
  SOURCE_FREE_FORM_INPUT*: jint {.`static`.}
  SOURCE_CHOICE*: jint {.`static`.}
  EDIT_CHOICES_BEFORE_SENDING_AUTO*: jint {.`static`.}
  EDIT_CHOICES_BEFORE_SENDING_DISABLED*: jint {.`static`.}
  EDIT_CHOICES_BEFORE_SENDING_ENABLED*: jint {.`static`.}
  CREATOR*: Creator[RemoteInput] {.`static`.}

jclass android.app.RemoteInput.Builder* of JVMObject:
  proc setLabel*(label: CharSequence): Builder
  proc setChoices*(choices: seq[CharSequence]): Builder
  proc setAllowDataType*(mimeType: string, doAllow: jboolean): Builder
  proc setAllowFreeFormInput*(allowFreeFormTextInput: jboolean): Builder
  proc setEditChoicesBeforeSending*(editChoicesBeforeSending: jint): Builder
  proc addExtras*(extras: Bundle): Builder
  proc getExtras*(): Bundle
  proc build*(): RemoteInput

jclass android.app.Builder* of JVMObject:
  proc setLabel*(label: CharSequence): Builder
  proc setChoices*(choices: seq[CharSequence]): Builder
  proc setAllowDataType*(mimeType: string, doAllow: jboolean): Builder
  proc setAllowFreeFormInput*(allowFreeFormTextInput: jboolean): Builder
  proc setEditChoicesBeforeSending*(editChoicesBeforeSending: jint): Builder
  proc addExtras*(extras: Bundle): Builder
  proc getExtras*(): Bundle
  proc build*(): RemoteInput

