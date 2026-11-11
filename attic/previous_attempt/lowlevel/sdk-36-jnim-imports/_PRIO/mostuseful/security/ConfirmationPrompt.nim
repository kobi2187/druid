import jnim

jclass android.security.ConfirmationPrompt* of JVMObject:
  proc presentPrompt*(executor: Executor, callback: ConfirmationCallback)
  proc cancelPrompt*()
  proc isSupported*(context: Context): jboolean {.`static`.}

jclass android.security.ConfirmationPrompt.Builder* of JVMObject:
  proc setPromptText*(promptText: CharSequence): Builder
  proc setExtraData*(extraData: seq[jbyte]): Builder
  proc build*(): ConfirmationPrompt

jclass android.security.Builder* of JVMObject:
  proc setPromptText*(promptText: CharSequence): Builder
  proc setExtraData*(extraData: seq[jbyte]): Builder
  proc build*(): ConfirmationPrompt

