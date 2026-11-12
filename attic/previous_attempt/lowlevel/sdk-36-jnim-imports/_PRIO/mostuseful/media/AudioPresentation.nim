import jnim

jclass android.media.AudioPresentation* of JVMObject:
  proc getPresentationId*(): jint
  proc getProgramId*(): jint
  proc getLabels*(): Map[Locale, string]
  proc getLocale*(): Locale
  proc getMasteringIndication*(): jint
  proc hasAudioDescription*(): jboolean
  proc hasSpokenSubtitles*(): jboolean
  proc hasDialogueEnhancement*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CONTENT_UNKNOWN*: jint {.`static`.}
  CONTENT_MAIN*: jint {.`static`.}
  CONTENT_MUSIC_AND_EFFECTS*: jint {.`static`.}
  CONTENT_VISUALLY_IMPAIRED*: jint {.`static`.}
  CONTENT_HEARING_IMPAIRED*: jint {.`static`.}
  CONTENT_DIALOG*: jint {.`static`.}
  CONTENT_COMMENTARY*: jint {.`static`.}
  CONTENT_EMERGENCY*: jint {.`static`.}
  CONTENT_VOICEOVER*: jint {.`static`.}
  MASTERING_NOT_INDICATED*: jint {.`static`.}
  MASTERED_FOR_STEREO*: jint {.`static`.}
  MASTERED_FOR_SURROUND*: jint {.`static`.}
  MASTERED_FOR_3D*: jint {.`static`.}
  MASTERED_FOR_HEADPHONE*: jint {.`static`.}
  PRESENTATION_ID_UNKNOWN*: jint {.`static`.}
  PROGRAM_ID_UNKNOWN*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AudioPresentation] {.`static`.}

jclass android.media.AudioPresentation.Builder* of JVMObject:
  proc setProgramId*(programId: jint): Builder
  proc setLocale*(language: ULocale): Builder
  proc setMasteringIndication*(masteringIndication: jint): Builder
  proc setLabels*(labels: Map[ULocale, CharSequence]): Builder
  proc setHasAudioDescription*(audioDescriptionAvailable: jboolean): Builder
  proc setHasSpokenSubtitles*(spokenSubtitlesAvailable: jboolean): Builder
  proc setHasDialogueEnhancement*(dialogueEnhancementAvailable: jboolean): Builder
  proc build*(): AudioPresentation

jclass android.media.Builder* of JVMObject:
  proc setProgramId*(programId: jint): Builder
  proc setLocale*(language: ULocale): Builder
  proc setMasteringIndication*(masteringIndication: jint): Builder
  proc setLabels*(labels: Map[ULocale, CharSequence]): Builder
  proc setHasAudioDescription*(audioDescriptionAvailable: jboolean): Builder
  proc setHasSpokenSubtitles*(spokenSubtitlesAvailable: jboolean): Builder
  proc setHasDialogueEnhancement*(dialogueEnhancementAvailable: jboolean): Builder
  proc build*(): AudioPresentation

