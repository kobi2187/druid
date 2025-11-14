import jnim

jclass android.security.AndroidProtectedConfirmation* of JVMObject:
  proc presentConfirmationPrompt*(listener: IConfirmationCallback, promptText: string, extraData: seq[jbyte], locale: string, uiOptionsAsFlags: jint): jint
  proc cancelConfirmationPrompt*(listener: IConfirmationCallback): jint
  proc isConfirmationPromptSupported*(): jboolean
  ERROR_OK*: jint {.`static`.}
  ERROR_CANCELED*: jint {.`static`.}
  ERROR_ABORTED*: jint {.`static`.}
  ERROR_OPERATION_PENDING*: jint {.`static`.}
  ERROR_IGNORED*: jint {.`static`.}
  ERROR_SYSTEM_ERROR*: jint {.`static`.}
  ERROR_UNIMPLEMENTED*: jint {.`static`.}
  FLAG_UI_OPTION_INVERTED*: jint {.`static`.}
  FLAG_UI_OPTION_MAGNIFIED*: jint {.`static`.}

