import jnim

jclass android.telecom.Voicemail* of JVMObject:
  proc createForInsertion*(timestamp: jlong, number: string): Builder {.`static`.}
  proc createForUpdate*(id: jlong, sourceData: string): Builder {.`static`.}
  proc getId*(): jlong
  proc getNumber*(): string
  proc getPhoneAccount*(): PhoneAccountHandle
  proc getTimestampMillis*(): jlong
  proc getDuration*(): jlong
  proc getSourcePackage*(): string
  proc getSourceData*(): string
  proc getUri*(): Uri
  proc isRead*(): jboolean
  proc hasContent*(): jboolean
  proc getTranscription*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[Voicemail] {.`static`.}

jclass android.telecom.Voicemail.Builder* of JVMObject:
  proc setNumber*(number: string): Builder
  proc setTimestamp*(timestamp: jlong): Builder
  proc setPhoneAccount*(phoneAccount: PhoneAccountHandle): Builder
  proc setId*(id: jlong): Builder
  proc setDuration*(duration: jlong): Builder
  proc setSourcePackage*(sourcePackage: string): Builder
  proc setSourceData*(sourceData: string): Builder
  proc setUri*(uri: Uri): Builder
  proc setIsRead*(isRead: jboolean): Builder
  proc setHasContent*(hasContent: jboolean): Builder
  proc setTranscription*(transcription: string): Builder
  proc build*(): Voicemail

jclass android.telecom.Builder* of JVMObject:
  proc setNumber*(number: string): Builder
  proc setTimestamp*(timestamp: jlong): Builder
  proc setPhoneAccount*(phoneAccount: PhoneAccountHandle): Builder
  proc setId*(id: jlong): Builder
  proc setDuration*(duration: jlong): Builder
  proc setSourcePackage*(sourcePackage: string): Builder
  proc setSourceData*(sourceData: string): Builder
  proc setUri*(uri: Uri): Builder
  proc setIsRead*(isRead: jboolean): Builder
  proc setHasContent*(hasContent: jboolean): Builder
  proc setTranscription*(transcription: string): Builder
  proc build*(): Voicemail

