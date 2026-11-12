import jnim

jclass android.app.PictureInPictureUiState* of JVMObject:
  proc isStashed*(): jboolean
  proc isTransitioningToPip*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Creator[PictureInPictureUiState] {.`static`.}

jclass android.app.PictureInPictureUiState.Builder* of JVMObject:
  proc setStashed*(isStashed: jboolean): Builder
  proc setTransitioningToPip*(isEnteringPip: jboolean): Builder
  proc build*(): PictureInPictureUiState

jclass android.app.Builder* of JVMObject:
  proc setStashed*(isStashed: jboolean): Builder
  proc setTransitioningToPip*(isEnteringPip: jboolean): Builder
  proc build*(): PictureInPictureUiState

